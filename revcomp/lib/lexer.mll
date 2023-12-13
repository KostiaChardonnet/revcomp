{open Parser}

let id      = ['a'-'z' '0'-'9']+
let space   = [' ' '\t']+
let newline = '\r' | '\n' | "\r\n"

rule read = parse
  | '('     { LEFT_PAR }
  | ')'     { RIGHT_PAR }
  | ','     { COMMA }
  | "fold"  { FOLD }
  | "let"   { LET }
  | "in"    { IN }
  | "left"  { LEFT }
  | "right" { RIGHT }
  | space   { read lexbuf }
  | newline { EOL }
  | eof     { EOF }
  | id      { VAR (Lexing.lexeme lexbuf) }
