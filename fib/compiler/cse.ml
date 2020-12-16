open KNormal

(* (KNormal.t, Id.t) list -> KNormal.t -> KNormal.t *)
let rec g env e = (* 共通部分式削除 *)
    try
        Var(List.assoc e env)
    with
        Not_found ->
       (match e with
        | IfEq(x, y, e1, e2) -> IfEq(x, y, g env e1, g env e2)
        | IfLE(x, y, e1, e2) -> IfLE(x, y, g env e1, g env e2)
        | Let((x, t) as xt, e1, e2) ->
            let e1' = g env e1 in
            Let(xt, e1', g ((e1', x) :: env) e2)
        | LetRec({ name = (x, t); args = yts; body = e1 }, e2) ->
          LetRec({ name = (x, t); args = yts; body = g env e1}, g env e2)
        | LetTuple(xts, y, e) -> LetTuple(xts, y, g env e)
        | e1 -> e1
        )

let f e = g [] e
