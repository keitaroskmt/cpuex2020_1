type t = (* MinCamlの構文を表現するデータ型 (caml2html: syntax_t) *)
  | Unit
  | Bool of bool
  | Int of int
  | Float of float
  | Not of t
  | Neg of t
  | Add of t * t
  | Sub of t * t
  | FNeg of t
  | FAdd of t * t
  | FSub of t * t
  | FMul of t * t
  | FDiv of t * t
  | Eq of t * t
  | LE of t * t
  | If of t * t * t
  | Let of (Id.t * Type.t) * t * t
  | Var of Id.t
  | LetRec of fundef * t
  | App of t * t list
  | Tuple of t list
  | LetTuple of (Id.t * Type.t) list * t * t
  | Array of t * t
  | Get of t * t
  | Put of t * t * t
and fundef = { name : Id.t * Type.t; args : (Id.t * Type.t) list; body : t }

(* for debug *)
let syntax_debug oc l =
    let rec print_tab level =
        if level = 0 then ()
        else (Printf.fprintf oc "\t"; print_tab (level-1))

    and  print_syntax e level =
       (print_tab level;
        match e with
        | Unit ->
            Printf.fprintf oc "()\n"
        | Bool b ->
            Printf.fprintf oc "Bool %s\n" (string_of_bool b)
        | Int i ->
            Printf.fprintf oc "Int %s\n" (string_of_int i)
        | Float f ->
            Printf.fprintf oc "Float %s\n" (string_of_float f)
        | Not e1 ->
            (Printf.fprintf oc "Not\n";
             print_syntax e1 (level+1))
        | Neg e1 ->
            (Printf.fprintf oc "Neg\n";
             print_syntax e1 (level+1))
        | Add (e1, e2) ->
            (Printf.fprintf oc "Add\n";
             print_syntax e1 (level+1);
             print_syntax e2 (level+1))
        | Sub (e1, e2) ->
            (Printf.fprintf oc "Sub\n";
             print_syntax e1 (level+1);
             print_syntax e2 (level+1))
        | FNeg e1 ->
            (Printf.fprintf oc "FNeg\n";
             print_syntax e1 (level+1))
        | FAdd (e1, e2) ->
            (Printf.fprintf oc "FAdd\n";
             print_syntax e1 (level+1);
             print_syntax e2 (level+1))
        | FSub (e1, e2) ->
            (Printf.fprintf oc "FSub\n";
             print_syntax e1 (level+1);
             print_syntax e2 (level+1))
        | FMul (e1, e2) ->
            (Printf.fprintf oc "FMul\n";
             print_syntax e1 (level+1);
             print_syntax e2 (level+1))
        | FDiv (e1, e2) ->
            (Printf.fprintf oc "FDiv\n";
             print_syntax e1 (level+1);
             print_syntax e2 (level+1))
        | Eq (e1, e2) ->
            (Printf.fprintf oc "Eq\n";
             print_syntax e1 (level+1);
             print_syntax e2 (level+1))
        | LE (e1, e2) ->
            (Printf.fprintf oc "LE\n";
             print_syntax e1 (level+1);
             print_syntax e2 (level+1))
        | If (e1, e2, e3) ->
            (Printf.fprintf oc "If\n";
             print_syntax e1 (level+1);
             print_syntax e2 (level+1);
             print_syntax e3 (level+1))
        | Let ((id, t), e1, e2) ->
            (Printf.fprintf oc "Let\n";
             print_tab (level+1);
             print_id_type (id, t);
             Printf.fprintf oc "\n";
             print_syntax e1 (level+1);
             print_syntax e2 (level+1))
        | Var id ->
             Printf.fprintf oc "Var %s\n" id
        (*
            (Printf.fprintf oc "Var\n";
             print_tab (level+1);
             Printf.fprintf oc "%s\n" id)
             *)
        | LetRec (e1, e2) ->
            (Printf.fprintf oc "LetRec\n";
             print_fundef e1 (level+1);
             print_syntax e2 (level+1))
        | App (e1, e2) ->
            (Printf.fprintf oc "App\n";
             print_syntax e1 (level+1);
             List.iter (fun x -> print_syntax x (level+1)) e2)
        | Tuple e1 ->
            (Printf.fprintf oc "Tuple\n";
             List.iter (fun x -> print_syntax x (level+1)) e1)
        | LetTuple (e1, e2, e3) ->
            (Printf.fprintf oc "LetTuple\n";
             print_tab(level+1);
             print_id_type_list e1;
             Printf.fprintf oc "\n";
             print_syntax e2 (level+1);
             print_syntax e3 (level+1))
        | Array (e1, e2) ->
            (Printf.fprintf oc "Array\n";
             print_syntax e1 (level+1);
             print_syntax e2 (level+1))
        | Get (e1, e2) ->
            (Printf.fprintf oc "Get\n";
             print_syntax e1 (level+1);
             print_syntax e2 (level+1))
        | Put (e1, e2, e3) ->
            (Printf.fprintf oc "Put\n";
             print_syntax e1 (level+1);
             print_syntax e2 (level+1);
             print_syntax e3 (level+1))
        )

    and print_id_type (id, t) =
       (Printf.fprintf oc "(%s : " id;
        Type.print_type oc t;
        Printf.fprintf oc ")")

    and print_id_type_list list =
         let rec p lst =
         match lst with
         | [(id, t)] -> (print_id_type (id, t); Printf.fprintf oc "]")
         | (id, t) :: rest -> (print_id_type (id, t); Printf.fprintf oc ", "; p rest)
         in
        (Printf.fprintf oc "["; p list)

    and print_fundef fundef level =
       (print_tab level;
        Printf.fprintf oc "name : \n";
        print_tab (level+1);
        print_id_type fundef.name;
        Printf.fprintf oc "\n";
        print_tab level;
        Printf.fprintf oc "args : \n";
        print_tab (level+1);
        print_id_type_list fundef.args;
        Printf.fprintf oc "\n";
        print_tab level;
        Printf.fprintf oc "body : \n";
        print_syntax fundef.body (level+1))

    in
    print_syntax l 0
