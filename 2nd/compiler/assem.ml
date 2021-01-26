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

let assem_debug oc l = 
    let rec print_t = function
    | OPER {dst; src; jump} ->
        Printf.fprintf oc "OPER\n";
        Printf.fprintf oc "\tdst: ";
        print_xt_list dst;
        Printf.fprintf oc "\n\tsrc: ";
        print_xt_list src;
        Printf.fprintf oc "\n\tjump; ";
        print_lab_list_op jump;
        Printf.fprintf oc "\n"
    | LABEL {lab} -> 
        Printf.fprintf oc "LABEL\n";
        let Id.L(x) = lab in
        Printf.fprintf oc "\t%s\n" x
    | MOVE {dst; src} ->
        Printf.fprintf oc "MOVE\n";
        Printf.fprintf oc "\tdst: ";
        print_xt_list dst;
        Printf.fprintf oc "\n\tsrc: ";
        print_xt_list src;
        Printf.fprintf oc "\n"

    and print_xt (x, t) = 
        Printf.fprintf oc "(%s, " x;
        Type.print_type oc t;
        Printf.fprintf oc "), "

    and print_xt_list l = 
        Printf.fprintf oc "[";
        let rec print_sub l = 
        (match l with
        | [] -> Printf.fprintf oc "]"
        | xt :: rest -> (print_xt xt; print_sub rest)) in
        print_sub l

    and print_lab_list lab = 
        (match lab with
        | [] -> ()
        | Id.L(x) :: rest -> (Printf.fprintf oc "%s, " x; print_lab_list rest))

    and print_lab_list_op l = 
        Printf.fprintf oc "[";
        (match l with
        | None -> Printf.fprintf oc "None]"
        | Some(x) -> (print_lab_list x; Printf.fprintf oc "]"))

    in
    Printf.fprintf oc "Block-----------------\n";
    List.iter (fun x -> print_t x) l


  (* 
  - 関数呼び出しの際の余計な引数のmoveはemit.mlにおいてshuffle関数で消える 
  - Color.mlで消えるmoveもemit.mlでx=yの場合で消える

  - mini-tigerにおけるproc_entry_exit3の部分は, emit.mlのCallCls, CallDirの部分に相当
  - TODO: codegen内のmunch_argsの処理
  - TODO: proc_entry_exit2の処理
  - TODO: %g0の処理
  *)