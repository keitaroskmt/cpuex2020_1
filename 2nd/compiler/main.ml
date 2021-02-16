open Output

let string s = lexbuf (stdout, stdout) (Lexing.from_string s) (* 文字列をコンパイルして標準出力に表示する (caml2html: main_string) *)


let file f = (* ファイルをコンパイルしてファイルに出力する (caml2html: main_file) *)
 (let inchan = open_in (f ^ ".ml") in
  let outchan = open_out (f ^ ".s") in
  let datachan = open_out (f ^ "_data.mem") in
  try
    lexbuf (outchan, datachan) (Lexing.from_channel inchan);
    close_in inchan;
    close_out outchan;
    close_out datachan;
  with
  | e -> (close_in inchan; close_out outchan; close_out datachan; raise e))
  (*syntax_check f;
  knormal_check f;
  alpha_check f;
  cse_check f;
  iter_check f;
  closure_check f*)

let () = (* ここからコンパイラの実行が開始される (caml2html: main_entry) *)
  let files = ref [] in
  Arg.parse
    [("-inline", Arg.Int(fun i -> Inline.threshold := i), "maximum size of functions inlined");
     ("-iter", Arg.Int(fun i -> limit := i), "maximum number of optimizations iterated")]
    (fun s -> files := !files @ [s])
    ("Mitou Min-Caml Compiler (C) Eijiro Sumii\n" ^
     Printf.sprintf "usage: %s [-inline m] [-iter n] ...filenames without \".ml\"..." Sys.argv.(0));
  List.iter
    (fun f -> ignore (file f))
    !files
