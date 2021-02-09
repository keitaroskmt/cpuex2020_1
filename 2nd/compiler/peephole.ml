open Asm

let rec g = function
    | Ans(exp) -> Ans(g' exp)
    | Let((x, t), exp, e) ->
        Let((x, t), g' exp, g e)

(* 順次追加 *)
and g' = function
    | IfLE(x, C(0), e1, e2) -> IfLE(x, V(reg_zero), g e1, g e2)
    | e -> e

let h { name = l; args = xs; fargs = ys; body = e; ret = t } = 
    { name = l; args = xs; fargs = ys; body = g e; ret = t }

let f (Prog(data, fundefs, e)) =
    Prog(data, List.map h fundefs, g e)