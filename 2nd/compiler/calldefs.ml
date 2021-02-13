(* jump先の関数で、使用しないcallersave, 引数のレジスタについては干渉しないようにしたい *)
(* %raについてはどの関数も使うので省略 *)
open Assem

let calldefs_set = Hashtbl.create 1000

(* ライブラリ関数については手動で初期化 *)
Hashtbl.add calldefs_set "min_caml_print_char" (S.of_list ["%v0"])
Hashtbl.add calldefs_set "min_caml_read_int" (S.of_list ["%v0"; "%v1"])
Hashtbl.add calldefs_set "min_caml_read_float" (S.of_list ["%v0"; "%v1"; "%f0"])
Hashtbl.add calldefs_set "min_caml_create_array" (S.of_list ["%v0"; "%v1"; "%a0"])
Hashtbl.add calldefs_set "min_caml_create_float_array" (S.of_list ["%v0"; "%v1"; "%f0"])
Hashtbl.add calldefs_set "min_caml_create_extarray" (S.of_list ["%v0"; "%v1"; "%a0"; "%a1"])
Hashtbl.add calldefs_set "min_caml_create_float_extarray" (S.of_list ["%v0"; "%v1"; "%a0"; "%f0"])


let rec g = function
    | Ans(exp) -> Ans(g' exp)
    | Let((x, t), exp, e) -> 
        S.add x (S.union (g' exp) (g e))
and g' = function
    | Nop
    | 
    | CallCls(x, _, _) -> 
    | CallDir(Id.L(x), _, _) -> 

    | Save(x, _) -> S.singleton x




(* レジスタ割り当て済の関数を受け取って, 使うcalldefsの集合を登録する *)
let f label e = 
    Hashtbl.add calldefs_set label (g e)
