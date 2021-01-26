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
                | Assem.LABEL {lab = Id.L(x)} -> M.add x (Graph.new_node control) env
                | _ -> env))
             M.empty instrs in
    let label_node (Id.L(x)) = 
        try 
            M.find x label_map
        with 
        | Not_found -> failwith "label error occured in controlFlow" in

    let make_edges node succ =
        List.iter (Graph.mk_edge node) succ in

    (* for debug *)
    (* 
    M.iter (fun l -> fun x -> Printf.fprintf stdout "key: %s, value: %s\n" l (Graph.nodename x)) label_map;
    *)

    let rec to_graph instrs = 

    match instrs with
    | [] -> ({
            control = control;
            def = Graph.Table.empty;
            use = Graph.Table.empty;
            ismove = Graph.Table.empty
            }, [])
    | Assem.OPER {dst; src; jump} :: rest -> 
        let node = Graph.new_node control in
        let ({control; def; use; ismove}, nodes) = to_graph rest in
        let succ = 
            (match jump with
            | None -> (try [List.hd nodes] with Failure(hd) -> [])
            | Some(v) -> List.map label_node v 
            ) in
        make_edges node succ;
        ({
            control = control;
            def = Graph.Table.add node dst def;
            use = Graph.Table.add node src use;
            ismove = Graph.Table.add node false ismove
        }, node :: nodes)
    | Assem.LABEL {lab} :: rest ->
        let node = label_node lab in
        let ({control; def; use; ismove}, nodes) = to_graph rest in
        make_edges node (try [List.hd nodes] with Failure(hd) -> []);
        ({
            control = control;
            def = Graph.Table.add node [] def;
            use = Graph.Table.add node [] use;
            ismove = Graph.Table.add node false ismove
        }, node :: nodes)
    | Assem.MOVE {dst; src} :: rest -> 
        let node = Graph.new_node control in
        let ({control; def; use; ismove}, nodes) = to_graph rest in
        make_edges node (try [List.hd nodes] with Failure(hd) -> []);
        ({
            control = control;
            def = Graph.Table.add node dst def;
            use = Graph.Table.add node src use;
            ismove = Graph.Table.add node true ismove
        }, node :: nodes) in

    let ret = to_graph instrs in

    (* for debug *)
    (* 
     Graph.graph_debug stdout control; 
     List.iter (fun x -> Printf.fprintf stdout "%s\n" (Graph.nodename x)) (snd ret);
     *)

     ret


(* for debug *)
let controlFlow_debug oc ({control; def; use; ismove}, flownodes) = 
    let rec print_nodes = function
        | [] -> ()
        | node :: rest -> 
        (
            Printf.fprintf oc "Node %s\n" (Graph.nodename node);
            Printf.fprintf oc "\tdef: ";
            print_list oc (Graph.Table.find node def);
            Printf.fprintf oc "\tuse: ";
            print_list oc (Graph.Table.find node use);
            let s = if (Graph.Table.find node ismove) then "true" else "false" in
            Printf.fprintf oc "\tismove: %s\n" s;

            Printf.fprintf oc "\tsucc: ";
            print_node_list (Graph.succ node);
            Printf.fprintf oc "\tpred: ";
            print_node_list (Graph.pred node);
            print_nodes rest
        )

    and print_list oc l = 
        let rec print_list_sub l = 
        match l with 
        | [] -> Printf.fprintf oc "]\n";
        | (x, t) :: rest ->
        (
            Printf.fprintf oc "(%s, " x;
            Type.print_type oc t;
            Printf.fprintf oc "), ";
            print_list_sub rest
        )
        in
        Printf.fprintf oc "[";
        print_list_sub l

    and print_node_list l = 
        let rec print_list_sub l = 
        match l with
        | [] -> Printf.fprintf oc "]\n"
        | x :: rest -> (Printf.fprintf oc "%s, " (Graph.nodename x); print_list_sub rest)
        in 
        Printf.fprintf oc "[";
        print_list_sub l

    in

    print_nodes flownodes







