open Asm

(* external gethi : float -> int32 = "gethi" *)
(* external getlo : float -> int32 = "getlo" *)
external get : float -> int32 = "get"

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
let stacksize () = List.length !stackmap + 1

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

let load_imm oc dest v =
    let upper = Int32.shift_right_logical v 16 in
    let lower = Int32.logxor v (Int32.shift_left upper 16) in
    Printf.fprintf oc "\tlui\t%s, %ld\n" dest upper;
    Printf.fprintf oc "\tori\t%s, %s, %ld\n" dest dest lower
  (*
    Printf.fprintf oc "\tori\t%s, %s, %ld\n" dest reg_zero upper;
    Printf.fprintf oc "\taddi\t%s, %s, 16\n" reg_at reg_zero;
    Printf.fprintf oc "\tsll\t%s, %s, %s\n" dest dest reg_at;
    Printf.fprintf oc "\tori\t%s, %s, %ld\n" dest dest lower
    *)

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
    (*
        Printf.fprintf dc "%ld\n" (get d);
        Printf.fprintf dc "%f\n" d;
        *)
        Printf.fprintf dc "%s\n" (to_bits (get d) 0);
            load_float_imm dc rest (acc + 1)
    (*
        (load_imm oc reg_at (get d);
        Printf.fprintf oc "\tsw\t%s, 0(%s)\n" reg_at reg_hp;
        Printf.fprintf oc "\taddi\t%s, %s, 1\n" reg_hp reg_hp;
        load_float_imm oc rest (n+1))
    *)

let addi oc r1 r2 i =
    if -32768 <= i && i <= 32767 then
        Printf.fprintf oc "\taddi\t%s, %s, %d\n" r1 r2 i
    else
       (
        let upper = i asr 16 in
        let lower = i land 0xffff in
        Printf.fprintf oc "\tlui\t%s, %d\n" reg_at upper;
        Printf.fprintf oc "\tori\t%s, %s, %d\n" reg_at reg_at lower;
        Printf.fprintf oc "\tadd\t%s, %s, %s\n" r1 r2 reg_at
        )


type dest = Tail | NonTail of Id.t (* 末尾かどうかを表すデータ型 (caml2html: emit_dest) *)
let rec g oc = function (* 命令列のアセンブリ生成 (caml2html: emit_g) *)
  | dest, Ans(exp) -> g' oc (dest, exp)
  | dest, Let((x, t), exp, e) ->
      g' oc (NonTail(x), exp);
      g oc (dest, e)

and g' oc = function (* 各命令のアセンブリ生成 (caml2html: emit_gprime) *)
  (* 末尾でなかったら計算結果をdestにセット (caml2html: emit_nontail) *)
  | NonTail(_), Nop -> ()
  | NonTail(x), Set(i) ->
        addi oc x reg_zero i
  | NonTail(x), SetF(Id.L(y)) ->
        let (addr, d) = get_float_address y !float_table 0 in
        if addr < 32768 then
            Printf.fprintf oc "\tflw\t%s, %d(%s)\n" x addr reg_zero
        else
           (load_imm oc reg_at (Int32.of_int addr);
            Printf.fprintf oc "\tflw\t%s, 0(%s)# %f\n" x reg_at d)
  | NonTail(x), SetL(Id.L(y)) ->
      Printf.fprintf oc "\taddi\t%s, %s, %s\n" x reg_zero y
  | NonTail(x), Mov(y) when x = y -> ()
  | NonTail(x), Mov(y) ->
        Printf.fprintf oc "\tadd\t%s, %s, %s\n" x reg_zero y
  | NonTail(x), Neg(y) ->
        Printf.fprintf oc "\tsub\t%s, %s, %s\n" x reg_zero y
  | NonTail(x), Add(y, z') ->
       (match z' with
        | V(z) -> Printf.fprintf oc "\tadd\t%s, %s, %s\n" x y z
        | C(i) -> addi oc x y i)
  | NonTail(x), Sub(y, z') ->
       (match z' with
        | V(z) -> Printf.fprintf oc "\tsub\t%s, %s, %s\n" x y z
        | C(i) -> addi oc x y (-i))
  | NonTail(x), Mul(y, z') ->
       (match z' with
        | V(z) -> failwith "Mul Error"
        | C(i) ->
           (match i with
            | 2 -> Printf.fprintf oc "\tsll\t%s, %s, 1\n" x y
            | 4 -> Printf.fprintf oc "\tsll\t%s, %s, 2\n" x y
            | 8 -> Printf.fprintf oc "\tsll\t%s, %s, 3\n" x y
            | _ -> failwith "Mul is supported 2, 4, 8"))
  | NonTail(x), Div(y, z') ->
       (match z' with
        | V(z) -> failwith "Div Error"
        | C(i) ->
        (* srl命令のみ 負の数はだめ *)
            (match i with
            | 2 -> Printf.fprintf oc "\tsrl\t%s, %s, 1\n" x y
            | 4 -> Printf.fprintf oc "\tsrl\t%s, %s, 2\n" x y
            | 8 -> Printf.fprintf oc "\tsrl\t%s, %s, 3\n" x y
            | _ -> failwith "Div is supported 2, 4, 8"))
  | NonTail(x), SLL(y, z') ->
       (match z' with
       | V(z) -> Printf.fprintf oc "\tsll\t%s, %s, %s\n" x y z
       | C(i) -> Printf.fprintf oc "\tsll\t%s, %s, %d\n" x y i)
  | NonTail(x), Ld(y, z') ->
       (match z' with
       | V(z) -> Printf.fprintf oc "\tadd\t%s, %s, %s\n" reg_at y z;
                 Printf.fprintf oc "\tlw\t%s, 0(%s)\n" x reg_at
       | C(i) -> Printf.fprintf oc "\tlw\t%s, %d(%s)\n" x i y)
  | NonTail(_), St(x, y, z') ->
       (match z' with
       | V(z) -> Printf.fprintf oc "\tadd\t%s, %s, %s\n" reg_at y z;
                 Printf.fprintf oc "\tsw\t%s, 0(%s)\n" x reg_at
       | C(i) -> Printf.fprintf oc "\tsw\t%s, %d(%s)\n" x i y)
  | NonTail(x), FMovD(y) when x = y -> ()
  | NonTail(x), FMovD(y) ->
        Printf.fprintf oc "\tfadd\t%s, %s, %s\n" x reg_fzero y
  | NonTail(x), FNegD(y) ->
        Printf.fprintf oc "\tfneg\t%s, %s\n" x y
  | NonTail(x), FAddD(y, z) ->
        Printf.fprintf oc "\tfadd\t%s, %s, %s\n" x y z
  | NonTail(x), FSubD(y, z) ->
        Printf.fprintf oc "\tfsub\t%s, %s, %s\n" x y z
  | NonTail(x), FMulD(y, z) ->
        Printf.fprintf oc "\tfmul\t%s, %s, %s\n" x y z
  | NonTail(x), FDivD(y, z) ->
        Printf.fprintf oc "\tfdiv\t%s, %s, %s\n" x y z
  | NonTail(x), FAbs(y) ->
        Printf.fprintf oc "\tfabs\t%s, %s\n" x y
  | NonTail(x), FSqr(y) ->
        Printf.fprintf oc "\tfsqrt\t%s, %s\n" x y
  | NonTail(x), Ftoi(y) ->
        Printf.fprintf oc "\tftoi\t%s, %s\n" x y
  | NonTail(x), Itof(y) ->
        Printf.fprintf oc "\titof\t%s, %s\n" x y
  | NonTail(x), LdF(y, z') ->
       (match z' with
       | V(z) -> Printf.fprintf oc "\tadd\t%s, %s, %s\n" reg_at y z;
                 Printf.fprintf oc "\tflw\t%s, 0(%s)\n" x reg_at
       | C(i) -> Printf.fprintf oc "\tflw\t%s, %d(%s)\n" x i y)
  | NonTail(_), StF(x, y, z') ->
       (match z' with
       | V(z) -> Printf.fprintf oc "\tadd\t%s, %s, %s\n" reg_at y z;
                 Printf.fprintf oc "\tfsw\t%s, 0(%s)\n" x reg_at
       | C(i) -> Printf.fprintf oc "\tfsw\t%s, %d(%s)\n" x i y)
  | NonTail(_), Comment(s) ->
        Printf.fprintf oc "\t# %s\n" s

  (* 退避の仮想命令の実装 (caml2html: emit_save) *)
  | NonTail(_), Save(x, y) when List.mem x allregs && not (M.mem y !stackset) ->
      save y x;
      Printf.fprintf oc "\tsw\t%s, %d(%s)\n" x (offset y) reg_sp
  | NonTail(_), Save(x, y) when List.mem x allfregs && not (M.mem y !stackset) ->
      save y x;
      Printf.fprintf oc "\tfsw\t%s, %d(%s)\n" x (offset y) reg_sp
  | NonTail(_), Save(x, y) -> assert (M.mem y !stackset); ()

  (* 復帰の仮想命令の実装 (caml2html: emit_restore) *)
  | NonTail(x), Restore(y) when List.mem x allregs ->
      Printf.fprintf oc "\tlw\t%s, %d(%s)\n" x (offset y) reg_sp
  | NonTail(x), Restore(y) ->
      assert (List.mem x allfregs);
      Printf.fprintf oc "\tflw\t%s, %d(%s)\n" x (offset y) reg_sp

  (* 末尾だったら計算結果を第一レジスタにセットしてリターン (caml2html: emit_tailret) *)
  | Tail, (Nop | St _ | StF _ | Comment _ | Save _ as exp) ->
      g' oc (NonTail(Id.gentmp Type.Unit), exp);
      Printf.fprintf oc "\tjr\t%s\n" reg_ra;
  | Tail, (Set _ | SetL _ | Mov _ | Neg _ | Add _ | Sub _ | Mul _ | Div _ | Ftoi _ | SLL _ | Ld _ as exp) ->
      g' oc (NonTail(regs.(0)), exp);
      Printf.fprintf oc "\tjr\t%s\n" reg_ra;
  | Tail, (SetF _ | FMovD _ | FNegD _ | FAbs _ | FSqr _ | Itof _ | FAddD _ | FSubD _ | FMulD _ | FDivD _ | LdF _ as exp) ->
      g' oc (NonTail(fregs.(0)), exp);
      Printf.fprintf oc "\tjr\t%s\n" reg_ra;
  | Tail, (Restore(x) as exp) ->
      let reg = M.find x !stackset in
      if List.mem reg allregs then
           (g' oc (NonTail(regs.(0)), exp);
            Printf.fprintf oc "\tjr\t%s\n" reg_ra)
      else if List.mem reg allfregs then
           (g' oc (NonTail(fregs.(0)), exp);
            Printf.fprintf oc "\tjr\t%s\n" reg_ra)
  | Tail, IfEq(x, y', e1, e2) ->
      (match y' with
      | V(y) -> g'_tail_ifeq oc x y e1 e2 "beq" "bne"
      | C(i) -> addi oc reg_at reg_zero i;
                g'_tail_ifeq oc x reg_at e1 e2 "beq" "bne")
  | Tail, IfLE(x, y', e1, e2) ->
        (* LE -> not GT *)
      (match y' with
      | V(y) -> Printf.fprintf oc "\tslt\t%s, %s, %s\n" reg_at y x;
                g'_tail_ifeq oc reg_at reg_zero e1 e2 "beq" "bne"
      | C(i) -> addi oc reg_at reg_zero i;
                Printf.fprintf oc "\tslt\t%s, %s, %s\n" reg_at reg_at x;
                g'_tail_ifeq oc reg_at reg_zero e1 e2 "beq" "bne")
  | Tail, IfGE(x, y', e1, e2) ->
        (* GE -> not LT *)
      (match y' with
      | V(y) -> Printf.fprintf oc "\tslt\t%s, %s, %s\n" reg_at x y;
                g'_tail_ifeq oc reg_at reg_zero e1 e2 "beq" "bne"
      | C(i) -> Printf.fprintf oc "\tslti\t%s, %s, %d\n" reg_at x i;
                g'_tail_ifeq oc reg_at reg_zero e1 e2 "beq" "bne")
  | Tail, IfFEq(x, y, e1, e2) ->
        g'_tail_ifeq oc x y e1 e2 "fbeq" "fbne"
  | Tail, IfFLE(x, y, e1, e2) ->
        Printf.fprintf oc "\tfslt\t%s, %s, %s\n" reg_at y x;
        g'_tail_ifeq oc reg_at reg_zero e1 e2 "beq" "bne"
  | NonTail(z), IfEq(x, y', e1, e2) ->
      (match y' with
      | V(y) -> g'_non_tail_ifeq oc (NonTail(z)) x y e1 e2 "beq" "bne"
      | C(i) -> addi oc reg_at reg_zero i;
                g'_non_tail_ifeq oc (NonTail(z)) x reg_at e1 e2 "beq" "bne")
  | NonTail(z), IfLE(x, y', e1, e2) ->
        (* LE -> not GT *)
      (match y' with
      | V(y) -> Printf.fprintf oc "\tslt\t%s, %s, %s\n" reg_at y x;
                g'_non_tail_ifeq oc (NonTail(z)) reg_at reg_zero e1 e2 "beq" "bne"
      | C(i) -> addi oc reg_at reg_zero i;
                Printf.fprintf oc "\tslt\t%s, %s, %s\n" reg_at reg_at x;
                g'_non_tail_ifeq oc (NonTail(z)) reg_at reg_zero e1 e2 "beq" "bne")
 | NonTail(z), IfGE(x, y', e1, e2) ->
        (* GE -> not LT *)
      (match y' with
      | V(y) -> Printf.fprintf oc "\tslt\t%s, %s, %s\n" reg_at x y;
                g'_non_tail_ifeq oc (NonTail(z)) reg_at reg_zero e1 e2 "beq" "bne"
      | C(i) -> Printf.fprintf oc "\tslti\t%s, %s, %d\n" reg_at x i;
                g'_non_tail_ifeq oc (NonTail(z)) reg_at reg_zero e1 e2 "beq" "bne")
  | NonTail(z), IfFEq(x, y, e1, e2) ->
        g'_non_tail_ifeq oc (NonTail(z)) x y e1 e2 "fbeq" "fbne"
  | NonTail(z), IfFLE(x, y, e1, e2) ->
        Printf.fprintf oc "\tfslt\t%s, %s, %s\n" reg_at y x;
        g'_non_tail_ifeq oc (NonTail(z)) reg_at reg_zero e1 e2 "beq" "bne"

  (* 関数呼び出しの仮想命令の実装 (caml2html: emit_call) *)
  | Tail, CallCls(x, ys, zs) -> (* 末尾呼び出し (caml2html: emit_tailcall) *)
      g'_args oc [(x, reg_cl)] ys zs;
      Printf.fprintf oc "\tlw\t%s, 0(%s)\n" reg_at reg_cl;
      Printf.fprintf oc "\tjr\t%s\n" reg_at;
  | Tail, CallDir(Id.L(x), ys, zs) -> (* 末尾呼び出し *)
      g'_args oc [] ys zs;
      Printf.fprintf oc "\tj\t%s\n" x;
  | NonTail(a), CallCls(x, ys, zs) ->
      g'_args oc [(x, reg_cl)] ys zs;
      let ss = stacksize () in
      Printf.fprintf oc "\tsw\t%s, %d(%s)\n" reg_ra (ss - 1) reg_sp;
      addi oc reg_sp reg_sp ss;
      Printf.fprintf oc "\tlw\t%s, 0(%s)\n" reg_at reg_cl;
      Printf.fprintf oc "\tjalr\t%s\n" reg_at;
      addi oc reg_sp reg_sp (-ss);
      Printf.fprintf oc "\tlw\t%s, %d(%s)\n" reg_ra (ss - 1) reg_sp;
      if List.mem a allregs && a <> regs.(0) then
        Printf.fprintf oc "\taddi\t%s, %s, 0\n" a regs.(0)
      else if List.mem a allfregs && a <> fregs.(0) then
        Printf.fprintf oc "\tfadd\t%s, %s, %s\n" a fregs.(0) reg_fzero
  | NonTail(a), CallDir(Id.L(x), ys, zs) ->
      g'_args oc [] ys zs;
      let ss = stacksize () in
      Printf.fprintf oc "\tsw\t%s, %d(%s)\n" reg_ra (ss - 1) reg_sp;
      addi oc reg_sp reg_sp ss;
      Printf.fprintf oc "\tjal\t%s\n" x;
      addi oc reg_sp reg_sp (-ss);
      Printf.fprintf oc "\tlw\t%s, %d(%s)\n" reg_ra (ss - 1) reg_sp;
      if List.mem a allregs && a <> regs.(0) then
        Printf.fprintf oc "\taddi\t%s, %s, 0\n" a regs.(0)
      else if List.mem a allfregs && a <> fregs.(0) then
        Printf.fprintf oc "\tfadd\t%s, %s, %s\n" a fregs.(0) reg_fzero

and g'_tail_ifeq oc o1 o2 e1 e2 b bn =
    let b_else = Id.genid (b ^ "_else") in
    Printf.fprintf oc "\t%s\t%s, %s, %s\n" bn o1 o2 b_else;
    let stackset_back = !stackset in
    g oc (Tail, e1);
    Printf.fprintf oc "%s:\n" b_else;
    stackset := stackset_back;
    g oc (Tail, e2)
and g'_non_tail_ifeq oc dest o1 o2 e1 e2 b bn =
    let b_else = Id.genid (b ^ "_else") in
    let b_cont = Id.genid (b ^ "_cont") in
    Printf.fprintf oc "\t%s\t%s, %s, %s\n" bn o1 o2 b_else;
    let stackset_back = !stackset in
    g oc (dest, e1);
    let stackset1 = !stackset in
    Printf.fprintf oc "\tj\t%s\n" b_cont;
    Printf.fprintf oc "%s:\n" b_else;
    stackset := stackset_back;
    g oc (dest, e2);
    Printf.fprintf oc "%s:\n" b_cont;
    let stackset2 = !stackset in
    stackset := M.filter (fun x _ -> M.mem x stackset1) stackset2

and g'_args oc x_reg_cl ys zs =
  let (i, yrs) =
    List.fold_left
      (fun (i, yrs) y -> (i + 1, (y, regs.(i)) :: yrs))
      (0, x_reg_cl)
      ys in
  List.iter
    (fun (y, r) -> Printf.fprintf oc "\taddi\t%s, %s, 0\n" r y)
    (shuffle reg_sw yrs);
  let (d, zfrs) =
    List.fold_left
      (fun (d, zfrs) z -> (d + 1, (z, fregs.(d)) :: zfrs))
      (0, [])
      zs in
  List.iter
    (fun (z, fr) -> Printf.fprintf oc "\tfadd\t%s, %s, %s\n" fr z reg_fzero)
    (shuffle reg_fsw zfrs)

let h oc { name = Id.L(x); args = _; fargs = _; body = e; ret = _ } =
  Printf.fprintf oc "%s:\n" x;
  stackset := M.empty;
  stackmap := [];
  g oc (Tail, e)

let f (oc, dc) (Prog(data, fundefs, e)) =
  Format.eprintf "generating assembly...@.";
  Printf.fprintf oc ".section\t\".rodata\"\n";
  Printf.fprintf oc ".align\t8\n";
  Printf.fprintf oc "# ------------ Initialize float table ---------\n";
  preprocess_data dc !FixAddress.hp_init;
  Format.eprintf "hp_init: %d\n" !FixAddress.hp_init;
  let float_hp = load_float_imm dc data 0 in
  float_table := data;
  Printf.fprintf oc "# ------------ Initialize register ------------\n";
  load_imm oc reg_sp (Int32.of_int sp_init);
  load_imm oc reg_hp (Int32.of_int (!FixAddress.hp_init + float_hp));
  Printf.fprintf oc "# ------------ Text Section -------------------\n";
  Printf.fprintf oc ".section\t\".text\"\n";
    Printf.fprintf oc "\tj\tmin_caml_start\n";
  Printf.fprintf oc "# ------------ libmincaml.S -------------------\n";
   (
    let inchan = open_in "libmincaml.S" in
    try
        while true do
            let line = input_line inchan in Printf.fprintf oc "%s\n" line;
        done
    with
    | End_of_file -> (close_in inchan)
   );
  Printf.fprintf oc "# ------------ body ---------------------------\n";
  List.iter (fun fundef -> h oc fundef) fundefs;
  Printf.fprintf oc ".global\tmin_caml_start\n";
  Printf.fprintf oc "min_caml_start:\n";
  stackset := M.empty;
  stackmap := [];
  g oc (NonTail("%g0"), e);
  Printf.fprintf oc "\tret\n";