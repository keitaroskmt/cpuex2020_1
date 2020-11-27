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

(* int -> float 中身同じbitを itofでハードウェア実装 *)
(* float -> int 中身同じbitを ftoiでハードウェア実装 *)

(* 8388608.0で割ったときの商 *)
let rec int_of_float_sub1 x n =
    if x < 8388608.0 then n
    else int_of_float_sub1 (x -. 8388608.0) (n+1)
in

(* 8388608.0で割ったときのあまり *)
let rec int_of_float_sub2 x =
    if x < 8388608.0 then x
    else int_of_float_sub2 (x -. 8388608.0)
in

(* 8388608をm回たす *)
let rec int_of_float_sub3 m acm =
    if m = 0 then acm
    else int_of_float_sub3 (m-1) (8388608 + acm)
in

let rec int_of_float x =
    let flag = x >= 0.0 in
    let x_abs = fabs x in
    let res =
    (
    if x_abs < 8388608.0 then ftoi (x_abs +. 8388608.0) - 1258291200
    else
        ftoi (int_of_float_sub2 x_abs +. 8388608.0) - 1258291200
        + int_of_float_sub3 (int_of_float_sub1 x_abs 0) 0
    ) in
    if flag then res else -res
in


(* 8388608で割ったときの商 *)
let rec float_of_int_sub1 x n =
    if x < 8388608 then n
    else float_of_int_sub1 (x - 8388608) (n+1)
in

(* 8388608で割ったときのあまり *)
let rec float_of_int_sub2 x =
    if x < 8388608 then x
    else float_of_int_sub2 (x - 8388608)
in

(* 8388608.0をm回たす *)
let rec float_of_int_sub3 m acm =
    if m = 0 then acm
    else float_of_int_sub3 (m-1) (8388608.0 +. acm)
in

let rec float_of_int x =
    let flag = x > 0 in
    let x_abs = if x < 0 then -x else x in
    let res =
    (
    if x_abs < 8388608 then itof (x_abs + 1258291200) -. 8388608.0
    else
        itof (float_of_int_sub2 x_abs + 1258291200) -. 8388608.0
        +. float_of_int_sub3 (float_of_int_sub1 x_abs 0) 0.0
    ) in
    if flag then res else fneg res
in

let rec floor x =
    let flag = x >= 0.0 in
    let x_abs = fabs x in
    let res =
        if x_abs >= 8388608.0 then x_abs else float_of_int (int_of_float x_abs) in
    let res_ =
        if flag then res else fneg res in
    if res_ > x then res_ -. 1.0 else res_
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
    let rec f s t = (* while (x >= p) *)
        if s < t then t else f s (2.0 *. t) in
    let p = f x pi2 in
    let rec g s t = (* while (x >= pi2) *)
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

(* 10で割った商 *)
let rec print_int_sub1 x n =
    if x < 10 then n else print_int_sub1 (x - 10) (n + 1)
in

(* 10で割ったあまり *)
let rec print_int_sub2 x =
    if x < 10 then x else print_int_sub2 (x - 10)
in

let rec print_int x =
    let d1 = print_int_sub1 x 0 in
    let r1 = print_int_sub2 x in
    print_char (48 + r1);
    if d1 > 0 then
    (
        let d2 = print_int_sub1 d1 0 in
        let r2 = print_int_sub2 d1 in
        print_char (48 + r2);
        if d2 > 0 then
        (
            let r3 = print_int_sub2 d2 in
            print_char (48 + r3)
        )
        else ()
    )
    else ()
in

(* 本体 *)
(*MINCAML*) let rec dbl f = f +. f in
(*NOMINCAML let dbl f = 2. *. f in *)
(*NOMINCAML for y = 0 to 399 do *)
(*MINCAML*) let rec yloop y =
(*MINCAML*)   if y >= 10 then () else
(*NOMINCAML   for x = 0 to 399 do *)
(*MINCAML*)   let rec xloop x y =
(*MINCAML*)     if x >= 10 then () else
                let cr = dbl (float_of_int x) /. 10.0 -. 1.5 in
                let ci = dbl (float_of_int y) /. 10.0 -. 1.0 in
                let rec iloop i zr zi zr2 zi2 cr ci =
                  if i = 0 then print_int 1 else
                  let tr = zr2 -. zi2 +. cr in
                  let ti = dbl zr *. zi +. ci in
                  let zr = tr in
                  let zi = ti in
                  let zr2 = zr *. zr in
                  let zi2 = zi *. zi in
                  if zr2 +. zi2 > 2.0 *. 2.0 then print_int 0 else
                  iloop (i - 1) zr zi zr2 zi2 cr ci in
                iloop 1000 0.0 0.0 0.0 0.0 cr ci;
(*
                let i = ref 1000 in
                let zr = ref 0.0 in
                let zi = ref 0.0 in
                let zr2 = ref 0.0 in
                let zi2 = ref 0.0 in
                while (if !i = 0 then (print_int 1; false) else
                       let tr = !zr2 -. !zi2 +. cr in
                       let ti = dbl !zr *. !zi +. ci in
                       zr := tr;
                       zi := ti;
                       zr2 := !zr *. !zr;
                       zi2 := !zi *. !zi;
                       if !zr2 +. !zi2 > 2.0 *. 2.0 then (print_int 0; false) else
                       true) do
                  i := !i - 1
                done;
*)
(*MINCAML*)     xloop (x + 1) y in
(*MINCAML*)   xloop 0 y;
(*NOMINCAML   done; *)
(*MINCAML*)   yloop (y + 1) in
(*MINCAML*) yloop 0
(*NOMINCAML done; *)
