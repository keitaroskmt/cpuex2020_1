open Asm

let rec fv = function
    | Ans(exp) -> fv' exp
    | Let((x, t), exp, e) -> S.union (fv' exp) (S.remove x (fv e))
and fv' = function
    | Nop | Set(_) | SetF(_) | SetL(_) | Comment(_) -> S.empty
    | Mov(x) | Neg(x) | FMovD(x) | FNegD(x) | FAbs(x) | FSqr(x) | Ftoi(x) | Itof(x) | Floor(x) -> S.singleton x
    | Add(x, V(y)) | Sub(x, V(y)) | Mul(x, V(y)) | Div(x, V(y)) | SLL(x, V(y)) | Ld(x, V(y)) | LdF(x, V(y)) -> S.of_list [x; y]
    | Add(x, C(i)) | Sub(x, C(i)) | Mul(x, C(i)) | Div(x, C(i)) | SLL(x, C(i)) | Ld(x, C(i)) | LdF(x, C(i)) -> S.singleton x
    | St(x, y, V(z)) | StF(x, y, V(z)) -> S.of_list [x; y; z]
    | St(x, y, C(i)) | StF(x, y, C(i)) -> S.of_list [x; y]
    | FAddD(x, y) | FSubD(x, y) | FMulD(x, y) | FDivD(x, y) -> S.of_list [x; y] 
    | IfEq(x, V(y), e1, e2) | IfLE(x, V(y), e1, e2) | IfGE(x, V(y), e1, e2) -> 
        S.add x (S.add y (S.union (fv e1) (fv e2)))
    | IfEq(x, C(i), e1, e2) | IfLE(x, C(i), e1, e2) | IfGE(x, C(i), e1, e2) -> 
        S.add x (S.union (fv e1) (fv e2))
    | IfFEq(x, y, e1, e2) | IfFLE(x, y, e1, e2) ->
        S.add x (S.add y (S.union (fv e1) (fv e2)))
    | Slt(x, y) | FSlt(x, y) -> S.of_list [x; y]
    | CallCls(x, ys, zs) -> S.add x (S.union (S.of_list ys) (S.of_list zs))
    | CallDir(_, ys, zs) -> S.union (S.of_list ys) (S.of_list zs) 
    | Save(x, y) -> S.of_list [x; y]
    | Restore(x) -> S.singleton x

(* 副作用の持つ式 メモリの書き換え *)
(* 関数呼び出しの先は追えないので副作用ありとする * *)
let rec effect = function
    | Ans(exp) -> effect' exp
    | Let((x, t), exp, e) -> effect' exp || effect e
and effect' = function
    | St(_) | StF(_) | Save(_) | CallCls(_) | CallDir(_) -> true 
    | IfEq(_, _, e1, e2) | IfLE(_, _, e1, e2) | IfGE(_, _, e1, e2) | IfFEq(_, _, e1, e2) | IfFLE(_, _, e1, e2) -> effect e1 || effect e2
    | _ -> false

and g = function
    | Ans(exp) -> Ans(g' exp)
    | Let((x, t), exp, e) ->
        let exp' = g' exp in
        let e' = g e in
        (* %hpの操作などは削除できない *)
        if effect' exp' || S.mem x (fv e) || is_reg x then
            Let((x, t), exp', e')
        else
            e'

and g' = function
    | IfEq(x, y, e1, e2) -> IfEq(x, y, g e1, g e2)
    | IfLE(x, y, e1, e2) -> IfLE(x, y, g e1, g e2)
    | IfGE(x, y, e1, e2) -> IfGE(x, y, g e1, g e2)
    | IfFEq(x, y, e1, e2) -> IfFEq(x, y, g e1, g e2)
    | IfFLE(x, y, e1, e2) -> IfFLE(x, y, g e1, g e2)
    | e -> e

let h { name = l; args = xs; fargs = ys; body = e; ret = t } = 
    { name = l; args = xs; fargs = ys; body = g e; ret = t }

let f (Prog(data, fundefs, e)) = 
    Prog(data, List.map h fundefs, g e)