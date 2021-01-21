type t = 
  | OPER of {
    dst: (Id.t * Type.t) list;
    src: (Id.t * Type.t) list;
    jump: Id.l list option;
  }
  | LABEL of {
    lab: Id.l;
  }
  | MOVE of {
    dst: (Id.t * Type.t) list;
    src: (Id.t * Type.t) list;
  }

  (* 
  - 関数呼び出しの際の余計な引数のmoveはemit.mlにおいてshuffle関数で消える 
  - Color.mlで消えるmoveもemit.mlでx=yの場合で消える

  - mini-tigerにおけるproc_entry_exit3の部分は, emit.mlのCallCls, CallDirの部分に相当
  - TODO: codegen内のmunch_argsの処理
  - TODO: proc_entry_exit2の処理
  *)