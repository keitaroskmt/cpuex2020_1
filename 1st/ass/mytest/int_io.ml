let x = read_int () in
let rec fib n =
  if n <= 1 then n else
  fib (n - 1) + fib (n - 2) in
(
print_char 80;
print_char (48 + 3);
print_char 10;
print_int (fib x);
print_char 32;
print_int (fib (x + 2));
print_char 32;
print_int 255;
print_char 10
)
