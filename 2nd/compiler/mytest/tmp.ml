let rec f i =
if i < 0 then 0.0 else 1.0 +. f (i - 1) in
print_float (f 10)