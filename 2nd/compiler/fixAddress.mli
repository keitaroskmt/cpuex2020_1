val hp_init : int ref

val global_address : (Id.t * (int * Type.t)) list ref
val global_data : (int * int32) list ref

val f : KNormal.t -> KNormal.t