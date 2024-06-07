type id = string [@@deriving show]

type base_type = 
  | One 
  | TypeVar of id
  | Tens of base_type * base_type 
  | Plus of base_type * base_type 
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

type clause = value * expr
  [@@deriving show]

type iso = 
  | Lambda of id * id list * clause list (* identifier * list of lambdas * body *)
  | App of iso * iso
  [@@deriving show]

type term = 
  [ `Var of id 
  | `Unit
  | `Pair of term * term 
  | `InjL of term 
  | `InjR of term 
  | `Let of pattern * term * term 
  | `App of iso * term
  ]
  [@@deriving show]

type prog = iso list
  [@@deriving show]

type typing_ctx = (id * base_type) list
