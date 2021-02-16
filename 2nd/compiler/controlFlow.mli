type flowgraph = {
  control: Graph.graph;
  def: (Id.t * Type.t) list Graph.Table.t;
  use: (Id.t * Type.t) list Graph.Table.t;
  ismove: bool Graph.Table.t
}

val instrs_to_graph: Block.t list -> (flowgraph * Graph.node list)

val controlFlow_debug: out_channel -> (flowgraph * Graph.node list) -> unit