type base_type = 
| One 
| TypeVar of string
| Tens of base_type * base_type 
| Plus of base_type * base_type 
| Mu of TypeVar * base_type

type iso_type = 
| Iso of base_type * base_type

type id = string

type values = 
| Var of id
| Unit 
| Pair of values * values 
| InjL of values 
| InjR of values 
| Fold of values

type pattern = 
| PVar of id 
| PPair of pattern * pattern

type expression = 
| EVal of values 
| ELet of pattern * values * expression 

type iso = (values * expression) list

type terms = 
| TVar of id 
| TUnit
| TPair of terms * terms 
| TInjL of terms 
| TInjR of terms 
| Fold of terms
| TLet of pattern * terms * terms 
| TApp of iso * terms 

type typing_ctx = (id * base_type) list