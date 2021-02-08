open Asm

let float_data = ref []

let findi x env =
    (match M.find x env with
    | Set(i) -> i
    | _ -> raise Not_found)
let findf x env = 
    (match M.find x env with
    | SetF(l) -> 
        let (_, f) = List.find (fun (l', _) -> l = l') !float_data in f
    | _ -> raise Not_found)

let add_label f =
    try 
        let (l, _) = List.find (fun (_, d) -> d = f) !float_data in l
    with
    | Not_found ->
    (
        let l' = Id.L(Id.genid "l") in
        float_data := (l', f) :: !float_data;
        l'
    )

let rec g env = function 
    | Ans(exp) -> Ans(g' env exp)
    | Let((x, t), exp, e) -> 
        (match exp with
        | Set(i) -> Let((x, t), g' env exp, g (M.add x (Set(i)) env) e)
        | SetF(l) -> Let((x, t), g' env exp, g (M.add x (SetF(l)) env) e)
        | _ -> Let((x, t), g' env exp, g env e))

and g' env = function
    | Neg(x) when M.mem x env -> Set(-(findi x env))
    | Add(x, y') when M.mem x env ->
        Printf.fprintf stdout "constfoldasm Add\n";
        (match y' with
        | V(y) -> if M.mem y env then Set((findi x env) + (findi y env)) else Add(x, y')
        | C(i) -> Set((findi x env) + i))
    | Sub(x, y') when M.mem x env ->
        Printf.fprintf stdout "constfoldasm Sub\n";
        (match y' with
        | V(y) -> if M.mem y env then Set((findi x env) - (findi y env)) else Sub(x, y')
        | C(i) -> Set((findi x env) - i))
    | Mul(x, y') when M.mem x env ->
        Printf.fprintf stdout "constfoldasm Mul\n";
        (match y' with
        | V(y) -> if M.mem y env then Set((findi x env) * (findi y env)) else Mul(x, y')
        | C(i) -> Set((findi x env) * i))
    | Div(x, y') when M.mem x env ->
        Printf.fprintf stdout "constfoldasm Div\n";
        (match y' with
        | V(y) -> if M.mem y env then Set((findi x env) / (findi y env)) else Div(x, y')
        | C(i) -> Set((findi x env) / i))
    | SLL(x, y') when M.mem x env ->
        Printf.fprintf stdout "constfoldasm SLL\n";
        (match y' with
        | V(y) -> if M.mem y env then Set((findi x env) lsl (findi y env)) else SLL(x, y')
        | C(i) -> Set((findi x env) lsl i))
    | Ld(x, y') when M.mem x env ->
        Printf.fprintf stdout "constfoldasm Ld\n";
        (match y' with
        | V(y) -> if M.mem y env then Ld(reg_zero, C((findi x env) + (findi y env))) else Ld(x, y')
        | C(i) -> Ld(reg_zero, C((findi x env) + i)))
    | St(x, y, z') when M.mem y env ->
        Printf.fprintf stdout "constfoldasm St\n";
        (match z' with
        | V(z) -> if M.mem z env then St(x, reg_zero, C((findi y env) + (findi z env))) else St(x, y, z')
        | C(i) -> St(x, reg_zero, C((findi y env) + i)))
    | FNegD(x) when M.mem x env -> 
        Printf.fprintf stdout "constfoldasm FNegD\n";
        let f = -.(findf x env) in
        let l = add_label f in
        SetF(l)
    | FAddD(x, y) when M.mem x env && M.mem y env ->
        Printf.fprintf stdout "constfoldasm FAddD\n";
        let f = (findf x env) +. (findf y env) in
        let l = add_label f in
        SetF(l)
    | FSubD(x, y) when M.mem x env && M.mem y env ->
        Printf.fprintf stdout "constfoldasm FSubD\n";
        let f = (findf x env) -. (findf y env) in
        let l = add_label f in
        SetF(l)
    | FMulD(x, y) when M.mem x env && M.mem y env ->
        Printf.fprintf stdout "constfoldasm FMulD\n";
        let f = (findf x env) *. (findf y env) in
        let l = add_label f in
        SetF(l)
    | FDivD(x, y) when M.mem x env && M.mem y env ->
        Printf.fprintf stdout "constfoldasm FDivD\n";
        let f = (findf x env) /. (findf y env) in
        let l = add_label f in
        SetF(l)
    | FAbs(x) when M.mem x env -> 
        Printf.fprintf stdout "constfoldasm FAbs\n";
        let f = abs_float (findf x env) in
        let l = add_label f in
        SetF(l)
    | FSqr(x) when M.mem x env -> 
        Printf.fprintf stdout "constfoldasm FSqr\n";
        let f = sqrt (findf x env) in
        let l = add_label f in
        SetF(l)
    | Ftoi(x) when M.mem x env -> Set(int_of_float (findf x env))
    | Itof(x) when M.mem x env -> 
        Printf.fprintf stdout "constfoldasm Itof\n";
        let f = float_of_int (findi x env) in
        let l = add_label f in
        SetF(l)
    | LdF(x, y') when M.mem x env ->
        Printf.fprintf stdout "constfoldasm LdF\n";
        (match y' with
        | V(y) -> if M.mem y env then LdF(reg_zero, C((findi x env) + (findi y env))) else LdF(x, y')
        | C(i) -> LdF(reg_zero, C((findi x env) + i)))
    | StF(x, y, z') when M.mem y env ->
        Printf.fprintf stdout "constfoldasm StF\n";
        (match z' with
        | V(z) -> if M.mem z env then StF(x, reg_zero, C((findi y env) + (findi z env))) else StF(x, y, z')
        | C(i) -> StF(x, reg_zero, C((findi y env) + i)))
    | IfEq(x, V(y), e1, e2) when M.mem x env && M.mem y env ->
        Printf.fprintf stdout "constfoldasm IfEq\n";
        if findi x env = findi y env then
            IfEq(reg_zero, C(0), (g env e1), Ans(Nop))
        else
            IfEq(reg_zero, C(0), (g env e2), Ans(Nop))
    | IfEq(x, C(i), e1, e2) when M.mem x env ->
        Printf.fprintf stdout "constfoldasm IfEq\n";
        if findi x env = i then
            IfEq(reg_zero, C(0), (g env e1), Ans(Nop))
        else
            IfEq(reg_zero, C(0), (g env e2), Ans(Nop))
    | IfEq(x, y', e1, e2) -> 
        IfEq(x, y', g env e1, g env e2)
    | IfLE(x, V(y), e1, e2) when M.mem x env && M.mem y env ->
        Printf.fprintf stdout "constfoldasm IfLE\n";
        if findi x env <= findi y env then
            IfEq(reg_zero, C(0), (g env e1), Ans(Nop))
        else
            IfEq(reg_zero, C(0), (g env e2), Ans(Nop))
    | IfLE(x, C(i), e1, e2) when M.mem x env ->
        Printf.fprintf stdout "constfoldasm IfLE\n";
        if findi x env <= i then
            IfEq(reg_zero, C(0), (g env e1), Ans(Nop))
        else
            IfEq(reg_zero, C(0), (g env e2), Ans(Nop))
    | IfLE(x, y', e1, e2) -> 
        IfLE(x, y', g env e1, g env e2)
    | IfGE(x, V(y), e1, e2) when M.mem x env && M.mem y env ->
        Printf.fprintf stdout "constfoldasm IfGE\n";
        if findi x env >= findi y env then
            IfEq(reg_zero, C(0), (g env e1), Ans(Nop))
        else
            IfEq(reg_zero, C(0), (g env e2), Ans(Nop))
    | IfGE(x, C(i), e1, e2) when M.mem x env ->
        Printf.fprintf stdout "constfoldasm IfGE\n";
        if findi x env >= i then
            IfEq(reg_zero, C(0), (g env e1), Ans(Nop))
        else
            IfEq(reg_zero, C(0), (g env e2), Ans(Nop))
    | IfGE(x, y', e1, e2) -> 
        IfGE(x, y', g env e1, g env e2)
    | IfFEq(x, y, e1, e2) when M.mem x env && M.mem y env ->
        Printf.fprintf stdout "constfoldasm IfFEq\n";
        if findf x env = findf y env then
            IfEq(reg_zero, C(0), (g env e1), Ans(Nop))
        else
            IfEq(reg_zero, C(0), (g env e2), Ans(Nop))
    | IfFEq(x, y, e1, e2) -> 
        IfFEq(x, y, g env e1, g env e2)
    | IfFLE(x, y, e1, e2) when M.mem x env && M.mem y env ->
        Printf.fprintf stdout "constfoldasm IfFLE\n";
        if findf x env <= findf y env then
            IfEq(reg_zero, C(0), (g env e1), Ans(Nop))
        else
            IfEq(reg_zero, C(0), (g env e2), Ans(Nop))
    | IfFLE(x, y, e1, e2) -> 
        IfFLE(x, y, g env e1, g env e2)
    (* floorは仕様が違う *)
    | e -> e


let h { name = l; args = xs; fargs = ys; body = e; ret = t } = 
    { name = l; args = xs; fargs = ys; body = g M.empty e; ret = t }

let f (Prog(data, fundefs, e)) = 
    float_data := data;
    let fundefs' = List.map h fundefs in
    let e' = g M.empty e in
    Prog(!float_data, fundefs', e')