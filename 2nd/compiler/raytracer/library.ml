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

let rec reduction_2pi_sub1 s t =  (* while (x >= p) *)
    if s < t then t else reduction_2pi_sub1 s (2.0 *. t) in

let rec reduction_2pi_sub2 s t pi2 = (* while (x >= pi2) *)
    if s < pi2 then s else  
    if s >= t then reduction_2pi_sub2 (s -. t) (t /. 2.0) pi2 else reduction_2pi_sub2 s (t /. 2.0) pi2 in

let rec reduction_2pi x =
    let pi = 3.14159265358979 in
    let pi2 = 2.0 *. pi in
    let p = reduction_2pi_sub1 x pi2 in
    reduction_2pi_sub2 x p pi2
in

(*
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
    (* if (x >= pi) *)
    let flag = if x >= pi then not flag else flag in
    let x = if x >= pi then x -. pi else x in
    (* if (x >= pi / 2) *)
    let flag = if x >= pi /. 2.0 then not flag else flag in
    let x = if x >= pi /. 2.0 then pi -. x else x in
    let res = if x <= (pi /. 4.0) then kernel_cos x else kernel_sin (pi /. 2.0 -. x) in
    if flag then res else fneg res
in

let rec sin x =
    let pi = 3.14159265358979 in
    let flag = x >= 0.0 in
    let x = reduction_2pi (fabs x) in
    (* if (x >= pi) *)
    let flag = if x >= pi then not flag else flag in
    let x = if x >= pi then x -. pi else x in
    (* if (x >= pi / 2 *)
    let x = if x >= pi /. 2.0 then pi -. x else x in
    let res = if x <= (pi /. 4.0) then kernel_sin x else kernel_cos (pi /. 2.0 -. x) in
    if flag then res else fneg res
in

let rec atan x =
    let pi = 3.14159265358979 in
    let flag = x >= 0.0 in
    let x_abs = fabs x in
    if x_abs < 0.4375 then kernel_atan x
    else (
        let res =
        if x_abs < 2.4375 then pi /. 4.0 +. kernel_atan ((x_abs -. 1.0) /. (x_abs +. 1.0))
        else pi /. 2.0 -. kernel_atan (1.0 /. x_abs) in
        if flag then res else fneg res
    )
in

(* ループ展開してみる *)
(* 10で割った商 *)
let rec print_int_sub1 x n =
    if x < 10 then n else
    (
        if x < 20 then (n + 1) else
        (
            if x < 30 then (n + 2) else
            (
                if x < 40 then (n + 3) else
                    print_int_sub1 (x - 40) (n + 4)
            )
        )
    )
in

(* 10で割ったあまり *)
let rec print_int_sub2 x =
    if x < 10 then x else 
    (
        if x < 20 then x - 10 else
        (
            if x < 30 then x - 20 else
            (
                if x < 40 then x - 30 else
                    print_int_sub2 (x - 40)
            )
        )
    )
in

let rec print_int x =
    let d1 = print_int_sub1 x 0 in
    let r1 = print_int_sub2 x in
    if d1 > 0 then
    (
        let d2 = print_int_sub1 d1 0 in
        let r2 = print_int_sub2 d1 in
        if d2 > 0 then
        (
            let r3 = print_int_sub2 d2 in
            print_char (48 + r3);
            print_char (48 + r2);
            print_char (48 + r1)
        )
        else (
            print_char (48 + r2);
            print_char (48 + r1)
        )
    )
    else (
        print_char (48 + r1)
    )
in
