type id_or_imm = V of Id.t | C of int
type t = 
    | Nop
    | Add of Id.t * Id.t * Id.t
    | Addi of Id.t * Id.t * int
    (* ラベルの行数をmovする命令. ラベルの位置が判明後Addiに変換する. *)
    | Movl of Id.t * string
    | Sub of Id.t * Id.t * Id.t
    | And of Id.t * Id.t * Id.t
    | Or of Id.t * Id.t * Id.t
    | Ori of Id.t * Id.t * int
    | Nor of Id.t * Id.t * Id.t
    | Sll of Id.t * Id.t * id_or_imm
    | Srl of Id.t * Id.t * id_or_imm
    | Lui of Id.t * int

    | FAdd of Id.t * Id.t * Id.t
    | FSub of Id.t * Id.t * Id.t
    | FMul of Id.t * Id.t * Id.t
    | FDiv of Id.t * Id.t * Id.t
    | FNeg of Id.t * Id.t
    | FAbs of Id.t * Id.t
    | FSqrt of Id.t * Id.t
    | FMov of Id.t * Id.t
    | Floor of Id.t * Id.t

    | Ftoi of Id.t * Id.t
    | Itof of Id.t * Id.t

    | Lw of Id.t * int * Id.t
    | Sw of Id.t * int * Id.t
    | FLw of Id.t * int * Id.t
    | FSw of Id.t * int * Id.t

    | In of Id.t
    | Out of Id.t

    | Jr of Id.t 
    | Jalr of Id.t
    | J of string
    | Jal of string

    | Beq of Id.t * Id.t * string
    | Beqi of Id.t * int * string
    | Bne of Id.t * Id.t * string
    | Blt of Id.t * Id.t * string
    | Blti of Id.t * int * string
    | FBeq of Id.t * Id.t * string
    | FBne of Id.t * Id.t * string
    | FBlt of Id.t * Id.t * string
    | Slt of Id.t * Id.t * Id.t
    | FSlt of Id.t * Id.t * Id.t

    | Label of string
    | Comment of string
    | LibmincamlStart (* libmincaml.Sの中身をここから出力 *)
    | Ret



let assem_debug oc list =  
    List.iter
        (fun inst -> 
        (match inst with
        | Nop -> Printf.fprintf oc "Nop\n"
        | Add(x, y, z) -> Printf.fprintf oc "\tadd\t%s, %s, %s\n" x y z
        | Addi(x, y, i) -> Printf.fprintf oc "\taddi\t%s, %s, %d\n" x y i
        | Movl(x, l) -> Printf.fprintf oc "\tmovl\t%s, %s\n" x l
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
        | LibmincamlStart -> Printf.fprintf oc "LibmincamlStart\n"
        | Ret -> Printf.fprintf oc "\tret\n"
        ))
    list
