open Asm

let float_data = ref []

let find x env = 
    if M.mem x env then M.find x env else x

let find' x' env = 
    match x' with
    | V(x) -> if M.mem x env then V(M.find x env) else V(x)
    | C(i) -> C(i)

let rec g env = function
    | Let((x, t), Set(0), e) -> g (M.add x reg_zero env) e
    | Let((x, t), Set(1), e) -> g (M.add x reg_one env) e
    | Let((x, t), SetF(l), e) ->
        let (_, f) = List.find (fun (l', _) -> l = l') !float_data in
        (match f with
        | 0.0 -> g (M.add x reg_fzero env) e
        | 1.0 -> g (M.add x reg_fone env) e
        | 0.01 -> g (M.add x reg_f001 env) e
        | (-0.2) -> g (M.add x reg_f_02 env) e
        | _ -> Let((x, t), SetF(l), g env e))

    (* coalescingが効く? *)
    | Ans(Set(0)) -> Ans(Mov(reg_zero))
    | Ans(Set(1)) -> Ans(Mov(reg_one))
    | Ans(SetF(l)) -> 
        let (_, f) = List.find (fun (l', _) -> l = l') !float_data in
        (match f with
        | 0.0 -> Ans(FMovD(reg_fzero))
        | 1.0 -> Ans(FMovD(reg_fone))
        | 0.01 -> Ans(FMovD(reg_f001))
        | (-0.2) -> Ans(FMovD(reg_f_02))
        | _ -> Ans(SetF(l)))

    | Ans(exp) -> Ans(g' env exp)
    | Let((x, t), exp, e) -> Let((x, t), g' env exp, g env e)

and g' env = function
    | Mov(x) -> Mov(find x env)
    | Neg(x) -> Neg(find x env)
    | Add(x, y') -> Add(find x env, find' y' env)
    | Sub(x, y') -> Sub(find x env, find' y' env)
    | Mul(x, y') -> Mul(find x env, find' y' env)
    | Div(x, y') -> Div(find x env, find' y' env)
    | SLL(x, y') -> SLL(find x env, find' y' env)
    | Ld(x, y') -> Ld(find x env, find' y' env)
    | St(x, y, z') -> St(find x env, find y env, find' z' env)
    | FMovD(x) -> FMovD(find x env)
    | FNegD(x) -> FNegD(find x env)
    | FAddD(x, y) -> FAddD(find x env, find y env)
    | FSubD(x, y) -> FSubD(find x env, find y env)
    | FMulD(x, y) -> FMulD(find x env, find y env)
    | FDivD(x, y) -> FDivD(find x env, find y env)
    | FAbs(x) -> FAbs(find x env)
    | FSqr(x) -> FSqr(find x env)
    | Ftoi(x) -> Ftoi(find x env)
    | Itof(x) -> Itof(find x env)
    | Floor(x) -> Floor(find x env)
    | LdF(x, y') -> LdF(find x env, find' y' env)
    | StF(x, y, z') -> StF(find x env, find y env, find' z' env)
    | IfEq(x, y', e1, e2) -> IfEq(find x env, find' y' env, g env e1, g env e2)
    | IfLE(x, y', e1, e2) -> IfLE(find x env, find' y' env, g env e1, g env e2)
    | IfGE(x, y', e1, e2) -> IfGE(find x env, find' y' env, g env e1, g env e2)
    | IfFEq(x, y, e1, e2) -> IfFEq(find x env, find y env, g env e1, g env e2)
    | IfFLE(x, y, e1, e2) -> IfFLE(find x env, find y env, g env e1, g env e2)
    | Slt(x, y) -> Slt(find x env, find y env)
    | FSlt(x, y) -> FSlt(find x env, find y env)
    | CallCls(x, ys, zs) -> CallCls(x, List.map (fun y -> find y env) ys, List.map (fun z -> find z env) zs)
    | CallDir(x, ys, zs) -> CallDir(x, List.map (fun y -> find y env) ys, List.map (fun z -> find z env) zs)
    | Save(_, _) | Restore(_) -> failwith "constreg"
    | e -> e


let h { name = l; args = xs; fargs = ys; body = e; ret = t } = 
    { name = l; args = xs; fargs = ys; body = g M.empty e; ret = t }

let f (Prog(data, fundefs, e)) = 
    float_data := data;
    Prog(data, List.map h fundefs, g M.empty e)