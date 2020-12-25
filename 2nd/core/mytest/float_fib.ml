let rec float_fib n =
  if n <= 1.0 then n else
  float_fib (n -. 1.0) +. float_fib (n -. 2.0) in
(float_fib 10.0)
