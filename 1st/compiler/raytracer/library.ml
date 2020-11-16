let rec fequal e1 e2 = (e1 = e2)
in
let rec fless e1 e2 = e1 < e2
in

let rec fispos x = x > 0.0
in
let rec fisneg x = x < 0.0
in
let rec fiszero x = (x = 0.0)
in

let rec xor x y = if x then not y else y
in

let rec fhalf x = x *. 0.5
in
let rec fsqr x = x *. x
in

(* fabs, fneg, fsqrtはハードウェア実装
let rec fabs x = x +. x
in
let rec fneg x = x +. x
in
let rec sqrt x = x +. x
in
*)

let rec floor x = x +. x
in

let rec int_of_float x = if x = 1.0 then 1 else 0
in

(* int -> float 中身同じbitを itofでハードウェア実装 *)
(* float -> int 中身同じbitを ftoiでハードウェア実装 *)

let rec float_of_int x = 1.0
in

let rec kernel_sin x =
    let x2 = x *. x in
    let x4 = x2 *. x2 in
    x
    -. 0.16666668 *. x *. x2
    +. 0.008332824 *. x *. x4
    -. 0.00019587841 *. x *. x2 *. x4
in

let rec kernel_cos x =
    let x2 = x *. x in
    let x4 = x2 *. x2 in
    1.0
    -. 0.5 *. x2
    +. 0.04166368 *. x4
    -. 0.0013695068 *. x2 *. x4
in

let rec kernel_atan x =
    let x2 = x *. x in
    let x4 = x2 *. x2 in
    let x8 = x4 *. x4 in
    x
    -. 0.3333333 *. x *. x2
    +. 0.2 *. x *. x4
    -. 0.142857142 *. x *. x2 *. x4
    +. 0.111111104 *. x *. x8
    -. 0.08976446 *. x *. x2 *. x8
    +. 0.060035485 *. x *. x4 *. x8
in

let rec reduction_2pi x =
    let pi = 3.14159265358979 in
    let pi2 = 2.0 *. pi in
    let rec f s t =
        if t < s then s else f (2.0 *. s) t in
    let p = f pi2 x in
    let rec g s t =
        if s < pi2 then s else
        if s >= t then g (s -. t) (t /. 2.0) else g s (t /. 2.0) in
    g x p
in

(* tenuki
let rec reduction_2pi x =
    let pi = 3.14159265358979 in
    let pi2 = 2.0 *. pi in
    let d = floor (x /. pi2) in
    x -. d *. pi2
in
*)

let rec cos x =
    let pi = 3.14159265358979 in
    let flag = true in
    let x = reduction_2pi (fabs x) in
    let flag = if x >= pi then not flag else flag in
    let x = if x >= pi then x -. pi else x in
    let flag = if x >= pi then not flag else flag in
    let x = if x >= pi /. 2.0 then pi -. x else x in
    let res = if x <= (pi /. 4.0) then kernel_cos x else kernel_sin (pi /. 2.0 -. x) in
    if flag then res else res *. (-.1.0)
in

let rec sin x =
    let pi = 3.14159265358979 in
    let flag = if fisneg x then false else true in
    let x = reduction_2pi (fabs x) in
    let flag = if x >= pi then not flag else flag in
    let x = if x >= pi then x -. pi else x in
    let x = if x >= pi /. 2.0 then pi -. x else x in
    let res = if x <= (pi /. 4.0) then kernel_sin x else kernel_cos (pi /. 2.0 -. x) in
    if flag then res else res *. (-.1.0)
in

let rec atan x =
    let pi = 3.14159265358979 in
    let flag = if fisneg x then false else true in
    let x = fabs x in
    if x < 0.4375 then kernel_atan x
    else (
        let res =
        if x < 2.4375 then pi /. 4.0 +. kernel_atan ((x -. 1.0) /. (x +. 1.0))
        else pi /. 2.0 -. kernel_atan (1.0 /. x) in
        if flag then res else res *. (-.1.0)
    )
in


let rec print_char x = ()
in
let rec print_int x = ()
in

let rec read_token in_token = ()
in

(*
let rec read_float  = ()
in
let rec read_int = ()
in
*)