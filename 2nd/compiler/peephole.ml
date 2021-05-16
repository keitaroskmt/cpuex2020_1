open Asm

let rec g = function
    | Ans(exp) -> Ans(g' exp)
    | Let((x, t), exp, e) ->
        match exp with
        (* 
        | IfGE(y, V(z), Ans(Set(0)), Ans(Set(1))) -> 
            (* y >= z then x = 0 else x = 1 <=> y < z then x = 1 else x = 0 *)
            Let((x, t), Slt(y, z), g e)
        | IfLE(y, V(z), Ans(Set(0)), Ans(Set(1))) -> 
            (* y <= z then x = 0 else y = 1 <=> z < y then x = 1 else x = 0 *)
            Let((x, t), Slt(z, y), g e)
        | IfFLE(y, z, Ans(Set(0)), Ans(Set(1))) -> 
            (* y <= z then x = 0 else y = 1 <=> z < y then x = 1 else x = 0 *)
            Let((x, t), FSlt(z, y), g e)
            *)
        | _ ->
            Let((x, t), g' exp, g e)

(* 順次追加 *)
and g' = function
    (* IfLEは即値の分岐ができない *)
    | IfLE(x, C(0), e1, e2) -> IfLE(x, V(reg_zero), g e1, g e2)
    | IfLE(x, C(1), e1, e2) -> IfLE(x, V(reg_one), g e1, g e2)
    (* ld, stはレジスタの場合1命令増える *)
    | Ld(x, V(y)) when y = reg_zero -> Ld(x, C(0))
    | Ld(x, V(y)) when y = reg_one -> Ld(x, C(1))
    | St(x, y, V(z)) when z = reg_zero -> St(x, y, C(0))
    | St(x, y, V(z)) when z = reg_one -> St(x, y, C(1))
    | LdF(x, V(y)) when y = reg_zero -> LdF(x, C(0))
    | LdF(x, V(y)) when y = reg_one -> LdF(x, C(1))
    | StF(x, y, V(z)) when z = reg_zero -> StF(x, y, C(0))
    | StF(x, y, V(z)) when z = reg_one -> StF(x, y, C(1))

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