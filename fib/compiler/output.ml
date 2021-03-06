let limit = ref 1000

let rec iter n e = (* 最適化処理をくりかえす (caml2html: main_iter) *)
  Format.eprintf "iteration %d@." n;
  if n = 0 then e else
  let e' = Elim.f (ConstFold.f (Inline.f (Assoc.f (Beta.f e)))) in
  if e = e' then e else
  iter (n - 1) e'

let lexbuf outchan l = (* バッファをコンパイルしてチャンネルへ出力する (caml2html: main_lexbuf) *)
  Id.counter := 0;
  Typing.extenv := M.empty;
  Emit.f outchan
    (RegAlloc.f
       (Simm.f
          (Virtual.f
             (Closure.f
                (iter !limit
                (Cse.f
                   (Alpha.f
                      (KNormal.f
                         (Typing.f
                            (Parser.exp Lexer.token l))))))))))

let string s = lexbuf stdout (Lexing.from_string s) (* 文字列をコンパイルして標準出力に表示する (caml2html: main_string) *)

let syntax_check f =
    let inchan = open_in (f ^ ".ml") in
    let outchan = open_out (f ^ ".synt") in
    try
        Id.counter := 0;
        Typing.extenv := M.empty;
        Syntax.syntax_debug outchan (Parser.exp Lexer.token (Lexing.from_channel inchan));
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
            (iter !limit
               (Alpha.f
                  (KNormal.f
                     (Typing.f
                        (Parser.exp Lexer.token (Lexing.from_channel inchan)))))));
        close_in inchan;
        close_out outchan;
    with e -> (close_in inchan; close_out outchan; raise e)

