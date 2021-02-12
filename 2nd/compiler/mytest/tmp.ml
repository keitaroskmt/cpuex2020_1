(**************** グローバル変数の宣言 ****************)


(* 間接光サンプリングに使う方向ベクトル *)
let dirvecs =
  let dummyf = create_array 0 0.0 in
  let dummyff = create_array 0 dummyf in
  let dummy_vs = create_array 0 (dummyf, dummyff) in
  create_array 5 dummy_vs in


let n_reflections = create_array 1 0 in
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

let rec vecset v x y z =
  v.(0) <- x;
  v.(1) <- y;
  v.(2) <- z
in

let rec d_vec d =
  let (m_vec, xm_const) = d in
  m_vec
in

let rec tan x =
  sin(x) /. cos(x)
in

let rec adjust_position h ratio =
  let l = sqrt(h*.h +. 0.1) in
  let tan_h = 1.0 /. l in
  let theta_h = atan tan_h in
   let tan_m = tan (theta_h *. ratio) in
  tan_m *. l
in

let rec calc_dirvec icount x y rx ry group_id index =
  if icount >= 5 then (
    let l = sqrt(fsqr x +. fsqr y +. 1.0) in
    let vx = x /. l in
    let vy = y /. l in
    let vz = 1.0 /. l in

    (* 立方体的に対称に分布させる *)
    let dgroup = dirvecs.(group_id) in
    vecset (d_vec dgroup.(index))    vx vy vz;
    vecset (d_vec dgroup.(index+40)) vx vz (fneg vy);
    vecset (d_vec dgroup.(index+80)) vz (fneg vx) (fneg vy);
    vecset (d_vec dgroup.(index+1)) (fneg vx) (fneg vy) (fneg vz);
    vecset (d_vec dgroup.(index+41)) (fneg vx) (fneg vz) vy;
    vecset (d_vec dgroup.(index+81)) (fneg vz) vx vy
   ) else
    let x2 = adjust_position y rx in
    calc_dirvec (icount + 1) x2 (adjust_position x2 ry) rx ry group_id index
in

calc_dirvec 0 0.0 0.0 0.0 0.0 0 0
