open Asm

let rec g = function
    | Ans(exp) -> Ans(g' exp)
    | Let((x, t), exp, e) ->
        match exp with
        | IfGE(y, V(z), Ans(Set(0)), Ans(Set(1))) -> 
            (* y >= z then x = 0 else x = 1 <=> y < z then x = 1 else x = 0 *)
            Let((x, t), Slt(y, z), g e)
        | IfLE(y, V(z), Ans(Set(0)), Ans(Set(1))) -> 
            (* y <= z then x = 0 else y = 1 <=> z < y then x = 1 else x = 0 *)
            Let((x, t), Slt(y, z), g e)
        | IfFLE(y, z, Ans(Set(0)), Ans(Set(1))) -> 
            (* y <= z then x = 0 else y = 1 <=> z < y then x = 1 else x = 0 *)
            Let((x, t), FSlt(y, z), g e)
        | _ ->
            Let((x, t), g' exp, g e)

(* 順次追加 *)
and g' = function
    | IfLE(x, C(0), e1, e2) -> IfLE(x, V(reg_zero), g e1, g e2)
    | e -> e

let h { name = l; args = xs; fargs = ys; body = e; ret = t } = 
    { name = l; args = xs; fargs = ys; body = g e; ret = t }

let f (Prog(data, fundefs, e)) =
    Prog(data, List.map h fundefs, g e)