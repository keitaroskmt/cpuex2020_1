let rec f x = x in
let rec g x = x + 1 in
let x = f 5 in
let y = (if x <= 0 then f 1 else 2) in
let z = (if x <= 3 then x - 4 else g 5) in
print_int (x - y - z)