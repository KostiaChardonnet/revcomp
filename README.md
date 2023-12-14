# reversibleComputing

First, move to the dune project folder.

```
cd ./revcomp
```

And install the necessary libraries.

```
opam install ppx_deriving
```

## Build

```
dune build
```

## Build & Run

```
dune exec revcomp
```

## Use

Type expressions <expr> in the following syntax:

```
<id> ::= lowercase alphanumeric

<value> ::=
  | true
  | false
  | <id>
  | ()
  | (<term>, <term>)
  | #l <term>
  | #r <term>
  | fold <term>

<pattern> ::=
  | <id>
  | (<pattern>, <pattern>)

<expr> ::=
  | <value>
  | let <pattern> = <value> in <expr>
```
