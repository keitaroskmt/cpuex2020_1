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
let rec float_of_int x = 1.0
in

let rec cos x = x +. x
in
let rec sin x = x +. x
in
let rec atan x = x +. x
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