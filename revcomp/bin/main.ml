open Revcomp

let rec repl () =
  let lexbuf = Lexing.from_channel stdin in
  let t = Parser.main Lexer.read lexbuf in
  Format.printf "%a\n" Ast.pp_expr t;
  Format.print_flush ();
  repl ()

let () = repl ()
