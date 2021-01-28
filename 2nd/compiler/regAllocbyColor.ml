open Asm


  (* envはspilledと新たに作った変数の対応 *)
  (* SaveとRestoreは1対1対応するため, setでspilledに含まれ, かつRestore済のものを管理 *)
let rec rewrite e spilled env set = 
    match e with
    | Ans(exp) -> rewrite_exp exp spilled env set
    | Let((x, t) as xt, exp, e) ->
        if List.mem x spilled then
            let exp' = rewrite_exp exp spilled env set in
            let e' = rewrite e spilled env set in
            (* レジスタ割り当て決定後, Save(M.find x regenv, x)とする *)
            (* seq(Save(x, x), concat exp' (M.find x env, t) e')*)
            concat exp' xt (seq(Save(x, x), e'))
        else
            let exp' = rewrite_exp exp spilled env set in
            let e' = rewrite e spilled env set in
            concat exp' xt e'

and rewrite_tmp x t spilled env set k =
    if S.mem x set then
        k (M.find x env) set
    else
    (
        if List.mem x spilled then
            Let((M.find x env, t), Restore(x), k (M.find x env) (S.add x set))
        else
            k x set 
    )
    
and rewrite_tmp' x' t spilled env set k =
    match x' with
    | V(x) ->  if S.mem x set then
                    k (V(M.find x env)) set
                else
                (
                    if List.mem x spilled then
                        Let((M.find x env, t), Restore(x), k (V(M.find x env)) set)
                    else
                        k (V(x)) set
                )
    | c -> k c set

and rewrite_exp e spilled env set = 
    match e with
    | Nop | Set _ | SetF _ | SetL _ | Comment _ | Restore _ as exp -> Ans(exp)
    | Mov(x) ->
        rewrite_tmp x Type.Int spilled env set (fun s _ -> Ans(Mov(s)))
    | Neg(x) -> 
        rewrite_tmp x Type.Int spilled env set (fun s _ -> Ans(Neg(s)))
    | Add(x, y') -> 
        rewrite_tmp x Type.Int spilled env set
            (fun s _ -> rewrite_tmp' y' Type.Int spilled env set
                (fun t _ -> Ans(Add(s, t))))
    | Sub(x, y') -> 
        rewrite_tmp x Type.Int spilled env set
            (fun s _ -> rewrite_tmp' y' Type.Int spilled env set
                (fun t _ -> Ans(Sub(s, t))))
    | Mul(x, y') -> 
        rewrite_tmp x Type.Int spilled env set
            (fun s _ -> rewrite_tmp' y' Type.Int spilled env set
                (fun t _ -> Ans(Mul(s, t))))
    | Div(x, y') -> 
        rewrite_tmp x Type.Int spilled env set
            (fun s _ -> rewrite_tmp' y' Type.Int spilled env set
                (fun t _ -> Ans(Div(s, t))))
    | SLL(x, y') -> 
        rewrite_tmp x Type.Int spilled env set
            (fun s _ -> rewrite_tmp' y' Type.Int spilled env set
                (fun t _ -> Ans(SLL(s, t))))
    | Ld(x, y') -> 
        rewrite_tmp x Type.Int spilled env set
            (fun s _ -> rewrite_tmp' y' Type.Int spilled env set
                (fun t _ -> Ans(Ld(s, t))))
    | St(x, y, z') -> 
        rewrite_tmp x Type.Int spilled env set
            (fun s _ -> rewrite_tmp y Type.Int spilled env set
                (fun t _ -> rewrite_tmp' z' Type.Int spilled env set
                    (fun u _ -> Ans(St(s, t, u)))))
    | FMovD(x) -> 
        rewrite_tmp x Type.Float spilled env set (fun s _ -> Ans(FMovD(s)))
    | FNegD(x) -> 
        rewrite_tmp x Type.Float spilled env set (fun s _ -> Ans(FNegD(s)))
    | FAddD(x, y) -> 
        rewrite_tmp x Type.Float spilled env set
            (fun s _ -> rewrite_tmp y Type.Float spilled env set
                (fun t _ -> Ans(FAddD(s, t))))
    | FSubD(x, y) -> 
        rewrite_tmp x Type.Float spilled env set
            (fun s _ -> rewrite_tmp y Type.Float spilled env set
                (fun t _ -> Ans(FSubD(s, t))))
    | FMulD(x, y) -> 
        rewrite_tmp x Type.Float spilled env set
            (fun s _ -> rewrite_tmp y Type.Float spilled env set
                (fun t _ -> Ans(FMulD(s, t))))
    | FDivD(x, y) ->
        rewrite_tmp x Type.Float spilled env set
            (fun s _ -> rewrite_tmp y Type.Float spilled env set
                (fun t _ -> Ans(FDivD(s, t))))
    | FAbs(x) -> 
        rewrite_tmp x Type.Float spilled env set (fun s _ -> Ans(FAbs(s)))
    | FSqr(x) -> 
        rewrite_tmp x Type.Float spilled env set (fun s _ -> Ans(FSqr(s)))
    | Ftoi(x) -> 
        rewrite_tmp x Type.Float spilled env set (fun s _ -> Ans(Ftoi(s)))
    | Itof(x) -> 
        rewrite_tmp x Type.Int spilled env set (fun s _ -> Ans(Itof(s)))
    | Floor(x) -> 
        rewrite_tmp x Type.Float spilled env set (fun s _ -> Ans(Floor(s)))
    | LdF(x, y') -> 
        rewrite_tmp x Type.Int spilled env set
            (fun s _ -> rewrite_tmp' y' Type.Int spilled env set
                (fun t _ -> Ans(LdF(s, t))))
    | StF(x, y, z') -> 
        rewrite_tmp x Type.Float spilled env set
            (fun s _ -> rewrite_tmp y Type.Int spilled env set
                (fun t _ -> rewrite_tmp' z' Type.Int spilled env set
                    (fun u _ -> Ans(StF(s, t, u)))))
    | IfEq(x, y', e1, e2) -> 
        rewrite_tmp x Type.Int spilled env set
            (fun s set -> rewrite_tmp' y' Type.Int spilled env set
                (fun t set -> 
                    let e1' = rewrite e1 spilled env set in
                    let e2' = rewrite e2 spilled env set in
                    Ans(IfEq(s, t, e1', e2'))))
    | IfLE(x, y', e1, e2) -> 
        rewrite_tmp x Type.Int spilled env set
            (fun s set -> rewrite_tmp' y' Type.Int spilled env set
                (fun t set -> 
                    let e1' = rewrite e1 spilled env set in
                    let e2' = rewrite e2 spilled env set in
                    Ans(IfLE(s, t, e1', e2'))))
    | IfGE(x, y', e1, e2) -> 
        rewrite_tmp x Type.Int spilled env set
            (fun s set -> rewrite_tmp' y' Type.Int spilled env set
                (fun t set -> 
                    let e1' = rewrite e1 spilled env set in
                    let e2' = rewrite e2 spilled env set in
                    Ans(IfGE(s, t, e1', e2'))))
    | IfFEq(x, y, e1, e2) -> 
        rewrite_tmp x Type.Float spilled env set
            (fun s set -> rewrite_tmp y Type.Float spilled env set
                (fun t set -> 
                    let e1' = rewrite e1 spilled env set in
                    let e2' = rewrite e2 spilled env set in
                    Ans(IfFEq(s, t, e1', e2'))))
    | IfFLE(x, y, e1, e2) -> 
        rewrite_tmp x Type.Float spilled env set
            (fun s set -> rewrite_tmp y Type.Float spilled env set
                (fun t set -> 
                    let e1' = rewrite e1 spilled env set in
                    let e2' = rewrite e2 spilled env set in
                    Ans(IfFLE(s, t, e1', e2'))))
    | CallCls(x, ys, zs) as exp ->
        let x' = if List.mem x spilled then M.find x env else x in
        let ys' = List.map (fun x -> if List.mem x spilled then M.find x env else x) ys in
        let zs' = List.map (fun x -> if List.mem x spilled then M.find x env else x) zs in
        let cont = Ans(CallCls(x', ys', zs')) in

        let exp' = List.fold_left
            (fun e x -> 
                if S.mem x set then e
                else 
                (
                    if List.mem x spilled then
                        (Let((M.find x env, Type.Int), Restore(x), e))
                    else
                        e
                ))
        cont (x :: ys) in
        List.fold_left
            (fun e x -> 
                if S.mem x set then e
                else
                (
                    if List.mem x spilled then
                        (Let((M.find x env, Type.Float), Restore(x), e))
                    else
                        e
                ))
        cont zs

    | CallDir(Id.L(x), ys, zs) as exp ->
        let ys' = List.map (fun x -> if List.mem x spilled then M.find x env else x) ys in
        let zs' = List.map (fun x -> if List.mem x spilled then M.find x env else x) zs in
        let cont = Ans(CallDir(Id.L(x), ys', zs')) in

        let exp' = List.fold_left
            (fun e x -> 
                if S.mem x set then e
                else 
                (
                    if List.mem x spilled then
                        (Let((M.find x env, Type.Int), Restore(x), e))
                    else 
                        e
                ))
        cont ys in
        List.fold_left
            (fun e x -> 
                if S.mem x set then e
                else
                (
                if List.mem x spilled then
                    (Let((M.find x env, Type.Float), Restore(x), e))
                else
                    e
                ))
        cont zs

    | Save(x, y) -> Ans(Save(x, y))



let rec g e env = 
    match e with
    | Ans(exp) -> Ans(g' exp env)
    | Let((x, t), exp, e) ->
        if t = Type.Unit then 
            Let((x, t), g' exp env, g e env)
        else
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



type fundefort = Fun of fundef | T of t

let alloc e = 
    let rec loop e rewrite_temps = 
        let instrs = 
            match e with
            | Fun(fundef) -> ToAssem.h fundef
            | T(t) -> ToAssem.f t in
        (* for debug *)
        Assem.assem_debug stdout instrs;

        let (ControlFlow.{control; def; use; ismove} as flowgraph, flownodes) = ControlFlow.instrs_to_graph instrs in
        (* for debug*)
        ControlFlow.controlFlow_debug stdout (flowgraph, flownodes);

        let (Liveness.{graph; id2node; node2id; moves} as igraph, liveouts) = Liveness.interference_graph flowgraph in
        (* for debug*)
        Liveness.igraph_debug stdout igraph;

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
                let (use, def) = M.find x usedef in
                if List.mem x rewrite_temps then max_int else use + def) in

        (* for debug *)
        List.iter (fun node -> Printf.fprintf stdout "%s: %d\n" (fst (node2id node)) (spill_cost node)) (Graph.nodes graph);

        (* temp_map, registersをAsm内で定義 *)
        let (allocation, spilled) = Color.color igraph spill_cost reg_map (registers, fregisters) in
        (
        if spilled = [] then
        (
            let et = 
                (match e with
                | Fun({ name = _; args = _; fargs = _; body = x; ret = _ }) -> x
                | T(x) -> x) in

            (* for debug *)
            asm_debug stdout (Prog([], [], et));
            (g et allocation, allocation)
        )
        else
            let et = 
                (match e with
                | Fun({ name = _; args = _; fargs = _; body = x; ret = _ }) -> x
                | T(x) -> x) in

            (* spillした変数の移動先 *)
            let env = List.fold_left
                    (fun env x -> M.add x (Id.genid x) env)
                M.empty spilled in
            let new_temps = List.map (fun x -> M.find x env) spilled in
            let et' = rewrite et spilled env S.empty in

            (* for debug *)
            asm_debug stdout (Prog([], [], et'));
            List.iter (fun x -> Printf.fprintf stdout "spilled!!!!! %s\n" x) spilled;

            let e' = 
                (match e with
                | Fun({ name = n; args = ys; fargs = zs; body = _; ret = t }) -> 
                    Fun({ name = n; args = ys; fargs = zs; body = et'; ret = t})
                | T(_) -> 
                    T(et')) in

            loop e' (new_temps @ rewrite_temps)
        ) in
    loop e []
    

(* p.237 *)
let move_calleesaves ({ name = n; args = ys; fargs = zs; body = e; ret = t } as fundef) = 
    (* 移動先の仮変数との対応 *)
    let env = 
        List.fold_left
            (fun env (x, t) ->
                M.add x (Id.gentmp t) env)
        M.empty ((reg_ra, Type.Int) :: calleesaves) in
    
    (* 先頭ではcalleesaves -> 仮変数 *)
    let e' = 
        List.fold_left
            (fun cont (x, t) ->
                (
                    match t with
                    | Type.Float -> (Let((M.find x env, t), FMovD(x), cont))
                    | _ -> (Let((M.find x env, t), Mov(x), cont))
                ))
        e ((reg_ra, Type.Int) :: calleesaves) in

    (* 返り値を受け取って, 仮引数 -> calleesaves を挿入する関数 *)
    let exit =  
        (fun e ->
            (List.fold_left
                (fun cont (x, t) ->
                    (
                        match t with
                        | Type.Float -> (Let((x, t), FMovD(M.find x env), cont))
                        | _ -> (Let((x, t), Mov(M.find x env), cont))
                    ))
            e ((reg_ra, Type.Int) :: calleesaves))) in

    (* e'の後ろにexitを挿入する関数 *)
    let rec concat e exit = 
        match e with
        | Ans(IfEq(x, y, e1, e2)) -> Ans(IfEq(x, y, (concat e1 exit), (concat e2 exit)))
        | Ans(IfLE(x, y, e1, e2)) -> Ans(IfLE(x, y, (concat e1 exit), (concat e2 exit)))
        | Ans(IfGE(x, y, e1, e2)) -> Ans(IfGE(x, y, (concat e1 exit), (concat e2 exit)))
        | Ans(IfFEq(x, y, e1, e2)) -> Ans(IfFEq(x, y, (concat e1 exit), (concat e2 exit)))
        | Ans(IfFLE(x, y, e1, e2)) -> Ans(IfFLE(x, y, (concat e1 exit), (concat e2 exit)))
        | Ans(exp) -> exit (Ans(exp))
        | Let(xt, exp, e1) -> Let(xt, exp, (concat e1 exit)) in
    { name = n; args = ys; fargs = zs; body = concat e' exit; ret = t }


let h_args ({ name = n; args = ys; fargs = zs; body = e; ret = t } as fundef) = 
    let (_, yrs) =
        List.fold_left
            (fun (i, yrs) y -> (i + 1, (y, regs.(i)) :: yrs))
            (0, []) ys in
    let e =
        List.fold_left
            (fun e (y, r) ->
                (Let((y, Type.Int), Mov(r), e)))
        e yrs in
    let (_, zfrs) =
        List.fold_left
            (fun (d, zfrs) z -> (d + 1, (fregs.(d), z) :: zfrs))
            (0, []) zs in
    let e =
        List.fold_left
            (fun e (d, fr) ->
                (Let((d, Type.Float), FMovD(fr), e)))
        e zfrs in
    { name = n; args = ys; fargs = zs; body = e; ret = t }


let h ({ name = Id.L(x); args = ys; fargs = zs; body = e; ret = t } as fundef) = 
    (* 
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
    *)
    let fundef' = h_args (move_calleesaves fundef) in

    let (e', allocation) = alloc (Fun(fundef')) in 
    let arg_regs = List.map (fun x -> M.find x allocation) ys in
    let farg_regs = List.map (fun x -> M.find x allocation) zs in
    { name = Id.L(x); args = ys; fargs = zs; body = e'; ret = t }


let f (Prog(data, fundefs, e)) = 
    asm_debug stdout (Prog(data, fundefs, e));
    Format.eprintf "register allocation: may take some time (up to a few minutes, depending on the size of functions)@.";
    let fundefs' = List.map h fundefs in
    let (e', _) = alloc (T(e)) in 
    Prog(data, fundefs', e')

