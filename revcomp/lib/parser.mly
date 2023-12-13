%token EOF
%token EOL
%token <string> VAR
%token COMMA
%token LEFT_PAR
%token RIGHT_PAR
%token FOLD
%token LET
%token IN
%token LEFT
%token RIGHT

%start <Ast.term> main

%%

main: t = term { t }

term:
| LEFT_PAR; RIGHT_PAR { Ast.TUnit }
| LEFT_PAR; t = term; COMMA; u = term; RIGHT_PAR
  { Ast.TPair (t, u) }
| LEFT; t = term { Ast.TInjL t }
| RIGHT; t = term { Ast.TInjR t }
| FOLD; t = term { Ast.Fold t }
| x = VAR { Ast.TVar x }
