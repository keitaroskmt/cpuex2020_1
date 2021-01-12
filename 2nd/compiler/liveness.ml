type igraph = {
    graph: Graph.graph;
    id2node: Id.t -> Graph.node;
    node2id: Graph.node -> Id.t;
    moves: (Graph.node * Graph.node) list
    }

type liveset = S.t * Id.t list 
type livemap = liveset Graph.Table.t


let union l1 l2 = 
    let rec union_sub = function
    | [] -> [] 
    | x :: rest -> if List.mem x l2 then union_sub rest else x :: (union_sub rest) in
    List.merge Pervasives.compare (union_sub l1) l2

let rec sub l1 l2 = 
    match l1 with
    | [] -> []
    | x :: rest -> if List.mem x l2 then sub rest l2 else x :: (sub rest l2)


let liveness ({control; def; use; ismove} as flowgraph) =
    let nodes = Graph.nodes control in
    let emptyenv = List.fold_left 
        (fun env node -> Graph.Table.add node [] env) Graph.Table.empty nodes in
    let rec loop inenv outenv = 
        let (inenv', outenv') = List.fold_left
            (fun (inenv, outenv) node -> 
                let def = Graph.Table.find node def in
                let use = Graph.Table.find node use in
                let liveout = Graph.Table.find node outenv in
                (* 集合が一致したか判定するためにリストがソート済である必要あり *)
                let livein' = union use (sub liveout def) in
                let liveout' = List.fold_left
                    (fun liveout succ ->
                        union liveout (List.sort Pervasives.compare (Graph.Table.find succ inenv))) liveout (Graph.succ node) in
                let inenv' = Graph.Table.add node livein' inenv in
                let outenv' = Graph.Table.add node liveout' outenv in (inenv', outenv')) 
                (*
                let inenv' = Graph.Table.add node (List.sort livein') inenv in
                let outenv' = Graph.Table.add node (List.sort liveout') outenv in (inenv', outenv')) 
                *)
            (inenv, outenv) nodes in
        if List.forall 
            (fun node -> 
                Graph.Table.find node inenv = Graph.Table.find node inenv' &&
                Graph.Table.find node outenv = Graph.Table.find node outenv') 
            nodes then 
            (inenv', outenv')
        else 
            loop inenv' outenv' in
     
    let (inenv, outenv) = loop emptyenv emptyenv in
    List.fold_left
        (fun livemap node ->
            let livelist = Graph.Table.find node outenv in
            let liveset = List.fold_left (fun set t -> S.add t set) S.empty livelist in
            Graph.Table.add node (liveset, livelist) livemap)
    Graph.Table.empty nodes


let interference_graph ({control; def; use; ismove} as flowgraph) = 
    let livemap = liveness flowgraph in
    let igraph = Graph.new_graph () in
    let add_inode (id2node, node2id) t = 
        if M.mem t id2node then 
            (id2node, node2id) 
        else 
            let inode = Graph.new_node igraph in
            let id2node' = M.add t inode id2node in
            let node2id' = Graph.Table.add inode t node2id in
            (id2node', node2id') in
    let add_iedge n1 n2 = 
        if not (Graph.eq n1 n2) && not (List.exists (Graph.eq n1) (Graph.adj n2)) then
            Graph.mk_edge n1 n2 in

    let rec make_igraph id2node node2id moves = function
    | [] -> {
        graph = igraph;
        id2node = (fun t -> M.find t id2node);
        node2id = (fun node -> Graph.Table.find node node2id);
        moves = List.rev moves
    }
    | node :: rest -> 
        let def = Graph.Table.find node def in
        let use = Graph.Table.find node use in
        let ismove = Graph.Table.find node ismove in
        let (liveset, livelist) = Graph.Table.find node livemap in
        (* def @ use @ livelist? *)
        let (id2node', node2id') = List.fold_left add_inode (id2node, node2id) (def @ use) in
        let moves' = 
            if ismove then 
                let u = M.find (List.hd def) id2node' in
                let v = M.find (List.hd use) id2node' in
                    (u, v) :: moves
            else
                moves in
        let target = 
            if ismove && S.mem (List.hd use) liveset then
                List.filter (fun n -> n <> List.hd use) livelist
            else
                livelist in
        List.iter 
            (fun n ->
                let node = M.find n id2node in
                let target_node = List.map (fun t -> M.find t id2node) target in
                List.iter (add_iedge node) target_node)
            def;
        make_igraph id2node' node2id' moves' rest in
    
    let nodes = Graph.nodes control in
    let igraph = make_igraph  M.empty Graph.Table.empty [] nodes in
    (igraph, fun node -> snd (Graph.Table.find node livemap))
        

(* for debug *)
let rec livemap_debug oc livemap = 
    Printf.fprintf oc "Livemap\n";
    Graph.Table.iter
        (fun node (_, livelist) -> 
            Printf.fprintf oc "%s: \n" (Graph.nodename node);
            List.iter (fun s -> Printf.fprintf oc "%s, " s) livelist;
            Printf.fprintf oc "\n")
    livemap

let rec igraph_debug oc ({graph; id2node; node2id; moves}) =
    Printf.fprintf oc "Interferece graph\n";
    List.iter
        (fun node ->
            let s = Graph.Table.find node node2id in
            Printf.fprintf oc "node: %s\n" s;
            Printf.fprintf oc "\tsucc:";
            List.iter (fun s -> Printf.fprintf oc "%s, " s) 
                (List.map (fun t -> Graph.Table.find t node2id) (succ node));
            Printf.fprintf oc "\tpred:";
            List.iter (fun s -> Printf.fprintf oc "%s, " s) 
                (List.map (fun t -> Graph.Table.find t node2id) (pred node));
        ) 
    (Graph.nodes graph)







            



