(* jump先の関数で、使用しないcallersave, 引数のレジスタについては干渉しないようにしたい *)
open Asm
open Assem

module Regset = Set.Make(
    struct
        type t = Id.t * Type.t 
        let compare = compare
    end
) 

let use_regs = Hashtbl.create 1000

(* ライブラリ関数については手動で初期化 *)
let init () = 
    Hashtbl.clear use_regs;
    Hashtbl.add use_regs "min_caml_print_char" (Regset.of_list [("%v0", Type.Int); (reg_ra, Type.Int)]);
    Hashtbl.add use_regs "min_caml_read_int" (Regset.of_list [("%v0", Type.Int); ("%v1", Type.Int); (reg_ra, Type.Int)]);
    Hashtbl.add use_regs "min_caml_read_float" (Regset.of_list [("%v0", Type.Int); ("%v1", Type.Int); ("%f0", Type.Float); (reg_ra, Type.Int)]);
    Hashtbl.add use_regs "min_caml_create_array" (Regset.of_list [("%v0", Type.Int); ("%v1", Type.Int); ("%a0", Type.Int); (reg_ra, Type.Int)]);
    Hashtbl.add use_regs "min_caml_create_float_array" (Regset.of_list [("%v0", Type.Int); ("%v1", Type.Int); ("%f0", Type.Float); (reg_ra, Type.Int)]);
    Hashtbl.add use_regs "min_caml_create_extarray" (Regset.of_list [("%v0", Type.Int); ("%v1", Type.Int); ("%a0", Type.Int); ("%a1", Type.Int); (reg_ra, Type.Int)]);
    Hashtbl.add use_regs "min_caml_create_float_extarray" (Regset.of_list [("%v0", Type.Int); ("%v1", Type.Int); ("%a0", Type.Int); ("%f0", Type.Float); (reg_ra, Type.Int)])


(* クロージャはないことが前提 *)
let rec g = function
    | Nop | Sw(_) | FSw(_) | Out(_) | Jr(_) 
    | Beq(_) | Beqi(_) | Bne(_) | Blt(_) | Blti(_) | FBeq(_) | FBne(_) | FBlt(_)
    | Label(_) | Comment(_) | LibmincamlStart | Ret -> Regset.empty

    | Add(x, _, _) | Addi(x, _, _) | Movl(x, _) | Sub(x, _, _) | And(x, _, _) | Or(x, _, _) 
    | Ori(x, _, _) | Nor(x, _, _) | Sll(x, _, _) | Srl(x, _, _) | Lui(x, _) | Ftoi(x, _)
    | Lw(x, _, _) | In(x) | Slt(x, _, _) | FSlt(x, _, _) -> Regset.singleton (x, Type.Int)

    | FAdd(x, _, _) | FSub(x, _, _) | FMul(x, _, _) | FDiv(x, _, _) | FNeg(x, _) | FAbs(x, _) 
    | FSqrt(x, _) | FMov(x, _) | Floor(x, _) | Itof(x, _) | FLw(x, _, _) -> Regset.singleton (x, Type.Float)

    | J(l) | Jal(l) -> 
        (
            if Hashtbl.mem use_regs l then
                Hashtbl.find use_regs l
            else
                (* 登録されていない関数にjumpするということは再帰関数 *)
                Regset.empty
        )
    | Jalr(_) -> failwith ("calldefs error")



(* レジスタ割り当て済の関数を受け取って, 使うcalldefsの集合を登録する *)
let f label list = 
    let set = List.fold_left 
        (fun set inst -> Regset.union (g inst) set)
    Regset.empty list in

    let set' = Regset.add (reg_ra, Type.Int) (Regset.filter (fun x -> List.mem x (callersaves @ argregs)) set) in  

    Hashtbl.add use_regs label set'
