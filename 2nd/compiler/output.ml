let limit = ref 1000

let rec iter n e = (* 最適化処理をくりかえす (caml2html: main_iter) *)
  Format.eprintf "iteration %d@." n;
  if n = 0 then e else
  let e' = Elim.f (ConstFold.f (Inline.f (Assoc.f (Beta.f (Cse.f e))))) in
  if e = e' then e else
  iter (n - 1) e'

let rec iter_asm n e = 
  Format.eprintf "iteration %d@." n;
  if n = 0 then e else
  (*
  let e' = Constreg.f (Peephole.f (ElimAsm.f (ConstFoldAsm.f e))) in
  let e' = Peephole.f (ElimAsm.f (ConstFoldAsm.f e)) in
  let e' = ElimAsm.f (ConstFoldAsm.f e) in
  let e' = (ConstFoldAsm.f e) in 
  let e' = e in
  *)
  let e' = Constreg.f (Peephole.f (ElimAsm.f (ConstFoldAsm.f e))) in
  if e = e' then e else
  iter_asm (n - 1) e'

let lexbuf (outchan, datachan) l = (* バッファをコンパイルしてチャンネルへ出力する (caml2html: main_lexbuf) *)
  Id.counter := 0;
  Typing.extenv := M.empty;
  EmitAssem.f outchan
    (ReduceSpAdd.f 
        (ElimJump.f 
            (ToAssem.f datachan true (* RegAllocbyColorをまとめる *)
                (iter_asm !limit
                    (Simm.f
                        (Virtual.f
                            (Closure.f
                                (FixAddress.f
                                    (iter !limit
                                        (Alpha.f
                                            (KNormal.f
                                                (Typing.f
                                                    (Parser.exp Lexer.token l)))))))))))))

(*
  Id.counter := 0;
  Typing.extenv := M.empty;
  EmitAssem.f outchan
    (ElimJump.f 
        (ToAssem.f datachan false (* RegAllocをまとめる *)
            (iter_asm !limit
                (Simm.f
                    (Virtual.f
                        (Closure.f
                            (FixAddress.f
                                (iter !limit
                                    (Alpha.f
                                        (KNormal.f
                                            (Typing.f
                                                (Parser.exp Lexer.token l))))))))))))
                                                *)

let syntax_check f =
    let inchan = open_in (f ^ ".ml") in
    let outchan = open_out (f ^ ".synt") in
    try
        Id.counter := 0;
        Typing.extenv := M.empty;
        Typing.syntax_debug outchan (Parser.exp Lexer.token (Lexing.from_channel inchan));
        close_in inchan;
        close_out outchan;
    with e -> (close_in inchan; close_out outchan; raise e)

let knormal_check f =
    let inchan = open_in (f ^ ".ml") in
    let outchan = open_out (f ^ ".knormal") in
    try
        Id.counter := 0;
        Typing.extenv := M.empty;
        KNormal.knormal_debug outchan
            (KNormal.f
                (Typing.f
                    (Parser.exp Lexer.token (Lexing.from_channel inchan))));
        close_in inchan;
        close_out outchan;
    with e -> (close_in inchan; close_out outchan; raise e)

let alpha_check f =
    let inchan = open_in (f ^ ".ml") in
    let outchan = open_out (f ^ ".alpha") in
    try
        Id.counter := 0;
        Typing.extenv := M.empty;
        KNormal.knormal_debug outchan
        (Alpha.f
            (KNormal.f
                (Typing.f
                    (Parser.exp Lexer.token (Lexing.from_channel inchan)))));
        close_in inchan;
        close_out outchan;
    with e -> (close_in inchan; close_out outchan; raise e)

let cse_check f =
    let inchan = open_in (f ^ ".ml") in
    let outchan = open_out (f ^ ".cse") in
    try
        Id.counter := 0;
        Typing.extenv := M.empty;
        KNormal.knormal_debug outchan
        (Cse.f
        (Alpha.f
            (KNormal.f
                (Typing.f
                    (Parser.exp Lexer.token (Lexing.from_channel inchan))))));
        close_in inchan;
        close_out outchan;
    with e -> (close_in inchan; close_out outchan; raise e)

let iter_check f =
    let inchan = open_in (f ^ ".ml") in
    let outchan = open_out (f ^ ".iter") in
    try
        Id.counter := 0;
        Typing.extenv := M.empty;
        KNormal.knormal_debug outchan
        (iter !limit
            (Alpha.f
                (KNormal.f
                    (Typing.f
                        (Parser.exp Lexer.token (Lexing.from_channel inchan))))));
        close_in inchan;
        close_out outchan;
    with e -> (close_in inchan; close_out outchan; raise e)

let closure_check f =
    let inchan = open_in (f ^ ".ml") in
    let outchan = open_out (f ^ ".closure") in
    try
        Id.counter := 0;
        Typing.extenv := M.empty;
        Closure.closure_debug outchan
         (Closure.f
           (FixAddress.f
            (iter !limit
               (Alpha.f
                  (KNormal.f
                     (Typing.f
                        (Parser.exp Lexer.token (Lexing.from_channel inchan))))))));
        close_in inchan;
        close_out outchan;
    with e -> (close_in inchan; close_out outchan; raise e)

