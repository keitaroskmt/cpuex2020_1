open Asm
open Block


let inst_list = ref []
let emit inst = 
    inst_list := inst :: !inst_list


type dest = Tail | NonTail of (Id.t * Type.t)
let rec g = function 
  | dest, Ans(exp) -> g' (dest, exp)
  | dest, Let((x, t), exp, e) ->
      g' (NonTail((x, t)), exp);
      g (dest, e) 

and g' = function 
  | NonTail(_), Nop -> ()
  (* 型をintにしておかないと例えばFloat list型などありうる. このとき, livenessなどでノードの一致判定で同じ変数でも型が違うとバグる *)
  | NonTail((x, _)), Set(_) | NonTail((x, _)), SetL(_) ->
        emit (OPER {
          dst = [(x, Type.Int)];
          src = [];
          jump = None
        })
  | NonTail((x, _)), SetF(_) ->
        emit (OPER {
          dst = [(x, Type.Float)];
          src = [];
          jump = None
        })
  | NonTail((x, _)), Mov(y) when x = y -> ()
  | NonTail((x, _)), Mov(y) ->
        emit (MOVE {
          dst = [(x, Type.Int)];
          src = [(y, Type.Int)]
        })
  | NonTail((x, _)), Neg(y) ->
        emit (OPER {
          dst = [(x, Type.Int)];
          src = [(y, Type.Int)];
          jump = None
        })
  (* Ld先の型がintではなく, listのとき (多重配列) バグるので明示的にintにしておく *)
  | NonTail((x, _)), Add(y, z') | NonTail((x, _)), Sub(y, z') | NonTail((x, _)), SLL(y, z') | NonTail((x, _)), Ld(y, z') ->
       (match z' with
        | V(z) -> emit (OPER {
                    dst = [(x, Type.Int)];
                    src = [(y, Type.Int); (z, Type.Int)];
                    jump = None
                  })
        | C(i) -> emit (OPER {
                    dst = [(x, Type.Int)];
                    src = [(y, Type.Int)];
                    jump = None
                  }))
  | NonTail((x, _)), Mul(y, z') | NonTail((x, _)), Div(y, z') ->
       (match z' with
        | V(z) -> failwith "Mul or Div Error"
        | C(i) -> emit (OPER {
                    dst = [(x, Type.Int)];
                    src = [(y, Type.Int)];
                    jump = None
                  }))
  | NonTail(_), St(x, y, z') ->
       (match z' with
       | V(z) -> emit (OPER {
                    dst = [];
                    src = [(x, Type.Int); (y, Type.Int); (z, Type.Int)];
                    jump = None
                  })
       | C(i) -> emit (OPER {
                    dst = [];
                    src = [(x, Type.Int); (y, Type.Int)];
                    jump = None
                  }))
  | NonTail((x, _)), FMovD(y) when x = y -> ()
  | NonTail((x, _)), FMovD(y) ->
        emit (MOVE {
          dst = [(x, Type.Float)];
          src = [(y, Type.Float)];
        })
  | NonTail((x, _)), FNegD(y) | NonTail((x, _)), FAbs(y) | NonTail((x, _)), FSqr(y) | NonTail((x, _)), Floor(y) ->
        emit (OPER {
          dst = [(x, Type.Float)];
          src = [(y, Type.Float)];
          jump = None
        })
  | NonTail((x, _)), FAddD(y, z) | NonTail((x, _)), FSubD(y, z) | NonTail((x, _)), FMulD(y, z) | NonTail((x, _)), FDivD(y, z) ->
        emit (OPER {
          dst = [(x, Type.Float)];
          src = [(y, Type.Float); (z, Type.Float)];
          jump = None
        })
  | NonTail((x, _)), Ftoi(y) ->
        emit (OPER {
          dst = [(x, Type.Int)];
          src = [(y, Type.Float)];
          jump = None
        });
  | NonTail((x, _)), Itof(y) ->
        emit (OPER {
          dst = [(x, Type.Float)];
          src = [(y, Type.Int)];
          jump = None
        });
  | NonTail((x, t)), LdF(y, z') ->
       (match z' with
        | V(z) -> emit (OPER {
                    dst = [(x, Type.Float)];
                    src = [(y, Type.Int); (z, Type.Int)];
                    jump = None
                  })
        | C(i) -> emit (OPER {
                    dst = [(x, Type.Float)];
                    src = [(y, Type.Int)];
                    jump = None
                  }))
  | NonTail(_), StF(x, y, z') ->
       (match z' with
       | V(z) -> emit (OPER {
                    dst = [];
                    src = [(x, Type.Float); (y, Type.Int); (z, Type.Int)];
                    jump = None
                  })
       | C(i) -> emit (OPER {
                    dst = [];
                    src = [(x, Type.Float); (y, Type.Int)];
                    jump = None
                  }))
  | NonTail(_), Comment(s) -> ()

  | NonTail((x, _)), Slt(y, z) -> 
      emit (OPER {
        dst = [(x, Type.Int)];
        src = [(y, Type.Int); (z, Type.Int)];
        jump = None
      })
  | NonTail((x, _)), FSlt(y, z) -> 
      emit (OPER {
        dst = [(x, Type.Int)];
        src = [(y, Type.Float); (z, Type.Float)];
        jump = None
      })
  (* ? *)
  | NonTail(_), Save(x, y) -> ()
  (* ? *)
  | NonTail(xt), Restore(y) -> emit (OPER {
                                    dst = [xt];
                                    src = [];
                                    jump = None
                                })


      (* reg_raのjump先について考えること -> 関数ごとに考えるので不要 *)
  | Tail, (Nop | St _ | StF _ | Comment _ | Save _ as exp) ->
      g' (NonTail((Id.gentmp Type.Unit, Type.Unit)), exp);
  | Tail, (Set _ | SetL _ | Mov _ | Neg _ | Add _ | Sub _ | Mul _ | Div _ | Ftoi _ | SLL _ | Ld _ | Slt _ | FSlt _  as exp) ->
      g' (NonTail((regs.(0), Type.Int)), exp);
  | Tail, (SetF _ | FMovD _ | FNegD _ | FAbs _ | FSqr _ | Itof _ | Floor _ | FAddD _ | FSubD _ | FMulD _ | FDivD _ | LdF _ as exp) ->
      g' (NonTail((fregs.(0), Type.Float)), exp);
  | Tail, (Restore(x) as exp) ->
      ()  
  | Tail, IfEq(x, y', e1, e2) | Tail, IfLE(x, y', e1, e2) | Tail, IfGE(x, y', e1, e2) ->
      let b_else = Id.genid ("else") in
      let b_then = Id.genid ("then") in
      let b_cont = Id.genid ("cont") in
      (match y' with
      | V(y) -> emit (OPER {
        dst = [];
        src = [(x, Type.Int); (y, Type.Int)];
        jump = Some [Id.L(b_then); Id.L(b_else)]
      }) 
      | C(i) -> emit (OPER {
        dst = [];
        src = [(x, Type.Int)];
        jump = Some [Id.L(b_then); Id.L(b_else)]
      }));
      emit (LABEL {
          lab = Id.L(b_then)
      });
      g (Tail, e1);
      emit (OPER {
          dst = [];
          src = [];
          jump = Some [Id.L(b_cont)];
      });
      emit (LABEL {
          lab = Id.L(b_else)
      });
      g (Tail, e2);
      emit (LABEL {
          lab = Id.L(b_cont)
      })

  | Tail, IfFEq(x, y, e1, e2) | Tail, IfFLE(x, y, e1, e2) ->
      let b_else = Id.genid ("else") in
      let b_then = Id.genid ("then") in
      let b_cont = Id.genid ("cont") in
        emit (OPER {
        dst = [];
        src = [(x, Type.Float); (y, Type.Float)];
        jump = Some [Id.L(b_then); Id.L(b_else)]
        });
        emit (LABEL {
            lab = Id.L(b_then)
        });
        g (Tail, e1);
      emit (OPER {
          dst = [];
          src = [];
          jump = Some [Id.L(b_cont)];
      });
        emit (LABEL {
            lab = Id.L(b_else)
        });
        g (Tail, e2);
      emit (LABEL {
          lab = Id.L(b_cont)
      })

  | NonTail(zt), IfEq(x, y', e1, e2) | NonTail(zt), IfLE(x, y', e1, e2) | NonTail(zt), IfGE(x, y', e1, e2) ->
      let b_else = Id.genid ("else") in
      let b_then = Id.genid ("then") in
      let b_cont = Id.genid ("cont") in
      (match y' with
      | V(y) -> emit (OPER {
        dst = [];
        src = [(x, Type.Int); (y, Type.Int)];
        jump = Some [Id.L(b_then); Id.L(b_else)]
      }) 
      | C(i) -> emit (OPER {
        dst = [];
        src = [(x, Type.Int)];
        jump = Some [Id.L(b_then); Id.L(b_else)]
      }));
      emit (LABEL {
          lab = Id.L(b_then)
      });
      g (NonTail(zt), e1);
      emit (OPER {
          dst = [];
          src = [];
          jump = Some [Id.L(b_cont)];
      });
      emit (LABEL {
          lab = Id.L(b_else)
      });
      g (NonTail(zt), e2);
      emit (LABEL {
          lab = Id.L(b_cont)
      })

  | NonTail(zt), IfFEq(x, y, e1, e2) | NonTail(zt), IfFLE(x, y, e1, e2) ->
      let b_else = Id.genid ("else") in
      let b_then = Id.genid ("then") in
      let b_cont = Id.genid ("cont") in
      emit (OPER {
          dst = [];
          src = [(x, Type.Float); (y, Type.Float)];
          jump = Some [Id.L(b_then); Id.L(b_else)]
      });
      emit (LABEL {
          lab = Id.L(b_then)
      });
      g (NonTail(zt), e1);
      emit (OPER {
          dst = [];
          src = [];
          jump = Some [Id.L(b_cont)];
      });
      emit (LABEL {
          lab = Id.L(b_else)
      });
      g (NonTail(zt), e2);
      emit (LABEL {
          lab = Id.L(b_cont)
      })

  | Tail, CallCls(x, ys, zs) -> (* 末尾呼び出し (caml2html: emit_tailcall) *)
      emit (OPER {
          dst = calldefs;
          src = g'_args [(x, reg_cl)] ys zs;
          jump = None
      })
  | Tail, CallDir(Id.L(x), ys, zs) -> (* 末尾呼び出し *)
      emit (OPER {
          dst = 
          (if Hashtbl.mem Calldefs.use_regs x then 
                Calldefs.Regset.elements (Hashtbl.find Calldefs.use_regs x)
            else (* 再帰関数 *)
                calldefs);
          src = g'_args [] ys zs;
          jump = None
      })

    (* Float以外の返り値はIntとしておく *)
  | NonTail((a, t)), CallCls(x, ys, zs) ->
      emit (OPER {
          dst = calldefs;
          src = g'_args [(x, reg_cl)] ys zs;
          jump = None
      });
      (match t with 
      | Type.Unit -> ()
      | Type.Float -> emit (MOVE{
                        dst = [(a, t)];
                        src = [(fregs.(0), Type.Float)]
                    })
      | _ -> emit (MOVE {
                        dst = [(a, Type.Int)];
                        src = [(regs.(0), Type.Int)]
                    }))
  | NonTail((a, t)), CallDir(Id.L(x), ys, zs) ->
      emit (OPER {
          dst = 
          (if Hashtbl.mem Calldefs.use_regs x then 
                Calldefs.Regset.elements (Hashtbl.find Calldefs.use_regs x)
            else (* 再帰関数 *)
                calldefs);
          src = g'_args [] ys zs;
          jump = None
      });
      (match t with 
      | Type.Unit -> ()
      | Type.Float -> emit (MOVE{
                        dst = [(a, t)];
                        src = [(fregs.(0), Type.Float)]
                    })
      | _ -> emit (MOVE{
                        dst = [(a, Type.Int)];
                        src = [(regs.(0), Type.Int)]
                    }))


(* 呼び出し側から見た引数s処理　*)
and g'_args x_reg_cl ys zs =
    let (i, yrs) =
      List.fold_left
        (fun (i, yrs) y -> (i + 1, (y, regs.(i)) :: yrs))
        (0, x_reg_cl)
      ys in
    List.iter
        (fun (y, r) -> 
            emit (MOVE {
                dst = [(r, Type.Int)];
                src = [(y, Type.Int)]
            }))
    yrs;
    let (d, zfrs) =
      List.fold_left
        (fun (d, zfrs) z -> (d + 1, (z, fregs.(d)) :: zfrs))
        (0, [])
      zs in
    List.iter
        (fun (z, fr) ->
            emit (MOVE {
                dst = [(fr, Type.Float)];
                src = [(z, Type.Float)]
            }))
    zfrs;
    let cl = if x_reg_cl <> [] then [(reg_cl, Type.Int)] else [] in
    cl @ List.map (fun (y, r) -> (r, Type.Int)) yrs @ List.map (fun (z, fr) -> (fr, Type.Float)) zfrs


(*
(* 関数内部から見た引数処理　*)
let h_args x ys zs = 
    emit (MOVE {
        dst = [(x, Type.Int)];
        src = [(reg_cl, Type.Int)]
    });

    let (i, yrs) =
      List.fold_left
        (fun (i, yrs) y -> (i + 1, (y, regs.(i)) :: yrs))
        (0, [])
      ys in
    List.iter
        (fun (y, r) -> 
            emit (MOVE {
                dst = [(y, Type.Int)];
                src = [(r, Type.Int)]
            }))
    yrs;
    let (d, zfrs) =
      List.fold_left
        (fun (d, zfrs) z -> (d + 1, (z, fregs.(d)) :: zfrs))
        (0, [])
      zs in
    List.iter
        (fun (z, fr) ->
            emit (MOVE {
                dst = [(z, Type.Float)];
                src = [(fr, Type.Float)]
            }))
    zfrs
    *)

let add_exit l = 
    l @ [(OPER {
        dst = [];
        src = specialregs @ calleesaves;
        jump = None
    })]

let h { name = Id.L(x); args = ys; fargs = zs; body = e; ret = t } =
    inst_list := [];
    emit (LABEL {lab = Id.L(x)});
    emit (MOVE {
        dst = [(x, Type.Int)];
        src = [(reg_cl, Type.Int)]
    });
    (*h_args x ys zs;*)
    g (Tail, e);
    add_exit (List.rev !inst_list)

let f e =
    inst_list := [];
    g (NonTail(("%g0", Type.Unit)), e);
    add_exit (List.rev !inst_list)


  (* 
    virtual.ml -> simm.ml -> regAlloc.ml -> emit.ml
                    | 
                    |-> regAllocbyColor.ml -> emit.ml

    関数ごとに, Id.tからregisterへのmapとstackの状態を
    toBlock.ml -> liveness.ml -> Interference.ml -> Color.ml
    の一連の流れで得る
  *)