external  ftoi : float -> int32 = "ftoi"
external  itof : int32 -> float = "itof"

let rec fisneg x = x < 0.0

let rec fabs x =
	if x < 0.0 then -.x else x

let rec fneg x = -.x

(* 8388608.0で割ったときの商 *)
let rec int_of_float_sub1 x n =
    if x < 8388608.0 then n
    else int_of_float_sub1 (x -. 8388608.0) (n+1)

(* 8388608.0で割ったときのあまり *)
let rec int_of_float_sub2 x =
    if x < 8388608.0 then x
    else int_of_float_sub2 (x -. 8388608.0)

(* 8388608をm回たす *)
let rec int_of_float_sub3 m acm =
    if m = 0 then acm
    else int_of_float_sub3 (m-1) (8388608 + acm)

let rec myint_of_float x =
    let flag = x >= 0.0 in
    let x_abs = fabs x in
    let res =
    (
    if x_abs < 8388608.0 then Int32.sub (ftoi (x_abs +. 8388608.0)) 1258291200l
    else
        Int32.add (Int32.sub (ftoi (int_of_float_sub2 x_abs +. 8388608.0)) 1258291200l)
       (Int32.of_int (int_of_float_sub3 (int_of_float_sub1 x_abs 0) 0))
    ) in
    if flag then res else Int32.neg res


(* 8388608で割ったときの商 *)
let rec float_of_int_sub1 x n =
    if x < 8388608l then n
    else float_of_int_sub1 (Int32.sub x 8388608l) (n+1)

(* 8388608で割ったときのあまり *)
let rec float_of_int_sub2 x =
    if x < 8388608l then x
    else float_of_int_sub2 (Int32.sub x 8388608l)

(* 8388608.0をm回たす *)
let rec float_of_int_sub3 m acm =
    if m = 0 then acm
    else float_of_int_sub3 (m-1) (8388608.0 +. acm)

let rec myfloat_of_int x =
    let flag = x >= 0l in
    let x_abs = Int32.abs x in
    let res =
    (
    if x_abs < 8388608l then itof (Int32.add x_abs 1258291200l) -. 8388608.0
    else
       itof (Int32.add (float_of_int_sub2 x_abs) 1258291200l) -. 8388608.0
        +. float_of_int_sub3 (float_of_int_sub1 x_abs 0) 0.0
    ) in
    if flag then res else fneg res

let rec myfloor x =
    let flag = x >= 0.0 in
    let x_abs = fabs x in
    let res =
        if x_abs >= 8388608.0 then x_abs else myfloat_of_int (myint_of_float x_abs) in
    let res_ = 
        if flag then res else fneg res in
    if res_ > x then res_ -. 1.0 else res_ 


let rec kernel_cos x =
    let x2 = x *. x in
    let x4 = x2 *. x2 in
    1.0
    -. 0.5 *. x2
    +. 0.04166368 *. x4
    -. 0.0013695068 *. x2 *. x4

let rec kernel_sin x =
    let x2 = x *. x in
    let x4 = x2 *. x2 in
    x
    -. 0.16666668 *. x *. x2
    +. 0.008332824 *. x *. x4
    -. 0.00019587841 *. x *. x2 *. x4

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

(* tenuki
let rec reduction_2pi x =
    let pi = 3.14159265358979 in
    let pi2 = 2.0 *. pi in
    let d = floor (x /. pi2) in
    x -. d *. pi2
*)

let rec mycos x =
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

let rec mysin x =
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

let rec myatan x =
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

     
let rec int_of_float_test () = 
    let var = ref 0.0 in
    let max = ref 0 in
	Random.self_init ();
    (* -2^31 + 1 <= A <= 2^31 - 1 *)

    (* 0.0のとき *)
    Printf.printf "%f\n" !var;
    Printf.printf "Answer: %d\n" (int_of_float !var);
    Printf.printf "Result: %ld\n" (myint_of_float !var);	
    let diff = abs ((int_of_float !var) - Int32.to_int (myint_of_float !var)) in
    Printf.printf "diff  : %d\n" diff;
    max := if !max < diff then diff else !max;

	(* 正の数 *)
	let i = ref 0 in
    while !i <= 500000 do
		var := Random.float (Int32.to_float Int32.max_int -. 0.001);
        Printf.printf "%f\n" !var;
        Printf.printf "Answer: %d\n" (int_of_float !var);
        Printf.printf "Result: %ld\n" (myint_of_float !var);	
        let diff = abs ((int_of_float !var) - Int32.to_int (myint_of_float !var)) in

        Printf.printf "diff  : %d\n" diff;
        max := if !max < diff then diff else !max;
		i := !i + 1;
    done;

	(* 負の数 *)
	let i = ref 0 in
    while !i <= 500000 do
		var := Random.float (Int32.to_float Int32.max_int -. 0.001);
        var := fneg !var;
        Printf.printf "%f\n" !var;
        Printf.printf "Answer: %d\n" (int_of_float !var);
        Printf.printf "Result: %ld\n" (myint_of_float !var);	
        let diff = abs ((int_of_float !var) - Int32.to_int (myint_of_float !var)) in

        Printf.printf "diff  : %d\n" diff;
        max := if !max < diff then diff else !max;
		i := !i + 1;
    done;
    Printf.printf "int_of_float_error   : %d\n" !max

let rec float_of_int_test () = 
    let var = ref 0l in
    let max = ref 0.0 in
	Random.self_init ();
    (* 32bit整数全て *)

    (* 0のとき *)
    Printf.printf "%d\n" (Int32.to_int !var);
    Printf.printf "Answer: %f\n" (float_of_int (Int32.to_int !var));
    Printf.printf "Result: %f\n" (myfloat_of_int !var);	
    let diff = fabs (float_of_int (Int32.to_int !var) -. (myfloat_of_int !var)) in
    Printf.printf "diff  : %f\n" diff;
    max := if !max < diff then diff else !max;

    (* Int32.of_int を用いているので, 符号拡張されることもある *)
	let i = ref 0 in
    while !i <= 500000 do
		var := Int32.of_int (Random.int (1 lsl 30 - 1));
        var := Int32.shift_left !var 1;
        Printf.printf "%d\n" (Int32.to_int !var);
        Printf.printf "Answer: %f\n" (float_of_int (Int32.to_int !var));
        Printf.printf "Result: %f\n" (myfloat_of_int !var);	
		let diff = fabs (float_of_int (Int32.to_int !var) -. (myfloat_of_int !var)) in

        Printf.printf "diff  : %f\n" diff;
        max := if !max < diff then diff else !max;
		i := !i + 1;
    done;

	let i = ref 0 in
    while !i <= 500000 do
		var := Int32.of_int (-1 * (Random.int (1 lsl 30 - 1)));
        var := Int32.shift_left !var 1;
        Printf.printf "%d\n" (Int32.to_int !var);
        Printf.printf "Answer: %f\n" (float_of_int (Int32.to_int !var));
        Printf.printf "Result: %f\n" (myfloat_of_int !var);	
		let diff = fabs (float_of_int (Int32.to_int !var) -. (myfloat_of_int !var)) in

        Printf.printf "diff  : %f\n" diff;
        max := if !max < diff then diff else !max;
		i := !i + 1;
    done;

    Printf.printf "float_of_int_error   : %f\n" !max

let f_max = 8388608.0

let rec pow x n =
    if n = 0 then x else x *. (pow x (n-1))

let rec floor_test () = 
    let var = ref 0.0 in
    let max = ref 0.0 in
    (* let f_max = pow 2.0 127 in *)
	Random.self_init ();

	(* 正の数 *)
	let i = ref 0 in
    while !i <= 500000 do
		var := Random.float f_max;
        Printf.printf "%f\n" !var;
        Printf.printf "Answer: %f\n" (floor !var);
        Printf.printf "Result: %f\n" (myfloor !var);	
        let diff = fabs ((floor !var) -. (myfloor !var)) in

        Printf.printf "diff  : %f\n" diff;
        max := if !max < diff then diff else !max;
		i := !i + 1;
    done;

	(* 負の数 *)
	let i = ref 0 in
    while !i <= 500000 do
		var := Random.float f_max;
        var := fneg !var;
        Printf.printf "%f\n" !var;
        Printf.printf "Answer: %f\n" (floor !var);
        Printf.printf "Result: %f\n" (myfloor !var);	
        let diff = fabs ((floor !var) -. (myfloor !var)) in

        Printf.printf "diff  : %f\n" diff;
        max := if !max < diff then diff else !max;
		i := !i + 1;
    done;
    Printf.printf "floor_error   : %f\n" !max

let rec cos_test () = 
    let var = ref 0.0 in
    let max = ref 0.0 in
    let max_ulp = ref Int32.zero in

    (* 正の数 *)
    let i = ref 0 in
    while !i <= 500000 do
		var := Random.float f_max;
        Printf.printf "%f\n" !var;
        Printf.printf "Answer: %.10f\n" (cos !var);
        Printf.printf "Result: %.10f\n" (mycos !var);
        let diff = fabs (mycos !var -. (cos !var)) in
        let x = Int32.abs (Int32.sub (ftoi (mycos !var)) (ftoi (cos !var))) in
        Printf.printf "diff  : %.10f\n" diff;
        Printf.printf "ulp   : %ld\n" x;
        max := if !max < diff then diff else !max;
        max_ulp := if !max_ulp < x then x else !max_ulp;
		i := !i + 1;
    done;

    (* 負の数 *)
    let i = ref 0 in
    while !i <= 500000 do
		var := Random.float f_max;
        var := fneg !var;
        Printf.printf "%f\n" !var;
        Printf.printf "Answer: %.10f\n" (cos !var);
        Printf.printf "Result: %.10f\n" (mycos !var);
        let diff = fabs (mycos !var -. (cos !var)) in
        let x = Int32.abs (Int32.sub (ftoi (mycos !var)) (ftoi (cos !var))) in
        Printf.printf "diff  : %.10f\n" diff;
        Printf.printf "ulp   : %ld\n" x;
        max := if !max < diff then diff else !max;
        max_ulp := if !max_ulp < x then x else !max_ulp;
		i := !i + 1;
    done;
    Printf.printf "cos_max_error       : %f\n" !max;
    Printf.printf "cos_max_error_ulp   : %ld\n" !max_ulp

let rec sin_test () = 
    let var = ref 0.0 in
    let max = ref 0.0 in
    let max_ulp = ref Int32.zero in

    (* 正の数 *)
    let i = ref 0 in
    while !i <= 500000 do
		var := Random.float f_max;
        Printf.printf "%f\n" !var;
        Printf.printf "Answer: %.10f\n" (sin !var);
        Printf.printf "Result: %.10f\n" (mysin !var);
        let diff = fabs (mysin !var -. (sin !var)) in
        let x = Int32.abs (Int32.sub (ftoi (mysin !var)) (ftoi (sin !var))) in
        Printf.printf "diff  : %.10f\n" diff;
        Printf.printf "ulp   : %ld\n" x;
        max := if !max < diff then diff else !max;
        max_ulp := if !max_ulp < x then x else !max_ulp;
        if !max_ulp > 1000l then (
            Printf.printf "%ld\n" (ftoi (mysin !var));
         failwith "error";
        );
		i := !i + 1;
    done;

    (* 負の数 *)
    let i = ref 0 in
    while !i <= 500000 do
		var := Random.float f_max;
        var := fneg !var;
        Printf.printf "%f\n" !var;
        Printf.printf "Answer: %.10f\n" (sin !var);
        Printf.printf "Result: %.10f\n" (mysin !var);
        let diff = fabs (mysin !var -. (sin !var)) in
        let x = Int32.abs (Int32.sub (ftoi (mysin !var)) (ftoi (sin !var))) in
        Printf.printf "diff  : %.10f\n" diff;
        Printf.printf "ulp   : %ld\n" x;
        max := if !max < diff then diff else !max;
        max_ulp := if !max_ulp < x then x else !max_ulp;
		i := !i + 1;
    done;
    Printf.printf "sin_max_error       : %f\n" !max;
    Printf.printf "sin_max_error_ulp   : %ld\n" !max_ulp

let rec atan_test () = 
    let var = ref 0.0 in
    let max = ref 0.0 in
    let max_ulp = ref Int32.zero in

    (* 正の数 *)
    let i = ref 0 in
    while !i <= 500000 do
		var := Random.float f_max;
        Printf.printf "%f\n" !var;
        Printf.printf "Answer: %.10f\n" (atan !var);
        Printf.printf "Result: %.10f\n" (myatan !var);
        let diff = fabs (myatan !var -. (atan !var)) in
        let x = Int32.abs (Int32.sub (ftoi (myatan !var)) (ftoi (atan !var))) in
        Printf.printf "diff  : %.10f\n" diff;
        Printf.printf "ulp   : %ld\n" x;
        max := if !max < diff then diff else !max;
        max_ulp := if !max_ulp < x then x else !max_ulp;
		i := !i + 1;
    done;

    (* 負の数 *)
    let i = ref 0 in
    while !i <= 500000 do
		var := Random.float f_max;
        var := fneg !var;
        Printf.printf "%f\n" !var;
        Printf.printf "Answer: %.10f\n" (atan !var);
        Printf.printf "Result: %.10f\n" (myatan !var);
        let diff = fabs (myatan !var -. (atan !var)) in
        let x = Int32.abs (Int32.sub (ftoi (myatan !var)) (ftoi (atan !var))) in
        Printf.printf "diff  : %.10f\n" diff;
        Printf.printf "ulp   : %ld\n" x;
        max := if !max < diff then diff else !max;
        max_ulp := if !max_ulp < x then x else !max_ulp;
		i := !i + 1;
    done;
    Printf.printf "atan_max_error       : %f\n" !max;
    Printf.printf "atan_max_error_ulp   : %ld\n" !max_ulp
;;



float_of_int_test ();;
(*
int_of_float_test ();;
float_of_int_test ();;
floor_test ();;
cos_test ();;
sin_test ();;
atan_test ();;
*)
