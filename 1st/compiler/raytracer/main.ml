(**************** グローバル変数の宣言 ****************)

(* オブジェクトの個数 *)
let n_objects = create_array 1 0 in

(* オブジェクトのデータを入れるベクトル（最大60個）*)
let objects = 
  let dummy = create_array 0 0.0 in
  create_array 60 (0, 0, 0, 0, dummy, dummy, false, dummy, dummy, dummy, dummy) in

(* Screen の中心座標 *)
let screen = create_array 3 0.0 in
(* 視点の座標 *)
let viewpoint = create_array 3 0.0 in
(* 光源方向ベクトル (単位ベクトル) *)
let light = create_array 3 0.0 in
(* 鏡面ハイライト強度 (標準=255) *)
let beam = create_array 1 255.0 in
(* AND ネットワークを保持 *)
let and_net = create_array 50 (create_array 1 (-1)) in
(* OR ネットワークを保持 *)
let or_net = create_array 1 (create_array 1 (and_net.(0))) in

(* 以下、交差判定ルーチンの返り値格納用 *)
(* solver の交点 の t の値 *)
let solver_dist = create_array 1 0.0 in
(* 交点の直方体表面での方向 *)
let intsec_rectside = create_array 1 0 in
(* 発見した交点の最小の t *)
let tmin = create_array 1 (1000000000.0) in
(* 交点の座標 *)
let intersection_point = create_array 3 0.0 in
(* 衝突したオブジェクト番号 *)
let intersected_object_id = create_array 1 0 in
(* 法線ベクトル *)
let nvector = create_array 3 0.0 in
(* 交点の色 *)
let texture_color = create_array 3 0.0 in

(* 計算中の間接受光強度を保持 *)
let diffuse_ray = create_array 3 0.0 in
(* スクリーン上の点の明るさ *)
let rgb = create_array 3 0.0 in

(* 画像サイズ *)
let image_size = create_array 2 0 in
(* 画像の中心 = 画像サイズの半分 *)
let image_center = create_array 2 0 in
(* 3次元上のピクセル間隔 *)
let scan_pitch = create_array 1 0.0 in

(* judge_intersectionに与える光線始点 *)
let startp = create_array 3 0.0 in
(* judge_intersection_fastに与える光線始点 *)
let startp_fast = create_array 3 0.0 in

(* 画面上のx,y,z軸の3次元空間上の方向 *)
let screenx_dir = create_array 3 0.0 in
let screeny_dir = create_array 3 0.0 in
let screenz_dir = create_array 3 0.0 in

(* 直接光追跡で使う光方向ベクトル *)
let ptrace_dirvec  = create_array 3 0.0 in

(* 間接光サンプリングに使う方向ベクトル *)
let dirvecs =
  let dummyf = create_array 0 0.0 in
  let dummyff = create_array 0 dummyf in
  let dummy_vs = create_array 0 (dummyf, dummyff) in
  create_array 5 dummy_vs in

(* 光源光の前処理済み方向ベクトル *)
let light_dirvec =
  let dummyf2 = create_array 0 0.0 in
  let v3 = create_array 3 0.0 in
  let consts = create_array 60 dummyf2 in
  (v3, consts) in

(* 鏡平面の反射情報 *)
let reflections =
  let dummyf3 = create_array 0 0.0 in
  let dummyff3 = create_array 0 dummyf3 in
  let dummydv = (dummyf3, dummyff3) in
  create_array 180 (0, dummydv, 0.0) in

(* reflectionsの有効な要素数 *) 

let n_reflections = create_array 1 0 in
let rec fequal e1 e2 = let x = e1 +. e2 in true
in
let rec fless e1 e2 = let x = e1 +. e2 in true
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

let rec fabs x = x +. x
in
let rec fneg x = x +. x
in
let rec sqrt x = x +. x
in
let rec floor x = x +. x
in

let rec int_of_float x = if x = 1.0 then 1 else 0
in

(* int -> float ���Ʊ��bit�� itof�ǥϡ��ɥ��������� *)
(* float -> int ���Ʊ��bit�� ftoi�ǥϡ��ɥ��������� *)

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
*)(****************************************************************)
(*                                                              *)
(* Ray Tracing Program for (Mini) Objective Caml                *)
(*                                                              *)
(* Original Program by Ryoji Kawamichi                          *)
(* Arranged for Chez Scheme by Motohico Nanano                  *)
(* Arranged for Objective Caml by Y. Oiwa and E. Sumii          *)
(* Added diffuse ray tracer by Y.Ssugawara                      *)
(*                                                              *)
(****************************************************************)

(*NOMINCAML open MiniMLRuntime;;*)
(*NOMINCAML open Globals;;*)
(*MINCAML*) (* let true = 1 in *)
(*MINCAML*) (* let false = 0 in *)
(*MINCAML*) (* let rec xor x y = if x then not y else y in *)

(******************************************************************************
   ユーティリティー
 *****************************************************************************)

(* 符号 *)
let rec sgn x =
  if fiszero x then 0.0
  else if fispos x then 1.0
  else -1.0
in

(* 条件付き符号反転 *)
let rec fneg_cond cond x =
  if cond then x else fneg x
in

(* (x+y) mod 5 *)
let rec add_mod5 x y =
  let sum = x + y in
  if sum >= 5 then sum - 5 else sum
in

(******************************************************************************
   ベクトル操作のためのプリミティブ
 *****************************************************************************)

(*
let rec vecprint v =
  (o_param_abc m) inFormat.eprintf "(%f %f %f)" v.(0) v.(1) v.(2)
in
*)

(* 値代入 *)
let rec vecset v x y z =
  v.(0) <- x;
  v.(1) <- y;
  v.(2) <- z
in

(* 同じ値で埋める *)
let rec vecfill v elem =
  v.(0) <- elem;
  v.(1) <- elem;
  v.(2) <- elem
in

(* 零初期化 *)
let rec vecbzero v =
  vecfill v 0.0
in

(* コピー *)
let rec veccpy dest src =
  dest.(0) <- src.(0);
  dest.(1) <- src.(1);
  dest.(2) <- src.(2)
in

(* 距離の自乗 *)
let rec vecdist2 p q =
  fsqr (p.(0) -. q.(0)) +. fsqr (p.(1) -. q.(1)) +. fsqr (p.(2) -. q.(2))
in

(* 正規化 ゼロ割りチェック無し *)
let rec vecunit v =
  let il = 1.0 /. sqrt(fsqr v.(0) +. fsqr v.(1) +. fsqr v.(2)) in
  v.(0) <- v.(0) *. il;
  v.(1) <- v.(1) *. il;
  v.(2) <- v.(2) *. il
in

(* 符号付正規化 ゼロ割チェック*)
let rec vecunit_sgn v inv =
  let l = sqrt (fsqr v.(0) +. fsqr v.(1) +. fsqr v.(2)) in
  let il = if fiszero l then 1.0 else if inv then -1.0 /. l else 1.0 /. l in
  v.(0) <- v.(0) *. il;
  v.(1) <- v.(1) *. il;
  v.(2) <- v.(2) *. il
in

(* 内積 *)
let rec veciprod v w =
  v.(0) *. w.(0) +. v.(1) *. w.(1) +. v.(2) *. w.(2)
in

(* 内積 引数形式が異なる版 *)
let rec veciprod2 v w0 w1 w2 =
  v.(0) *. w0 +. v.(1) *. w1 +. v.(2) *. w2
in

(* 別なベクトルの定数倍を加算 *)
let rec vecaccum dest scale v =
  dest.(0) <- dest.(0) +. scale *. v.(0);
  dest.(1) <- dest.(1) +. scale *. v.(1);
  dest.(2) <- dest.(2) +. scale *. v.(2)
in

(* ベクトルの和 *)
let rec vecadd dest v =
  dest.(0) <- dest.(0) +. v.(0);
  dest.(1) <- dest.(1) +. v.(1);
  dest.(2) <- dest.(2) +. v.(2)
in

(* ベクトル要素同士の積 *)
let rec vecmul dest v =
  dest.(0) <- dest.(0) *. v.(0);
  dest.(1) <- dest.(1) *. v.(1);
  dest.(2) <- dest.(2) *. v.(2)
in

(* ベクトルを定数倍 *)
let rec vecscale dest scale =
  dest.(0) <- dest.(0) *. scale;
  dest.(1) <- dest.(1) *. scale;
  dest.(2) <- dest.(2) *. scale
in

(* 他の２ベクトルの要素同士の積を計算し加算 *)
let rec vecaccumv dest v w =
  dest.(0) <- dest.(0) +. v.(0) *. w.(0);
  dest.(1) <- dest.(1) +. v.(1) *. w.(1);
  dest.(2) <- dest.(2) +. v.(2) *. w.(2)
in

(******************************************************************************
   オブジェクトデータ構造へのアクセス関数
 *****************************************************************************)

(* テクスチャ種 0:無し 1:市松模様 2:縞模様 3:同心円模様 4:斑点*)
let rec o_texturetype m =
  let (m_tex, xm_shape, xm_surface, xm_isrot,
       xm_abc, xm_xyz,
       xm_invert, xm_surfparams, xm_color,
       xm_rot123, xm_ctbl) = m
  in
  m_tex
in

(* 物体の形状 0:直方体 1:平面 2:二次曲面 3:円錐 *)
let rec o_form m =
  let (xm_tex, m_shape, xm_surface, xm_isrot,
       xm_abc, xm_xyz,
       xm_invert, xm_surfparams, xm_color,
       xm_rot123, xm_ctbl) = m
  in
  m_shape
in

(* 反射特性 0:拡散反射のみ 1:拡散＋非完全鏡面反射 2:拡散＋完全鏡面反射 *)
let rec o_reflectiontype m =
  let (xm_tex, xm_shape, m_surface, xm_isrot,
       xm_abc, xm_xyz,
       xm_invert, xm_surfparams, xm_color,
       xm_rot123, xm_ctbl) = m
  in
  m_surface
in

(* 曲面の外側が真かどうかのフラグ true:外側が真 false:内側が真 *)
let rec o_isinvert m =
  let (xm_tex, xm_shape, xm_surface, xm_isrot,
       xm_abc, xm_xyz,
       m_invert, xm_surfparams, xm_color,
       xm_rot123, xm_ctbl) = m in
  m_invert
in

(* 回転の有無 true:回転あり false:回転無し 2次曲面と円錐のみ有効 *)
let rec o_isrot m =
  let (xm_tex, xm_shape, xm_surface, m_isrot,
       xm_abc, xm_xyz,
       xm_invert, xm_surfparams, xm_color,
       xm_rot123, xm_ctbl) = m in
  m_isrot
in

(* 物体形状の aパラメータ *)
let rec o_param_a m =
  let (xm_tex, xm_shape, xm_surface, xm_isrot,
       m_abc, xm_xyz,
       xm_invert, xm_surfparams, xm_color,
       xm_rot123, xm_ctbl) = m
  in
  m_abc.(0)
in

(* 物体形状の bパラメータ *)
let rec o_param_b m =
  let (xm_tex, xm_shape, xm_surface, xm_isrot,
       m_abc, xm_xyz,
       xm_invert, xm_surfparams, xm_color,
       xm_rot123, xm_ctbl) = m
  in
  m_abc.(1)
in

(* 物体形状の cパラメータ *)
let rec o_param_c m =
  let (xm_tex, xm_shape, xm_surface, xm_isrot,
       m_abc, xm_xyz,
       xm_invert, xm_surfparams, xm_color,
       xm_rot123, xm_ctbl) = m
  in
  m_abc.(2)
in

(* 物体形状の abcパラメータ *)
let rec o_param_abc m =
  let (xm_tex, xm_shape, xm_surface, xm_isrot,
       m_abc, xm_xyz,
       xm_invert, xm_surfparams, xm_color,
       xm_rot123, xm_ctbl) = m
  in
  m_abc
in

(* 物体の中心x座標 *)
let rec o_param_x m =
  let (xm_tex, xm_shape, xm_surface, xm_isrot,
       xm_abc, m_xyz,
       xm_invert, xm_surfparams, xm_color,
       xm_rot123, xm_ctbl) = m
  in
  m_xyz.(0)
in

(* 物体の中心y座標 *)
let rec o_param_y m =
  let (xm_tex, xm_shape, xm_surface, xm_isrot,
       xm_abc, m_xyz,
       xm_invert, xm_surfparams, xm_color,
       xm_rot123, xm_ctbl) = m
  in
  m_xyz.(1)
in

(* 物体の中心z座標 *)
let rec o_param_z m =
  let (xm_tex, xm_shape, xm_surface, xm_isrot,
       xm_abc, m_xyz,
       xm_invert, xm_surfparams, xm_color,
       xm_rot123, xm_ctbl) = m
  in
  m_xyz.(2)
in

(* 物体の拡散反射率 0.0 -- 1.0 *)
let rec o_diffuse m =
  let (xm_tex, xm_shape, xm_surface, xm_isrot,
       xm_abc, xm_xyz,
       xm_invert, m_surfparams, xm_color,
       xm_rot123, xm_ctbl) = m
  in
  m_surfparams.(0)
in

(* 物体の不完全鏡面反射率 0.0 -- 1.0 *)
let rec o_hilight m =
  let (xm_tex, xm_shape, xm_surface, xm_isrot,
       xm_abc, xm_xyz,
       xm_invert, m_surfparams, xm_color,
       xm_rot123, xm_ctbl) = m
  in
  m_surfparams.(1)
in

(* 物体色の R成分 *)
let rec o_color_red m =
  let (xm_tex, xm_shape, m_surface, xm_isrot,
       xm_abc, xm_xyz,
       xm_invert, xm_surfparams, m_color,
       xm_rot123, xm_ctbl) = m
  in
  m_color.(0)
in

(* 物体色の G成分 *)
let rec o_color_green m =
  let (xm_tex, xm_shape, m_surface, xm_isrot,
       xm_abc, xm_xyz,
       xm_invert, xm_surfparams, m_color,
       xm_rot123, xm_ctbl) = m
  in
  m_color.(1)
in

(* 物体色の B成分 *)
let rec o_color_blue m =
  let (xm_tex, xm_shape, m_surface, xm_isrot,
       xm_abc, xm_xyz,
       xm_invert, xm_surfparams, m_color,
       xm_rot123, xm_ctbl) = m
  in
  m_color.(2)
in

(* 物体の曲面方程式の y*z項の係数 2次曲面と円錐で、回転がある場合のみ *)
let rec o_param_r1 m =
  let (xm_tex, xm_shape, xm_surface, xm_isrot,
       xm_abc, xm_xyz,
       xm_invert, xm_surfparams, xm_color,
       m_rot123, xm_ctbl) = m
  in
  m_rot123.(0)
in

(* 物体の曲面方程式の x*z項の係数 2次曲面と円錐で、回転がある場合のみ *)
let rec o_param_r2 m =
  let (xm_tex, xm_shape, xm_surface, xm_isrot,
       xm_abc, xm_xyz,
       xm_invert, xm_surfparams, xm_color,
       m_rot123, xm_ctbl) = m
  in
  m_rot123.(1)
in

(* 物体の曲面方程式の x*y項の係数 2次曲面と円錐で、回転がある場合のみ *)
let rec o_param_r3 m =
  let (xm_tex, xm_shape, xm_surface, xm_isrot,
       xm_abc, xm_xyz,
       xm_invert, xm_surfparams, xm_color,
       m_rot123, xm_ctbl) = m
  in
  m_rot123.(2)
in

(* 光線の発射点をあらかじめ計算した場合の定数テーブル *)
(*
   0 -- 2 番目の要素: 物体の固有座標系に平行移動した光線始点
   3番目の要素:
   直方体→無効
   平面→ abcベクトルとの内積
   二次曲面、円錐→二次方程式の定数項
 *)
let rec o_param_ctbl m =
  let (xm_tex, xm_shape, xm_surface, xm_isrot,
       xm_abc, xm_xyz,
       xm_invert, xm_surfparams, xm_color,
       xm_rot123, m_ctbl) = m
  in
  m_ctbl
in

(******************************************************************************
   Pixelデータのメンバアクセス関数群
 *****************************************************************************)

(* 直接光追跡で得られたピクセルのRGB値 *)
let rec p_rgb pixel =
  let (m_rgb, xm_isect_ps, xm_sids, xm_cdif, xm_engy,
       xm_r20p, xm_gid, xm_nvectors ) = pixel in
  m_rgb
in

(* 飛ばした光が物体と衝突した点の配列 *)
let rec p_intersection_points pixel =
  let (xm_rgb, m_isect_ps, xm_sids, xm_cdif, xm_engy,
       xm_r20p, xm_gid, xm_nvectors ) = pixel in
  m_isect_ps
in

(* 飛ばした光が衝突した物体面番号の配列 *)
(* 物体面番号は オブジェクト番号 * 4 + (solverの返り値) *)
let rec p_surface_ids pixel =
  let (xm_rgb, xm_isect_ps, m_sids, xm_cdif, xm_engy,
       xm_r20p, xm_gid, xm_nvectors ) = pixel in
  m_sids
in

(* 間接受光を計算するか否かのフラグ *)
let rec p_calc_diffuse pixel =
  let (xm_rgb, xm_isect_ps, xm_sids, m_cdif, xm_engy,
       xm_r20p, xm_gid, xm_nvectors ) = pixel in
  m_cdif
in

(* 衝突点の間接受光エネルギーがピクセル輝度に与える寄与の大きさ *)
let rec p_energy pixel =
  let (xm_rgb, xm_isect_ps, xm_sids, xm_cdif, m_engy,
       xm_r20p, xm_gid, xm_nvectors ) = pixel in
  m_engy
in

(* 衝突点の間接受光エネルギーを光線本数を1/5に間引きして計算した値 *)
let rec p_received_ray_20percent pixel =
  let (xm_rgb, xm_isect_ps, xm_sids, xm_cdif, xm_engy,
       m_r20p, xm_gid, xm_nvectors ) = pixel in
  m_r20p
in

(* このピクセルのグループ ID *)
(*
   スクリーン座標 (x,y)の点のグループIDを (x+2*y) mod 5 と定める
   結果、下図のような分け方になり、各点は上下左右4点と別なグループになる
   0 1 2 3 4 0 1 2 3 4
   2 3 4 0 1 2 3 4 0 1
   4 0 1 2 3 4 0 1 2 3
   1 2 3 4 0 1 2 3 4 0
*)

let rec p_group_id pixel =
  let (xm_rgb, xm_isect_ps, xm_sids, xm_cdif, xm_engy,
       xm_r20p, m_gid, xm_nvectors ) = pixel in
  m_gid.(0)
in

(* グループIDをセットするアクセス関数 *)
let rec p_set_group_id pixel id =
  let (xm_rgb, xm_isect_ps, xm_sids, xm_cdif, xm_engy,
       xm_r20p, m_gid, xm_nvectors ) = pixel in
  m_gid.(0) <- id
in

(* 各衝突点における法線ベクトル *)
let rec p_nvectors pixel =
  let (xm_rgb, xm_isect_ps, xm_sids, xm_cdif, xm_engy,
       xm_r20p, xm_gid, m_nvectors ) = pixel in
  m_nvectors
in

(******************************************************************************
   前処理済み方向ベクトルのメンバアクセス関数
 *****************************************************************************)

(* ベクトル *)
let rec d_vec d =
  let (m_vec, xm_const) = d in
  m_vec
in

(* 各オブジェクトに対して作った solver 高速化用定数テーブル *)
let rec d_const d =
  let (dm_vec, m_const) = d in
  m_const
in

(******************************************************************************
   平面鏡面体の反射情報
 *****************************************************************************)

(* 面番号 オブジェクト番号*4 + (solverの返り値) *)
let rec r_surface_id r =
  let (m_sid, xm_dvec, xm_br) = r in
  m_sid
in

(* 光源光の反射方向ベクトル(光と逆向き) *)
let rec r_dvec r =
  let (xm_sid, m_dvec, xm_br) = r in
  m_dvec
in

(* 物体の反射率 *)
let rec r_bright r =
  let (xm_sid, xm_dvec, m_br) = r in
  m_br
in

(******************************************************************************
   データ読み込みの関数群
 *****************************************************************************)

(* ラジアン *)
let rec rad x =
  x *. 0.017453293
in

(**** 環境データの読み込み ****)
let rec read_screen_settings _ =

  (* スクリーン中心の座標 *)
  screen.(0) <- read_float ();
  screen.(1) <- read_float ();
  screen.(2) <- read_float ();
  (* 回転角 *)
  let v1 = rad (read_float ()) in
  let cos_v1 = cos v1 in
  let sin_v1 = sin v1 in
  let v2 = rad (read_float ()) in
  let cos_v2 = cos v2 in
  let sin_v2 = sin v2 in
  (* スクリーン面の奥行き方向のベクトル 注視点からの距離200をかける *)
  screenz_dir.(0) <- cos_v1 *. sin_v2 *. 200.0;
  screenz_dir.(1) <- sin_v1 *. -200.0;
  screenz_dir.(2) <- cos_v1 *. cos_v2 *. 200.0;
  (* スクリーン面X方向のベクトル *)
  screenx_dir.(0) <- cos_v2;
  screenx_dir.(1) <- 0.0;
  screenx_dir.(2) <- fneg sin_v2;
  (* スクリーン面Y方向のベクトル *)
  screeny_dir.(0) <- fneg sin_v1 *. sin_v2;
  screeny_dir.(1) <- fneg cos_v1;
  screeny_dir.(2) <- fneg sin_v1 *. cos_v2;
  (* 視点位置ベクトル(絶対座標) *)
  viewpoint.(0) <- screen.(0) -. screenz_dir.(0);
  viewpoint.(1) <- screen.(1) -. screenz_dir.(1);
  viewpoint.(2) <- screen.(2) -. screenz_dir.(2)

in

(* 光源情報の読み込み *)
let rec read_light _ =

  let nl = read_int () in

  (* 光線関係 *)
  let l1 = rad (read_float ()) in
  let sl1 = sin l1 in
  light.(1) <- fneg sl1;
  let l2 = rad (read_float ()) in
  let cl1 = cos l1 in
  let sl2 = sin l2 in
  light.(0) <- cl1 *. sl2;
  let cl2 = cos l2 in
  light.(2) <- cl1 *. cl2;
  beam.(0) <- read_float ()

in

(* 元の2次形式行列 A に両側から回転行列 R をかけた行列 R^t * A * R を作る *)
(* R は x,y,z軸に関する回転行列の積 R(z)R(y)R(x) *)
(* スクリーン座標のため、y軸回転のみ角度の符号が逆 *)

let rec rotate_quadratic_matrix abc rot =
  (* 回転行列の積 R(z)R(y)R(x) を計算する *)
  let cos_x = cos rot.(0) in
  let sin_x = sin rot.(0) in
  let cos_y = cos rot.(1) in
  let sin_y = sin rot.(1) in
  let cos_z = cos rot.(2) in
  let sin_z = sin rot.(2) in

  let m00 = cos_y *. cos_z in
  let m01 = sin_x *. sin_y *. cos_z -. cos_x *. sin_z in
  let m02 = cos_x *. sin_y *. cos_z +. sin_x *. sin_z in

  let m10 = cos_y *. sin_z in
  let m11 = sin_x *. sin_y *. sin_z +. cos_x *. cos_z in
  let m12 = cos_x *. sin_y *. sin_z -. sin_x *. cos_z in

  let m20 = fneg sin_y in
  let m21 = sin_x *. cos_y in
  let m22 = cos_x *. cos_y in

  (* a, b, cの元の値をバックアップ *)
  let ao = abc.(0) in
  let bo = abc.(1) in
  let co = abc.(2) in

  (* R^t * A * R を計算 *)

  (* X^2, Y^2, Z^2成分 *)
  abc.(0) <- ao *. fsqr m00 +. bo *. fsqr m10 +. co *. fsqr m20;
  abc.(1) <- ao *. fsqr m01 +. bo *. fsqr m11 +. co *. fsqr m21;
  abc.(2) <- ao *. fsqr m02 +. bo *. fsqr m12 +. co *. fsqr m22;

  (* 回転によって生じた XY, YZ, ZX成分 *)
  rot.(0) <- 2.0 *. (ao *. m01 *. m02 +. bo *. m11 *. m12 +. co *. m21 *. m22);
  rot.(1) <- 2.0 *. (ao *. m00 *. m02 +. bo *. m10 *. m12 +. co *. m20 *. m22);
  rot.(2) <- 2.0 *. (ao *. m00 *. m01 +. bo *. m10 *. m11 +. co *. m20 *. m21)

in

(**** オブジェクト1つのデータの読み込み ****)
let rec read_nth_object n =

  let texture = read_int () in
  if texture <> -1 then
    (
      let form = read_int () in
      let refltype = read_int () in
      let isrot_p = read_int () in

      let abc = create_array 3 0.0 in
      abc.(0) <- read_float ();
      abc.(1) <- read_float (); (* 5 *)
      abc.(2) <- read_float ();

      let xyz = create_array 3 0.0 in
      xyz.(0) <- read_float ();
      xyz.(1) <- read_float ();
      xyz.(2) <- read_float ();

      let m_invert = fisneg (read_float ()) in (* 10 *)

      let reflparam = create_array 2 0.0 in
      reflparam.(0) <- read_float (); (* diffuse *)
      reflparam.(1) <- read_float (); (* hilight *)

      let color = create_array 3 0.0 in
      color.(0) <- read_float ();
      color.(1) <- read_float ();
      color.(2) <- read_float (); (* 15 *)

      let rotation = create_array 3 0.0 in
      if isrot_p <> 0 then
	(
	 rotation.(0) <- rad (read_float ());
	 rotation.(1) <- rad (read_float ());
	 rotation.(2) <- rad (read_float ())
	)
      else ();

      (* パラメータの正規化 *)

      (* 注: 下記正規化 (form = 2) 参照 *)
      let m_invert2 = if form = 2 then true else m_invert in
      let ctbl = create_array 4 0.0 in
      (* ここからあとは abc と rotation しか操作しない。*)
      let obj =
	(texture, form, refltype, isrot_p,
	 abc, xyz, (* x-z *)
	 m_invert2,
	 reflparam, (* reflection paramater *)
	 color, (* color *)
	 rotation, (* rotation *)
         ctbl (* constant table *)
	) in
      objects.(n) <- obj;

      if form = 3 then
	(
	  (* 2次曲面: X,Y,Z サイズから2次形式行列の対角成分へ *)
	 let a = abc.(0) in
	 abc.(0) <- if fiszero a then 0.0 else sgn a /. fsqr a; (* X^2 成分 *)
	 let b = abc.(1) in
	 abc.(1) <- if fiszero b then 0.0 else sgn b /. fsqr b; (* Y^2 成分 *)
	 let c = abc.(2) in
	 abc.(2) <- if fiszero c then 0.0 else sgn c /. fsqr c  (* Z^2 成分 *)
	)
      else if form = 2 then
	(* 平面: 法線ベクトルを正規化, 極性を負に統一 *)
	vecunit_sgn abc (not m_invert)
      else ();

      (* 2次形式行列に回転変換を施す *)
      if isrot_p <> 0 then
	rotate_quadratic_matrix abc rotation
      else ();

      true
     )
  else
    false (* データの終了 *)
in

(**** 物体データ全体の読み込み ****)
let rec read_object n =
  if n < 60 then
    if read_nth_object n then
      read_object (n + 1)
    else
      n_objects.(0) <- n
  else () (* failwith "too many objects" *)
in

let rec read_all_object _ =
  read_object 0
in

(**** AND, OR ネットワークの読み込み ****)

(* ネットワーク1つを読み込みベクトルにして返す *)
let rec read_net_item length =
  let item = read_int () in
  if item = -1 then create_array (length + 1) (-1)
  else
    let v = read_net_item (length + 1) in
    (v.(length) <- item; v)
in

let rec read_or_network length =
  let net = read_net_item 0 in
  if net.(0) = -1 then
    create_array (length + 1) net
  else
    let v = read_or_network (length + 1) in
    (v.(length) <- net; v)
in

let rec read_and_network n =
  let net = read_net_item 0 in
  if net.(0) = -1 then ()
  else (
    and_net.(n) <- net;
    read_and_network (n + 1)
  )
in

let rec read_parameter _ =
  (
   read_screen_settings();
   read_light();
   read_all_object ();
   read_and_network 0;
   or_net.(0) <- read_or_network 0
  )
in

(******************************************************************************
   直線とオブジェクトの交点を求める関数群
 *****************************************************************************)

(* solver :
   オブジェクト (の index) と、ベクトル L, P を受けとり、
   直線 Lt + P と、オブジェクトとの交点を求める。
   交点がない場合は 0 を、交点がある場合はそれ以外を返す。
   この返り値は nvector で交点の法線ベクトルを求める際に必要。
   (直方体の場合)

   交点の座標は t の値として solver_dist に格納される。
*)

(* 直方体の指定された面に衝突するかどうか判定する *)
(* i0 : 面に垂直な軸のindex X:0, Y:1, Z:2         i2,i3は他の2軸のindex *)
let rec solver_rect_surface m dirvec b0 b1 b2 i0 i1 i2  =
  if fiszero dirvec.(i0) then false else
  let abc = o_param_abc m in
  let d = fneg_cond (xor (o_isinvert m) (fisneg dirvec.(i0))) abc.(i0) in

  let d2 = (d -. b0) /. dirvec.(i0) in
  if fless (fabs (d2 *. dirvec.(i1) +. b1)) abc.(i1) then
    if fless (fabs (d2 *. dirvec.(i2) +. b2)) abc.(i2) then
      (solver_dist.(0) <- d2; true)
    else false
  else false
in


(***** 直方体オブジェクトの場合 ****)
let rec solver_rect m dirvec b0 b1 b2 =
  if      solver_rect_surface m dirvec b0 b1 b2 0 1 2 then 1   (* YZ 平面 *)
  else if solver_rect_surface m dirvec b1 b2 b0 1 2 0 then 2   (* ZX 平面 *)
  else if solver_rect_surface m dirvec b2 b0 b1 2 0 1 then 3   (* XY 平面 *)
  else                                                     0
in


(* 平面オブジェクトの場合 *)
let rec solver_surface m dirvec b0 b1 b2 =
  (* 点と平面の符号つき距離 *)
  (* 平面は極性が負に統一されている *)
  let abc = o_param_abc m in
  let d = veciprod dirvec abc in
  if fispos d then (
    solver_dist.(0) <- fneg (veciprod2 abc b0 b1 b2) /. d;
    1
   ) else 0
in


(* 3変数2次形式 v^t A v を計算 *)
(* 回転が無い場合は対角部分のみ計算すれば良い *)
let rec quadratic m v0 v1 v2 =
  let diag_part =
    fsqr v0 *. o_param_a m +. fsqr v1 *. o_param_b m +. fsqr v2 *. o_param_c m
  in
  if o_isrot m = 0 then
    diag_part
  else
    diag_part
      +. v1 *. v2 *. o_param_r1 m
      +. v2 *. v0 *. o_param_r2 m
      +. v0 *. v1 *. o_param_r3 m
in

(* 3変数双1次形式 v^t A w を計算 *)
(* 回転が無い場合は A の対角部分のみ計算すれば良い *)
let rec bilinear m v0 v1 v2 w0 w1 w2 =
  let diag_part =
    v0 *. w0 *. o_param_a m
      +. v1 *. w1 *. o_param_b m
      +. v2 *. w2 *. o_param_c m
  in
  if o_isrot m = 0 then
    diag_part
  else
    diag_part +. fhalf
      ((v2 *. w1 +. v1 *. w2) *. o_param_r1 m
	 +. (v0 *. w2 +. v2 *. w0) *. o_param_r2 m
	 +. (v0 *. w1 +. v1 *. w0) *. o_param_r3 m)
in


(* 2次曲面または円錐の場合 *)
(* 2次形式で表現された曲面 x^t A x - (0 か 1) = 0 と 直線 base + dirvec*t の
   交点を求める。曲線の方程式に x = base + dirvec*t を代入してtを求める。
   つまり (base + dirvec*t)^t A (base + dirvec*t) - (0 か 1) = 0、
   展開すると (dirvec^t A dirvec)*t^2 + 2*(dirvec^t A base)*t  +
   (base^t A base) - (0か1) = 0 、よってtに関する2次方程式を解けば良い。*)

let rec solver_second m dirvec b0 b1 b2 =

  (* 解の公式 (-b' ± sqrt(b'^2 - a*c)) / a  を使用(b' = b/2) *)
  (* a = dirvec^t A dirvec *)
  let aa = quadratic m dirvec.(0) dirvec.(1) dirvec.(2) in

  if fiszero aa then
    0 (* 正確にはこの場合も1次方程式の解があるが、無視しても通常は大丈夫 *)
  else (

    (* b' = b/2 = dirvec^t A base   *)
    let bb = bilinear m dirvec.(0) dirvec.(1) dirvec.(2) b0 b1 b2 in
    (* c = base^t A base  - (0か1)  *)
    let cc0 = quadratic m b0 b1 b2 in
    let cc = if o_form m = 3 then cc0 -. 1.0 else cc0 in
    (* 判別式 *)
    let d = fsqr bb -. aa *. cc in

    if fispos d then (
      let sd = sqrt d in
      let t1 = if o_isinvert m then sd else fneg sd in
      (solver_dist.(0) <- (t1 -. bb) /.  aa; 1)
     )
    else
      0
   )
in

(**** solver のメインルーチン ****)
let rec solver index dirvec org =
  let m = objects.(index) in
  (* 直線の始点を物体の基準位置に合わせて平行移動 *)
  let b0 =  org.(0) -. o_param_x m in
  let b1 =  org.(1) -. o_param_y m in
  let b2 =  org.(2) -. o_param_z m in
  let m_shape = o_form m in
  (* 物体の種類に応じた補助関数を呼ぶ *)
  if m_shape = 1 then       solver_rect m dirvec b0 b1 b2    (* 直方体 *)
  else if m_shape = 2 then  solver_surface m dirvec b0 b1 b2 (* 平面 *)
  else                      solver_second m dirvec b0 b1 b2  (* 2次曲面/円錐 *)
in

(******************************************************************************
   solverのテーブル使用高速版
 *****************************************************************************)
(*
   通常版solver と同様、直線 start + t * dirvec と物体の交点を t の値として返す
   t の値は solver_distに格納

   solver_fast は、直線の方向ベクトル dirvec について作ったテーブルを使用
   内部的に solver_rect_fast, solver_surface_fast, solver_second_fastを呼ぶ

   solver_fast2 は、dirvecと直線の始点 start それぞれに作ったテーブルを使用
   直方体についてはstartのテーブルによる高速化はできないので、solver_fastと
   同じく solver_rect_fastを内部的に呼ぶ。それ以外の物体については
   solver_surface_fast2またはsolver_second_fast2を内部的に呼ぶ

   変数dconstは方向ベクトル、sconstは始点に関するテーブル
*)

(***** solver_rectのdirvecテーブル使用高速版 ******)
let rec solver_rect_fast m v dconst b0 b1 b2 =
  let d0 = (dconst.(0) -. b0) *. dconst.(1) in
  if  (* YZ平面との衝突判定 *)
    if fless (fabs (d0 *. v.(1) +. b1)) (o_param_b m) then
      if fless (fabs (d0 *. v.(2) +. b2)) (o_param_c m) then
	not (fiszero dconst.(1))
      else false
    else false
  then
    (solver_dist.(0) <- d0; 1)
  else let d1 = (dconst.(2) -. b1) *. dconst.(3) in
  if  (* ZX平面との衝突判定 *)
    if fless (fabs (d1 *. v.(0) +. b0)) (o_param_a m) then
      if fless (fabs (d1 *. v.(2) +. b2)) (o_param_c m) then
	not (fiszero dconst.(3))
      else false
    else false
  then
    (solver_dist.(0) <- d1; 2)
  else let d2 = (dconst.(4) -. b2) *. dconst.(5) in
  if  (* XY平面との衝突判定 *)
    if fless (fabs (d2 *. v.(0) +. b0)) (o_param_a m) then
      if fless (fabs (d2 *. v.(1) +. b1)) (o_param_b m) then
	not (fiszero dconst.(5))
      else false
    else false
  then
    (solver_dist.(0) <- d2; 3)
  else
    0
in

(**** solver_surfaceのdirvecテーブル使用高速版 ******)
let rec solver_surface_fast m dconst b0 b1 b2 =
  if fisneg dconst.(0) then (
    solver_dist.(0) <-
      dconst.(1) *. b0 +. dconst.(2) *. b1 +. dconst.(3) *. b2;
    1
   ) else 0
in

(**** solver_second のdirvecテーブル使用高速版 ******)
let rec solver_second_fast m dconst b0 b1 b2 =

  let aa = dconst.(0) in
  if fiszero aa then
    0
  else
    let neg_bb = dconst.(1) *. b0 +. dconst.(2) *. b1 +. dconst.(3) *. b2 in
    let cc0 = quadratic m b0 b1 b2 in
    let cc = if o_form m = 3 then cc0 -. 1.0 else cc0 in
    let d = (fsqr neg_bb) -. aa *. cc in
    if fispos d then (
      if o_isinvert m then
	solver_dist.(0) <- (neg_bb +. sqrt d) *. dconst.(4)
      else
	solver_dist.(0) <- (neg_bb -. sqrt d) *. dconst.(4);
      1)
    else 0
in

(**** solver のdirvecテーブル使用高速版 *******)
let rec solver_fast index dirvec org =
  let m = objects.(index) in
  let b0 = org.(0) -. o_param_x m in
  let b1 = org.(1) -. o_param_y m in
  let b2 = org.(2) -. o_param_z m in
  let dconsts = d_const dirvec in
  let dconst = dconsts.(index) in
  let m_shape = o_form m in
  if m_shape = 1 then
    solver_rect_fast m (d_vec dirvec) dconst b0 b1 b2
  else if m_shape = 2 then
    solver_surface_fast m dconst b0 b1 b2
  else
    solver_second_fast m dconst b0 b1 b2
in




(* solver_surfaceのdirvec+startテーブル使用高速版 *)
let rec solver_surface_fast2 m dconst sconst b0 b1 b2 =
  if fisneg dconst.(0) then (
    solver_dist.(0) <- dconst.(0) *. sconst.(3);
    1
   ) else 0
in

(* solver_secondのdirvec+startテーブル使用高速版 *)
let rec solver_second_fast2 m dconst sconst b0 b1 b2 =

  let aa = dconst.(0) in
  if fiszero aa then
    0
  else
    let neg_bb = dconst.(1) *. b0 +. dconst.(2) *. b1 +. dconst.(3) *. b2 in
    let cc = sconst.(3) in
    let d = (fsqr neg_bb) -. aa *. cc in
    if fispos d then (
      if o_isinvert m then
	solver_dist.(0) <- (neg_bb +. sqrt d) *. dconst.(4)
      else
	solver_dist.(0) <- (neg_bb -. sqrt d) *. dconst.(4);
      1)
    else 0
in

(* solverの、dirvec+startテーブル使用高速版 *)
let rec solver_fast2 index dirvec =
  let m = objects.(index) in
  let sconst = o_param_ctbl m in
  let b0 = sconst.(0) in
  let b1 = sconst.(1) in
  let b2 = sconst.(2) in
  let dconsts = d_const dirvec in
  let dconst = dconsts.(index) in
  let m_shape = o_form m in
  if m_shape = 1 then
    solver_rect_fast m (d_vec dirvec) dconst b0 b1 b2
  else if m_shape = 2 then
    solver_surface_fast2 m dconst sconst b0 b1 b2
  else
    solver_second_fast2 m dconst sconst b0 b1 b2
in

(******************************************************************************
   方向ベクトルの定数テーブルを計算する関数群
 *****************************************************************************)

(* 直方体オブジェクトに対する前処理 *)
let rec setup_rect_table vec m =
  let const = create_array 6 0.0 in

  if fiszero vec.(0) then (* YZ平面 *)
    const.(1) <- 0.0
  else (
    (* 面の X 座標 *)
    const.(0) <- fneg_cond (xor (o_isinvert m) (fisneg vec.(0))) (o_param_a m);
    (* 方向ベクトルを何倍すればX方向に1進むか *)
    const.(1) <- 1.0 /. vec.(0)
  );
  if fiszero vec.(1) then (* ZX平面 : YZ平面と同様*)
    const.(3) <- 0.0
  else (
    const.(2) <- fneg_cond (xor (o_isinvert m) (fisneg vec.(1))) (o_param_b m);
    const.(3) <- 1.0 /. vec.(1)
  );
  if fiszero vec.(2) then (* XY平面 : YZ平面と同様*)
    const.(5) <- 0.0
  else (
    const.(4) <- fneg_cond (xor (o_isinvert m) (fisneg vec.(2))) (o_param_c m);
    const.(5) <- 1.0 /. vec.(2)
  );
  const
in

(* 平面オブジェクトに対する前処理 *)
let rec setup_surface_table vec m =
  let const = create_array 4 0.0 in
  let d =
    vec.(0) *. o_param_a m +. vec.(1) *. o_param_b m +. vec.(2) *. o_param_c m
  in
  if fispos d then (
    (* 方向ベクトルを何倍すれば平面の垂直方向に 1 進むか *)
    const.(0) <- -1.0 /. d;
    (* ある点の平面からの距離が方向ベクトル何個分かを導く3次一形式の係数 *)
    const.(1) <- fneg (o_param_a m /. d);
    const.(2) <- fneg (o_param_b m /. d);
    const.(3) <- fneg (o_param_c m /. d)
   ) else
    const.(0) <- 0.0;
  const

in

(* 2次曲面に対する前処理 *)
let rec setup_second_table v m =
  let const = create_array 5 0.0 in

  let aa = quadratic m v.(0) v.(1) v.(2) in
  let c1 = fneg (v.(0) *. o_param_a m) in
  let c2 = fneg (v.(1) *. o_param_b m) in
  let c3 = fneg (v.(2) *. o_param_c m) in

  const.(0) <- aa;  (* 2次方程式の a 係数 *)

  (* b' = dirvec^t A start だが、(dirvec^t A)の部分を計算しconst.(1:3)に格納。
     b' を求めるにはこのベクトルとstartの内積を取れば良い。符号は逆にする *)
  if o_isrot m <> 0 then (
    const.(1) <- c1 -. fhalf (v.(2) *. o_param_r2 m +. v.(1) *. o_param_r3 m);
    const.(2) <- c2 -. fhalf (v.(2) *. o_param_r1 m +. v.(0) *. o_param_r3 m);
    const.(3) <- c3 -. fhalf (v.(1) *. o_param_r1 m +. v.(0) *. o_param_r2 m)
   ) else (
    const.(1) <- c1;
    const.(2) <- c2;
    const.(3) <- c3
   );
  if not (fiszero aa) then
    const.(4) <- 1.0 /. aa (* a係数の逆数を求め、解の公式での割り算を消去 *)
  else ();
  const

in

(* 各オブジェクトについて補助関数を呼んでテーブルを作る *)
let rec iter_setup_dirvec_constants dirvec index =
  if index >= 0 then (
    let m = objects.(index) in
    let dconst = (d_const dirvec) in
    let v = d_vec dirvec in
    let m_shape = o_form m in
    if m_shape = 1 then  (* rect *)
      dconst.(index) <- setup_rect_table v m
    else if m_shape = 2 then  (* surface *)
      dconst.(index) <- setup_surface_table v m
    else                      (* second *)
      dconst.(index) <- setup_second_table v m;

    iter_setup_dirvec_constants dirvec (index - 1)
  ) else ()
in

let rec setup_dirvec_constants dirvec =
  iter_setup_dirvec_constants dirvec (n_objects.(0) - 1)
in

(******************************************************************************
   直線の始点に関するテーブルを各オブジェクトに対して計算する関数群
 *****************************************************************************)

let rec setup_startp_constants p index =
  if index >= 0 then (
    let obj = objects.(index) in
    let sconst = o_param_ctbl obj in
    let m_shape = o_form obj in
    sconst.(0) <- p.(0) -. o_param_x obj;
    sconst.(1) <- p.(1) -. o_param_y obj;
    sconst.(2) <- p.(2) -. o_param_z obj;
    if m_shape = 2 then (* surface *)
      sconst.(3) <-
	veciprod2 (o_param_abc obj) sconst.(0) sconst.(1) sconst.(2)
    else if m_shape > 2 then (* second *)
      let cc0 = quadratic obj sconst.(0) sconst.(1) sconst.(2) in
      sconst.(3) <- if m_shape = 3 then cc0 -. 1.0 else cc0
    else ();
    setup_startp_constants p (index - 1)
   ) else ()
in

let rec setup_startp p =
  veccpy startp_fast p;
  setup_startp_constants p (n_objects.(0) - 1)
in

(******************************************************************************
   与えられた点がオブジェクトに含まれるかどうかを判定する関数群
 *****************************************************************************)

(**** 点 q がオブジェクト m の外部かどうかを判定する ****)

(* 直方体 *)
let rec is_rect_outside m p0 p1 p2 =
  if
    if (fless (fabs p0) (o_param_a m)) then
      if (fless (fabs p1) (o_param_b m)) then
	fless (fabs p2) (o_param_c m)
      else false
    else false
  then o_isinvert m else not (o_isinvert m)
in

(* 平面 *)
let rec is_plane_outside m p0 p1 p2 =
  let w = veciprod2 (o_param_abc m) p0 p1 p2 in
  not (xor (o_isinvert m) (fisneg w))
in

(* 2次曲面 *)
let rec is_second_outside m p0 p1 p2 =
  let w = quadratic m p0 p1 p2 in
  let w2 = if o_form m = 3 then w -. 1.0 else w in
  not (xor (o_isinvert m) (fisneg w2))
in

(* 物体の中心座標に平行移動した上で、適切な補助関数を呼ぶ *)
let rec is_outside m q0 q1 q2 =
  let p0 = q0 -. o_param_x m in
  let p1 = q1 -. o_param_y m in
  let p2 = q2 -. o_param_z m in
  let m_shape = o_form m in
  if m_shape = 1 then
    is_rect_outside m p0 p1 p2
  else if m_shape = 2 then
    is_plane_outside m p0 p1 p2
  else
    is_second_outside m p0 p1 p2
in

(**** 点 q が AND ネットワーク iand の内部にあるかどうかを判定 ****)
let rec check_all_inside ofs iand q0 q1 q2 =
  let head = iand.(ofs) in
  if head = -1 then
    true
  else (
    if is_outside objects.(head) q0 q1 q2 then
      false
    else
      check_all_inside (ofs + 1) iand q0 q1 q2
   )
in

(******************************************************************************
   衝突点が他の物体の影に入っているか否かを判定する関数群
 *****************************************************************************)

(* 点 intersection_point から、光線ベクトルの方向に辿り、   *)
(* 物体にぶつかる (=影にはいっている) か否かを判定する。*)

(**** AND ネットワーク iand の影内かどうかの判定 ****)
let rec shadow_check_and_group iand_ofs and_group =
  if and_group.(iand_ofs) = -1 then
    false
  else
    let obj = and_group.(iand_ofs) in
    let t0 = solver_fast obj light_dirvec intersection_point in
    let t0p = solver_dist.(0) in
    if (if t0 <> 0 then fless t0p (-0.2) else false) then
      (* Q: 交点の候補。実際にすべてのオブジェクトに *)
      (* 入っているかどうかを調べる。*)
      let t = t0p +. 0.01 in
      let q0 = light.(0) *. t +. intersection_point.(0) in
      let q1 = light.(1) *. t +. intersection_point.(1) in
      let q2 = light.(2) *. t +. intersection_point.(2) in
      if check_all_inside 0 and_group q0 q1 q2 then
	true
      else
	shadow_check_and_group (iand_ofs + 1) and_group
	  (* 次のオブジェクトから候補点を探す *)
    else
      (* 交点がない場合: 極性が正(内側が真)の場合、    *)
      (* AND ネットの共通部分はその内部に含まれるため、*)
      (* 交点はないことは自明。探索を打ち切る。        *)
      if o_isinvert (objects.(obj)) then
	shadow_check_and_group (iand_ofs + 1) and_group
      else
	false
in

(**** OR グループ or_group の影かどうかの判定 ****)
let rec shadow_check_one_or_group ofs or_group =
  let head = or_group.(ofs) in
  if head = -1 then
    false
  else (
    let and_group = and_net.(head) in
    let shadow_p = shadow_check_and_group 0 and_group in
    if shadow_p then
      true
    else
      shadow_check_one_or_group (ofs + 1) or_group
   )
in

(**** OR グループの列のどれかの影に入っているかどうかの判定 ****)
let rec shadow_check_one_or_matrix ofs or_matrix =
  let head = or_matrix.(ofs) in
  let range_primitive = head.(0) in
  if range_primitive = -1 then (* OR行列の終了マーク *)
    false
  else
    if (* range primitive が無いか、またはrange_primitiveと交わる事を確認 *)
      if range_primitive = 99 then      (* range primitive が無い *)
	true
      else              (* range_primitiveがある *)
	let t = solver_fast range_primitive light_dirvec intersection_point in
        (* range primitive とぶつからなければ *)
        (* or group との交点はない            *)
	if t <> 0 then
          if fless solver_dist.(0) (-0.1) then
            if shadow_check_one_or_group 1 head then
              true
	    else false
	  else false
	else false
    then
      if (shadow_check_one_or_group 1 head) then
	true (* 交点があるので、影に入る事が判明。探索終了 *)
      else
	shadow_check_one_or_matrix (ofs + 1) or_matrix (* 次の要素を試す *)
    else
      shadow_check_one_or_matrix (ofs + 1) or_matrix (* 次の要素を試す *)

in

(******************************************************************************
   光線と物体の交差判定
 *****************************************************************************)

(**** あるANDネットワークが、レイトレースの方向に対し、****)
(**** 交点があるかどうかを調べる。                     ****)
let rec solve_each_element iand_ofs and_group dirvec =
  let iobj = and_group.(iand_ofs) in
  if iobj = -1 then ()
  else (
    let t0 = solver iobj dirvec startp in
    if t0 <> 0 then
      (
       (* 交点がある時は、その交点が他の要素の中に含まれるかどうか調べる。*)
       (* 今までの中で最小の t の値と比べる。*)
       let t0p = solver_dist.(0) in

       if (fless 0.0 t0p) then
	 if (fless t0p tmin.(0)) then
	   (
	    let t = t0p +. 0.01 in
	    let q0 = dirvec.(0) *. t +. startp.(0) in
	    let q1 = dirvec.(1) *. t +. startp.(1) in
	    let q2 = dirvec.(2) *. t +. startp.(2) in
	    if check_all_inside 0 and_group q0 q1 q2 then
	      (
		tmin.(0) <- t;
		vecset intersection_point q0 q1 q2;
		intersected_object_id.(0) <- iobj;
		intsec_rectside.(0) <- t0
	       )
	    else ()
	   )
	 else ()
       else ();
       solve_each_element (iand_ofs + 1) and_group dirvec
      )
    else
      (* 交点がなく、しかもその物体は内側が真ならこれ以上交点はない *)
      if o_isinvert (objects.(iobj)) then
	solve_each_element (iand_ofs + 1) and_group dirvec
      else ()

   )
in

(**** 1つの OR-group について交点を調べる ****)
let rec solve_one_or_network ofs or_group dirvec =
  let head = or_group.(ofs) in
  if head <> -1 then (
    let and_group = and_net.(head) in
    solve_each_element 0 and_group dirvec;
    solve_one_or_network (ofs + 1) or_group dirvec
   ) else ()
in

(**** ORマトリクス全体について交点を調べる。****)
let rec trace_or_matrix ofs or_network dirvec =
  let head = or_network.(ofs) in
  let range_primitive = head.(0) in
  if range_primitive = -1 then (* 全オブジェクト終了 *)
    ()
  else (
    if range_primitive = 99 (* range primitive なし *)
    then (solve_one_or_network 1 head dirvec)
    else
      (
	(* range primitive の衝突しなければ交点はない *)
       let t = solver range_primitive dirvec startp in
       if t <> 0 then
	 let tp = solver_dist.(0) in
	 if fless tp tmin.(0)
	 then (solve_one_or_network 1 head dirvec)
	 else ()
       else ()
      );
    trace_or_matrix (ofs + 1) or_network dirvec
  )
in

(**** トレース本体 ****)
(* トレース開始点 ViewPoint と、その点からのスキャン方向ベクトル *)
(* Vscan から、交点 crashed_point と衝突したオブジェクト         *)
(* crashed_object を返す。関数自体の返り値は交点の有無の真偽値。 *)
let rec judge_intersection dirvec = (
  tmin.(0) <- (1000000000.0);
  trace_or_matrix 0 (or_net.(0)) dirvec;
  let t = tmin.(0) in

  if (fless (-0.1) t) then
    (fless t 100000000.0)
  else false
 )
in

(******************************************************************************
   光線と物体の交差判定 高速版
 *****************************************************************************)

let rec solve_each_element_fast iand_ofs and_group dirvec =
  let vec = (d_vec dirvec) in
  let iobj = and_group.(iand_ofs) in
  if iobj = -1 then ()
  else (
    let t0 = solver_fast2 iobj dirvec in
    if t0 <> 0 then
      (
        (* 交点がある時は、その交点が他の要素の中に含まれるかどうか調べる。*)
        (* 今までの中で最小の t の値と比べる。*)
       let t0p = solver_dist.(0) in

       if (fless 0.0 t0p) then
	 if (fless t0p tmin.(0)) then
	   (
	    let t = t0p +. 0.01 in
	    let q0 = vec.(0) *. t +. startp_fast.(0) in
	    let q1 = vec.(1) *. t +. startp_fast.(1) in
	    let q2 = vec.(2) *. t +. startp_fast.(2) in
	    if check_all_inside 0 and_group q0 q1 q2 then
	      (
		tmin.(0) <- t;
		vecset intersection_point q0 q1 q2;
		intersected_object_id.(0) <- iobj;
		intsec_rectside.(0) <- t0;
	       )
	    else ()
	   )
	 else ()
       else ();
       solve_each_element_fast (iand_ofs + 1) and_group dirvec
      )
    else
       (* 交点がなく、しかもその物体は内側が真ならこれ以上交点はない *)
       if o_isinvert (objects.(iobj)) then
	 solve_each_element_fast (iand_ofs + 1) and_group dirvec
       else ()
   )
in

(**** 1つの OR-group について交点を調べる ****)
let rec solve_one_or_network_fast ofs or_group dirvec =
  let head = or_group.(ofs) in
  if head <> -1 then (
    let and_group = and_net.(head) in
    solve_each_element_fast 0 and_group dirvec;
    solve_one_or_network_fast (ofs + 1) or_group dirvec
   ) else ()
in

(**** ORマトリクス全体について交点を調べる。****)
let rec trace_or_matrix_fast ofs or_network dirvec =
  let head = or_network.(ofs) in
  let range_primitive = head.(0) in
  if range_primitive = -1 then (* 全オブジェクト終了 *)
    ()
  else (
    if range_primitive = 99 (* range primitive なし *)
    then solve_one_or_network_fast 1 head dirvec
    else
      (
	(* range primitive の衝突しなければ交点はない *)
       let t = solver_fast2 range_primitive dirvec in
       if t <> 0 then
	 let tp = solver_dist.(0) in
	 if fless tp tmin.(0)
	 then (solve_one_or_network_fast 1 head dirvec)
	 else ()
       else ()
      );
    trace_or_matrix_fast (ofs + 1) or_network dirvec
   )
in

(**** トレース本体 ****)
let rec judge_intersection_fast dirvec =
(
  tmin.(0) <- (1000000000.0);
  trace_or_matrix_fast 0 (or_net.(0)) dirvec;
  let t = tmin.(0) in

  if (fless (-0.1) t) then
    (fless t 100000000.0)
  else false
)
in

(******************************************************************************
   物体と光の交差点の法線ベクトルを求める関数
 *****************************************************************************)

(**** 交点から法線ベクトルを計算する ****)
(* 衝突したオブジェクトを求めた際の solver の返り値を *)
(* 変数 intsec_rectside 経由で渡してやる必要がある。  *)
(* nvector もグローバル。 *)

let rec get_nvector_rect dirvec =
  let rectside = intsec_rectside.(0) in
  (* solver の返り値はぶつかった面の方向を示す *)
  vecbzero nvector;
  nvector.(rectside-1) <- fneg (sgn (dirvec.(rectside-1)))
in

(* 平面 *)
let rec get_nvector_plane m =
  (* m_invert は常に true のはず *)
  nvector.(0) <- fneg (o_param_a m); (* if m_invert then fneg m_a else m_a *)
  nvector.(1) <- fneg (o_param_b m);
  nvector.(2) <- fneg (o_param_c m)
in

(* 2次曲面 :  grad x^t A x = 2 A x を正規化する *)
let rec get_nvector_second m =
  let p0 = intersection_point.(0) -. o_param_x m in
  let p1 = intersection_point.(1) -. o_param_y m in
  let p2 = intersection_point.(2) -. o_param_z m in

  let d0 = p0 *. o_param_a m in
  let d1 = p1 *. o_param_b m in
  let d2 = p2 *. o_param_c m in

  if o_isrot m = 0 then (
    nvector.(0) <- d0;
    nvector.(1) <- d1;
    nvector.(2) <- d2
   ) else (
    nvector.(0) <- d0 +. fhalf (p1 *. o_param_r3 m +. p2 *. o_param_r2 m);
    nvector.(1) <- d1 +. fhalf (p0 *. o_param_r3 m +. p2 *. o_param_r1 m);
    nvector.(2) <- d2 +. fhalf (p0 *. o_param_r2 m +. p1 *. o_param_r1 m)
   );
  vecunit_sgn nvector (o_isinvert m)

in

let rec get_nvector m dirvec =
  let m_shape = o_form m in
  if m_shape = 1 then
    get_nvector_rect dirvec
  else if m_shape = 2 then
    get_nvector_plane m
  else (* 2次曲面 or 錐体 *)
    get_nvector_second m
  (* retval = nvector *)
in

(******************************************************************************
   物体表面の色(色付き拡散反射率)を求める
 *****************************************************************************)

(**** 交点上のテクスチャの色を計算する ****)
let rec utexture m p =
  let m_tex = o_texturetype m in
  (* 基本はオブジェクトの色 *)
  texture_color.(0) <- o_color_red m;
  texture_color.(1) <- o_color_green m;
  texture_color.(2) <- o_color_blue m;
  if m_tex = 1 then
    (
     (* zx方向のチェッカー模様 (G) *)
     let w1 = p.(0) -. o_param_x m in
     let flag1 =
       let d1 = (floor (w1 *. 0.05)) *. 20.0 in
      fless (w1 -. d1) 10.0
     in
     let w3 = p.(2) -. o_param_z m in
     let flag2 =
       let d2 = (floor (w3 *. 0.05)) *. 20.0 in
       fless (w3 -. d2) 10.0
     in
     texture_color.(1) <-
       if flag1
       then (if flag2 then 255.0 else 0.0)
       else (if flag2 then 0.0 else 255.0)
    )
  else if m_tex = 2 then
    (* y軸方向のストライプ (R-G) *)
    (
      let w2 = fsqr (sin (p.(1) *. 0.25)) in
      texture_color.(0) <- 255.0 *. w2;
      texture_color.(1) <- 255.0 *. (1.0 -. w2)
    )
  else if m_tex = 3 then
    (* ZX面方向の同心円 (G-B) *)
    (
      let w1 = p.(0) -. o_param_x m in
      let w3 = p.(2) -. o_param_z m in
      let w2 = sqrt (fsqr w1 +. fsqr w3) /. 10.0 in
      let w4 =  (w2 -. floor w2) *. 3.1415927 in
      let cws = fsqr (cos w4) in
      texture_color.(1) <- cws *. 255.0;
      texture_color.(2) <- (1.0 -. cws) *. 255.0
    )
  else if m_tex = 4 then (
    (* 球面上の斑点 (B) *)
    let w1 = (p.(0) -. o_param_x m) *. (sqrt (o_param_a m)) in
    let w3 = (p.(2) -. o_param_z m) *. (sqrt (o_param_c m)) in
    let w4 = (fsqr w1) +. (fsqr w3) in
    let w7 =
      if fless (fabs w1) 1.0e-4 then
	15.0 (* atan +infty = pi/2 *)
      else
	let w5 = fabs (w3 /. w1)
	in
	((atan w5) *. 30.0) /. 3.1415927
    in
    let w9 = w7 -. (floor w7) in

    let w2 = (p.(1) -. o_param_y m) *. (sqrt (o_param_b m)) in
    let w8 =
      if fless (fabs w4) 1.0e-4 then
	15.0
      else
	let w6 = fabs (w2 /. w4)
	in ((atan w6) *. 30.0) /. 3.1415927
    in
    let w10 = w8 -. (floor w8) in
    let w11 = 0.15 -. (fsqr (0.5 -. w9)) -. (fsqr (0.5 -. w10)) in
    let w12 = if fisneg w11 then 0.0 else w11 in
    texture_color.(2) <- (255.0 *. w12) /. 0.3
   )
  else ()
in

(******************************************************************************
   衝突点に当たる光源の直接光と反射光を計算する関数群
 *****************************************************************************)

(* 当たった光による拡散光と不完全鏡面反射光による寄与をRGB値に加算 *)
let rec add_light bright hilight hilight_scale =

  (* 拡散光 *)
  if fispos bright then
    vecaccum rgb bright texture_color
  else ();

  (* 不完全鏡面反射 cos ^4 モデル *)
  if fispos hilight then (
    let ihl = fsqr (fsqr hilight) *. hilight_scale in
    rgb.(0) <- rgb.(0) +. ihl;
    rgb.(1) <- rgb.(1) +. ihl;
    rgb.(2) <- rgb.(2) +. ihl
  ) else ()
in

(* 各物体による光源の反射光を計算する関数(直方体と平面のみ) *)
let rec trace_reflections index diffuse hilight_scale dirvec =

  if index >= 0 then (
    let rinfo = reflections.(index) in (* 鏡平面の反射情報 *)
    let dvec = r_dvec rinfo in    (* 反射光の方向ベクトル(光と逆向き *)

    (*反射光を逆にたどり、実際にその鏡面に当たれば、反射光が届く可能性有り *)
    if judge_intersection_fast dvec then
      let surface_id = intersected_object_id.(0) * 4 + intsec_rectside.(0) in
      if surface_id = r_surface_id rinfo then
	(* 鏡面との衝突点が光源の影になっていなければ反射光は届く *)
        if not (shadow_check_one_or_matrix 0 or_net.(0)) then
	  (* 届いた反射光による RGB成分への寄与を加算 *)
          let p = veciprod nvector (d_vec dvec) in
          let scale = r_bright rinfo in
          let bright = scale *. diffuse *. p in
          let hilight = scale *. veciprod dirvec (d_vec dvec) in
          add_light bright hilight hilight_scale
        else ()
      else ()
    else ();
    trace_reflections (index - 1) diffuse hilight_scale dirvec
  ) else ()

in

(******************************************************************************
   直接光を追跡する
 *****************************************************************************)
let rec trace_ray nref energy dirvec pixel dist =
  if nref <= 4 then (
    let surface_ids = p_surface_ids pixel in
    if judge_intersection dirvec then (
    (* オブジェクトにぶつかった場合 *)
      let obj_id = intersected_object_id.(0) in
      let obj = objects.(obj_id) in
      let m_surface = o_reflectiontype obj in
      let diffuse = o_diffuse obj *. energy in

      get_nvector obj dirvec; (* 法線ベクトルを get *)
      veccpy startp intersection_point;  (* 交差点を新たな光の発射点とする *)
      utexture obj intersection_point; (*テクスチャを計算 *)

      (* pixel tupleに情報を格納する *)
      surface_ids.(nref) <- obj_id * 4 + intsec_rectside.(0);
      let intersection_points = p_intersection_points pixel in
      veccpy intersection_points.(nref) intersection_point;

      (* 拡散反射率が0.5以上の場合のみ間接光のサンプリングを行う *)
      let calc_diffuse = p_calc_diffuse pixel in
      if fless (o_diffuse obj) 0.5 then
	calc_diffuse.(nref) <- false
      else (
	calc_diffuse.(nref) <- true;
	let energya = p_energy pixel in
	veccpy energya.(nref) texture_color;
	vecscale energya.(nref) ((1.0 /. 256.0) *. diffuse);
	let nvectors = p_nvectors pixel in
	veccpy nvectors.(nref) nvector;
       );

      let w = (-2.0) *. veciprod dirvec nvector in
      (* 反射光の方向にトレース方向を変更 *)
      vecaccum dirvec w nvector;

      let hilight_scale = energy *. o_hilight obj in

      (* 光源光が直接届く場合、RGB成分にこれを加味する *)
      if not (shadow_check_one_or_matrix 0 or_net.(0)) then
        let bright = fneg (veciprod nvector light) *. diffuse in
        let hilight = fneg (veciprod dirvec light) in
        add_light bright hilight hilight_scale
      else ();

      (* 光源光の反射光が無いか探す *)
      setup_startp intersection_point;
      trace_reflections (n_reflections.(0)-1) diffuse hilight_scale dirvec;

      (* 重みが 0.1より多く残っていたら、鏡面反射元を追跡する *)
      if fless 0.1 energy then (

	if(nref < 4) then
	  surface_ids.(nref+1) <- -1
	else ();

	if m_surface = 2 then (   (* 完全鏡面反射 *)
	  let energy2 = energy *. (1.0 -. o_diffuse obj) in
	  trace_ray (nref+1) energy2 dirvec pixel (dist +. tmin.(0))
	 ) else ();

       ) else ()

     ) else (
      (* どの物体にも当たらなかった場合。光源からの光を加味 *)

      surface_ids.(nref) <- -1;

      if nref <> 0 then (
	let hl = fneg (veciprod dirvec light) in
        (* 90°を超える場合は0 (光なし) *)
	if fispos hl then
	  (
	   (* ハイライト強度は角度の cos^3 に比例 *)
	   let ihl = fsqr hl *. hl *. energy *. beam.(0) in
	   rgb.(0) <- rgb.(0) +. ihl;
	   rgb.(1) <- rgb.(1) +. ihl;
	   rgb.(2) <- rgb.(2) +. ihl
          )
	else ()
       ) else ()
     )
   ) else ()
in


(******************************************************************************
   間接光を追跡する
 *****************************************************************************)

(* ある点が特定の方向から受ける間接光の強さを計算する *)
(* 間接光の方向ベクトル dirvecに関しては定数テーブルが作られており、衝突判定
   が高速に行われる。物体に当たったら、その後の反射は追跡しない *)
let rec trace_diffuse_ray dirvec energy =

  (* どれかの物体に当たるか調べる *)
  if judge_intersection_fast dirvec then
    let obj = objects.(intersected_object_id.(0)) in
    get_nvector obj (d_vec dirvec);
    utexture obj intersection_point;

    (* その物体が放射する光の強さを求める。直接光源光のみを計算 *)
    if not (shadow_check_one_or_matrix 0 or_net.(0)) then
      let br =  fneg (veciprod nvector light) in
      let bright = (if fispos br then br else 0.0) in
      vecaccum diffuse_ray (energy *. bright *. o_diffuse obj) texture_color
    else ()
  else ()
in

(* あらかじめ決められた方向ベクトルの配列に対し、各ベクトルの方角から来る
   間接光の強さをサンプリングして加算する *)
let rec iter_trace_diffuse_rays dirvec_group nvector org index =
  if index >= 0 then (
    let p = veciprod (d_vec dirvec_group.(index)) nvector in

    (* 配列の 2n 番目と 2n+1 番目には互いに逆向の方向ベクトルが入っている
       法線ベクトルと同じ向きの物を選んで使う *)
    if fisneg p then
      trace_diffuse_ray dirvec_group.(index + 1) (p /. -150.0)
    else
      trace_diffuse_ray dirvec_group.(index) (p /. 150.0);

    iter_trace_diffuse_rays dirvec_group nvector org (index - 2)
   ) else ()
in

(* 与えられた方向ベクトルの集合に対し、その方向の間接光をサンプリングする *)
let rec trace_diffuse_rays dirvec_group nvector org =
  setup_startp org;
  (* 配列の 2n 番目と 2n+1 番目には互いに逆向の方向ベクトルが入っていて、
     法線ベクトルと同じ向きの物のみサンプリングに使われる *)
  (* 全部で 120 / 2 = 60本のベクトルを追跡 *)
  iter_trace_diffuse_rays dirvec_group nvector org 118
in

(* 半球方向の全部で300本のベクトルのうち、まだ追跡していない残りの240本の
   ベクトルについて間接光追跡する。60本のベクトル追跡を4セット行う *)
let rec trace_diffuse_ray_80percent group_id nvector org =

  if group_id <> 0 then
    trace_diffuse_rays dirvecs.(0) nvector org
  else ();

  if group_id <> 1 then
    trace_diffuse_rays dirvecs.(1) nvector org
  else ();

  if group_id <> 2 then
    trace_diffuse_rays dirvecs.(2) nvector org
  else ();

  if group_id <> 3 then
    trace_diffuse_rays dirvecs.(3) nvector org
  else ();

  if group_id <> 4 then
    trace_diffuse_rays dirvecs.(4) nvector org
  else ()

in

(* 上下左右4点の間接光追跡結果を使わず、300本全部のベクトルを追跡して間接光を
   計算する。20%(60本)は追跡済なので、残り80%(240本)を追跡する *)
let rec calc_diffuse_using_1point pixel nref =

  let ray20p = p_received_ray_20percent pixel in
  let nvectors = p_nvectors pixel in
  let intersection_points = p_intersection_points pixel in
  let energya = p_energy pixel in

  veccpy diffuse_ray ray20p.(nref);
  trace_diffuse_ray_80percent
    (p_group_id pixel)
    nvectors.(nref)
    intersection_points.(nref);
  vecaccumv rgb energya.(nref) diffuse_ray

in

(* 自分と上下左右4点の追跡結果を加算して間接光を求める。本来は 300 本の光を
   追跡する必要があるが、5点加算するので1点あたり60本(20%)追跡するだけで済む *)

let rec calc_diffuse_using_5points x prev cur next nref =

  let r_up = p_received_ray_20percent prev.(x) in
  let r_left = p_received_ray_20percent cur.(x-1) in
  let r_center = p_received_ray_20percent cur.(x) in
  let r_right = p_received_ray_20percent cur.(x+1) in
  let r_down = p_received_ray_20percent next.(x) in

  veccpy diffuse_ray r_up.(nref);
  vecadd diffuse_ray r_left.(nref);
  vecadd diffuse_ray r_center.(nref);
  vecadd diffuse_ray r_right.(nref);
  vecadd diffuse_ray r_down.(nref);

  let energya = p_energy cur.(x) in
  vecaccumv rgb energya.(nref) diffuse_ray

in

(* 上下左右4点を使わずに直接光の各衝突点における間接受光を計算する *)
let rec do_without_neighbors pixel nref =
  if nref <= 4 then
    (* 衝突面番号が有効(非負)かチェック *)
    let surface_ids = p_surface_ids pixel in
    if surface_ids.(nref) >= 0 then (
      let calc_diffuse = p_calc_diffuse pixel in
      if calc_diffuse.(nref) then
	calc_diffuse_using_1point pixel nref
      else ();
      do_without_neighbors pixel (nref + 1)
     ) else ()
  else ()
in

(* 画像上で上下左右に点があるか(要するに、画像の端で無い事)を確認 *)
let rec neighbors_exist x y next =
  if (y + 1) < image_size.(1) then
    if y > 0 then
      if (x + 1) < image_size.(0) then
	if x > 0 then
	  true
	else false
      else false
    else false
  else false
in

let rec get_surface_id pixel index =
  let surface_ids = p_surface_ids pixel in
  surface_ids.(index)
in

(* 上下左右4点の直接光追跡の結果、自分と同じ面に衝突しているかをチェック
   もし同じ面に衝突していれば、これら4点の結果を使うことで計算を省略出来る *)
let rec neighbors_are_available x prev cur next nref =
  let sid_center = get_surface_id cur.(x) nref in

  if get_surface_id prev.(x) nref = sid_center then
    if get_surface_id next.(x) nref = sid_center then
      if get_surface_id cur.(x-1) nref = sid_center then
	if get_surface_id cur.(x+1) nref = sid_center then
	  true
	else false
      else false
    else false
  else false
in

(* 直接光の各衝突点における間接受光の強さを、上下左右4点の結果を使用して計算
   する。もし上下左右4点の計算結果を使えない場合は、その時点で
   do_without_neighborsに切り替える *)

let rec try_exploit_neighbors x y prev cur next nref =
  let pixel = cur.(x) in
  if nref <= 4 then

    (* 衝突面番号が有効(非負)か *)
    if get_surface_id pixel nref >= 0 then
      (* 周囲4点を補完に使えるか *)
      if neighbors_are_available x prev cur next nref then (

	(* 間接受光を計算するフラグが立っていれば実際に計算する *)
	let calc_diffuse = p_calc_diffuse pixel in
        if calc_diffuse.(nref) then
	  calc_diffuse_using_5points x prev cur next nref
	else ();

	(* 次の反射衝突点へ *)
	try_exploit_neighbors x y prev cur next (nref + 1)
      ) else
	(* 周囲4点を補完に使えないので、これらを使わない方法に切り替える *)
	do_without_neighbors cur.(x) nref
    else ()
  else ()
in

(******************************************************************************
   PPMファイルの書き込み関数
 *****************************************************************************)
let rec write_ppm_header _ =
  (
    print_char 80; (* 'P' *)
    print_char (48 + 3); (* +6 if binary *) (* 48 = '0' *)
    print_char 10;
    print_int image_size.(0);
    print_char 32;
    print_int image_size.(1);
    print_char 32;
    print_int 255;
    print_char 10
  )
in

let rec write_rgb_element x =
  let ix = int_of_float x in
  let elem = if ix > 255 then 255 else if ix < 0 then 0 else ix in
  print_int elem
in

let rec write_rgb _ =
   write_rgb_element rgb.(0); (* Red   *)
   print_char 32;
   write_rgb_element rgb.(1); (* Green *)
   print_char 32;
   write_rgb_element rgb.(2); (* Blue  *)
   print_char 10
in

(******************************************************************************
   あるラインの計算に必要な情報を集めるため次のラインの追跡を行っておく関数群
 *****************************************************************************)

(* 間接光のサンプリングでは上下左右4点の結果を使うので、次のラインの計算を
   行わないと最終的なピクセルの値を計算できない *)

(* 間接光を 60本(20%)だけ計算しておく関数 *)
let rec pretrace_diffuse_rays pixel nref =
  if nref <= 4 then

    (* 面番号が有効か *)
    let sid = get_surface_id pixel nref in
    if sid >= 0 then (
      (* 間接光を計算するフラグが立っているか *)
      let calc_diffuse = p_calc_diffuse pixel in
      if calc_diffuse.(nref) then (
	let group_id = p_group_id pixel in
	vecbzero diffuse_ray;

	(* 5つの方向ベクトル集合(各60本)から自分のグループIDに対応する物を
	   一つ選んで追跡 *)
	let nvectors = p_nvectors pixel in
	let intersection_points = p_intersection_points pixel in
	trace_diffuse_rays
	  dirvecs.(group_id)
	  nvectors.(nref)
	  intersection_points.(nref);
	let ray20p = p_received_ray_20percent pixel in
	veccpy ray20p.(nref) diffuse_ray
       ) else ();
      pretrace_diffuse_rays pixel (nref + 1)
     ) else ()
  else ()
in

(* 各ピクセルに対して直接光追跡と間接受光の20%分の計算を行う *)

let rec pretrace_pixels line x group_id lc0 lc1 lc2 =
  if x >= 0 then (

    let xdisp = scan_pitch.(0) *. float_of_int (x - image_center.(0)) in
    ptrace_dirvec.(0) <- xdisp *. screenx_dir.(0) +. lc0;
    ptrace_dirvec.(1) <- xdisp *. screenx_dir.(1) +. lc1;
    ptrace_dirvec.(2) <- xdisp *. screenx_dir.(2) +. lc2;
    vecunit_sgn ptrace_dirvec false;
    vecbzero rgb;
    veccpy startp viewpoint;

    (* 直接光追跡 *)
    trace_ray 0 1.0 ptrace_dirvec line.(x) 0.0;
    veccpy (p_rgb line.(x)) rgb;
    p_set_group_id line.(x) group_id;

    (* 間接光の20%を追跡 *)
    pretrace_diffuse_rays line.(x) 0;

    pretrace_pixels line (x-1) (add_mod5 group_id 1) lc0 lc1 lc2

   ) else ()
in

(* あるラインの各ピクセルに対し直接光追跡と間接受光20%分の計算をする *)
let rec pretrace_line line y group_id =
  let ydisp = scan_pitch.(0) *. float_of_int (y - image_center.(1)) in

  (* ラインの中心に向かうベクトルを計算 *)
  let lc0 = ydisp *. screeny_dir.(0) +. screenz_dir.(0) in
  let lc1 = ydisp *. screeny_dir.(1) +. screenz_dir.(1) in
  let lc2 = ydisp *. screeny_dir.(2) +. screenz_dir.(2) in
  pretrace_pixels line (image_size.(0) - 1) group_id lc0 lc1 lc2
in


(******************************************************************************
   直接光追跡と間接光20%追跡の結果から最終的なピクセル値を計算する関数
 *****************************************************************************)

(* 各ピクセルの最終的なピクセル値を計算 *)
let rec scan_pixel x y prev cur next =
  if x < image_size.(0) then (

    (* まず、直接光追跡で得られたRGB値を得る *)
    veccpy rgb (p_rgb cur.(x));

    (* 次に、直接光の各衝突点について、間接受光による寄与を加味する *)
    if neighbors_exist x y next then
      try_exploit_neighbors x y prev cur next 0
    else
      do_without_neighbors cur.(x) 0;

    (* 得られた値をPPMファイルに出力 *)
    write_rgb ();

    scan_pixel (x + 1) y prev cur next
   ) else ()
in

(* 一ライン分のピクセル値を計算 *)
let rec scan_line y prev cur next group_id = (

  if y < image_size.(1) then (

    if y < image_size.(1) - 1 then
      pretrace_line next (y + 1) group_id
    else ();
    scan_pixel 0 y prev cur next;
    scan_line (y + 1) cur next prev (add_mod5 group_id 2);
   ) else ()
)
in

(******************************************************************************
   ピクセルの情報を格納するデータ構造の割り当て関数群
 *****************************************************************************)

(* 3次元ベクトルの5要素配列を割り当て *)
let rec create_float5x3array _ = (
  let vec = create_array 3 0.0 in
  let array = create_array 5 vec in
  array.(1) <- create_array 3 0.0;
  array.(2) <- create_array 3 0.0;
  array.(3) <- create_array 3 0.0;
  array.(4) <- create_array 3 0.0;
  array
)
in

(* ピクセルを表すtupleを割り当て *)
let rec create_pixel _ =
  let m_rgb = create_array 3 0.0 in
  let m_isect_ps = create_float5x3array() in
  let m_sids = create_array 5 0 in
  let m_cdif = create_array 5 false in
  let m_engy = create_float5x3array() in
  let m_r20p = create_float5x3array() in
  let m_gid = create_array 1 0 in
  let m_nvectors = create_float5x3array() in
  (m_rgb, m_isect_ps, m_sids, m_cdif, m_engy, m_r20p, m_gid, m_nvectors)
in

(* 横方向1ライン中の各ピクセル要素を割り当てる *)
let rec init_line_elements line n =
  if n >= 0 then (
    line.(n) <- create_pixel();
    init_line_elements line (n-1)
   ) else
    line
in

(* 横方向1ライン分のピクセル配列を作る *)
let rec create_pixelline _ =
  let line = create_array image_size.(0) (create_pixel()) in
  init_line_elements line (image_size.(0)-2)
in

(******************************************************************************
   間接光のサンプリングにつかう方向ベクトル群を計算する関数群
 *****************************************************************************)

(* ベクトル達が出来るだけ一様に分布するよう、600本の方向ベクトルの向きを定める
   立方体上の各面に100本ずつ分布させ、さらに、100本が立方体上の面上で10 x 10 の
   格子状に並ぶような配列を使う。この配列では方角によるベクトルの密度の差が
   大きいので、これに補正を加えたものを最終的に用いる *)

let rec tan x =
  sin(x) /. cos(x)
in

(* ベクトル達が出来るだけ球面状に一様に分布するよう座標を補正する *)
let rec adjust_position h ratio =
  let l = sqrt(h*.h +. 0.1) in
  let tan_h = 1.0 /. l in
  let theta_h = atan tan_h in
   let tan_m = tan (theta_h *. ratio) in
  tan_m *. l
in

(* ベクトル達が出来るだけ球面状に一様に分布するような向きを計算する *)
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

(* 立方体上の 10x10格子の行中の各ベクトルを計算する *)
let rec calc_dirvecs col ry group_id index =
  if col >= 0 then (
    (* 左半分 *)
    let rx = (float_of_int col) *. 0.2 -. 0.9 in (* 列の座標 *)
    calc_dirvec 0 0.0 0.0 rx ry group_id index;
    (* 右半分 *)
    let rx2 = (float_of_int col) *. 0.2 +. 0.1 in (* 列の座標 *)
    calc_dirvec 0 0.0 0.0 rx2 ry group_id (index + 2);

    calc_dirvecs (col - 1) ry (add_mod5 group_id 1) index
   ) else ()
in

(* 立方体上の10x10格子の各行に対しベクトルの向きを計算する *)
let rec calc_dirvec_rows row group_id index =
  if row >= 0 then (
    let ry = (float_of_int row) *. 0.2 -. 0.9 in (* 行の座標 *)
    calc_dirvecs 4 ry group_id index; (* 一行分計算 *)
    calc_dirvec_rows (row - 1) (add_mod5 group_id 2) (index + 4)
   ) else ()
in

(******************************************************************************
   dirvec のメモリ割り当てを行う
 *****************************************************************************)


let rec create_dirvec _ =
  let v3 = create_array 3 0.0 in
  let consts = create_array n_objects.(0) v3 in
  (v3, consts)
in

let rec create_dirvec_elements d index =
  if index >= 0 then (
    d.(index) <- create_dirvec();
    create_dirvec_elements d (index - 1)
   ) else ()
in

let rec create_dirvecs index =
  if index >= 0 then (
    dirvecs.(index) <- create_array 120 (create_dirvec());
    create_dirvec_elements dirvecs.(index) 118;
    create_dirvecs (index-1)
   ) else ()
in

(******************************************************************************
   補助関数達を呼び出してdirvecの初期化を行う
 *****************************************************************************)

let rec init_dirvec_constants vecset index =
  if index >= 0 then (
    setup_dirvec_constants vecset.(index);
    init_dirvec_constants vecset (index - 1)
   ) else ()
in

let rec init_vecset_constants index =
  if index >= 0 then (
    init_dirvec_constants dirvecs.(index) 119;
    init_vecset_constants (index - 1)
   ) else ()
in

let rec init_dirvecs _ =
  create_dirvecs 4;
  calc_dirvec_rows 9 0 0;
  init_vecset_constants 4
in

(******************************************************************************
   完全鏡面反射成分を持つ物体の反射情報を初期化する
 *****************************************************************************)

(* 反射平面を追加する *)
let rec add_reflection index surface_id bright v0 v1 v2 =
  let dvec = create_dirvec() in
  vecset (d_vec dvec) v0 v1 v2; (* 反射光の向き *)
  setup_dirvec_constants dvec;

  reflections.(index) <- (surface_id, dvec, bright)
in

(* 直方体の各面について情報を追加する *)
let rec setup_rect_reflection obj_id obj =
  let sid = obj_id * 4 in
  let nr = n_reflections.(0) in
  let br = 1.0 -. o_diffuse obj in
  let n0 = fneg light.(0) in
  let n1 = fneg light.(1) in
  let n2 = fneg light.(2) in
  add_reflection nr (sid+1) br light.(0) n1 n2;
  add_reflection (nr+1) (sid+2) br n0 light.(1) n2;
  add_reflection (nr+2) (sid+3) br n0 n1 light.(2);
  n_reflections.(0) <- nr + 3
in

(* 平面について情報を追加する *)
let rec setup_surface_reflection obj_id obj =
  let sid = obj_id * 4 + 1 in
  let nr = n_reflections.(0) in
  let br = 1.0 -. o_diffuse obj in
  let p = veciprod light (o_param_abc obj) in

  add_reflection nr sid br
    (2.0 *. o_param_a obj *. p -. light.(0))
    (2.0 *. o_param_b obj *. p -. light.(1))
    (2.0 *. o_param_c obj *. p -. light.(2));
  n_reflections.(0) <- nr + 1
in


(* 各オブジェクトに対し、反射する平面があればその情報を追加する *)
let rec setup_reflections obj_id =
  if obj_id >= 0 then
    let obj = objects.(obj_id) in
    if o_reflectiontype obj = 2 then
      if fless (o_diffuse obj) 1.0 then
	let m_shape = o_form obj in
	(* 直方体と平面のみサポート *)
	if m_shape = 1 then
	  setup_rect_reflection obj_id obj
	else if m_shape = 2 then
	  setup_surface_reflection obj_id obj
	else ()
      else ()
    else ()
  else ()
in

(*****************************************************************************
   全体の制御
 *****************************************************************************)

(* レイトレの各ステップを行う関数を順次呼び出す *)
let rec rt size_x size_y =
(
 image_size.(0) <- size_x;
 image_size.(1) <- size_y;
 image_center.(0) <- size_x / 2;
 image_center.(1) <- size_y / 2;
 scan_pitch.(0) <- 128.0 /. float_of_int size_x;
 let prev = create_pixelline () in
 let cur  = create_pixelline () in
 let next = create_pixelline () in
 read_parameter();
 write_ppm_header ();
 init_dirvecs();
 veccpy (d_vec light_dirvec) light;
 setup_dirvec_constants light_dirvec;
 setup_reflections (n_objects.(0) - 1);
 pretrace_line cur 0 0;
 scan_line 0 prev cur next 2
)
in

let _ = rt 512 512

in 0
