(* type inference/reconstruction *)

open Syntax

exception Unify of Type.t * Type.t
exception Error of t * Type.t * Type.t

let extenv = ref M.empty

(* for pretty printing (and type normalization) *)
let rec deref_typ = function (* 型変数を中身でおきかえる関数 (caml2html: typing_deref) *)
  | Type.Fun(t1s, t2) -> Type.Fun(List.map deref_typ t1s, deref_typ t2)
  | Type.Tuple(ts) -> Type.Tuple(List.map deref_typ ts)
  | Type.Array(t) -> Type.Array(deref_typ t)
  | Type.Var({ contents = None } as r) ->
      Format.eprintf "uninstantiated type variable detected; assuming int@.";
      r := Some(Type.Int);
      Type.Int
  | Type.Var({ contents = Some(t) } as r) ->
      let t' = deref_typ t in
      r := Some(t');
      t'
  | t -> t
let rec deref_id_typ (x, t) = (x, deref_typ t)
let rec deref_term = function
  | Not(e) -> Not(deref_term e)
  | Neg(e) -> Neg(deref_term e)
  | Add(e1, e2) -> Add(deref_term e1, deref_term e2)
  | Sub(e1, e2) -> Sub(deref_term e1, deref_term e2)
  | Eq(e1, e2) -> Eq(deref_term e1, deref_term e2)
  | LE(e1, e2) -> LE(deref_term e1, deref_term e2)
  | FNeg(e) -> FNeg(deref_term e)
  | FAdd(e1, e2) -> FAdd(deref_term e1, deref_term e2)
  | FSub(e1, e2) -> FSub(deref_term e1, deref_term e2)
  | FMul(e1, e2) -> FMul(deref_term e1, deref_term e2)
  | FDiv(e1, e2) -> FDiv(deref_term e1, deref_term e2)
  | If(e1, e2, e3) -> If(deref_term e1, deref_term e2, deref_term e3)
  | Let(xt, e1, e2) -> Let(deref_id_typ xt, deref_term e1, deref_term e2)
  | LetRec({ name = xt; args = yts; body = e1 }, e2) ->
      LetRec({ name = deref_id_typ xt;
               args = List.map deref_id_typ yts;
               body = deref_term e1 },
             deref_term e2)
  | App(e, es) -> App(deref_term e, List.map deref_term es)
  | Tuple(es) -> Tuple(List.map deref_term es)
  | LetTuple(xts, e1, e2) -> LetTuple(List.map deref_id_typ xts, deref_term e1, deref_term e2)
  | Array(e1, e2) -> Array(deref_term e1, deref_term e2)
  | Get(e1, e2) -> Get(deref_term e1, deref_term e2)
  | Put(e1, e2, e3) -> Put(deref_term e1, deref_term e2, deref_term e3)
  | e -> e

(* Type.t -> Type.t -> bool *)
let rec occur r1 = function (* occur check (caml2html: typing_occur) *)
  | Type.Fun(t2s, t2) -> List.exists (occur r1) t2s || occur r1 t2
  | Type.Tuple(t2s) -> List.exists (occur r1) t2s
  | Type.Array(t2) -> occur r1 t2
  | Type.Var(r2) when r1 == r2 -> true (* 物理的に同一 *)
  | Type.Var({ contents = None }) -> false
  | Type.Var({ contents = Some(t2) }) -> occur r1 t2
  | _ -> false

 (* Type.t -> Type.t -> unit *)
let rec unify t1 t2 = (* 型が合うように、型変数への代入をする (caml2html: typing_unify) *)
  match t1, t2 with
  | Type.Unit, Type.Unit | Type.Bool, Type.Bool | Type.Int, Type.Int | Type.Float, Type.Float -> ()
  | Type.Fun(t1s, t1'), Type.Fun(t2s, t2') ->
      (try List.iter2 unify t1s t2s
      with Invalid_argument(_) -> raise (Unify(t1, t2)));
      unify t1' t2'
  | Type.Tuple(t1s), Type.Tuple(t2s) ->
      (try List.iter2 unify t1s t2s
      with Invalid_argument(_) -> raise (Unify(t1, t2)))
  | Type.Array(t1), Type.Array(t2) -> unify t1 t2
  | Type.Var(r1), Type.Var(r2) when r1 == r2 -> ()
  | Type.Var({ contents = Some(t1') }), _ -> unify t1' t2
  | _, Type.Var({ contents = Some(t2') }) -> unify t1 t2'
  | Type.Var({ contents = None } as r1), _ -> (* 一方が未定義の型変数の場合 (caml2html: typing_undef) *)
      if occur r1 t2 then raise (Unify(t1, t2));
      r1 := Some(t2)
  | _, Type.Var({ contents = None } as r2) ->
      if occur r2 t1 then raise (Unify(t1, t2));
      r2 := Some(t1)
  | _, _ -> raise (Unify(t1, t2))

 (* M ({key: string, value: Type.t) -> Syntax.t -> Type.t *)
let rec g env e = (* 型推論ルーチン (caml2html: typing_g) *)
  try
    match e with
    | Unit -> Type.Unit
    | Bool(_) -> Type.Bool
    | Int(_) -> Type.Int
    | Float(_) -> Type.Float
    | Not(e) ->
        unify Type.Bool (g env e);
        Type.Bool
    | Neg(e) ->
        unify Type.Int (g env e);
        Type.Int
    | Add(e1, e2) | Sub(e1, e2) | Mul (e1, e2) | Div(e1, e2) -> (* 足し算（と引き算）の型推論 (caml2html: typing_add) *)
        unify Type.Int (g env e1);
        unify Type.Int (g env e2);
        Type.Int
    | FNeg(e) ->
        unify Type.Float (g env e);
        Type.Float
    | FAdd(e1, e2) | FSub(e1, e2) | FMul(e1, e2) | FDiv(e1, e2) ->
        unify Type.Float (g env e1);
        unify Type.Float (g env e2);
        Type.Float
    | Eq(e1, e2) | LE(e1, e2) ->
        unify (g env e1) (g env e2);
        Type.Bool
    | If(e1, e2, e3) ->
        unify (g env e1) Type.Bool;
        let t2 = g env e2 in
        let t3 = g env e3 in
        unify t2 t3;
        t2
    | Let((x, t), e1, e2) -> (* letの型推論 (caml2html: typing_let) *)
        unify t (g env e1);
        g (M.add x t env) e2
    | Var(x) when M.mem x env -> M.find x env (* 変数の型推論 (caml2html: typing_var) *)
    | Var(x) when M.mem x !extenv -> M.find x !extenv
    | Var(x) -> (* 外部変数の型推論 (caml2html: typing_extvar) *)
        Format.eprintf "free variable %s assumed as external@." x;
        let t = Type.gentyp () in
        extenv := M.add x t !extenv;
        t
    | LetRec({ name = (x, t); args = yts; body = e1 }, e2) -> (* let recの型推論 (caml2html: typing_letrec) *)
        let env = M.add x t env in
        unify t (Type.Fun(List.map snd yts, g (M.add_list yts env) e1));
        g env e2
    | App(e, es) -> (* 関数適用の型推論 (caml2html: typing_app) *)
        let t = Type.gentyp () in
        unify (g env e) (Type.Fun(List.map (g env) es, t));
        t
    | Tuple(es) -> Type.Tuple(List.map (g env) es)
    | LetTuple(xts, e1, e2) ->
        unify (Type.Tuple(List.map snd xts)) (g env e1);
        g (M.add_list xts env) e2
    | Array(e1, e2) -> (* must be a primitive for "polymorphic" typing *)
        unify (g env e1) Type.Int;
        Type.Array(g env e2)
    | Get(e1, e2) ->
        let t = Type.gentyp () in
        unify (Type.Array(t)) (g env e1);
        unify Type.Int (g env e2);
        t
    | Put(e1, e2, e3) ->
        let t = g env e3 in
        unify (Type.Array(t)) (g env e1);
        unify Type.Int (g env e2);
        Type.Unit
  with Unify(t1, t2) -> raise (Error(deref_term e, deref_typ t1, deref_typ t2))


(* --------- fは下へ --------------------------*)

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
        | Mul (e1, e2) ->
            (Printf.fprintf oc "Mul\n";
             print_syntax e1 (level+1);
             print_syntax e2 (level+1))
        | Div (e1, e2) ->
            (Printf.fprintf oc "Div\n";
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


let f e =
    extenv := M.empty;
    extenv := M.add "fequal" (Type.Fun([Type.Float; Type.Float], Type.Bool)) !extenv;
    extenv := M.add "fless" (Type.Fun([Type.Float; Type.Float], Type.Bool)) !extenv;
    extenv := M.add "fabs" (Type.Fun([Type.Float], Type.Float)) !extenv;
    extenv := M.add "fneg" (Type.Fun([Type.Float], Type.Float)) !extenv;
    extenv := M.add "sqrt" (Type.Fun([Type.Float], Type.Float)) !extenv;
    extenv := M.add "itof" (Type.Fun([Type.Int], Type.Float)) !extenv;
    extenv := M.add "ftoi" (Type.Fun([Type.Float], Type.Int)) !extenv;
    (*
    extenv := M.add "read_float" (Type.Fun([Type.Unit], Type.Float)) !extenv;
    extenv := M.add "read_int" (Type.Fun([Type.Unit], Type.Int)) !extenv;
    *)
(*
  (match deref_typ (g M.empty e) with
  | Type.Unit -> ()
  | _ -> Format.eprintf "warning: final result does not have type unit@.");
*)
  (try unify Type.Unit (g M.empty e)
  with
   | Unify _ ->
        (try
         unify Type.Int (g M.empty e)
        with
            | Unify _ ->
            (try
                unify Type.Float (g M.empty e)
            with
            | Unify _ -> failwith "top level does not have type unit or int, float"
            )
        )
   | Error(e, t1, t2) ->
        (syntax_debug stderr e;
         Type.print_type stderr t1;
         Printf.fprintf stderr " ";
         Type.print_type stderr t2;
         failwith "typing error"));
  extenv := M.map deref_typ !extenv;
  deref_term e
