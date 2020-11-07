open Asm

(* external gethi : float -> int32 = "gethi" *)
(* external getlo : float -> int32 = "getlo" *)
external get : float -> int32 = "get"

let float_table = ref []

(* float��ñ���٤ˤ������Ȥˤ��, �����å�����ͤη���int�ȶ��̤��դ��ʤ��ʤä��Τ�, stackset�Ϸ��⵭��. *)
let stackset = ref M.empty (* ���Ǥ�Save���줿�ѿ��ν��� (caml2html: emit_stackset) *)
let stackmap = ref [] (* Save���줿�ѿ��Ρ������å��ˤ�������� (caml2html: emit_stackmap) *)
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
let offset x = 4 * List.hd (locate x)
let stacksize () = align ((List.length !stackmap + 1) * 4)

let pp_id_or_imm = function
  | V(x) -> x
  | C(i) -> string_of_int i

(* �ؿ��ƤӽФ��Τ���˰������¤��ؤ���(register shuffling) (caml2html: emit_shuffle) *)
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
        (if x = label then (hp_init + n, d)
        else get_float_address label rest (n + 4))

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

let rec load_float_imm oc data n =
    match data with
    | [] -> ()
    | (Id.L(x), d) :: rest ->
        (load_imm oc reg_at (get d);
        Printf.fprintf oc "\tsw\t%s, 0(%s)\n" reg_at reg_hp;
        Printf.fprintf oc "\taddi\t%s, %s, 4\n" reg_hp reg_hp;
        load_float_imm oc rest (n+1))

type dest = Tail | NonTail of Id.t (* �������ɤ�����ɽ���ǡ����� (caml2html: emit_dest) *)
let rec g oc = function (* ̿����Υ�����֥����� (caml2html: emit_g) *)
  | dest, Ans(exp) -> g' oc (dest, exp)
  | dest, Let((x, t), exp, e) ->
      g' oc (NonTail(x), exp);
      g oc (dest, e)

and g' oc = function (* ��̿��Υ�����֥����� (caml2html: emit_gprime) *)
  (* �����Ǥʤ��ä���׻���̤�dest�˥��å� (caml2html: emit_nontail) *)
  | NonTail(_), Nop -> ()
  | NonTail(x), Set(i) ->
        Printf.fprintf oc "\taddi\t%s, %s, %d\n" x reg_zero i
  | NonTail(x), SetF(Id.L(y)) ->
        let (addr, d) = get_float_address y !float_table 0 in
        if addr < 32768 then
            Printf.fprintf oc "\tflw\t%s, %d(%s)\n" x addr reg_zero
        else
           (load_imm oc reg_at (Int32.of_int addr);
            Printf.fprintf oc "\tflw\t%s, 0(%s) # %f\n" x reg_at d)
  | NonTail(x), SetL(Id.L(y)) ->
        Printf.fprintf oc "\tadd\t%s, %s, %s\n" x reg_zero y
  | NonTail(x), Mov(y) when x = y -> ()
  | NonTail(x), Mov(y) ->
        Printf.fprintf oc "\tadd\t%s, %s, %s\n" x reg_zero y
  | NonTail(x), Neg(y) ->
        Printf.fprintf oc "\tsub\t%s, %s, %s\n" x reg_zero y
  | NonTail(x), Add(y, z') ->
       (match z' with
        | V(z) -> Printf.fprintf oc "\tadd\t%s, %s, %s\n" x y z
        | C(i) -> Printf.fprintf oc "\taddi\t%s, %s, %d\n" x y i)
  | NonTail(x), Sub(y, z') ->
       (match z' with
        | V(z) -> Printf.fprintf oc "\tsub\t%s, %s, %s\n" x y z
        | C(i) -> Printf.fprintf oc "\taddi\t%s, %s, %d\n" x y (-i))
  | NonTail(x), SLL(y, z') ->
       (match z' with
       | V(z) -> Printf.fprintf oc "\tsll\t%s, %s, %s\n" x y z
       | C(i) -> Printf.fprintf oc "\tslli\t%s, %s, %d\n" x y i)
  | NonTail(x), Ld(y, z') ->
       (match z' with
       | V(z) -> Printf.fprintf oc "\tadd\t%s, %s, %s\n" reg_at y z;
                 Printf.fprintf oc "\tlw\t%s, 0(%s)" x reg_at
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
        Printf.fprintf oc "\tfsub\t%s, %s, %s\n" x reg_fzero y
  | NonTail(x), FAddD(y, z) ->
        Printf.fprintf oc "\tfadd\t%s, %s, %s\n" x y z
  | NonTail(x), FSubD(y, z) ->
        Printf.fprintf oc "\tfsub\t%s, %s, %s\n" x y z
  | NonTail(x), FMulD(y, z) ->
        Printf.fprintf oc "\tfmul\t%s, %s, %s\n" x y z
  | NonTail(x), FDivD(y, z) ->
        Printf.fprintf oc "\tfdiv\t%s, %s, %s\n" x y z
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

  (* ����β���̿��μ��� (caml2html: emit_save) *)
  | NonTail(_), Save(x, y) when List.mem x allregs && not (M.mem y !stackset) ->
      save y x;
      Printf.fprintf oc "\tsw\t%s, %d(%s)\n" x (offset y) reg_sp
  | NonTail(_), Save(x, y) when List.mem x allfregs && not (M.mem y !stackset) ->
      save y x;
      Printf.fprintf oc "\tfsw\t%s, %d(%s)\n" x (offset y) reg_sp
  | NonTail(_), Save(x, y) -> assert (M.mem y !stackset); ()

  (* �����β���̿��μ��� (caml2html: emit_restore) *)
  | NonTail(x), Restore(y) when List.mem x allregs ->
      Printf.fprintf oc "\tlw\t%s, %d(%s)\n" x (offset y) reg_sp
  | NonTail(x), Restore(y) ->
      assert (List.mem x allfregs);
      Printf.fprintf oc "\tflw\t%s, %d(%s)\n" x (offset y) reg_sp

  (* �������ä���׻���̤����쥸�����˥��åȤ��ƥ꥿���� (caml2html: emit_tailret) *)
  | Tail, (Nop | St _ | StF _ | Comment _ | Save _ as exp) ->
      g' oc (NonTail(Id.gentmp Type.Unit), exp);
      Printf.fprintf oc "\tjr\t%s\n" reg_ra;
  | Tail, (Set _ | SetF _ | SetL _ | Mov _ | Neg _ | Add _ | Sub _ | SLL _ | Ld _ as exp) ->
      g' oc (NonTail(regs.(0)), exp);
      Printf.fprintf oc "\tjr\t%s\n" reg_ra;
  | Tail, (FMovD _ | FNegD _ | FAddD _ | FSubD _ | FMulD _ | FDivD _ | LdF _ as exp) ->
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
      | C(i) -> Printf.fprintf oc "\taddi\t%s, %s, %d\n" reg_at reg_zero i;
                g'_tail_ifeq oc x reg_at e1 e2 "beq" "bne")
  | Tail, IfLE(x, y', e1, e2) ->
        (* LE -> not GT *)
      (match y' with
      | V(y) -> Printf.fprintf oc "\tslt\t%s, %s, %s\n" reg_at y x;
                g'_tail_ifeq oc reg_at reg_zero e1 e2 "beq" "bne"
      | C(i) -> Printf.fprintf oc "\taddi\t%s, %s, %d\n" reg_at reg_zero i;
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
        Printf.fprintf oc "\tfslt\t%s, %s, %s\n" reg_fat y x;
        g'_tail_ifeq oc reg_fat reg_fzero e1 e2 "fbeq" "fbne"
  | NonTail(z), IfEq(x, y', e1, e2) ->
      (match y' with
      | V(y) -> g'_non_tail_ifeq oc (NonTail(z)) x y e1 e2 "beq" "bne"
      | C(i) -> Printf.fprintf oc "\taddi\t%s, %s, %d\n" reg_at reg_zero i;
                g'_non_tail_ifeq oc (NonTail(z)) x reg_at e1 e2 "beq" "bne")
  | NonTail(z), IfLE(x, y', e1, e2) ->
        (* LE -> not GT *)
      (match y' with
      | V(y) -> Printf.fprintf oc "\tslt\t%s, %s, %s\n" reg_at y x;
                g'_non_tail_ifeq oc (NonTail(z)) reg_at reg_zero e1 e2 "beq" "bne"
      | C(i) -> Printf.fprintf oc "\taddi\t%s, %s, %d\n" reg_at reg_zero i;
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
        Printf.fprintf oc "\tfslt\t%s, %s, %s\n" reg_fat y x;
        g'_non_tail_ifeq oc (NonTail(z)) reg_fat reg_fzero e1 e2 "fbeq" "fbne"

  (* �ؿ��ƤӽФ��β���̿��μ��� (caml2html: emit_call) *)
  | Tail, CallCls(x, ys, zs) -> (* �����ƤӽФ� (caml2html: emit_tailcall) *)
      g'_args oc [(x, reg_cl)] ys zs;
      Printf.fprintf oc "\tlw\t%s, 0(%s)\n" reg_at reg_cl;
      Printf.fprintf oc "\tjr\t%s\n" reg_at;
  | Tail, CallDir(Id.L(x), ys, zs) -> (* �����ƤӽФ� *)
      g'_args oc [] ys zs;
      Printf.fprintf oc "\tj\t%s\n" x;
  | NonTail(a), CallCls(x, ys, zs) ->
      g'_args oc [(x, reg_cl)] ys zs;
      let ss = stacksize () in
      Printf.fprintf oc "\tsw\t%s, %d(%s)\n" reg_ra (ss - 4) reg_sp;
      Printf.fprintf oc "\taddi\t%s, %s, %d\n" reg_sp reg_sp ss;
      Printf.fprintf oc "\tlw\t%s, 0(%s)\n" reg_at reg_cl;
      Printf.fprintf oc "\tjalr\t%s\n" reg_at;
      Printf.fprintf oc "\taddi\t%s, %s, %d\n" reg_sp reg_sp (-ss);
      Printf.fprintf oc "\tlw\t%s, %d(%s)\n" reg_ra (ss - 4) reg_sp;
      if List.mem a allregs && a <> regs.(0) then
        Printf.fprintf oc "\taddi\t%s, %s, 0\n" a regs.(0)
      else if List.mem a allfregs && a <> fregs.(0) then
        Printf.fprintf oc "\tfadd\t%s, %s, %s\n" a fregs.(0) reg_fzero
  | NonTail(a), CallDir(Id.L(x), ys, zs) ->
      g'_args oc [] ys zs;
      let ss = stacksize () in
      Printf.fprintf oc "\tsw\t%s, %d(%s)\n" reg_ra (ss - 4) reg_sp;
      Printf.fprintf oc "\taddi\t%s, %s, %d\n" reg_sp reg_sp ss;
      Printf.fprintf oc "\tjal\t%s\n" x;
      Printf.fprintf oc "\taddi\t%s, %s, %d\n" reg_sp reg_sp (-ss);
      Printf.fprintf oc "\tlw\t%s, %d(%s)\n" reg_ra (ss - 4) reg_sp;
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

let f oc (Prog(data, fundefs, e)) =
  Format.eprintf "generating assembly...@.";
  Printf.fprintf oc ".section\t\".rodata\"\n";
  Printf.fprintf oc ".align\t8\n";
  Printf.fprintf oc "# Initialize register\n";
  load_imm oc reg_sp (Int32.of_int sp_init);
  load_imm oc reg_hp (Int32.of_int hp_init);
  Printf.fprintf oc "# Initialize float table\n";
  load_float_imm oc data 0;
  float_table := data;
  Printf.fprintf oc ".section\t\".text\"\n";
  List.iter (fun fundef -> h oc fundef) fundefs;
  Printf.fprintf oc ".global\tmin_caml_start\n";
  Printf.fprintf oc "min_caml_start:\n";
  stackset := M.empty;
  stackmap := [];
  g oc (NonTail("%g0"), e);
  Printf.fprintf oc "\tret\n";