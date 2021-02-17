module Regset : Set.S with type elt = Id.t * Type.t

val use_regs : (string, Regset.t) Hashtbl.t
val init : unit -> unit
val f : Id.t -> Assem.t list -> unit