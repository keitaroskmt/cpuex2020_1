type igraph = {
    graph: Graph.graph;
    id2node: Id.t -> Graph.node;
    node2id: Graph.node -> Id.t;
    moves: (Graph.node * Graph.node) list
    }

type liveset = S.t * Id.t list 
type livemap = liveset Graph.Table.t

val liveness: ControlFlow.flowgraph -> livemap
val interference_graph: ControlFlow.flowgraph -> igraph * (Graph.node -> Id.t list)

val livemap_debug: out_channel -> livemap -> unit
val igraph_debug: out_channel -> igraph -> unit