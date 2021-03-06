open KNormal
(* *)

let hp_init = ref 0

let global_address = ref []
let global_value = ref []


let memi x env =
  try (match M.find x env with Int(_) -> true | _ -> false)
  with Not_found -> false
let memf x env =
  try (match M.find x env with Float(_) -> true | _ -> false)
  with Not_found -> false
let memt x env =
  try (match M.find x env with Tuple(_) -> true | _ -> false)
  with Not_found -> false

let findi x env = (match M.find x env with Int(i) -> i | _ -> raise Not_found)
let findf x env = (match M.find x env with Float(d) -> d | _ -> raise Not_found)
let findt x env = (match M.find x env with Tuple(ys) -> ys | _ -> raise Not_found)


(* 関数内部には入らない *)
let rec g env = function
    | Let((x, t), e1, e2) ->
        (
        match e1 with
        | ExtFunApp("create_array", [x1; x2]) ->
            if memi x1 env then
                let Int(size) = M.find x1 env in
                let addr = !hp_init in
                hp_init := !hp_init + size;
                global_address := (x, (addr, Type.Int)) :: !global_address;
                let z = Id.genid "a" in
                Let((z, Type.Int), Int(addr),
                    Let((x, t), ExtFunApp("create_extarray", [x1; x2; z]), g (M.add x (Int(addr)) env) e2))
            else
                Let((x, t), e1, g (M.add x e1 env) e2)
        | ExtFunApp("create_float_array", [x1; x2]) ->
            if memi x1 env then
                let Int(size) = M.find x1 env in
                let addr = !hp_init in
                hp_init := !hp_init + size;
                global_address := (x, (addr, Type.Float)) :: !global_address;
                let z = Id.genid "a" in
                Let((z, Type.Int), Int(addr),
                    Let((x, t), ExtFunApp("create_float_extarray", [x1; x2; z]), g (M.add x (Int(addr)) env) e2))
            else
                Let((x, t), e1, g (M.add x e1 env) e2)
        | _ -> Let((x, t), e1, g (M.add x e1 env) e2)
        )
    | e -> e

let global_debug () =
    List.iter (fun (x, (addr, ty)) -> Format.eprintf "%s -> %d\n" x addr) !global_address

let f e = g M.empty e