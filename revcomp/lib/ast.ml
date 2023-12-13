type id = string [@@deriving show]

type base_type = 
  | One 
  | TypeVar of id
  | Tens of base_type * base_type 
  | Plus of base_type * base_type 
  | Mu of id * base_type
  [@@deriving show]

type iso_type = 
  | Iso of base_type * base_type
  [@@deriving show]

type value = 
  | Var of id
  | Unit 
  | Pair of value * value 
  | InjL of value
  | InjR of value 
  | Fold of value
  [@@deriving show]

type pattern = 
  | PVar of id 
  | PPair of pattern * pattern
  [@@deriving show]

type expression = 
  | EVal of value
  | ELet of pattern * value * expression 
  [@@deriving show]

type iso = (value * expression) list
  [@@deriving show]

type term = 
  | TVar of id 
  | TUnit
  | TPair of term * term 
  | TInjL of term 
  | TInjR of term 
  | Fold of term
  | TLet of pattern * term * term 
  | TApp of iso * term
  [@@deriving show]

type typing_ctx = (id * base_type) list
