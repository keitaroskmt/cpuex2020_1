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

