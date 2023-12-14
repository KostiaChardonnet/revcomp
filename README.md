# revcomp

Revcomp is a toy functional programming language based on Theseus and
which follows the formalism from the following papers : 

- [Categorical Semantics of Reversible Pattern-Matching](https://arxiv.org/abs/2109.05837)
- [Semantics for a Turing-complete Reversible Programming Language with Inductive Types](https://arxiv.org/abs/2309.12151)

It allows to build first-order reversible functions which the help of
reversible pattern-matching.

# Building the project

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
