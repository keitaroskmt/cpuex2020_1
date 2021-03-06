type id_or_imm = V of Id.t | C of int
type t =
  | Ans of exp
  | Let of (Id.t * Type.t) * exp * t
and exp =
  | Nop
  | Set of int
  | SetF of Id.l
  | SetL of Id.l
  | Mov of Id.t
  | Neg of Id.t
  | Add of Id.t * id_or_imm
  | Sub of Id.t * id_or_imm
  | Mul of Id.t * id_or_imm
  | Div of Id.t * id_or_imm
  | SLL of Id.t * id_or_imm
  | Ld of Id.t * id_or_imm
  | St of Id.t * Id.t * id_or_imm
  | FMovD of Id.t
  | FNegD of Id.t
  | FAddD of Id.t * Id.t
  | FSubD of Id.t * Id.t
  | FMulD of Id.t * Id.t
  | FDivD of Id.t * Id.t
  | FAbs of Id.t
  | FSqr of Id.t
  | Ftoi of Id.t
  | Itof of Id.t
  | Floor of Id.t
  | LdF of Id.t * id_or_imm
  | StF of Id.t * Id.t * id_or_imm
  | Comment of string
  (* virtual instructions *)
  | IfEq of Id.t * id_or_imm * t * t
  | IfLE of Id.t * id_or_imm * t * t
  | IfGE of Id.t * id_or_imm * t * t
  | IfFEq of Id.t * Id.t * t * t
  | IfFLE of Id.t * Id.t * t * t
  | Slt of Id.t * Id.t
  | FSlt of Id.t * Id.t
  (* closure address, integer arguments, and float arguments *)
  | CallCls of Id.t * Id.t list * Id.t list
  | CallDir of Id.l * Id.t list * Id.t list
  | Save of Id.t * Id.t (* レジスタ変数の値をスタック変数へ保存 *)
  | Restore of Id.t (* スタック変数から値を復元 *)
type fundef = { name : Id.l; args : Id.t list; fargs : Id.t list; body : t; ret : Type.t }
type prog = Prog of (Id.l * float) list * fundef list * t

val fletd : Id.t * exp * t -> t (* shorthand of Let for float *)
val seq : exp * t -> t (* shorthand of Let for unit *)

val regs : Id.t array
val fregs : Id.t array
val allregs : Id.t list
val allfregs : Id.t list
val reg_cl : Id.t
val reg_sw : Id.t
val reg_zero : Id.t
val reg_sp : Id.t
val reg_hp : Id.t
val reg_gp : Id.t
val reg_ra : Id.t
val reg_at : Id.t

val sp_init : int

val reg_fsw : Id.t
val reg_fat : Id.t
val reg_fzero : Id.t

val is_reg : Id.t -> bool

val fv : t -> Id.t list
val concat : t -> Id.t * Type.t -> t -> t

val registers : Id.t list
val fregisters : Id.t list

val reg_map : Id.t M.t


val reg_one : Id.t
val reg_fone : Id.t
val reg_f001 : Id.t
val reg_f_02 : Id.t

val specialregs : (Id.t * Type.t) list
val argregs : (Id.t * Type.t) list
val calleesaves : (Id.t * Type.t) list
val callersaves : (Id.t * Type.t) list
val calldefs : (Id.t * Type.t) list

(*
val align : int -> int
*)

val asm_debug: out_channel -> prog -> unit
