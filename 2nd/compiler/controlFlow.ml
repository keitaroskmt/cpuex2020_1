type flowgraph = {
  control: Graph.graph;
  def: (Id.t * Type.t) list Graph.Table.t;
  use: (Id.t * Type.t) list Graph.Table.t;
  ismove: bool Graph.Table.t
}


(* Assem.t list -> flowgraph * Graph.node list*)
let instrs_to_graph instrs = 
    let control = Graph.new_graph () in

    (* ラベルとnodeの対応 *)
    let label_map =
        List.fold_left 
            (fun env instr -> 
                (match instr with
                | Assem.LABEL(Id.l(x)) -> M.add x (Graph.new_node control) env
                | _ -> env))
             M.empty instrs in
    let label_node Id.l(x) = 
        try 
            M.find x label_map
        with 
        | Not_found -> failwith "label error occured in controlFlow" in

    let make_edges node succ =
        List.iter (Graph.mk_edge node) succ

    let rec to_graph = function
    | [] -> ({
            control = control;
            def = Graph.Table.empty;
            use = Graph.Table.empty;
            ismove = Graph.Table.empty
            }, [])
    | Assem.OPER {dst; src; jump} :: rest -> 
        let node = Graph.new_node control in
        let({_; def; use; ismove}, nodes) = to_graph rest in
        let succ = 
            (match jump with
            | None -> [List.hd nodes]
            | Some(v) -> List.map label_node v 
            ) in
        mk_edges node succ;
        ({
            control = control;
            def = Graph.Table.add node dst def;
            use = Graph.Table add node src use;
            ismove = Graph.Table add node false ismove
        }, node :: nodes)
    | Assem.LABEL {lab} :: rest ->
        let node = label_node lab in
        let({_; def; use; ismove}, nodes) = to_graph rest in
        mk_edges node [List.hd nodes];
        ({
            control = control;
            def = Graph.Table.add node [] def;
            use = Graph.Table.add node [] use;
            ismove = Graph.Table add node false ismove
        }, node :: nodes)
    | Assem.MOVE {dst; src} :: rest -> 
        let node = Graph.new_node control in
        let({_; def; use; ismove}, nodes) = to_graph rest in
        mk_edges node [List.hd nodes];
        ({
            control = control;
            def = Graph.Table add node dst def;
            use = Graph.Table add node src use;
            ismove = Graph.Table add node true ismove
        }, node :: nodes) in

    to_graph instrs


(* for debug *)
let rec controlFlow_debug oc ({control; def; use; ismove} as flowgraph, flownodes) = 
    match flownodes with
    | [] -> ()
    | node :: rest -> 
        Printf.fprintf oc (Graph.nodename node);
        Printf.fprintf oc "\n";
        Printf.fprintf oc "def: ";
        print_list (Graph.Table.find node def);
        Printf.fprintf oc "use: ";
        print_list (Graph.Table.find node use);
        let s = if (Graph.Table.find node ismove) then "true" else "false" in
        Printf.fprintf oc "ismove: %s\n" s;
        Printf.fprintf oc "%s\n" e2)
and print_list oc l = 
    match l with 
    | [] -> Printf.fprintf oc "\n";
    | (x, t) :: rest -> Printf.fprintf oc "%s " x; print_list oc rest






