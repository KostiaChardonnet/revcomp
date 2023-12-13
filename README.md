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

Type terms in the following syntax:

```
<term> ::=
  | id (lowercase alphanumeric)
  | ()
  | (<term>, <term>)
  | left <term>
  | right <term>
  | fold <term>
```
