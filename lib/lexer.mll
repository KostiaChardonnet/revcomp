{open Parser}

let id      = ['a'-'z' '0'-'9']+
let space   = [' ' '\t']+
let newline = '\r' | '\n' | "\r\n"

rule read = parse
| '('     { LEFT_PAR }
| ')'     { RIGHT_PAR }
| ','     { COMMA }
| '='     { EQ }
| '|'     { BAR }
| "<->"   { EQQ }
| "true"  { TRUE }
| "false" { FALSE }
| "fold"  { FOLD }
| "let"   { LET }
| "in"    { IN }
| "#l"    { LEFT }
| "#r"    { RIGHT }
| space   { read lexbuf }
| newline { EOL }
| eof     { EOF }
| id      { ID (Lexing.lexeme lexbuf) }
