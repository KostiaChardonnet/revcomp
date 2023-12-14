%token EOF
%token EOL
%token <string> ID
%token COMMA
%token LEFT_PAR
%token RIGHT_PAR
%token FOLD
%token LET
%token IN
%token TRUE
%token FALSE
%token LEFT
%token RIGHT
%token EQ
%token EQQ
%token BAR

%start <Ast.expr> main

%%

main: t = expr { t }

value:
| TRUE { `InjL `Unit }
| FALSE { `InjR `Unit }
| LEFT_PAR; RIGHT_PAR { `Unit }
| LEFT_PAR; t=value; COMMA; u=value; RIGHT_PAR
  { `Pair (t, u) }
| LEFT; t = value { `InjL t }
| RIGHT; t = value { `InjR t }
| FOLD; t = value { `Fold t }
| x = ID { `Var x }

pattern:
| x = ID { Ast.PVar x }
| LEFT_PAR; p1=pattern; p2=pattern; RIGHT_PAR
  { Ast.PPair (p1, p2) }

expr:
| v=value { Ast.EVal v }
| LET; p=pattern; EQ; v=value; IN; e=expr
  { Ast.ELet (p, v, e) }

eqq:
| v=value; EQQ; e=expr { (v, e) }

iso:
| i=separated_nonempty_list(BAR, eqq) { i }

term:
| v=value { v }
| LET; p=pattern; EQ; t=term; IN; u=term
  { `Let (p, t, u) }
| i=iso; t=term
  { `App (i, t) }

def:
| f=ID; l=list(ID); i=iso
  { (f, l, i) }

prog:
| l=nonempty_list(def); t=term
  { (l, t) }
