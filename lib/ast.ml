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
  [ `Var of id
  | `Unit 
  | `Pair of value * value 
  | `InjL of value
  | `InjR of value 
  | `Fold of value
  ]
  [@@deriving show]

type pattern = 
  | PVar of id 
  | PPair of pattern * pattern
  [@@deriving show]

type expr = 
  | EVal of value
  | ELet of pattern * value * expr 
  [@@deriving show]

type iso = (value * expr) list
  [@@deriving show]

type term = 
  [ `Var of id 
  | `Unit
  | `Pair of term * term 
  | `InjL of term 
  | `InjR of term 
  | `Fold of term
  | `Let of pattern * term * term 
  | `App of iso * term
  ]
  [@@deriving show]

type def = id * (id list) * iso
type prog = def list * term 

type typing_ctx = (id * base_type) list
