(* translation into SPARC assembly with infinite number of virtual registers *)

open Asm

let data = ref [] (* 浮動小数点数の定数テーブル (caml2html: virtual_data) *)

let classify xts ini addf addi =
  List.fold_left
    (fun acc (x, t) ->
      match t with
      | Type.Unit -> acc
      | Type.Float -> addf acc x
      | _ -> addi acc x t)
    ini
    xts

let separate xts =
  classify
    xts
    ([], [])
    (fun (int, float) x -> (int, float @ [x]))
    (fun (int, float) x _ -> (int @ [x], float))

let expand xts ini addf addi =
  classify
    xts
    ini
    (fun (offset, acc) x ->
      (*let offset = align offset in*)
      (offset + 1, addf x offset acc))
    (fun (offset, acc) x t ->
      (offset + 1, addi x t offset acc))

let rec load_global l =
    match l with
    | [] -> []
    | x :: rest ->
        (try
            let (addr, t) = List.assoc x !FixAddress.global_address in
            (* 関数適用時に引数のグローバル変数の名前を書き換えないとレジスタ割り当てに失敗する *)
            let z = Id.genid "g" in
            (z, addr) :: (load_global rest)
        with
        | Not_found -> (x, -1) :: (load_global rest)
        )

let rec g env = function (* 式の仮想マシンコード生成 (caml2html: virtual_g) *)
  | Closure.Unit -> Ans(Nop)
  | Closure.Int(i) -> Ans(Set(i))
  | Closure.Float(d) ->
      let l =
        try
          (* すでに定数テーブルにあったら再利用 *)
          let (l, _) = List.find (fun (_, d') -> d = d') !data in
          l
        with Not_found ->
          let l = Id.L(Id.genid "l") in
          data := (l, d) :: !data;
          l in
      Ans(SetF(l))
  | Closure.Neg(x) -> Ans(Neg(x))
  | Closure.Add(x, y) -> Ans(Add(x, V(y)))
  | Closure.Sub(x, y) -> Ans(Sub(x, V(y)))
  | Closure.Mul(x, y) -> Ans(Mul(x, V(y)))
  | Closure.Div(x, y) -> Ans(Div(x, V(y)))
  | Closure.FNeg(x) -> Ans(FNegD(x))
  | Closure.FAdd(x, y) -> Ans(FAddD(x, y))
  | Closure.FSub(x, y) -> Ans(FSubD(x, y))
  | Closure.FMul(x, y) -> Ans(FMulD(x, y))
  | Closure.FDiv(x, y) -> Ans(FDivD(x, y))
  | Closure.IfEq(x, y, e1, e2) ->
      (
      try
          (match M.find x env with
          | Type.Bool | Type.Int -> Ans(IfEq(x, V(y), g env e1, g env e2))
          | Type.Float -> Ans(IfFEq(x, y, g env e1, g env e2))
          | _ -> failwith "equality supported only for bool, int, and float")
      with Not_found -> failwith "IfEq"
      )
  | Closure.IfLE(x, y, e1, e2) ->
      (
      try
          (match M.find x env with
          | Type.Bool | Type.Int -> Ans(IfLE(x, V(y), g env e1, g env e2))
          | Type.Float -> Ans(IfFLE(x, y, g env e1, g env e2))
          | _ -> failwith "inequality supported only for bool, int, and float")
      with Not_found -> failwith "IfLE"
      )
  | Closure.Let((x, t1), e1, e2) ->
      let e1' = g env e1 in
      let e2' = g (M.add x t1 env) e2 in
      concat e1' (x, t1) e2'
  | Closure.Var(x) ->
        (
        try
            let (addr, t) = List.assoc x !FixAddress.global_address in Ans(Set(addr))
        with
        | Not_found ->
            (match M.find x env with
            | Type.Unit -> Ans(Nop)
            | Type.Float -> Ans(FMovD(x))
            | _ -> Ans(Mov(x)))
         )
  | Closure.MakeCls((x, t), { Closure.entry = l; Closure.actual_fv = ys }, e2) -> (* クロージャの生成 (caml2html: virtual_makecls) *)
      (* Closureのアドレスをセットしてから、自由変数の値をストア *)
      let e2' = g (M.add x t env) e2 in
      let offset, store_fv =
        expand
          (List.map (fun y -> (y, M.find y env)) ys)
          (1, e2')
          (fun y offset store_fv -> seq(StF(y, x, C(offset)), store_fv))
          (fun y _ offset store_fv -> seq(St(y, x, C(offset)), store_fv)) in
      Let((x, t), Mov(reg_hp),
          Let((reg_hp, Type.Int), Add(reg_hp, C(offset)),
              let z = Id.genid "l" in
              Let((z, Type.Int), SetL(l),
                  seq(St(z, x, C(0)),
                      store_fv))))
  | Closure.AppCls(x, ys) ->
    (
    try
      let (int, float) = separate (List.map (fun y -> (y, try M.find y env with Not_found -> Type.Int)) ys) in
      let arg = load_global int in
      List.fold_left (fun exp (name, addr) -> if addr >= 0 then Let((name, Type.Int), Set(addr), exp) else exp)
        (Ans(CallCls(x, (List.map (fun (name, addr) -> name) arg), float))) arg
    with Not_found -> failwith "AppCls"
    )
  | Closure.AppDir(Id.L(x), ys) ->
    (
    try
      let (int, float) = separate (List.map (fun y -> (y, try M.find y env with Not_found -> Type.Int)) ys) in
      let arg = load_global int in
      List.fold_left (fun exp (name, addr) -> if addr >= 0 then Let((name, Type.Int), Set(addr), exp) else exp)
        (Ans(CallDir(Id.L(x), (List.map (fun (name, addr) -> name) arg), float))) arg
    with Not_found -> failwith "AppDir"
    )
  | Closure.Tuple(xs) -> (* 組の生成 (caml2html: virtual_tuple) *)
    (
    try
      let y = Id.genid "t" in
      let (offset, store) =
        expand
          (List.map (fun x -> (x, try M.find x env with Not_found -> Type.Int)) xs)
          (0, Ans(Mov(y)))
          (fun x offset store -> seq(StF(x, y, C(offset)), store))
          (fun x _ offset store -> seq(St(x, y, C(offset)), store)) in
      Let((y, Type.Tuple(List.map (fun x -> try M.find x env with Not_found -> Type.Int) xs)), Mov(reg_hp),
          Let((reg_hp, Type.Int), Add(reg_hp, C(offset)),
              store))
    with Not_found -> failwith "Tuple"
    )
  | Closure.ExtTuple(xs, addr) ->
    (
    try
      let y = Id.genid "t" in
      let (offset, store) =
        expand
          (List.map (fun x -> (x, try M.find x env with Not_found -> Type.Int)) xs)
          (0, Ans(Mov(y)))
          (fun x offset store -> seq(StF(x, y, C(offset)), store))
          (fun x _ offset store -> seq(St(x, y, C(offset)), store)) in
      Let((y, Type.Tuple(List.map (fun x -> try M.find x env with Not_found -> Type.Int) xs)), Set(addr), store)
    with Not_found -> failwith "ExtTuple"
    )
  | Closure.LetTuple(xts, y, e2) ->
    (
    try
        let (addr, _) = List.assoc y !FixAddress.global_address in
        let addrid = Id.genid "v" in
        let s = Closure.fv e2 in
        let (offset, load) =
        expand
          xts
          (0, g (M.add_list xts env) e2)
          (fun x offset load ->
            if not (S.mem x s) then load else (* [XX] a little ad hoc optimization *)
            fletd(x, LdF(addrid, C(offset)), load))
          (fun x t offset load ->
            if not (S.mem x s) then load else (* [XX] a little ad hoc optimization *)
            Let((x, t), Ld(addrid, C(offset)), load)) in
        Let((addrid, Type.Int), Set(addr), load)
    with
    | Not_found ->
        let s = Closure.fv e2 in
        let (offset, load) =
        expand
          xts
          (0, g (M.add_list xts env) e2)
          (fun x offset load ->
            if not (S.mem x s) then load else (* [XX] a little ad hoc optimization *)
            fletd(x, LdF(y, C(offset)), load))
          (fun x t offset load ->
            if not (S.mem x s) then load else (* [XX] a little ad hoc optimization *)
            Let((x, t), Ld(y, C(offset)), load)) in
        load
    )
  | Closure.Get(x, y) -> (* 配列の読み出し (caml2html: virtual_get) *)
        (
        try
            (
            let (addr, t) = List.assoc x !FixAddress.global_address in
            let addrid = Id.genid "v" in
           (match t with
            | Type.Int -> Let((addrid, Type.Int), Set(addr), Ans(Ld(addrid, V(y))))
            | Type.Float -> Let((addrid, Type.Int), Set(addr), Ans(LdF(addrid, V(y))))
            | _ -> assert false)
            )
        with
        | Not_found ->
            (match M.find x env with
            | Type.Array(Type.Unit) -> Ans(Nop)
            | Type.Array(Type.Float) ->
                  Ans(LdF(x, V(y)))
            | Type.Array(_) ->
                  Ans(Ld(x, V(y)))
            | _ -> assert false)
        )
  | Closure.Put(x, y, z) ->
        (
        try
            (
            let (addr, t) = List.assoc x !FixAddress.global_address in
            let addrid = Id.genid "v" in
            if List.mem_assoc z !FixAddress.global_address then
                (
                let (z_addr, z_t) = List.assoc z !FixAddress.global_address in
                let z_addrid = Id.genid "w" in
                Let((z_addrid, Type.Int), Set(z_addr),
                (match t with
                | Type.Int -> Let((addrid, Type.Int), Set(addr), Ans(St(z_addrid, addrid, V(y))))
                | Type.Float -> Let((addrid, Type.Int), Set(addr), Ans(StF(z_addrid, addrid, V(y))))
                | _ -> assert false))
                )
            else
           (match t with
            | Type.Int -> Let((addrid, Type.Int), Set(addr), Ans(St(z, addrid, V(y))))
            | Type.Float -> Let((addrid, Type.Int), Set(addr), Ans(StF(z, addrid, V(y))))
            | _ -> assert false)
            )
        with
        | Not_found ->
            (match M.find x env with
            | Type.Array(Type.Unit) -> Ans(Nop)
            | Type.Array(Type.Float) ->
                  Ans(StF(z, x, V(y)))
            | Type.Array(_) ->
                  Ans(St(z, x, V(y)))
            | _ -> assert false)
        )
  | Closure.ExtArray(Id.L(x)) -> Ans(SetL(Id.L("min_caml_" ^ x)))
  | Closure.FAbs(x) -> Ans(FAbs(x))
  | Closure.FSqr(x) -> Ans(FSqr(x))
  | Closure.Ftoi(x) -> Ans(Ftoi(x))
  | Closure.Itof(x) -> Ans(Itof(x))
  | Closure.Floor(x) -> Ans(Floor(x))

(* 関数の仮想マシンコード生成 (caml2html: virtual_h) *)
let h { Closure.name = (Id.L(x), t); Closure.args = yts; Closure.formal_fv = zts; Closure.body = e } =
  let (int, float) = separate yts in
  let (offset, load) =
    expand
      zts
      (1, g (M.add x t (M.add_list yts (M.add_list zts M.empty))) e)
      (fun z offset load -> fletd(z, LdF(x, C(offset)), load))
      (fun z t offset load -> Let((z, t), Ld(x, C(offset)), load)) in
  match t with
  | Type.Fun(_, t2) ->
      { name = Id.L(x); args = int; fargs = float; body = load; ret = t2 }
  | _ -> assert false

(* プログラム全体の仮想マシンコード生成 (caml2html: virtual_f) *)
let f (Closure.Prog(fundefs, e)) =
  Closure.closure_debug stdout (Closure.Prog(fundefs, e));
  data := [];
  let fundefs = List.map h fundefs in
  let e = g M.empty e in
  Prog(!data, fundefs, e)
