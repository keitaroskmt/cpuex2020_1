open Assem

let g oc = function
    | Nop -> ()
    | Add(x, y, z) -> Printf.fprintf oc "\tadd\t%s, %s, %s\n" x y z
    | Addi(x, y, i) -> Printf.fprintf oc "\taddi\t%s, %s, %d\n" x y i
    (* ラベルyの行数が大きすぎる場合addiからはみ出る (raytracerではでないはず)*)
    | Movl(x, l) -> Printf.fprintf oc "\taddi\t%s, %s, %s\n" x Asm.reg_zero l
    | Sub(x, y, z) -> Printf.fprintf oc "\tsub\t%s, %s, %s\n" x y z
    | And(x, y, z) -> Printf.fprintf oc "\tand\t%s, %s, %s\n" x y z
    | Or(x, y, z) -> Printf.fprintf oc "\tor\t%s, %s, %s\n" x y z
    | Ori(x, y, i) -> Printf.fprintf oc "\tori\t%s, %s, %d\n" x y i
    | Nor(x, y, z) -> Printf.fprintf oc "\tnor\t%s, %s, %s\n" x y z
    | Sll(x, y, V(z)) -> Printf.fprintf oc "\tsll\t%s, %s, %s\n" x y z
    | Sll(x, y, C(i)) -> Printf.fprintf oc "\tsll\t%s, %s, %d\n" x y i
    | Srl(x, y, V(z)) -> Printf.fprintf oc "\tsrl\t%s, %s, %s\n" x y z
    | Srl(x, y, C(i)) -> Printf.fprintf oc "\tsrl\t%s, %s, %d\n" x y i
    | Lui(x, i) -> Printf.fprintf oc "\tlui\t%s, %d\n" x i

    | FAdd(x, y, z) -> Printf.fprintf oc "\tfadd\t%s, %s, %s\n" x y z
    | FSub(x, y, z) -> Printf.fprintf oc "\tfsub\t%s, %s, %s\n" x y z
    | FMul(x, y, z) -> Printf.fprintf oc "\tfmul\t%s, %s, %s\n" x y z
    | FDiv(x, y, z) -> Printf.fprintf oc "\tfdiv\t%s, %s, %s\n" x y z
    | FNeg(x, y) -> Printf.fprintf oc "\tfneg\t%s, %s\n" x y
    | FAbs(x, y) -> Printf.fprintf oc "\tfabs\t%s, %s\n" x y
    | FSqrt(x, y) -> Printf.fprintf oc "\tfsqrt\t%s, %s\n" x y
    | FMov(x, y) -> Printf.fprintf oc "\tfmov\t%s, %s\n" x y
    | Floor(x, y) -> Printf.fprintf oc "\tfloor\t%s, %s\n" x y

    | Ftoi(x, y) -> Printf.fprintf oc "\tftoi\t%s, %s\n" x y
    | Itof(x, y) -> Printf.fprintf oc "\titof\t%s, %s\n" x y

    | Lw(x, i, y) -> Printf.fprintf oc "\tlw\t%s, %d(%s)\n" x i y
    | Sw(x, i, y) -> Printf.fprintf oc "\tsw\t%s, %d(%s)\n" x i y
    | FLw(x, i, y) -> Printf.fprintf oc "\tflw\t%s, %d(%s)\n" x i y
    | FSw(x, i, y) -> Printf.fprintf oc "\tfsw\t%s, %d(%s)\n" x i y

    | In(x) -> Printf.fprintf oc "\tin\t%s\n" x
    | Out(x) -> Printf.fprintf oc "\tout\t%s\n" x

    | Jr(x) -> Printf.fprintf oc "\tjr\t%s\n" x
    | Jalr(x) -> Printf.fprintf oc "\tjalr\t%s\n" x
    | J(l) -> Printf.fprintf oc "\tj\t%s\n" l
    | Jal(l) -> Printf.fprintf oc "\tjal\t%s\n" l

    | Beq(x, y, l) -> Printf.fprintf oc "\tbeq\t%s, %s, %s\n" x y l
    | Beqi(x, i, l) -> Printf.fprintf oc "\tbeqi\t%s, %d, %s\n" x i l
    | Bne(x, y, l) -> Printf.fprintf oc "\tbne\t%s, %s, %s\n" x y l
    | Blt(x, y, l) -> Printf.fprintf oc "\tblt\t%s, %s, %s\n" x y l
    | Blti(x, i, l) -> Printf.fprintf oc "\tblti\t%s, %d, %s\n" x i l
    | FBeq(x, y, l) -> Printf.fprintf oc "\tfbeq\t%s, %s, %s\n" x y l
    | FBne(x, y, l) -> Printf.fprintf oc "\tfbne\t%s, %s, %s\n" x y l
    | FBlt(x, y, l) -> Printf.fprintf oc "\tfblt\t%s, %s, %s\n" x y l

    | Slt(x, y, z) -> Printf.fprintf oc "\tslt\t%s, %s, %s\n" x y z
    | FSlt(x, y, z) -> Printf.fprintf oc "\tfslt\t%s, %s, %s\n" x y z

    | Label(l) -> Printf.fprintf oc "%s:\n" l
    | Comment(s) -> Printf.fprintf oc "%s" s
    | LibmincamlStart -> 
        (
        let inchan = open_in "libmincaml.S" in
        try
            while true do
                let line = input_line inchan in Printf.fprintf oc "%s\n" line;
            done
        with
        | End_of_file -> (close_in inchan)
        )
    | Ret -> Printf.fprintf oc "\tret\n"


let f oc l = 
    List.iter (fun x -> g oc x) l