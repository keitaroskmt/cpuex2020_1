type igraph = {
    graph: Graph.graph;
    id2node: (Id.t * Type.t) -> Graph.node;
    node2id: Graph.node -> (Id.t * Type.t);
    moves: (Graph.node * Graph.node) list
    }

module Lset: Set.S with type elt = Id.t * Type.t

type liveset = Lset.t * (Id.t * Type.t) list 
type livemap = liveset Graph.Table.t

val liveness: ControlFlow.flowgraph -> livemap
val interference_graph: ControlFlow.flowgraph -> igraph * (Graph.node -> (Id.t * Type.t) list)

val livemap_debug: out_channel -> livemap -> unit
val igraph_debug: out_channel -> igraph -> unit