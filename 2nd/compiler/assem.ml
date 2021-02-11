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