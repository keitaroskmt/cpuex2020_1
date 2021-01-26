open Asm


  (* envはspilledと新たに作った変数の対応 *)
let rec rewrite e spilled env = 
    match e with
    | Ans(exp) -> rewrite_exp exp spilled env
    | Let((x, t) as xt, exp, e) ->
        if List.mem x spilled then
            let env' = 
                if M.mem x env then env 
                else 
                    let new_x = Id.gentmp t in M.add x new_x env in
            let exp' = rewrite_exp exp spilled env' in
            let e' = rewrite e spilled env' in
            (* (new_x, t)でok? *)
            (* レジスタ割り当て決定後, Save(M.find x regenv, x)とする *)
            seq(Save(x, x), concat exp' (M.find x env, t) e')
        else
            let exp' = rewrite_exp exp spilled env in
            let e' = rewrite e spilled env in
            concat exp' xt e'

and rewrite_tmp x t spilled env k =
    if List.mem x spilled then
        Let((M.find x env, t), Restore(x), k (M.find x env))
    else
        k x
    
and rewrite_tmp' x' t spilled env k =
    match x' with
    | V(x) -> if List.mem x spilled then
                Let((M.find x env, t), Restore(x), k (V(M.find x env)))
              else
                k (V(x))
    | c -> k c

and rewrite_exp e spilled env = 
    match e with
    | Nop | Set _ | SetF _ | SetL _ | Comment _ | Restore _ as exp -> Ans(exp)
    | Mov(x) ->
        rewrite_tmp x Type.Int spilled env (fun s -> Ans(Mov(s)))
    | Neg(x) -> 
        rewrite_tmp x Type.Int spilled env (fun s -> Ans(Neg(s)))
    | Add(x, y') -> 
        rewrite_tmp x Type.Int spilled env
            (fun s -> rewrite_tmp' y' Type.Int spilled env
                (fun t -> Ans(Add(s, t))))
    | Sub(x, y') -> 
        rewrite_tmp x Type.Int spilled env
            (fun s -> rewrite_tmp' y' Type.Int spilled env
                (fun t -> Ans(Sub(s, t))))
    | Mul(x, y') -> 
        rewrite_tmp x Type.Int spilled env
            (fun s -> rewrite_tmp' y' Type.Int spilled env
                (fun t -> Ans(Mul(s, t))))
    | Div(x, y') -> 
        rewrite_tmp x Type.Int spilled env
            (fun s -> rewrite_tmp' y' Type.Int spilled env
                (fun t -> Ans(Div(s, t))))
    | SLL(x, y') -> 
        rewrite_tmp x Type.Int spilled env
            (fun s -> rewrite_tmp' y' Type.Int spilled env
                (fun t -> Ans(SLL(s, t))))
    | Ld(x, y') -> 
        rewrite_tmp x Type.Int spilled env
            (fun s -> rewrite_tmp' y' Type.Int spilled env
                (fun t -> Ans(Ld(s, t))))
    | St(x, y, z') -> 
        rewrite_tmp x Type.Int spilled env
            (fun s -> rewrite_tmp y Type.Int spilled env
                (fun t -> rewrite_tmp' z' Type.Int spilled env
                    (fun u -> Ans(St(s, t, u)))))
    | FMovD(x) -> 
        rewrite_tmp x Type.Float spilled env (fun s -> Ans(FMovD(s)))
    | FNegD(x) -> 
        rewrite_tmp x Type.Float spilled env (fun s -> Ans(FNegD(s)))
    | FAddD(x, y) -> 
        rewrite_tmp x Type.Float spilled env
            (fun s -> rewrite_tmp y Type.Float spilled env
                (fun t -> Ans(FAddD(s, t))))
    | FSubD(x, y) -> 
        rewrite_tmp x Type.Float spilled env
            (fun s -> rewrite_tmp y Type.Float spilled env
                (fun t -> Ans(FSubD(s, t))))
    | FMulD(x, y) -> 
        rewrite_tmp x Type.Float spilled env
            (fun s -> rewrite_tmp y Type.Float spilled env
                (fun t -> Ans(FMulD(s, t))))
    | FDivD(x, y) ->
        rewrite_tmp x Type.Float spilled env
            (fun s -> rewrite_tmp y Type.Float spilled env
                (fun t -> Ans(FDivD(s, t))))
    | FAbs(x) -> 
        rewrite_tmp x Type.Float spilled env (fun s -> Ans(FAbs(s)))
    | FSqr(x) -> 
        rewrite_tmp x Type.Float spilled env (fun s -> Ans(FSqr(s)))
    | Ftoi(x) -> 
        rewrite_tmp x Type.Float spilled env (fun s -> Ans(Ftoi(s)))
    | Itof(x) -> 
        rewrite_tmp x Type.Int spilled env (fun s -> Ans(Itof(s)))
    | Floor(x) -> 
        rewrite_tmp x Type.Float spilled env (fun s -> Ans(Floor(s)))
    | LdF(x, y') -> 
        rewrite_tmp x Type.Int spilled env
            (fun s -> rewrite_tmp' y' Type.Int spilled env
                (fun t -> Ans(LdF(s, t))))
    | StF(x, y, z') -> 
        rewrite_tmp x Type.Float spilled env
            (fun s -> rewrite_tmp y Type.Int spilled env
                (fun t -> rewrite_tmp' z' Type.Int spilled env
                    (fun u -> Ans(StF(s, t, u)))))
    | IfEq(x, y', e1, e2) -> 
        let e1' = rewrite e1 spilled env in
        let e2' = rewrite e2 spilled env in
        rewrite_tmp x Type.Int spilled env
            (fun s -> rewrite_tmp' y' Type.Int spilled env
                (fun t -> Ans(IfEq(s, t, e1', e2'))))
    | IfLE(x, y', e1, e2) -> 
        let e1' = rewrite e1 spilled env in
        let e2' = rewrite e2 spilled env in
        rewrite_tmp x Type.Int spilled env
            (fun s -> rewrite_tmp' y' Type.Int spilled env
                (fun t -> Ans(IfLE(s, t, e1', e2'))))
    | IfGE(x, y', e1, e2) -> 
        let e1' = rewrite e1 spilled env in
        let e2' = rewrite e2 spilled env in
        rewrite_tmp x Type.Int spilled env
            (fun s -> rewrite_tmp' y' Type.Int spilled env
                (fun t -> Ans(IfGE(s, t, e1', e2'))))
    | IfFEq(x, y, e1, e2) -> 
        let e1' = rewrite e1 spilled env in
        let e2' = rewrite e2 spilled env in
        rewrite_tmp x Type.Float spilled env
            (fun s -> rewrite_tmp y Type.Float spilled env
                (fun t -> Ans(IfFEq(s, t, e1', e2'))))
    | IfFLE(x, y, e1, e2) -> 
        let e1' = rewrite e1 spilled env in
        let e2' = rewrite e2 spilled env in
        rewrite_tmp x Type.Float spilled env
            (fun s -> rewrite_tmp y Type.Float spilled env
                (fun t -> Ans(IfFLE(s, t, e1', e2'))))
    | CallCls(x, ys, zs) as exp ->
    (* とりあえず *)
        if (List.mem x spilled || List.for_all (fun y -> List.mem y spilled) ys || 
        List.for_all (fun z -> List.mem z spilled) zs) then
            failwith "CallCls in rewrite" 
        else
            Ans(exp)
    | CallDir(Id.L(x), ys, zs) as exp ->
    (* とりあえず *)
        if (List.for_all (fun y -> List.mem y spilled) ys || 
        List.for_all (fun z -> List.mem z spilled) zs) then
            failwith "CallDir in rewrite" 
        else
            Ans(exp)
    | Save(x, y) -> Ans(Save(x, y))



let rec g e env = 
    match e with
    | Ans(exp) -> Ans(g' exp env)
    | Let((x, t), exp, e) ->
        Let((M.find x env, t), g' exp env, g e env)

and g' e env = 
    match e with
    | Nop | Set _ | SetF _ | SetL _ | Comment _ | Restore _ as exp -> exp
    | Mov(x) -> Mov(M.find x env)
    | Neg(x) -> Neg(M.find x env)
    | Add(x, y') ->
        (match y' with
        | V(y) -> Add(M.find x env, V(M.find y env))
        | c -> Add(M.find x env, c))
    | Sub(x, y') ->
        (match y' with
        | V(y) -> Sub(M.find x env, V(M.find y env))
        | c -> Sub(M.find x env, c))
    | Mul(x, y') ->
        (match y' with
        | V(y) -> Mul(M.find x env, V(M.find y env))
        | c -> Mul(M.find x env, c))
    | Div(x, y') ->
        (match y' with
        | V(y) -> Div(M.find x env, V(M.find y env))
        | c -> Div(M.find x env, c))
    | SLL(x, y') ->
        (match y' with
        | V(y) -> SLL(M.find x env, V(M.find y env))
        | c -> SLL(M.find x env, c))
    | Ld(x, y') ->
        (match y' with
        | V(y) -> Ld(M.find x env, V(M.find y env))
        | c -> Ld(M.find x env, c))
    | St(x, y, z') -> 
        (match z' with
        | V(z) -> St(M.find x env, M.find y env, V(M.find z env))
        | c -> St(M.find x env, M.find y env, c))
    | FMovD(x) -> FMovD(M.find x env)
    | FNegD(x) -> FNegD(M.find x env)
    | FAddD(x, y) -> FAddD(M.find x env, M.find y env)
    | FSubD(x, y) -> FSubD(M.find x env, M.find y env)
    | FMulD(x, y) -> FMulD(M.find x env, M.find y env)
    | FDivD(x, y) -> FDivD(M.find x env, M.find y env)
    | FAbs(x) -> FAbs(M.find x env)
    | FSqr(x) -> FSqr(M.find x env)
    | Ftoi(x) -> Ftoi(M.find x env)
    | Itof(x) -> Itof(M.find x env)
    | Floor(x) -> Floor(M.find x env)
    | LdF(x, y') ->
        (match y' with
        | V(y) -> LdF(M.find x env, V(M.find y env))
        | c -> LdF(M.find x env, c))
    | StF(x, y, z') -> 
        (match z' with
        | V(z) -> StF(M.find x env, M.find y env, V(M.find z env))
        | c -> StF(M.find x env, M.find y env, c))
    | IfEq(x, y', e1, e2) ->
        let e1' = g e1 env in
        let e2' = g e2 env in
        (match y' with
        | V(y) -> IfEq(M.find x env, V(M.find y env), e1', e2')
        | c -> IfEq(M.find x env, c, e1', e2'))
    | IfLE(x, y', e1, e2) ->
        let e1' = g e1 env in
        let e2' = g e2 env in
        (match y' with
        | V(y) -> IfLE(M.find x env, V(M.find y env), e1', e2')
        | c -> IfLE(M.find x env, c, e1', e2'))
    | IfGE(x, y', e1, e2) ->
        let e1' = g e1 env in
        let e2' = g e2 env in
        (match y' with
        | V(y) -> IfGE(M.find x env, V(M.find y env), e1', e2')
        | c -> IfGE(M.find x env, c, e1', e2'))
    | IfFEq(x, y, e1, e2) ->
        let e1' = g e1 env in
        let e2' = g e2 env in
        IfFEq(M.find x env, M.find y env, e1', e2')
    | IfFLE(x, y, e1, e2) ->
        let e1' = g e1 env in
        let e2' = g e2 env in
        IfFLE(M.find x env, M.find y env, e1', e2')
    | CallCls(x, ys, zs) ->
        CallCls(M.find x env, List.map (fun y -> M.find y env) ys, List.map (fun z -> M.find z env) zs)
    | CallDir(Id.L(x), ys, zs) ->
        CallDir(Id.L(x), List.map (fun y -> M.find y env) ys, List.map (fun z -> M.find z env) zs)
    | Save(x, y) -> 
        Save(M.find x env, y)



let alloc e = 
    let rec loop e = 
        let instrs = ToAssem.f e in
        Assem.assem_debug stdout instrs;

        let (ControlFlow.{control; def; use; ismove} as flowgraph, flownodes) = ControlFlow.instrs_to_graph instrs in
        let (Liveness.{graph; id2node; node2id; moves} as igraph, liveouts) = Liveness.interference_graph flowgraph in

        (* TODO: 一度spillしたものは再びspillしない処理が必要? *)
        let spill_cost = 
            let usedef = 
                List.fold_left 
                    (fun env fnode ->
                        let env' = List.fold_left 
                            (fun env (x, t) -> 
                                let (nuse, ndef) = try M.find x env with Not_found -> (0, 0) in
                                M.add x (nuse + 1, ndef) env)
                            env (Graph.Table.find fnode use) in
                        List.fold_left
                            (fun env (x, t) ->
                                let (nuse, ndef) = try M.find x env with Not_found -> (0, 0) in
                                M.add x (nuse, ndef + 1) env)
                            env' (Graph.Table.find fnode def))
                M.empty flownodes in
            (fun inode ->
                let (x, t) = node2id inode in
                let (use, def) = M.find x usedef in use + def) in

        (* temp_map, registersをAsm内で定義 *)
        let (allocation, spilled) = Color.color igraph spill_cost reg_map (registers, fregisters) in
        (
        if spilled = [] then
            g e allocation
        else
            let e' = rewrite e spilled M.empty in
            loop e' 
        ) in
    loop e
    


let h ({ name = Id.L(x); args = ys; fargs = zs; body = e; ret = t }) = 
    let (_, arg_regs) = 
        List.fold_left
            (fun (i, arg_regs) _ ->
                (i+1, regs.(i) :: arg_regs))
        (0, []) ys in
    let (_, farg_regs) = 
        List.fold_left
            (fun (i, farg_regs) _ ->
                (i+1, fregs.(i) :: farg_regs))
        (0, []) zs in

  let e' = alloc e in
    { name = Id.L(x); args = arg_regs; fargs = farg_regs; body = e'; ret = t }


let f (Prog(data, fundefs, e)) = 
    asm_debug stdout (Prog(data, fundefs, e));
    Format.eprintf "register allocation: may take some time (up to a few minutes, depending on the size of functions)@.";
    let fundefs' = List.map h fundefs in
    let e' = alloc e in 
    Prog(data, fundefs', e')

