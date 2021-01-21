type igraph = {
    graph: Graph.graph;
    id2node: (Id.t * Type.t) -> Graph.node;
    node2id: Graph.node -> (Id.t * Type.t);
    moves: (Graph.node * Graph.node) list
    }

module Iset = Set.Make(
    struct
        type t = Id.t * Type.t 
        let compare = compare
    end
)

type liveset = Iset.t * (Id.t * Type.t) list 
type livemap = liveset Graph.Table.t

val liveness: ControlFlow.flowgraph -> livemap
val interference_graph: ControlFlow.flowgraph -> igraph * (Graph.node -> (Id.t * Type.t) list)

val livemap_debug: out_channel -> livemap -> unit
val igraph_debug: out_channel -> igraph -> unit