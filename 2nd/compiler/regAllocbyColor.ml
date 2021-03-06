open Asm

(* 種々のprintをするか *)
let debug = ref false

  (* envはspilledと新たに作った変数の対応 *)
  (* senvはspilledとSet, SetFとの対応 *)
  (* restoreは関数呼び出しの間の区間で1回のみに制限 -> setで管理 *)
let rec rewrite e spilled (env, senv) set = 
    match e with
    | Ans(exp) -> 
        let (ret, _, _) = rewrite_exp exp spilled (env, senv) set in ret
    | Let((x, t) as xt, exp, e) ->
        if List.mem x spilled then
            let (exp', (env', senv'), set') = rewrite_exp exp spilled (env, senv) set in

            (match exp' with
            | Ans(Set(_)) | Ans(SetF(_)) -> 
            (
                (* save以降もそのレジスタは使用可能 *)
                let e' = rewrite e spilled ((M.add x x env'), (M.add x exp' senv')) (S.add x set') in
                (* 簡単に復元できるのでsaveする必要なし*)
                concat exp' xt e'
            )
            | _ -> 
            (
                (* save以降もそのレジスタは使用可能 *)
                let e' = rewrite e spilled ((M.add x x env'), senv') (S.add x set') in
                (* レジスタ割り当て決定後, Save(M.find x regenv, x)とする *)
                concat exp' xt (seq(Save(x, x), e'))
            ))
        else
            let (exp', (env', senv'), set') = rewrite_exp exp spilled (env, senv) set in
            let e' = rewrite e spilled (env', senv') set' in
            concat exp' xt e'

and rewrite_tmp x t spilled (env, senv) set k =
    if S.mem x set then
        k (M.find x env) (env, senv) set
    else
    (
        if List.mem x spilled then
            let new_x = Id.gentmp t in
            let (exp, (env, senv), set) = k new_x ((M.add x new_x env), senv) (S.add x set) in
            (
            if M.mem x senv then
                let e = M.find x senv in
                match e with
                | Ans(Set(i)) -> (Let((new_x, t), Set(i), exp), (env, senv), set)
                | Ans(SetF(l)) -> (Let((new_x, t), SetF(l), exp), (env, senv), set)
                | _ -> failwith "rewrite_tmp"
            else
                (Let((new_x, t), Restore(x), exp), (env, senv), set)
            )
        else
            k x (env, senv) set 
    )
    
and rewrite_tmp' x' t spilled (env, senv) set k =
    match x' with
    | V(x) ->  if S.mem x set then
                    k (V(M.find x env)) (env, senv) set
                else
                (
                    if List.mem x spilled then
                        let new_x = Id.gentmp t in
                        let (exp, (env, senv), set) = k (V(new_x)) ((M.add x new_x env), senv) (S.add x set) in
                        (
                        if M.mem x senv then
                            let e = M.find x senv in
                            match e with
                            | Ans(Set(i)) -> (Let((new_x, t), Set(i), exp), (env, senv), set)
                            | Ans(SetF(l)) -> (Let((new_x, t), SetF(l), exp), (env, senv), set)
                            | _ -> failwith "rewrite_tmp"
                        else
                            (Let((new_x, t), Restore(x), exp), (env, senv), set)
                        )
                    else
                        k (V(x)) (env, senv) set
                )
    | c -> k c (env, senv) set

and rewrite_exp e spilled (env, senv) set = 
    match e with
    | Nop | Set _ | SetF _ | SetL _ | Comment _ | Restore _ as exp -> (Ans(exp), (env, senv), set)
    | Mov(x) ->
        rewrite_tmp x Type.Int spilled (env, senv) set (fun s (env, senv) set -> (Ans(Mov(s)), (env, senv), set))
    | Neg(x) -> 
        rewrite_tmp x Type.Int spilled (env, senv) set (fun s (env, senv) set -> (Ans(Neg(s)), (env, senv), set))
    | Add(x, y') -> 
        rewrite_tmp x Type.Int spilled (env, senv) set
            (fun s (env, senv) set -> rewrite_tmp' y' Type.Int spilled (env, senv) set
                (fun t (env, senv) set -> (Ans(Add(s, t)), (env, senv), set)))
    | Sub(x, y') -> 
        rewrite_tmp x Type.Int spilled (env, senv) set
            (fun s (env, senv) set -> rewrite_tmp' y' Type.Int spilled (env, senv) set
                (fun t (env, senv) set -> (Ans(Sub(s, t)), (env, senv), set)))
    | Mul(x, y') -> 
        rewrite_tmp x Type.Int spilled (env, senv) set
            (fun s (env, senv) set -> rewrite_tmp' y' Type.Int spilled (env, senv) set
                (fun t (env, senv) set -> (Ans(Mul(s, t)), (env, senv), set)))
    | Div(x, y') -> 
        rewrite_tmp x Type.Int spilled (env, senv) set
            (fun s (env, senv) set -> rewrite_tmp' y' Type.Int spilled (env, senv) set
                (fun t (env, senv) set -> (Ans(Div(s, t)), (env, senv), set)))
    | SLL(x, y') -> 
        rewrite_tmp x Type.Int spilled (env, senv) set
            (fun s (env, senv) set -> rewrite_tmp' y' Type.Int spilled (env, senv) set
                (fun t (env, senv) set -> (Ans(SLL(s, t)), (env, senv), set)))
    | Ld(x, y') -> 
        rewrite_tmp x Type.Int spilled (env, senv) set
            (fun s (env, senv) set -> rewrite_tmp' y' Type.Int spilled (env, senv) set
                (fun t (env, senv) set -> (Ans(Ld(s, t)), (env, senv), set)))
    | St(x, y, z') -> 
        rewrite_tmp x Type.Int spilled (env, senv) set
            (fun s (env, senv) set -> rewrite_tmp y Type.Int spilled (env, senv) set
                (fun t (env, senv) set -> rewrite_tmp' z' Type.Int spilled (env, senv) set
                    (fun u (env, senv) set -> (Ans(St(s, t, u)), (env, senv), set))))
    | FMovD(x) -> 
        rewrite_tmp x Type.Float spilled (env, senv) set (fun s (env, senv) set -> (Ans(FMovD(s)), (env, senv), set))
    | FNegD(x) -> 
        rewrite_tmp x Type.Float spilled (env, senv) set (fun s (env, senv) set -> (Ans(FNegD(s)), (env, senv), set))
    | FAddD(x, y) -> 
        rewrite_tmp x Type.Float spilled (env, senv) set
            (fun s (env, senv) set -> rewrite_tmp y Type.Float spilled (env, senv) set
                (fun t (env, senv) set -> (Ans(FAddD(s, t)), (env, senv), set)))
    | FSubD(x, y) -> 
        rewrite_tmp x Type.Float spilled (env, senv) set
            (fun s (env, senv) set -> rewrite_tmp y Type.Float spilled (env, senv) set
                (fun t (env, senv) set -> (Ans(FSubD(s, t)), (env, senv), set)))
    | FMulD(x, y) -> 
        rewrite_tmp x Type.Float spilled (env, senv) set
            (fun s (env, senv) set -> rewrite_tmp y Type.Float spilled (env, senv) set
                (fun t (env, senv) set -> (Ans(FMulD(s, t)), (env, senv), set)))
    | FDivD(x, y) ->
        rewrite_tmp x Type.Float spilled (env, senv) set
            (fun s (env, senv) set -> rewrite_tmp y Type.Float spilled (env, senv) set
                (fun t (env, senv) set -> (Ans(FDivD(s, t)), (env, senv), set)))
    | FAbs(x) -> 
        rewrite_tmp x Type.Float spilled (env, senv) set (fun s (env, senv) set -> (Ans(FAbs(s)), (env, senv), set))
    | FSqr(x) -> 
        rewrite_tmp x Type.Float spilled (env, senv) set (fun s (env, senv) set -> (Ans(FSqr(s)), (env, senv), set))
    | Ftoi(x) -> 
        rewrite_tmp x Type.Float spilled (env, senv) set (fun s (env, senv) set -> (Ans(Ftoi(s)), (env, senv), set))
    | Itof(x) -> 
        rewrite_tmp x Type.Int spilled (env, senv) set (fun s (env, senv) set -> (Ans(Itof(s)), (env, senv), set))
    | Floor(x) -> 
        rewrite_tmp x Type.Float spilled (env, senv) set (fun s (env, senv) set -> (Ans(Floor(s)), (env, senv), set))
    | LdF(x, y') -> 
        rewrite_tmp x Type.Int spilled (env, senv) set
            (fun s (env, senv) set -> rewrite_tmp' y' Type.Int spilled (env, senv) set
                (fun t (env, senv) set -> (Ans(LdF(s, t)), (env, senv), set)))
    | StF(x, y, z') -> 
        rewrite_tmp x Type.Float spilled (env, senv) set
            (fun s (env, senv) set -> rewrite_tmp y Type.Int spilled (env, senv) set
                (fun t (env, senv) set -> rewrite_tmp' z' Type.Int spilled (env, senv) set
                    (fun u (env, senv) set -> (Ans(StF(s, t, u)), (env, senv), set))))
    | Slt(x, y) -> 
        rewrite_tmp x Type.Int spilled (env, senv) set
            (fun s (env, senv) set -> rewrite_tmp y Type.Int spilled (env, senv) set
                (fun t (env, senv) set -> (Ans(Slt(s, t)), (env, senv), set)))
    | FSlt(x, y) -> 
        rewrite_tmp x Type.Float spilled (env, senv) set
            (fun s (env, senv) set -> rewrite_tmp y Type.Float spilled (env, senv) set
                (fun t (env, senv) set -> (Ans(FSlt(s, t)), (env, senv), set)))
    | IfEq(x, y', e1, e2) -> 
        rewrite_tmp x Type.Int spilled (env, senv) set
            (fun s (env, senv) set -> rewrite_tmp' y' Type.Int spilled (env, senv) set
                (fun t (env, senv) set -> 
                    let e1' = rewrite e1 spilled (env, senv) set in
                    let e2' = rewrite e2 spilled (env, senv) set in
                    (Ans(IfEq(s, t, e1', e2')), (env, senv), S.empty)))
    | IfLE(x, y', e1, e2) -> 
        rewrite_tmp x Type.Int spilled (env, senv) set
            (fun s (env, senv) set -> rewrite_tmp' y' Type.Int spilled (env, senv) set
                (fun t (env, senv) set -> 
                    let e1' = rewrite e1 spilled (env, senv) set in
                    let e2' = rewrite e2 spilled (env, senv) set in
                    (Ans(IfLE(s, t, e1', e2')), (env, senv), S.empty)))
    | IfGE(x, y', e1, e2) -> 
        rewrite_tmp x Type.Int spilled (env, senv) set
            (fun s (env, senv) set -> rewrite_tmp' y' Type.Int spilled (env, senv) set
                (fun t (env, senv) set -> 
                    let e1' = rewrite e1 spilled (env, senv) set in
                    let e2' = rewrite e2 spilled (env, senv) set in
                    (Ans(IfGE(s, t, e1', e2')), (env, senv), S.empty)))
    | IfFEq(x, y, e1, e2) -> 
        rewrite_tmp x Type.Float spilled (env, senv) set
            (fun s (env, senv) set -> rewrite_tmp y Type.Float spilled (env, senv) set
                (fun t (env, senv) set -> 
                    let e1' = rewrite e1 spilled (env, senv) set in
                    let e2' = rewrite e2 spilled (env, senv) set in
                    (Ans(IfFEq(s, t, e1', e2')), (env, senv), S.empty)))
    | IfFLE(x, y, e1, e2) -> 
        rewrite_tmp x Type.Float spilled (env, senv) set
            (fun s (env, senv) set -> rewrite_tmp y Type.Float spilled (env, senv) set
                (fun t (env, senv) set -> 
                    let e1' = rewrite e1 spilled (env, senv) set in
                    let e2' = rewrite e2 spilled (env, senv) set in
                    (Ans(IfFLE(s, t, e1', e2')), (env, senv), S.empty)))
    | CallCls(x, ys, zs) as exp ->
        let cont = 
            (
            (fun env ->
                (
                let x' = if List.mem x spilled then M.find x env else x in
                let ys' = List.map (fun x -> if List.mem x spilled then M.find x env else x) ys in
                let zs' = List.map (fun x -> if List.mem x spilled then M.find x env else x) zs in
                Ans(CallCls(x', ys', zs'))
                ))
             , (env, senv), set) in

        let exp' = List.fold_left
            (fun (k, (env, senv), set) x -> 
                if S.mem x set then (k, (env, senv), set)
                else 
                (
                    if List.mem x spilled then
                        let new_x = Id.gentmp Type.Int in
                        if M.mem x senv then
                            let exp = M.find x senv in
                            match exp with
                            | Ans(Set(i)) -> ((fun env -> (Let((new_x, Type.Int), Set(i), k env))), ((M.add x new_x env), senv), set)
                            | _ -> failwith "rewrite_exp: call_cls"
                        else
                        ((fun env -> (Let((new_x, Type.Int), Restore(x), k env))), ((M.add x new_x env), senv), set)
                    else 
                        (k, (env, senv), set)
                ))
        cont ys in
        let (k, (env, senv), set) = 
            List.fold_left
                (fun (k, (env, senv), set) x -> 
                    if S.mem x set then (k, (env, senv), set)
                    else
                    (
                    if List.mem x spilled then
                        let new_x = Id.gentmp Type.Float in
                        if M.mem x senv then
                            let exp = M.find x senv in
                            match exp with
                            | Ans(SetF(l)) -> ((fun env -> (Let((new_x, Type.Int), SetF(l), k env))), ((M.add x new_x env), senv), set)
                            | _ -> failwith "rewrite_exp: call_cls"
                        else
                        ((fun env -> (Let((new_x, Type.Float), Restore(x), k env))), ((M.add x new_x env), senv), set)
                    else
                        (k, (env, senv), set)
                    ))
            exp' zs in
        (k env, (env, senv), S.empty)

    | CallDir(Id.L(x), ys, zs) as exp ->
        let cont = 
            (
            (fun env ->
                (
                let ys' = List.map (fun x -> if List.mem x spilled then M.find x env else x) ys in
                let zs' = List.map (fun x -> if List.mem x spilled then M.find x env else x) zs in
                Ans(CallDir(Id.L(x), ys', zs'))
                ))
             , (env, senv), set) in

        let exp' = List.fold_left
            (fun (k, (env, senv), set) x -> 
                if S.mem x set then (k, (env, senv), set)
                else 
                (
                    if List.mem x spilled then
                        let new_x = Id.gentmp Type.Int in
                        if M.mem x senv then
                            let exp = M.find x senv in
                            match exp with
                            | Ans(Set(i)) -> ((fun env -> (Let((new_x, Type.Int), Set(i), k env))), ((M.add x new_x env), senv), set)
                            | _ -> failwith "rewrite_exp: call_dir"
                        else
                        ((fun env -> (Let((new_x, Type.Int), Restore(x), k env))), ((M.add x new_x env), senv), set)
                    else 
                        (k, (env, senv), set)
                ))
        cont ys in
        let (k, (env, senv), set) = 
            List.fold_left
                (fun (k, (env, senv), set) x -> 
                    if S.mem x set then (k, (env, senv), set)
                    else
                    (
                    if List.mem x spilled then
                        let new_x = Id.gentmp Type.Float in
                        if M.mem x senv then
                            let exp = M.find x senv in
                            match exp with
                            | Ans(SetF(l)) -> ((fun env -> (Let((new_x, Type.Int), SetF(l), k env))), ((M.add x new_x env), senv), set)
                            | _ -> failwith "rewrite_exp: call_dir"
                        else
                        ((fun env -> (Let((new_x, Type.Float), Restore(x), k env))), ((M.add x new_x env), senv), set)
                    else
                        (k, (env, senv), set)
                    ))
            exp' zs in
        (k env, (env, senv), S.empty)

    | Save(x, y) -> (Ans(Save(x, y)), (env, senv), set)

(* 出現する変数の種類を管理 *)
let rec var_count e =
    match e with
    | Ans(exp) -> var_count' exp
    | Let((x, t), exp, e) ->
        S.add x (S.union (var_count' exp) (var_count e))
and var_count' e = 
    match e with
    | Nop | Set _ | SetF _ | SetL _ | Comment _ | Restore _ -> S.empty
    | Mov(x) | Neg(x) -> S.add x S.empty
    | Add(x, y') | Sub(x, y') | Mul(x, y') | Div(x, y') | SLL(x, y') | Ld(x, y') | LdF(x, y') ->
        (match y' with
        | V(y) -> S.add x (S.add y S.empty)
        | _ -> S.add x S.empty)
    | St(x, y, z') | StF(x, y, z') -> 
        (match z' with
        | V(z) -> S.add x (S.add y (S.add z S.empty))
        | _ -> S.add x (S.add y S.empty))
    | FMovD(x) | FNegD(x) | FAbs(x) | FSqr(x) | Ftoi(x) | Itof(x) | Floor(x) -> S.add x S.empty
    | FAddD(x, y) | FSubD(x, y) | FMulD(x, y) | FDivD(x, y) | Slt(x, y) | FSlt(x, y) -> S.add x (S.add y S.empty)
    | IfEq(x, y', e1, e2) | IfLE(x, y', e1, e2) | IfGE(x, y', e1, e2) ->
        (match y' with
        | V(y) -> S.add x (S.add y (S.union (var_count e1) (var_count e2)))
        | _ -> S.add x (S.union (var_count e1) (var_count e2)))
    | IfFEq(x, y, e1, e2) | IfFLE(x, y, e1, e2) ->
        S.add x (S.add y (S.union (var_count e1) (var_count e2)))
    | CallCls(x, ys, zs) ->
        S.add x (S.union (S.of_list ys) (S.of_list zs))
    | CallDir(Id.L(x), ys, zs) ->
        S.union (S.of_list ys) (S.of_list zs)
    | Save(x, y) -> 
        S.add x (S.add y S.empty)

(* 実際にレジスタ割り当てを行う *)
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
    | Slt(x, y) -> Slt(M.find x env, M.find y env)
    | FSlt(x, y) -> FSlt(M.find x env, M.find y env)
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

let alloc e_origin = 
    let et_origin = 
        (match e_origin with
        | Fun({ name = _; args = _; fargs = _; body = x; ret = _ }) -> x
        | T(x) -> x) in

    let rec loop e spilled_temps = 
        let instrs = 
            match e with
            | Fun(fundef) -> ToBlock.h fundef
            | T(t) -> ToBlock.f t in
        (* for debug *)
        if !debug then Block.block_debug stdout instrs;

        let (ControlFlow.{control; def; use; ismove} as flowgraph, flownodes) = ControlFlow.instrs_to_graph instrs in
        (* for debug*)
        if !debug then ControlFlow.controlFlow_debug stdout (flowgraph, flownodes);

        let (Liveness.{graph; id2node; node2id; moves} as igraph, liveouts) = Liveness.interference_graph flowgraph !debug in
        (* for debug*)
        if !debug then Liveness.igraph_debug stdout igraph;

        (* 差集合から新たに*)
        let et = 
            (match e with
            | Fun({ name = _; args = _; fargs = _; body = x; ret = _ }) -> x
            | T(x) -> x) in
        let rewrite_temps = S.elements (S.diff (var_count et) (var_count et_origin)) in
        let rewrite_temps = spilled_temps @ rewrite_temps in

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
        if !debug then List.iter (fun node -> Printf.fprintf stdout "%s: %d\n" (fst (node2id node)) (spill_cost node)) (Graph.nodes graph);

        (* temp_map, registersをAsm内で定義 *)
        let (allocation, spilled) = Color.color igraph spill_cost reg_map (registers, fregisters) !debug in
        (
        if spilled = [] then
        (
            let et = 
                (match e with
                | Fun({ name = _; args = _; fargs = _; body = x; ret = _ }) -> x
                | T(x) -> x) in

            (* for debug *)
            if !debug then asm_debug stdout (Prog([], [], et));
            (g et allocation, allocation)
        )
        else
            let et = 
                (match e with
                | Fun({ name = _; args = _; fargs = _; body = x; ret = _ }) -> x
                | T(x) -> x) in

            let et' = rewrite et spilled (M.empty, M.empty) S.empty in

            (* for debug *)
            if !debug then (
                asm_debug stdout (Prog([], [], et'));
                List.iter (fun x -> Printf.fprintf stdout "spilled!!!!! %s\n" x) spilled
            ) else (
                asm_debug stdout (Prog([], [], et'));
            );

            let e' = 
                (match e with
                | Fun({ name = n; args = ys; fargs = zs; body = _; ret = t }) -> 
                    Fun({ name = n; args = ys; fargs = zs; body = et'; ret = t})
                | T(_) -> 
                    T(et')) in

            loop e' (spilled @ spilled_temps)
        ) in
    loop e_origin []
    

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
            (fun (d, zfrs) z -> (d + 1, (z, fregs.(d)) :: zfrs))
            (0, []) zs in
    let e =
        List.fold_left
            (fun e (d, fr) ->
                (Let((d, Type.Float), FMovD(fr), e)))
        e zfrs in
    { name = n; args = ys; fargs = zs; body = e; ret = t }


let h ({ name = Id.L(x); args = ys; fargs = zs; body = e; ret = t } as fundef) = 
    Printf.fprintf stdout "--- Function: %s ----------------------- \n" x;
    let fundef' = h_args (move_calleesaves fundef) in

    let (e', allocation) = alloc (Fun(fundef')) in 
    let arg_regs = List.map (fun x -> M.find x allocation) ys in
    let farg_regs = List.map (fun x -> M.find x allocation) zs in
    { name = Id.L(x); args = ys; fargs = zs; body = e'; ret = t }


let f e = 
    if !debug then asm_debug stdout (Prog([], [], e));
    let (e', _) = alloc (T(e)) in 
    e'


(* 
let test () = 
    let e = rewrite 
    (Let(("T1", Type.Int), Set(0), 
    (Let(("T2", Type.Int), Set(1), 
    (Let(("T4", Type.Int), CallDir(Id.L("min_caml"), [], []),
    (Let(("T3", Type.Unit), St("T1", "zero", C(1)), Ans(Set(1)))))))))) ["T1"] (M.empty, M.empty) S.empty in
    asm_debug stdout (Prog([], [], e))
*)
