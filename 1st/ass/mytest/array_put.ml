let rec inprod v1 v2 i =
  if i < 0 then 0.0 else
  v1.(i) *. v2.(i) +. inprod v1 v2 (i - 1) in
let v1 = Array.make 3 1.00 in
v1.(0) <- 1.23;
v1.(1) <- 1.23;
v1.(2) <- 1.23;
let v2 = Array.make 3 1.00 in
v2.(0) <- 4.56;
v2.(1) <- 4.56;
v2.(2) <- 4.56;
print_float (inprod v1 v2 2)
