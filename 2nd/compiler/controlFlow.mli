type flowgraph = {
  control: Graph.graph;
  def: Id.t list Graph.Table.t;
  use: Id.t list Graph.Table.t;
  ismove: bool Graph.Table.t
}

val instrs_to_graph: Assem.t list -> (flowgraph * Graph.node list)

val controlFlow_debug: out_channel -> (flowgraph * Graph.node list) -> unit