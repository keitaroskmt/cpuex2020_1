open Asm
open Assem

external get : float -> int32 = "get"
let stackset = ref M.empty (* すでにSaveされた変数の集合 (caml2html: emit_stackset) *)
let stackmap = ref [] (* Saveされた変数の、スタックにおける位置 (caml2html: emit_stackmap) *)

let inst_int_list = ref []
let inst_float_list = ref []

let emit_int inst = inst_int_list := inst :: !inst_int_list 
let emit_float inst = inst_float_list := inst :: !inst_float_list 


let pp_id_or_imm = function
  | V(x) -> x
  | C(i) -> string_of_int i

type dest = Tail | NonTail of Id.t 
let rec g = function 
  | dest, Ans(exp) -> g' (dest, exp)
  | dest, Let((x, t), exp, e) ->
      g' (NonTail(x), exp);
      g (dest, e) 

and g' = function 
  | NonTail(_), Nop -> ()
  | NonTail(x), Set(i) | NonTail(x), SerL(Id.L(y)) ->
        emit_int (OPER {
          dst = [x];
          src = [];
          jump = None
        })
  | NonTail(x), SetF(Id.L(y)) ->
        emit_float (OPER {
          dst = [x];
          src = [];
          jump = None
        })
  | NonTail(x), Mov(y) when x = y -> ()
  | NonTail(x), Mov(y) ->
        emit_int (MOVE {
          dst = [x];
          src = [y]
        })
  | NonTail(x), Neg(y) ->
        emit_int (OPER {
          dst = [x];
          src = [y];
          jump = None
        })
  | NonTail(x), Add(y, z') | NonTail(x), Sub(y, z') | NonTail(x), SLL(y, z') | NonTail(x), Ld(y, z') ->
       (match z' with
        | V(z) -> emit_int(OPER {
                    dst = [x];
                    src = [y; z];
                    jump = None
                  })
        | C(i) -> emit_int(OPER {
                    dst = [x];
                    src = [y];
                    jump = None
                  }))
  | NonTail(x), Mul(y, z') | NonTail(x), Div(y, z') ->
       (match z' with
        | V(z) -> failwith "Mul or Div Error"
        | C(i) -> emit_int(OPER {
                    dst = [x];
                    src = [y];
                    jump = None
                  }))
  | NonTail(_), St(x, y, z') ->
       (match z' with
       | V(z) -> emit_int(OPER {
                    dst = [];
                    src = [x; y; z];
                    jump = None
                  })
       | C(i) -> emit_int(OPER {
                    dst = [];
                    src = [x; y];
                    jump = None
                  }))
  | NonTail(x), FMovD(y) when x = y -> ()
  | NonTail(x), FMovD(y) ->
        emit_float (MOVE {
          dst = [x];
          src = [y];
        })
  | NonTail(x), FNegD(y) | NonTail(x), FAbs(y) | NonTail(x), FSqr(y) | NonTail(x), Floor(y) ->
        emit_float(OPER {
          dst = [x];
          src = [y];
          jump = None
        })
  | NonTail(x), FAddD(y, z) | NonTail(x), FSubD(y, z) | NonTail(x), FMulD(y, z) | NonTail(x), FDivD(y, z) ->
        emit_float(OPER {
          dst = [x];
          src = [y; z];
          jump = None
        })
  | NonTail(x), Ftoi(y) ->
        (emit_int(OPER {
          dst = [x];
          src = [];
          jump = None
        });
        emit_float(OPER {
          dst = [];
          src = [y];
          jump = None
        }))
  | NonTail(x), Itof(y) ->
        (emit_int(OPER {
          dst = [];
          src = [y];
          jump = None
        });
        emit_float(OPER {
          dst = [x];
          src = [];
          jump = None
        }))
  | NonTail(x), LdF(y, z') ->
       (match z' with
        | V(z) -> (emit_int(OPER {
                    dst = [];
                    src = [y; z];
                    jump = None
                  });
                  emit_float(OPER {
                    dst = [x];
                    src = [];
                    jump = None
                  }))
        | C(i) -> (emit_int(OPER {
                    dst = [];
                    src = [y];
                    jump = None
                  }));
                  emit_float(OPER {
                    dst = [x];
                    src = [];
                    jump = None
                  }))
  | NonTail(_), StF(x, y, z') ->
       (match z' with
       | V(z) -> (emit_int(OPER {
                    dst = [];
                    src = [y; z];
                    jump = None
                  });
                  emit_float(OPER {
                    dst = [];
                    src = [x];
                    jump = None
                  }))
       | C(i) -> (emit_int(OPER {
                    dst = [];
                    src = [y];
                    jump = None
                  });
                  emit_float(OPER {
                    dst = [];
                    src = [x];
                    jump = None
                  })))
  | NonTail(_), Comment(s) -> ()

  (* 使わない *)
  | NonTail(_), Save(x, y) ->
      failwith("Save error in toAssem.ml")
  (* 使わない *)
  | NonTail(x), Restore(y) ->
      failwith("Restore error in toAssem.ml")


      (* TODO: reg_raのjump先について考えること *)
  | Tail, (Nop | St _ | StF _ | Comment _ | Save _ as exp) ->
      g' oc (NonTail(Id.gentmp Type.Unit), exp);
  | Tail, (Set _ | SetL _ | Mov _ | Neg _ | Add _ | Sub _ | Mul _ | Div _ | Ftoi _ | SLL _ | Ld _ as exp) ->
      g' oc (NonTail(regs.(0)), exp);
  | Tail, (SetF _ | FMovD _ | FNegD _ | FAbs _ | FSqr _ | Itof _ | Floor _ | FAddD _ | FSubD _ | FMulD _ | FDivD _ | LdF _ as exp) ->
      g' oc (NonTail(fregs.(0)), exp);
  | Tail, (Restore(x) as exp) ->
      failwith("Restore error in toAssem.ml")
  | Tail, IfEq(x, y', e1, e2) | Tail, IfLE(x, y', e1, e2) | Tail, IfGE(x, y', e1, e2) ->
      let b_else = Id.genid ("else") in
      (match y' with
      | V(y) -> emit_int(OPER {
        dst = [];
        src = [x; y];
        jump = [Some(b_else)]
      }) 
      | C(i) -> emit_int)
and g'_tail_if o1 o2 e1 e2 b bn =
    let b_else = Id.genid (b ^ "_else") in
    Printf.fprintf oc "\t%s\t%s, %s, %s\n" bn o1 o2 b_else;
    g (Tail, e1);
    emit_int(LABEL {lab = Id.l(b_else)});
    emit_float(LABEL {lab = Id.l(b_else)});
    g (Tail, e2)
and g'_tail_if_imm oc o1 o2 e1 e2 b bn =
    let b_else = Id.genid (b ^ "_else") in
    Printf.fprintf oc "\t%s\t%s, %d, %s\n" bn o1 o2 b_else;
    let stackset_back = !stackset in
    g oc (Tail, e1);
    Printf.fprintf oc "%s:\n" b_else;
    stackset := stackset_back;
    g oc (Tail, e2)
      (* x = y then e1 <=> x != y then e2 *)
      (match y' with
      | V(y) -> g'_tail_if oc x y e1 e2 "beq" "bne"
      | C(i) -> if -128 <= i && i <= 127 then g'_tail_if_imm oc x i e2 e1 "bnei" "beqi"
                else (addi oc reg_at reg_zero i;
                        g'_tail_if oc x reg_at e1 e2 "beq" "bne"))
  | Tail, IfLE(x, y', e1, e2) ->
      (* x <= y then e1 <=> x > y then e2 <=> y < x then e2 *)
      (match y' with
      | V(y) -> g'_tail_if oc y x e1 e2 "bgt" "blt"
      | C(i) -> addi oc reg_at reg_zero i;
                g'_tail_if oc reg_at x e1 e2 "bgt" "blt")
  | Tail, IfGE(x, y', e1, e2) ->
       (* x >= y then e1 <=> x < y then e2 *)
      (match y' with
      | V(y) -> g'_tail_if oc x y e1 e2 "bgt" "blt"
      | C(i) -> if -128 <= i && i <= 127 then g'_tail_if_imm oc x i e1 e2 "bgti" "blti"
                else (addi oc reg_at reg_zero i;
                        g'_tail_if oc x reg_at e1 e2 "bgt" "blt"))
  | Tail, IfFEq(x, y, e1, e2) ->
      (* x = y then e1 <=> x != y then e2 *)
        g'_tail_if oc x y e1 e2 "fbeq" "fbne"
  | Tail, IfFLE(x, y, e1, e2) ->
      (* x <= y then e1 <=> x > y then e2 <=> y < x then e2 *)
        g'_tail_if oc y x e1 e2 "fbgt" "fblt"
  | NonTail(z), IfEq(x, y', e1, e2) ->
      (* x = y then e1 <=> x != y then e2 *)
      (match y' with
      | V(y) -> g'_non_tail_if oc (NonTail(z)) x y e1 e2 "beq" "bne"
      | C(i) -> if -128 <= i && i <= 127 then g'_non_tail_if_imm oc (NonTail(z)) x i e2 e1 "bnei" "beqi"
                else (addi oc reg_at reg_zero i;
                        g'_non_tail_if oc (NonTail(z)) x reg_at e1 e2 "beq" "bne"))
  | NonTail(z), IfLE(x, y', e1, e2) ->
      (* x <= y then e1 <=> x > y then e2 <=> y < x then e2 *)
      (match y' with
      | V(y) -> g'_non_tail_if oc (NonTail(z)) y x e1 e2 "bgt" "blt"
      | C(i) -> addi oc reg_at reg_zero i;
                g'_non_tail_if oc (NonTail(z)) reg_at x e1 e2 "bgt" "blt")
 | NonTail(z), IfGE(x, y', e1, e2) ->
       (* x >= y then e1 <=> x < y then e2 *)
      (match y' with
      | V(y) -> g'_non_tail_if oc (NonTail(z)) x y e1 e2 "bgt" "blt"
      | C(i) -> if -128 <= i && i <= 127 then g'_non_tail_if_imm oc (NonTail(z)) x i e1 e2 "bgti" "blti"
                else (addi oc reg_at reg_zero i;
                        g'_non_tail_if oc (NonTail(z)) x reg_at e1 e2 "bgt" "blt"))
  | NonTail(z), IfFEq(x, y, e1, e2) ->
      (* x = y then e1 <=> x != y then e2 *)
        g'_non_tail_if oc (NonTail(z)) x y e1 e2 "fbeq" "fbne"
  | NonTail(z), IfFLE(x, y, e1, e2) ->
      (* x <= y then e1 <=> x > y then e2 <=> y < x then e2 *)
        g'_non_tail_if oc (NonTail(z)) y x e1 e2 "fbgt" "fblt"

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
        Printf.fprintf oc "\tfmov\t%s, %s\n" a fregs.(0)
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
        Printf.fprintf oc "\tfmov\t%s, %s\n" a fregs.(0)

(* TODO: falseの場合の分岐について考えること *)
and g'_tail_if o1 o2 e1 e2 b bn =
    let b_else = Id.genid (b ^ "_else") in
    Printf.fprintf oc "\t%s\t%s, %s, %s\n" bn o1 o2 b_else;
    g (Tail, e1);
    emit_int(LABEL {lab = Id.l(b_else)});
    emit_float(LABEL {lab = Id.l(b_else)});
    g (Tail, e2)
and g'_tail_if_imm oc o1 o2 e1 e2 b bn =
    let b_else = Id.genid (b ^ "_else") in
    Printf.fprintf oc "\t%s\t%s, %d, %s\n" bn o1 o2 b_else;
    let stackset_back = !stackset in
    g oc (Tail, e1);
    Printf.fprintf oc "%s:\n" b_else;
    stackset := stackset_back;
    g oc (Tail, e2)
and g'_non_tail_if oc dest o1 o2 e1 e2 b bn =
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
and g'_non_tail_if_imm oc dest o1 o2 e1 e2 b bn =
    let b_else = Id.genid (b ^ "_else") in
    let b_cont = Id.genid (b ^ "_cont") in
    Printf.fprintf oc "\t%s\t%s, %d, %s\n" bn o1 o2 b_else;
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
      (fun (z, fr) -> Printf.fprintf oc "\tfmov\t%s, %s\n" fr z)
      (shuffle reg_fsw zfrs)

let h { name = Id.L(x); args = _; fargs = _; body = e; ret = _ } =
    emit_int(LABEL {lab = Id.L(x)});
    emit_float(LABEL {lab = Id.L(x)});
    stackset := M.empty;
    stackmap := [];
    g oc (Tail, e)

let f (Prog(data, fundefs, e)) =
    let float_hp = load_float_imm data 0 in
    float_table := data;
    load_imm oc reg_sp (Int32.of_int sp_init);
    load_imm oc reg_hp (Int32.of_int (!FixAddress.hp_init + float_hp));
    emit(J(Id.l("min_caml_start")))
    List.iter (fun fundef -> h oc fundef) fundefs;
    (* Printf.fprintf oc ".global\tmin_caml_start\n"; *)
    emit(Lable(Id.l("min_caml_start")))
    stackset := M.empty;
    stackmap := [];
    g oc (NonTail("%g0"), e);
    Printf.fprintf oc "\tret\n";


  (* 
    virtual.ml -> simm.ml -> regAlloc.ml -> emit.ml
                    | 
                    |-> regAllocbyColor.ml -> emit.ml

    関数ごとに, Id.tからregisterへのmapとstackの状態を
    toAssem.ml -> liveness.ml -> Interference.ml -> Color.ml
    の一連の流れで得る
  *)