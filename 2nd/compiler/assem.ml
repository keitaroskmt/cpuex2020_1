(*
type t = 
  | Nop
  | Add of Id.t * Id.t * Id.t
  | Sub of Id.t * Id.t * Id.t
  | Sll of Id.t * Id.t * Id.t
  | Srl of Id.t * Id.t * Id.t
  | Slli of Id.t * Id.t * int (* -> Sll *)
  | Srli of Id.t * Id.t * int (* -> Srl *)
  | Addi of Id.t * Id.t * int
  | Ori of Id.t * Id.t * int
  | Lui of Id.t * int
  | Flw of Id.t * int * Id.t
  | Mov of Id.t * Id.t (* -> Add *)
  | MovLabel of Id.t * Id.l (* -> Addi *)
  | J of Id.l
  | Label of Id.l
  | Ret
*)

type t = 
  | OPER of {
    dst: Id.t list;
    src: Id.t list;
    jump: Id.l list option;
  }
  | LABEL of {
    lab: Id.l;
  }
  | MOVE of {
    dst: Id.t list;
    src: Id.t list;
  }

  (* 
  - 関数呼び出しの際の余計な引数のmoveはemit.mlにおいてshuffle関数で消える 
  - Color.mlで消えるmoveもemit.mlでx=yの場合で消える

  - mini-tigerにおけるproc_entry_exit3の部分は, emit.mlのCallCls, CallDirの部分に相当
  - TODO: proc_entry_exit2の処理
  - TODO: if-elseの分岐において, 直後の処理にもラベルをつける (instrs_to_grpahでバグる)
  *)