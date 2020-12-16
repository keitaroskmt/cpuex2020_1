type t = (* MinCamlの型を表現するデータ型 (caml2html: type_t) *)
  | Unit
  | Bool
  | Int
  | Float
  | Fun of t list * t (* arguments are uncurried *)
  | Tuple of t list
  | Array of t
  | Var of t option ref

let gentyp () = Var(ref None) (* 新しい型変数を作る *)

let rec print_type oc t =
    match t with
    | Unit ->
        Printf.fprintf oc "()"
    | Bool ->
        Printf.fprintf oc "Bool"
    | Int ->
        Printf.fprintf oc "Int"
    | Float ->
        Printf.fprintf oc "Float"
    | Fun (t1, t2) ->
       (List.iter
       (fun t_ -> (print_type oc t_; Printf.fprintf oc " -> ")) t1;
        print_type oc t2)
    | Tuple t1 ->
       (let rec print_tuple tl =
            match tl with
            | [] -> Printf.fprintf oc ")"
            | [t_] -> (print_type oc t_; Printf.fprintf oc ")")
            | t_ :: rest -> (print_type oc t_; Printf.fprintf oc " * "; print_tuple rest)
        in
        print_tuple t1)
    | Array t1 ->
       (print_type oc t1; Printf.fprintf oc " list")
    | Var t1 ->
        match !t1 with
        | Some t_ -> print_type oc t_
        | None -> Printf.fprintf oc "none"
