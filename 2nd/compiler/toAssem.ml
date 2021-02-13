open Asm
open Assem
external get : float -> int32 = "get"

let assem_list = ref []
let emit inst = assem_list := inst :: !assem_list
let assem_list_all = ref []
let emit_all list = assem_list_all := list @ !assem_list_all

(* bycolor=false regAlloc.ml, bycolor=true regAllocbyColor.ml *)
let bycolor = ref false

let cls_count = ref 0
let float_table = ref []

(* floatを単精度にしたことにより, スタック上の値の型がintと区別が付かなくなったので, stacksetは型も記憶. *)
let stackset = ref M.empty (* すでにSaveされた変数の集合 (caml2html: emit_stackset) *)
let stackmap = ref [] (* Saveされた変数の、スタックにおける位置 (caml2html: emit_stackmap) *)
let save x reg =
  stackset := M.add x reg !stackset;
  if not (List.mem x !stackmap) then
    stackmap := !stackmap @ [x]
let locate x =
  let rec loc = function
    | [] -> []
    | y :: zs when x = y -> 0 :: List.map succ (loc zs)
    | y :: zs -> List.map succ (loc zs) in
  loc !stackmap
let offset x = if (locate x) = [] then (Printf.fprintf stdout ("%s\n") x; failwith "err") else List.hd (locate x)
let stacksize () = if !bycolor then List.length !stackmap else List.length !stackmap + 1

let pp_id_or_imm = function
  | V(x) -> x
  | C(i) -> string_of_int i

(* 関数呼び出しのために引数を並べ替える(register shuffling) (caml2html: emit_shuffle) *)
let rec shuffle sw xys =
  (* remove identical moves *)
  let _, xys = List.partition (fun (x, y) -> x = y) xys in
  (* find acyclic moves *)
  match List.partition (fun (_, y) -> List.mem_assoc y xys) xys with
  | [], [] -> []
  | (x, y) :: xys, [] -> (* no acyclic moves; resolve a cyclic move *)
      (y, sw) :: (x, y) :: shuffle sw (List.map
                                         (function
                                           | (y', z) when y = y' -> (sw, z)
                                           | yz -> yz)
                                         xys)
  | xys, acyc -> acyc @ shuffle sw xys

exception Float_address_error
let rec get_float_address label data n =
    match data with
    | [] -> raise Float_address_error
    | (Id.L(x), d) :: rest ->
        (if x = label then (!FixAddress.hp_init + n, d)
        else get_float_address label rest (n + 1))

let load_imm dest v =
    let upper = Int32.shift_right_logical v 16 in
    let lower = Int32.logxor v (Int32.shift_left upper 16) in
    emit (Lui(dest, Int32.to_int upper));
    emit (Ori(dest, dest, Int32.to_int lower))

let rec to_bits x i =
    if i = 32 then "" else
         (to_bits (Int32.shift_right x 1) (i+1)) ^
             (if (Int32.logand x 1l) = 1l then "1" else "0")

(* データセクション 応急処置 *)
let rec preprocess_data dc i =
    if i = 0 then () else
       (Printf.fprintf dc "%s\n" (to_bits 0l 0);
        preprocess_data dc (i-1))

let rec load_float_imm dc data acc =
    match data with
    | [] -> acc
    | (Id.L(x), d) :: rest ->
        Printf.fprintf dc "%s\n" (to_bits (get d) 0);
            load_float_imm dc rest (acc + 1)

let addi r1 r2 i =
    if -32768 <= i && i <= 32767 then
        emit (Addi(r1, r2, i))
    else
       (
        let upper = i asr 16 in
        let lower = i land 0xffff in
        emit (Lui(reg_at, upper));
        emit (Ori(reg_at, reg_at, lower));
        emit (Add(r1, r2, reg_at))
        )


type dest = Tail | NonTail of Id.t 
let rec g = function 
  | dest, Ans(exp) -> g' (dest, exp)
  | dest, Let((x, t), exp, e) ->
      g' (NonTail(x), exp);
      g (dest, e)

and g' = function 
  | NonTail(_), Nop -> ()
  | NonTail(x), Set(i) ->
        emit (Addi(x, reg_zero, i))
  | NonTail(x), SetF(Id.L(y)) ->
        let (addr, d) = get_float_address y !float_table 0 in
        if addr < 32768 then
            emit (FLw(x, addr, reg_zero))
        else
        (
            load_imm reg_at (Int32.of_int addr);
            emit (FLw(x, 0, reg_at))
        )
  | NonTail(x), SetL(Id.L(y)) ->
        emit (Movl(x, y))
  | NonTail(x), Mov(y) when x = y -> ()
  | NonTail(x), Mov(y) ->
        emit (Add(x, reg_zero, y))
  | NonTail(x), Neg(y) ->
        emit (Sub(x, reg_zero, y))
  | NonTail(x), Add(y, z') ->
       (match z' with
        | V(z) -> emit (Add(x, y, z))
        | C(i) -> addi x y i)
  | NonTail(x), Sub(y, z') ->
       (match z' with
        | V(z) -> emit (Sub(x, y, z))
        | C(i) -> addi x y (-i))
  | NonTail(x), Mul(y, z') ->
       (match z' with
        | V(z) -> failwith "Mul Error"
        | C(i) ->
           (match i with
            | 2 -> emit (Sll(x, y, C(1)))
            | 4 -> emit (Sll(x, y, C(2)))
            | 8 -> emit (Sll(x, y, C(3)))
            | _ -> failwith "Mul is supported 2, 4, 8"))
  | NonTail(x), Div(y, z') ->
       (match z' with
        | V(z) -> failwith "Div Error"
        | C(i) ->
        (* srl命令のみ 負の数はだめ *)
            (match i with
            | 2 -> emit (Srl(x, y, C(1)))
            | 4 -> emit (Srl(x, y, C(2)))
            | 8 -> emit (Srl(x, y, C(3)))
            | _ -> failwith "Div is supported 2, 4, 8"))
  | NonTail(x), SLL(y, z') ->
       (match z' with
       | V(z) -> emit (Sll(x, y, V(z)))
       | C(i) -> emit (Sll(x, y, C(i))))
  | NonTail(x), Ld(y, z') ->
       (match z' with
       | V(z) -> emit (Add(reg_at, y, z));
                 emit (Lw(x, 0, reg_at))
       | C(i) -> emit (Lw(x, i, y)))
  | NonTail(_), St(x, y, z') ->
       (match z' with
       | V(z) -> emit (Add(reg_at, y, z));
                 emit (Sw(x, 0, reg_at))
       | C(i) -> emit (Sw(x, i, y)))
  | NonTail(x), FMovD(y) when x = y -> ()
  | NonTail(x), FMovD(y) ->
        emit (FMov(x, y))
  | NonTail(x), FNegD(y) ->
        emit (FNeg(x, y))
  | NonTail(x), FAddD(y, z) ->
        emit (FAdd(x, y, z))
  | NonTail(x), FSubD(y, z) ->
        emit (FSub(x, y, z))
  | NonTail(x), FMulD(y, z) ->
        emit (FMul(x, y, z))
  | NonTail(x), FDivD(y, z) ->
        emit (FDiv(x, y, z))
  | NonTail(x), FAbs(y) ->
        emit (FAbs(x, y))
  | NonTail(x), FSqr(y) ->
        emit (FSqrt(x, y))
  | NonTail(x), Ftoi(y) ->
        emit (Ftoi(x, y))
  | NonTail(x), Itof(y) ->
        emit (Itof(x, y))
  | NonTail(x), Floor(y) ->
        emit (Floor(x, y))
  | NonTail(x), LdF(y, z') ->
       (match z' with
       | V(z) -> emit (Add(reg_at, y, z));
                 emit (FLw(x, 0, reg_at))
       | C(i) -> emit (FLw(x, i, y)))
  | NonTail(_), StF(x, y, z') ->
       (match z' with
       | V(z) -> emit (Add(reg_at, y, z));
                 emit (FSw(x, 0, reg_at))
       | C(i) -> emit (FSw(x, i, y)))
  | NonTail(_), Comment(s) ->
        emit (Comment(s))
  | NonTail(x), Slt(y, z) -> 
        emit (Slt(x, y, z))
  | NonTail(x), FSlt(y, z) -> 
        emit (FSlt(x, y, z))

  (* 退避の仮想命令の実装 (caml2html: emit_save) *)
  | NonTail(_), Save(x, y) when List.mem x allregs && not (M.mem y !stackset) ->
        save y x;
        emit (Sw(x, (offset y), reg_sp))
  | NonTail(_), Save(x, y) when List.mem x allfregs && not (M.mem y !stackset) ->
        save y x;
        emit (FSw(x, (offset y), reg_sp))
  | NonTail(_), Save(x, y) -> assert (M.mem y !stackset); ()

  (* 復帰の仮想命令の実装 (caml2html: emit_restore) *)
  | NonTail(x), Restore(y) when List.mem x allregs ->
        emit (Lw(x, (offset y), reg_sp))
  | NonTail(x), Restore(y) ->
        assert (List.mem x allfregs);
        emit (FLw(x, (offset y), reg_sp))

  (* 末尾だったら計算結果を第一レジスタにセットしてリターン (caml2html: emit_tailret) *)
  | Tail, (Nop | St _ | StF _ | Comment _ | Save _ as exp) ->
        g' (NonTail(Id.gentmp Type.Unit), exp);
        emit (Jr(reg_ra))
  | Tail, (Set _ | SetL _ | Mov _ | Neg _ | Add _ | Sub _ | Mul _ | Div _ | Ftoi _ | SLL _ | Ld _ | Slt _ | FSlt _ as exp) ->
        g' (NonTail(regs.(0)), exp);
        emit (Jr(reg_ra))
  | Tail, (SetF _ | FMovD _ | FNegD _ | FAbs _ | FSqr _ | Itof _ | Floor _ | FAddD _ | FSubD _ | FMulD _ | FDivD _ | LdF _ as exp) ->
        g' (NonTail(fregs.(0)), exp);
        emit (Jr(reg_ra))
  | Tail, (Restore(x) as exp) ->
        let reg = M.find x !stackset in
        if List.mem reg allregs then
            (g' (NonTail(regs.(0)), exp);
            emit (Jr(reg_ra)))
        else if List.mem reg allfregs then
            (g' (NonTail(fregs.(0)), exp);
            emit (Jr(reg_ra)))
  | Tail, IfEq(x, y', e1, e2) ->
      (* x = y then e1 <=> x != y then e2 *)
      (match y' with
      | V(y) -> g'_tail_if x y e1 e2 "beq" "bne"
      | C(i) -> if -128 <= i && i <= 127 then g'_tail_if_imm x i e2 e1 "bnei" "beqi"
                else (addi reg_at reg_zero i;
                        g'_tail_if x reg_at e1 e2 "beq" "bne"))
  | Tail, IfLE(x, y', e1, e2) ->
      (* x <= y then e1 <=> x > y then e2 <=> y < x then e2 *)
      (match y' with
      | V(y) -> g'_tail_if y x e1 e2 "bgt" "blt"
      | C(i) -> addi reg_at reg_zero i;
                g'_tail_if reg_at x e1 e2 "bgt" "blt")
  | Tail, IfGE(x, y', e1, e2) ->
       (* x >= y then e1 <=> x < y then e2 *)
      (match y' with
      | V(y) -> g'_tail_if x y e1 e2 "bgt" "blt"
      | C(i) -> if -128 <= i && i <= 127 then g'_tail_if_imm x i e1 e2 "bgti" "blti"
                else (addi reg_at reg_zero i;
                        g'_tail_if x reg_at e1 e2 "bgt" "blt"))
  | Tail, IfFEq(x, y, e1, e2) ->
      (* x = y then e1 <=> x != y then e2 *)
        g'_tail_if x y e1 e2 "fbeq" "fbne"
  | Tail, IfFLE(x, y, e1, e2) ->
      (* x <= y then e1 <=> x > y then e2 <=> y < x then e2 *)
        g'_tail_if y x e1 e2 "fbgt" "fblt"
  | NonTail(z), IfEq(x, y', e1, e2) ->
      (* x = y then e1 <=> x != y then e2 *)
      (match y' with
      | V(y) -> g'_non_tail_if (NonTail(z)) x y e1 e2 "beq" "bne"
      | C(i) -> if -128 <= i && i <= 127 then g'_non_tail_if_imm (NonTail(z)) x i e2 e1 "bnei" "beqi"
                else (addi reg_at reg_zero i;
                        g'_non_tail_if (NonTail(z)) x reg_at e1 e2 "beq" "bne"))
  | NonTail(z), IfLE(x, y', e1, e2) ->
      (* x <= y then e1 <=> x > y then e2 <=> y < x then e2 *)
      (match y' with
      | V(y) -> g'_non_tail_if (NonTail(z)) y x e1 e2 "bgt" "blt"
      | C(i) -> addi reg_at reg_zero i;
                g'_non_tail_if (NonTail(z)) reg_at x e1 e2 "bgt" "blt")
 | NonTail(z), IfGE(x, y', e1, e2) ->
       (* x >= y then e1 <=> x < y then e2 *)
      (match y' with
      | V(y) -> g'_non_tail_if (NonTail(z)) x y e1 e2 "bgt" "blt"
      | C(i) -> if -128 <= i && i <= 127 then g'_non_tail_if_imm (NonTail(z)) x i e1 e2 "bgti" "blti"
                else (addi reg_at reg_zero i;
                        g'_non_tail_if (NonTail(z)) x reg_at e1 e2 "bgt" "blt"))
  | NonTail(z), IfFEq(x, y, e1, e2) ->
      (* x = y then e1 <=> x != y then e2 *)
        g'_non_tail_if (NonTail(z)) x y e1 e2 "fbeq" "fbne"
  | NonTail(z), IfFLE(x, y, e1, e2) ->
      (* x <= y then e1 <=> x > y then e2 <=> y < x then e2 *)
        g'_non_tail_if (NonTail(z)) y x e1 e2 "fbgt" "fblt"

  | Tail, CallCls(x, ys, zs) -> 
        cls_count := !cls_count + 1;
        g'_args [(x, reg_cl)] ys zs;
        emit (Lw(reg_at, 0, reg_cl));
        emit (Jr(reg_at))
  | Tail, CallDir(Id.L(x), ys, zs) -> (* 末尾呼び出し *)
        g'_args [] ys zs;
        emit (J(x))
  | NonTail(a), CallCls(x, ys, zs) ->
        cls_count := !cls_count + 1;
        g'_args [(x, reg_cl)] ys zs;
        let ss = stacksize () in
        (
        if !bycolor then
        (
            addi reg_sp reg_sp ss;
            emit (Lw(reg_at, 0, reg_cl));
            emit (Jalr(reg_at));
            addi reg_sp reg_sp (-ss);
        )
        else
        (
            emit (Sw(reg_ra, (ss - 1), reg_sp));
            addi reg_sp reg_sp ss;
            emit (Lw(reg_at, 0, reg_cl));
            emit (Jalr(reg_at));
            addi reg_sp reg_sp (-ss);
            emit (Lw(reg_ra, (ss - 1), reg_sp))
        )
        );
        if List.mem a allregs && a <> regs.(0) then
            emit (Addi(a, regs.(0), 0))
        else if List.mem a allfregs && a <> fregs.(0) then
            emit (FMov(a, fregs.(0)))
  | NonTail(a), CallDir(Id.L(x), ys, zs) ->
        g'_args [] ys zs;
        let ss = stacksize () in
        (
        if !bycolor then
        (
            addi reg_sp reg_sp ss;
            emit (Jal(x));
            addi reg_sp reg_sp (-ss);
        )
        else
        (
            emit (Sw(reg_ra, (ss - 1), reg_sp));
            addi reg_sp reg_sp ss;
            emit (Jal(x));
            addi reg_sp reg_sp (-ss);
            emit (Lw(reg_ra, (ss - 1), reg_sp))
        )
        );
        if List.mem a allregs && a <> regs.(0) then
            emit (Addi(a, regs.(0), 0))
        else if List.mem a allfregs && a <> fregs.(0) then
            emit (FMov(a, fregs.(0)))

and g'_tail_if o1 o2 e1 e2 b bn =
    let b_else = Id.genid (b ^ "_else") in
    (match bn with
    | "bne" -> emit (Bne(o1, o2, b_else))
    | "blt" -> emit (Blt(o1, o2, b_else))
    | "fbne" -> emit (FBne(o1, o2, b_else))
    | "fblt" -> emit (FBlt(o1, o2, b_else))
    | _ -> failwith "g'_tail_if");
    let stackset_back = !stackset in
    g (Tail, e1);
    emit (Label(b_else));
    stackset := stackset_back;
    g (Tail, e2)
and g'_tail_if_imm o1 o2 e1 e2 b bn =
    let b_else = Id.genid (b ^ "_else") in
    (match bn with
    | "beqi" -> emit (Beqi(o1, o2, b_else))
    | "blti" -> emit (Blti(o1, o2, b_else))
    | _ -> failwith "g'_tail_if_imm");
    let stackset_back = !stackset in
    g (Tail, e1);
    emit (Label(b_else));
    stackset := stackset_back;
    g (Tail, e2)
and g'_non_tail_if dest o1 o2 e1 e2 b bn =
    let b_else = Id.genid (b ^ "_else") in
    let b_cont = Id.genid (b ^ "_cont") in
    (match bn with
    | "bne" -> emit (Bne(o1, o2, b_else))
    | "blt" -> emit (Blt(o1, o2, b_else))
    | "fbne" -> emit (FBne(o1, o2, b_else))
    | "fblt" -> emit (FBlt(o1, o2, b_else))
    | _ -> failwith "g'_non_tail_if");
    let stackset_back = !stackset in
    g (dest, e1);
    let stackset1 = !stackset in
    emit (J(b_cont));
    emit (Label(b_else));
    stackset := stackset_back;
    g (dest, e2);
    emit (Label(b_cont));
    let stackset2 = !stackset in
    stackset := M.filter (fun x _ -> M.mem x stackset1) stackset2
and g'_non_tail_if_imm dest o1 o2 e1 e2 b bn =
    let b_else = Id.genid (b ^ "_else") in
    let b_cont = Id.genid (b ^ "_cont") in
    (match bn with
    | "beqi" -> emit (Beqi(o1, o2, b_else))
    | "blti" -> emit (Blti(o1, o2, b_else))
    | _ -> failwith "g'_non_tail_if_imm");
    let stackset_back = !stackset in
    g (dest, e1);
    let stackset1 = !stackset in
    emit (J(b_cont));
    emit (Label(b_else));
    stackset := stackset_back;
    g (dest, e2);
    emit (Label(b_cont));
    let stackset2 = !stackset in
    stackset := M.filter (fun x _ -> M.mem x stackset1) stackset2

and g'_args x_reg_cl ys zs =
  let (i, yrs) =
    List.fold_left
      (fun (i, yrs) y -> (i + 1, (y, regs.(i)) :: yrs))
      (0, x_reg_cl)
      ys in
  List.iter
    (fun (y, r) -> emit (Addi(r, y, 0)))
    (shuffle reg_sw yrs);
  let (d, zfrs) =
    List.fold_left
      (fun (d, zfrs) z -> (d + 1, (z, fregs.(d)) :: zfrs))
      (0, [])
      zs in
  List.iter
    (fun (z, fr) -> emit (FMov(fr, z)))
    (shuffle reg_fsw zfrs)

let len_ys = ref 0
let len_zs = ref 0

let h option fundef =
  let { name = Id.L(x); args = ys; fargs = zs; body = e; ret = _ } = if option then RegAllocbyColor.h fundef else RegAlloc.h fundef in

  if List.length ys > !len_ys then len_ys := List.length ys;
  if List.length zs > !len_zs then len_zs := List.length zs;
  emit (Label(x));
  stackset := M.empty;
  stackmap := [];
  let ret = g (Tail, e) in
  emit_all !assem_list;
  ret

(* calldefs.mlのためにtoAssem.mlとregAllocbyColor.mlをまとめる *)
let f dc option (Prog(data, fundefs, e)) =
  bycolor := option;
(* データセクションに関してはこの段階で出力 *)
  cls_count := 0;
  Format.eprintf "register allocation and toAssem: may take some time (up to a few minutes, depending on the size of functions)@.";

  emit (Comment(".section\t\".rodata\"\n"));
  emit (Comment(".align\t8\n"));
  emit (Comment("# ------------ Initialize float table ---------\n"));
  preprocess_data dc !FixAddress.hp_init;
  Format.eprintf "hp_init: %d\n" !FixAddress.hp_init;
  let float_hp = load_float_imm dc data 0 in
  float_table := data;
  emit (Comment("# ------------ Initialize register ------------\n"));
  load_imm reg_sp (Int32.of_int sp_init);
  load_imm reg_hp (Int32.of_int (!FixAddress.hp_init + float_hp));
  emit (Comment("# ------------ Text Section -------------------\n"));
  emit (Comment(".section\t\".text\"\n"));
  emit (J("min_caml_start"));
  emit (Comment("# ------------ libmincaml.S -------------------\n"));
  emit (LibmincamlStart);
  emit (Comment("# ------------ body ---------------------------\n"));
  List.iter (fun fundef -> h option fundef) fundefs;
  emit (Comment(".global\tmin_caml_start\n"));
  emit (Label("min_caml_start"));
 
  let e' = if option then RegAllocbyColor.f e else RegAlloc.f e in
  stackset := M.empty;
  stackmap := [];
  g (NonTail("%g0"), e');
  emit (Ret);

  Printf.fprintf stdout "len ys: %d \n" (!len_ys);
  Printf.fprintf stdout "len zs: %d \n" (!len_zs);
  Printf.fprintf stdout "Closure num: %d\n" (!cls_count);

  emit_all !assem_list
  List.rev !assem_list_all