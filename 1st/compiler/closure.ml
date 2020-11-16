type closure = { entry : Id.l; actual_fv : Id.t list }
type t = (* クロージャ変換後の式 (caml2html: closure_t) *)
  | Unit
  | Int of int
  | Float of float
  | Neg of Id.t
  | Add of Id.t * Id.t
  | Sub of Id.t * Id.t
  | Mul of Id.t * Id.t
  | Div of Id.t * Id.t
  | FNeg of Id.t
  | FAdd of Id.t * Id.t
  | FSub of Id.t * Id.t
  | FMul of Id.t * Id.t
  | FDiv of Id.t * Id.t
  | IfEq of Id.t * Id.t * t * t
  | IfLE of Id.t * Id.t * t * t
  | Let of (Id.t * Type.t) * t * t
  | Var of Id.t
  | MakeCls of (Id.t * Type.t) * closure * t
  | AppCls of Id.t * Id.t list
  | AppDir of Id.l * Id.t list
  | Tuple of Id.t list
  | LetTuple of (Id.t * Type.t) list * Id.t * t
  | Get of Id.t * Id.t
  | Put of Id.t * Id.t * Id.t
  | ExtArray of Id.l
  | FAbs of Id.t
  | FSqr of Id.t
  | Ftoi of Id.t
  | Itof of Id.t
type fundef = { name : Id.l * Type.t;
                args : (Id.t * Type.t) list;
                formal_fv : (Id.t * Type.t) list;
                body : t }
type prog = Prog of fundef list * t

let rec fv = function
  | Unit | Int(_) | Float(_) | ExtArray(_) -> S.empty
  | Neg(x) | FNeg(x) | FAbs(x) | FSqr(x) | Ftoi(x) | Itof(x) -> S.singleton x
  | Add(x, y) | Sub(x, y) | Mul(x, y) | Div(x, y) | FAdd(x, y) | FSub(x, y) | FMul(x, y) | FDiv(x, y) | Get(x, y) -> S.of_list [x; y]
  | IfEq(x, y, e1, e2)| IfLE(x, y, e1, e2) -> S.add x (S.add y (S.union (fv e1) (fv e2)))
  | Let((x, t), e1, e2) -> S.union (fv e1) (S.remove x (fv e2))
  | Var(x) -> S.singleton x
  | MakeCls((x, t), { entry = l; actual_fv = ys }, e) -> S.remove x (S.union (S.of_list ys) (fv e))
  | AppCls(x, ys) -> S.of_list (x :: ys)
  | AppDir(_, xs) | Tuple(xs) -> S.of_list xs
  | LetTuple(xts, y, e) -> S.add y (S.diff (fv e) (S.of_list (List.map fst xts)))
  | Put(x, y, z) -> S.of_list [x; y; z]

let toplevel : fundef list ref = ref []

let rec g env known = function (* クロージャ変換ルーチン本体 (caml2html: closure_g) *)
  | KNormal.Unit -> Unit
  | KNormal.Int(i) -> Int(i)
  | KNormal.Float(d) -> Float(d)
  | KNormal.Neg(x) -> Neg(x)
  | KNormal.Add(x, y) -> Add(x, y)
  | KNormal.Sub(x, y) -> Sub(x, y)
  | KNormal.Mul(x, y) -> Mul(x, y)
  | KNormal.Div(x, y) -> Div(x, y)
  | KNormal.FNeg(x) -> FNeg(x)
  | KNormal.FAdd(x, y) -> FAdd(x, y)
  | KNormal.FSub(x, y) -> FSub(x, y)
  | KNormal.FMul(x, y) -> FMul(x, y)
  | KNormal.FDiv(x, y) -> FDiv(x, y)
  | KNormal.IfEq(x, y, e1, e2) -> IfEq(x, y, g env known e1, g env known e2)
  | KNormal.IfLE(x, y, e1, e2) -> IfLE(x, y, g env known e1, g env known e2)
  | KNormal.Let((x, t), e1, e2) -> Let((x, t), g env known e1, g (M.add x t env) known e2)
  | KNormal.Var(x) -> Var(x)
  | KNormal.LetRec({ KNormal.name = (x, t); KNormal.args = yts; KNormal.body = e1 }, e2) -> (* 関数定義の場合 (caml2html: closure_letrec) *)
      (* 関数定義let rec x y1 ... yn = e1 in e2の場合は、
         xに自由変数がない(closureを介さずdirectに呼び出せる)
         と仮定し、knownに追加してe1をクロージャ変換してみる *)
      let toplevel_backup = !toplevel in
      let env' = M.add x t env in
      let known' = S.add x known in
      let e1' = g (M.add_list yts env') known' e1 in
      (* 本当に自由変数がなかったか、変換結果e1'を確認する *)
      (* 注意: e1'にx自身が変数として出現する場合はclosureが必要!
         (thanks to nuevo-namasute and azounoman; test/cls-bug2.ml参照) *)
      let zs = S.diff (fv e1') (S.of_list (List.map fst yts)) in
      let known', e1' =
        if S.is_empty zs then known', e1' else
        (* 駄目だったら状態(toplevelの値)を戻して、クロージャ変換をやり直す *)
        (Format.eprintf "free variable(s) %s found in function %s@." (Id.pp_list (S.elements zs)) x;
         Format.eprintf "function %s cannot be directly applied in fact@." x;
         toplevel := toplevel_backup;
         let e1' = g (M.add_list yts env') known e1 in
         known, e1') in
      let zs = S.elements (S.diff (fv e1') (S.add x (S.of_list (List.map fst yts)))) in (* 自由変数のリスト *)
      let zts = List.map (fun z -> (z, M.find z env')) zs in (* ここで自由変数zの型を引くために引数envが必要 *)
      toplevel := { name = (Id.L(x), t); args = yts; formal_fv = zts; body = e1' } :: !toplevel; (* トップレベル関数を追加 *)
      let e2' = g env' known' e2 in
      if S.mem x (fv e2') then (* xが変数としてe2'に出現するか *)
        MakeCls((x, t), { entry = Id.L(x); actual_fv = zs }, e2') (* 出現していたら削除しない *)
      else
        (Format.eprintf "eliminating closure(s) %s@." x;
         e2') (* 出現しなければMakeClsを削除 *)
  | KNormal.App(x, ys) when S.mem x known -> (* 関数適用の場合 (caml2html: closure_app) *)
      Format.eprintf "directly applying %s@." x;
      AppDir(Id.L(x), ys)
  | KNormal.App(f, xs) -> AppCls(f, xs)
  | KNormal.Tuple(xs) -> Tuple(xs)
  | KNormal.LetTuple(xts, y, e) -> LetTuple(xts, y, g (M.add_list xts env) known e)
  | KNormal.Get(x, y) -> Get(x, y)
  | KNormal.Put(x, y, z) -> Put(x, y, z)
  | KNormal.ExtArray(x) -> ExtArray(Id.L(x))
  | KNormal.ExtFunApp(x, ys) ->
       (match x with
        | "fabs" -> FAbs(List.hd ys)
        | "fneg" -> FNeg(List.hd ys)
        | "sqrt" -> FSqr(List.hd ys)
        | "ftoi" -> Ftoi(List.hd ys)
        | "itof" -> Itof(List.hd ys)
        | _ -> AppDir(Id.L("min_caml_" ^ x), ys))

let f e =
  toplevel := [];
  let e' = g M.empty S.empty e in
  Prog(List.rev !toplevel, e')

(* for debug *)
let closure_debug oc l =
    let rec print_tab level =
        if level = 0 then ()
        else (Printf.fprintf oc "\t"; print_tab (level-1))

    and  print_closure e level =
       (print_tab level;
        match e with
        | Unit ->
            Printf.fprintf oc "()\n"
        | Int i ->
            Printf.fprintf oc "Int %s\n" (string_of_int i)
        | Float f ->
            Printf.fprintf oc "Float %s\n" (string_of_float f)
        | Neg e1 ->
            (Printf.fprintf oc "Neg\n";
             print_tab (level+1);
             Printf.fprintf oc "%s\n" e1)
        | Add (e1, e2) ->
            (Printf.fprintf oc "Add\n";
             print_tab (level+1);
             Printf.fprintf oc "%s\n" e1;
             print_tab (level+1);
             Printf.fprintf oc "%s\n" e2)
        | Sub (e1, e2) ->
            (Printf.fprintf oc "Sub\n";
             print_tab (level+1);
             Printf.fprintf oc "%s\n" e1;
             print_tab (level+1);
             Printf.fprintf oc "%s\n" e2)
        | Mul (e1, e2) ->
            (Printf.fprintf oc "Mul\n";
             print_tab (level+1);
             Printf.fprintf oc "%s\n" e1;
             print_tab (level+1);
             Printf.fprintf oc "%s\n" e2)
        | Div (e1, e2) ->
            (Printf.fprintf oc "Div\n";
             print_tab (level+1);
             Printf.fprintf oc "%s\n" e1;
             print_tab (level+1);
             Printf.fprintf oc "%s\n" e2)
        | FNeg e1 ->
            (Printf.fprintf oc "FNeg\n";
             print_tab (level+1);
             Printf.fprintf oc "%s\n" e1)
        | FAdd (e1, e2) ->
            (Printf.fprintf oc "FAdd\n";
             print_tab (level+1);
             Printf.fprintf oc "%s\n" e1;
             print_tab (level+1);
             Printf.fprintf oc "%s\n" e2)
        | FSub (e1, e2) ->
            (Printf.fprintf oc "FSub\n";
             print_tab (level+1);
             Printf.fprintf oc "%s\n" e1;
             print_tab (level+1);
             Printf.fprintf oc "%s\n" e2)
        | FMul (e1, e2) ->
            (Printf.fprintf oc "FMul\n";
             print_tab (level+1);
             Printf.fprintf oc "%s\n" e1;
             print_tab (level+1);
             Printf.fprintf oc "%s\n" e2)
        | FDiv (e1, e2) ->
            (Printf.fprintf oc "FDiv\n";
             print_tab (level+1);
             Printf.fprintf oc "%s\n" e1;
             print_tab (level+1);
             Printf.fprintf oc "%s\n" e2)
        | IfEq (e1, e2, e3, e4) ->
            (Printf.fprintf oc "IfEq\n";
             print_tab (level+1);
             Printf.fprintf oc "%s\n" e1;
             print_tab (level+1);
             Printf.fprintf oc "%s\n" e2;
             print_closure e3 (level+1);
             print_closure e4 (level+1))
        | IfLE (e1, e2, e3, e4) ->
            (Printf.fprintf oc "IfLE\n";
             print_tab (level+1);
             Printf.fprintf oc "%s\n" e1;
             print_tab (level+1);
             Printf.fprintf oc "%s\n" e2;
             print_closure e3 (level+1);
             print_closure e4 (level+1))
        | Let ((id, t), e1, e2) ->
            (Printf.fprintf oc "Let\n";
             print_tab (level+1);
             print_id_type (id, t);
             Printf.fprintf oc "\n";
             print_closure e1 (level+1);
             print_closure e2 (level+1))
        | Var id ->
             Printf.fprintf oc "Var %s\n" id
        | MakeCls ((id, t), cls, e1) ->
            (Printf.fprintf oc "MakeCls\n";
             print_tab (level+1);
             print_id_type (id, t);
             Printf.fprintf oc "\n";
             print_cls cls (level+1);
             print_closure e1 (level+1))
        | AppCls (e1, e2) ->
            (Printf.fprintf oc "AppCls\n";
             print_tab (level+1);
             Printf.fprintf oc "%s\n" e1;
             print_tab (level+1);
             print_id_list e2;
             Printf.fprintf oc "\n")
        | AppDir (e1, e2) ->
            (Printf.fprintf oc "AppDir\n";
             print_tab (level+1);
             print_lavel e1;
             Printf.fprintf oc "\n";
             print_tab (level+1);
             print_id_list e2;
             Printf.fprintf oc "\n")
        | Tuple e1 ->
            (Printf.fprintf oc "Tuple\n";
             print_tab (level+1);
             print_id_list e1;
             Printf.fprintf oc "\n")
        | LetTuple (e1, e2, e3) ->
            (Printf.fprintf oc "LetTuple\n";
             print_tab(level+1);
             print_id_type_list e1;
             Printf.fprintf oc "\n";
             print_tab (level+1);
             Printf.fprintf oc "%s\n" e2;
             print_closure e3 (level+1))
        | Get (e1, e2) ->
            (Printf.fprintf oc "Get\n";
             print_tab (level+1);
             Printf.fprintf oc "%s\n" e1;
             print_tab (level+1);
             Printf.fprintf oc "%s\n" e2)
        | Put (e1, e2, e3) ->
            (Printf.fprintf oc "Put\n";
             print_tab (level+1);
             Printf.fprintf oc "%s\n" e1;
             print_tab (level+1);
             Printf.fprintf oc "%s\n" e2;
             print_tab (level+1);
             Printf.fprintf oc "%s\n" e3)
        | ExtArray e1 ->
            (Printf.fprintf oc "ExtArray\n";
             print_tab (level+1);
             print_lavel e1;
             Printf.fprintf oc "\n")
        | FAbs e1 ->
            (Printf.fprintf oc "FAbs\n";
             print_tab (level+1);
             Printf.fprintf oc "%s\n" e1)
        | FSqr e1 ->
            (Printf.fprintf oc "FSqr\n";
             print_tab (level+1);
             Printf.fprintf oc "%s\n" e1)
        | Ftoi e1 ->
            (Printf.fprintf oc "Ftoi\n";
             print_tab (level+1);
             Printf.fprintf oc "%s\n" e1)
        | Itof e1 ->
            (Printf.fprintf oc "Itof\n";
             print_tab (level+1);
             Printf.fprintf oc "%s\n" e1)
        )

    and print_lavel e1 =
        let Id.L(s1) = e1 in
        Printf.fprintf oc "L (%s)" s1

    and print_id_list list =
        let rec p lst =
        match lst with
        | [] -> "]"
        | [s] -> s ^ "]"
        | s :: rest -> s ^ ", " ^ (p rest)
        in
        Printf.fprintf oc "%s" ("[" ^ p list)

    and print_id_type (id, t) =
       (Printf.fprintf oc "(%s : " id;
        Type.print_type oc t;
        Printf.fprintf oc ")")

    and print_id_type_list list =
         let rec p lst =
         match lst with
         | [] -> (Printf.fprintf oc "]")
         | [(id, t)] -> (print_id_type (id, t); Printf.fprintf oc "]")
         | (id, t) :: rest -> (print_id_type (id, t); Printf.fprintf oc ", "; p rest)
         in
        (Printf.fprintf oc "["; p list)

    and print_lavel_type (lvl, t) =
       (Printf.fprintf oc "(";
        print_lavel lvl;
        Printf.fprintf oc ": ";
        Type.print_type oc t;
        Printf.fprintf oc ")")

    and print_cls cls level =
       (print_tab level;
        Printf.fprintf oc "entry: \n";
        print_tab (level+1);
        print_lavel cls.entry;
        Printf.fprintf oc "\n";
        print_tab level;
        Printf.fprintf oc "actual_fv: \n";
        print_tab(level+1);
        print_id_list cls.actual_fv;
        Printf.fprintf oc "\n")

    and print_fundef fundef level =
       (print_tab level;
        Printf.fprintf oc "name : \n";
        print_tab (level+1);
        print_lavel_type fundef.name;
        Printf.fprintf oc "\n";
        print_tab level;
        Printf.fprintf oc "args : \n";
        print_tab (level+1);
        print_id_type_list fundef.args;
        Printf.fprintf oc "\n";
        print_tab level;
        Printf.fprintf oc "formal_fv : \n";
        print_tab (level+1);
        print_id_type_list fundef.formal_fv;
        Printf.fprintf oc "\n";
        print_tab level;
        Printf.fprintf oc "body : \n";
        print_closure fundef.body (level+1))

    and print_top prg =
        let Prog (lst, t) = prg in
       (Printf.fprintf oc "Prog \n";
        Printf.fprintf oc "fundef \n";
        List.iter (fun x -> print_fundef x 1) lst;
        Printf.fprintf oc "body \n";
        print_closure t 1)
    in
    print_top l
