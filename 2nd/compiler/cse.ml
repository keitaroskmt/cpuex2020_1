open KNormal
(* 共通部分式削除 *)

module Cenv =
  Map.Make
    (struct
      type t = KNormal.t
      let compare = compare
    end)

let rec has_sideEffect fenv e =
    match e with
    | IfEq(x, y, e1, e2) -> (has_sideEffect fenv e1) || (has_sideEffect fenv e2)
    | IfLE(x, y, e1, e2) -> (has_sideEffect fenv e1) || (has_sideEffect fenv e2)
    | Let(xt, e1, e2) -> (has_sideEffect fenv e1) || (has_sideEffect fenv e2)
    | LetRec({ name = (x, t); args = yts; body = e1 }, e2) ->
        let nfenv = M.add x e1 fenv in
        (has_sideEffect nfenv e1) || (has_sideEffect nfenv e2)
    | App(x, xs) ->
        (
        try
            let body = M.find x fenv in
            has_sideEffect (M.remove x fenv) body
        with
        | Not_found -> false (* 再帰関数の対応 すでにcheckしたのでokとする *)
        )
    | LetTuple(xts, y, e) -> has_sideEffect fenv e
    | Put(x, y, z) -> true
    | ExtFunApp(x, xs) -> true
    | _ -> false

(* fenv: 関数名とbodyとの対応. 関数適用において副作用を持つかの判定で必要. *)
(* env: (KNormal.t, Id.t) M -> fenv: (Id.t, KNormal.t) M -> KNormal.t -> KNormal.t *)
let rec g env fenv e =
    if Cenv.mem e env then
    (
        Format.eprintf "cse %s@." (Cenv.find e env);
        Var(Cenv.find e env)
    )
    else
       (match e with
        | IfEq(x, y, e1, e2) -> IfEq(x, y, g env fenv e1, g env fenv e2)
        | IfLE(x, y, e1, e2) -> IfLE(x, y, g env fenv e1, g env fenv e2)
        | Let((x, t) as xt, e1, e2) -> (* 変数xの対応を加える *)
            let e1' = g env fenv e1 in
            (* ExtFunAppはヒープレジスタを変更, Putはヒープの中身を変更する副作用 *)
           (match e1' with
            | Put(s, t, u) ->
                Let(xt, e1', g (Cenv.add e1' x (Cenv.remove (Get(s, t)) env)) fenv e2)
            | App(y, ys) ->
                (
                try
                let body = M.find y fenv in
                    if has_sideEffect (M.remove y fenv) body then
                        Let(xt, e1', g env fenv e2)
                    else
                        Let(xt, e1', g (Cenv.add e1' x env) fenv e2)
                with
                | Not_found -> failwith "error occured in cse.ml"
                )
            | ExtFunApp(y, ys) ->
                Let(xt, e1', g env fenv e2)
            | _ ->
                Let(xt, e1', g (Cenv.add e1' x env) fenv e2)
            )
        | LetRec({ name = (x, t); args = yts; body = e1 }, e2) ->
            let nfenv = M.add x e1 fenv in
            LetRec({ name = (x, t); args = yts; body = g Cenv.empty nfenv e1}, g env nfenv e2)
        | LetTuple(xts, y, e) -> LetTuple(xts, y, g env fenv e)
        | e1 -> e1
        )

let f e = g Cenv.empty M.empty e
