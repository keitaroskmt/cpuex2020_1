type nodeSets =
    | Precolored
    | Initial
    | Simplify
    | Freeze
    | Spill
    | Spilled
    | Coalesced
    | Colored
    | Stack

type moveSets = 
    | Coalesced
    | Constrained
    | Frozen
    | Worklist
    | Active


type cnode = {
    node: Graph.node;
    n: int;
    mutable nset: nodeSets
}

type move = {
    dst: cnode;
    src: cnode;
    mutable mset: moveSets 
}

module Cset = Set.Make(
    struct
        type t = cnode
        let compare = compare
    end
)

let union l1 l2 = 
    let rec union_sub = function
    | [] -> [] 
    | x :: rest -> if List.mem x l2 then union_sub rest else x :: (union_sub rest) in
    List.merge compare (union_sub l1) l2


(* allocation: key Id.t value Id.tのmap *)
(* registers: レジスタのlist *)
let color Liveness.{graph; id2node; node2id; moves} spill_cost allocation (registers, fregisters) = 
    (* 関数本体は一番下へ *)
    let counter = ref 0 in
    let add_node node set_name =
        let cnode = {node = node; n = !counter; nset = set_name} in
        counter := !counter + 1;
        cnode in

    let add_move dst src set_name = 
        let move = {dst = dst; src = src; mset = set_name} in
        move in

    
    let n = List.length (Graph.nodes graph) in
    let k = List.length registers in(* register size *)

    (* Node sets *)
    (* 干渉グラフの各ノードは, 必ず以下のどれか一つのうちに入る *)
    let precolored = ref [] in
    let initial = ref [] in
    let simplify_worklist = ref [] in
    let freeze_worklist = ref [] in
    let spill_worklist = ref [] in
    let spilled_nodes = ref [] in
    let coalesced_nodes = ref [] in
    let colored_nodes = ref [] in
    let select_stack = ref [] in

    (* Moves sets *)
    let coalesced_moves = ref [] in
    let constrained_moves = ref [] in
    let frozen_moves = ref [] in
    let worklist_moves = ref [] in
    let active_moves = ref [] in

    (* Other data structure *)
    let adjset = Array.make_matrix n n false in
    let adjlist = Array.make n Cset.empty in
    let degree = Array.make n 0 in 
    let move_list = Array.make n [] in
    let alias = Array.make n None in
    let color = Array.make n None in

    (* build *)
    let add_edge u v = 
        if not adjset.(u.n).(v.n) && u <> v then
        (
            adjset.(u.n).(v.n) <- true;
            adjset.(v.n).(u.n) <- true;
            if u.nset <> Precolored then
            (
                adjlist.(u.n) <- Cset.add v adjlist.(u.n);
                degree.(u.n) <- degree.(u.n) + 1
            );
            if v.nset <> Precolored then
            (
                    adjlist.(v.n) <- Cset.add u adjlist.(v.n);
                    degree.(v.n) <- degree.(v.n) + 1
            )
        ) in


    let build () = 
        (* inodeからcnodeへの対応 *)
        let inodeenv = 
            List.fold_left
                (fun env inode ->
                    let (x, t) = node2id inode in
                    let cnode = 
                        if M.mem x allocation then
                        (
                            let cnode' = add_node inode Precolored in
                            precolored := cnode' :: !precolored;
                            color.(cnode'.n) <- Some (M.find x allocation);
                            cnode'
                        )
                        else
                        (
                            let cnode' = add_node inode Initial in
                            initial := cnode' :: !initial;
                            cnode'
                        ) in
                    Graph.Table.add inode cnode env)
                Graph.Table.empty 
                (Graph.nodes graph) in
        (* cnode上で干渉グラフを構成 *)
        List.iter
            (fun inode -> 
                let cnode = Graph.Table.find inode inodeenv in
                List.iter
                    (fun adj -> add_edge cnode (Graph.Table.find adj inodeenv))
                (Graph.adj inode))
            (Graph.nodes graph);
        (* movesの処理 *)
        List.iter
            (fun (u, v) ->
                let u' = Graph.Table.find u inodeenv in
                let v' = Graph.Table.find v inodeenv in
                let m = add_move u' v' Worklist in
                move_list.(u'.n) <- m :: move_list.(u'.n);
                move_list.(v'.n) <- m :: move_list.(v'.n))
            moves in


    (* makeworklist *)
    let node_moves cnode =
        List.filter
            (fun m -> m.mset = Active || m.mset = Worklist)
        move_list.(cnode.n) in

    let move_related cnode = 
        node_moves cnode <> [] in

    let make_worklist () = 
        List.iter
            (fun cnode ->
                if degree.(cnode.n) >= k then
                (
                    cnode.nset <- Spill;
                    spill_worklist := cnode :: !spill_worklist
                )
                else if move_related cnode then
                (
                    cnode.nset <- Freeze; 
                    freeze_worklist := cnode :: !freeze_worklist
                )
                else
                (
                    cnode.nset <- Simplify;
                    simplify_worklist := cnode :: !simplify_worklist
                )
            )
        !initial;
        initial := [] in

    (* simplify *)
    let adjacent cnode = 
        List.filter
            (fun n -> 
                not (List.mem n !select_stack || List.mem n !coalesced_nodes))
        (Cset.elements adjlist.(cnode.n)) in

    let enable_moves cnodes = 
        List.iter
            (fun cnode -> 
                List.iter 
                    (fun m -> 
                        if m.mset = Active then 
                        (
                            active_moves := List.filter (fun x -> x <> m) !active_moves;
                            m.mset <- Worklist;
                            worklist_moves := m :: !worklist_moves)
                    )
                (node_moves cnode))
        cnodes in

    let decrement_degree cnode = 
        let d = degree.(cnode.n) in
            degree.(cnode.n) <- degree.(cnode.n) - 1;
            if d = k then
                enable_moves (cnode :: adjacent cnode);
                spill_worklist := List.filter (fun x -> x <> cnode) !spill_worklist;
                if move_related cnode then
                (
                    cnode.nset <- Freeze;
                    freeze_worklist := cnode :: !freeze_worklist 
                )
                else
                (
                    cnode.nset <- Simplify;
                    simplify_worklist := cnode :: !simplify_worklist
                ) in

    (* まとめてやるか一つずつやるか *)
    let simplify () = 
        List.iter 
            (fun cnode -> 
                select_stack := cnode :: !select_stack;
                cnode.nset <- Stack;
                List.iter decrement_degree (adjacent cnode))
        !simplify_worklist;
        simplify_worklist := [] in

    (* coalesce *)
    let add_worklist cnode =
        if cnode.nset <> Precolored && not (move_related cnode) && degree.(cnode.n) < k then
        (
            freeze_worklist := List.filter (fun x -> x <> cnode) !freeze_worklist;
            cnode.nset <- Simplify;
            simplify_worklist := cnode :: !simplify_worklist
        ) in

    let ok (u: cnode) (v: cnode) = 
        degree.(u.n) < k || u.nset = Precolored || adjset.(u.n).(v.n) in

    let conservative cnodes = 
        let d = 
            List.fold_left 
                (fun n cnode -> if degree.(cnode.n) >= k then n + 1 else n) 0 cnodes in
        d < k in

    let rec get_alias cnode = 
        if cnode.nset = Coalesced then 
            let cnode' = 
               (match alias.(cnode.n) with
                | Some v -> v
                | _ -> failwith "error in get_alias") in
            get_alias cnode'
        else 
            cnode in

    let combine (u: cnode) (v: cnode) = 
        (
        if v.nset = Freeze then 
            freeze_worklist := List.filter (fun x -> x <> v) !freeze_worklist
        else
            spill_worklist := List.filter (fun x -> x <> v) !spill_worklist
        );
        v.nset <- Coalesced;
        coalesced_nodes := v :: !coalesced_nodes;
        alias.(v.n) <- Some u;
        move_list.(u.n) <- move_list.(u.n) @ move_list.(v.n);
        (* TODO: enable_moves [v]; *) 
        List.iter
            (fun t -> add_edge t u; decrement_degree t) (adjacent v);
        if degree.(u.n) >= k && u.nset = Freeze then
        (
            freeze_worklist := List.filter (fun x -> x <> u) !freeze_worklist;
            u.nset <- Spill;
            spill_worklist := u :: !spill_worklist
        ) in

    let coalesce () = 
        match !worklist_moves with
        | [] -> failwith "error in coalesce"
        | ({dst; src; _} as m) :: rest ->
        (
        let x = get_alias src in
        let y = get_alias dst in
        let (u, v) = if y.nset = Precolored then (y, x) else (x, y) in
        worklist_moves := rest;
        if u = v then 
        (
            m.mset <- Coalesced;
            coalesced_moves := m :: !coalesced_moves;
            add_worklist u;
        )
        else if v.nset = Precolored || adjset.(u.n).(v.n) then
        (
            m.mset <- Constrained;
            constrained_moves := m :: !constrained_moves;
            add_worklist u;
            add_worklist v;
        )
        else if (u.nset = Precolored && List.for_all (fun t -> ok t u) (adjacent u)) ||
                 (u.nset <> Precolored && conservative (union (adjacent u) (adjacent v))) then
        (
            m.mset <- Coalesced;
            coalesced_moves := m :: !coalesced_moves;
            combine u v;
            add_worklist u
        )
        else 
        (
            m.mset <- Active;
            active_moves := m :: !active_moves
        )) in

    (* freeze *)
    let freeze_moves cnode = 
        List.iter 
            (fun m ->
                let v = if get_alias cnode = get_alias m.dst then 
                    get_alias m.src else get_alias m.dst in
                active_moves := List.filter (fun x -> x <> m) !active_moves;
                m.mset <- Frozen;
                frozen_moves := m :: !frozen_moves;
                if not (move_related v) && degree.(v.n) < k then
                (
                    freeze_worklist := List.filter (fun x -> x <> v) !freeze_worklist;
                    v.nset <- Simplify;
                    simplify_worklist := v :: !simplify_worklist
                ))
        (node_moves cnode) in

    let freeze () = 
        match !freeze_worklist with
        | [] -> failwith "error in freeze"
        | cnode :: rest ->
        (
        freeze_worklist := rest;
        cnode.nset <- Simplify;
        simplify_worklist := cnode :: !simplify_worklist;
        freeze_moves cnode 
        )in

    let select_spill () = 
        let cost cnode = spill_cost cnode.node in
        (* i >= j <=> cost v[i] >= cost v[j] *)
        (* TODO: costの並びの確認 *)
        match List.sort (fun u v -> cost v - cost u) !spill_worklist with
        | [] -> failwith "select_spill"
        | cnode :: rest -> 
        (
        spill_worklist := rest;
        cnode.nset <- Simplify;
        simplify_worklist := cnode :: !simplify_worklist;
        freeze_moves cnode 
        )in

    (* assign_colors *)
    let assign_colors () = 
        List.iter
            (fun cnode ->
                let (x, t) = node2id cnode.node in
                let ok_colors = 
                    Cset.fold
                        (fun w cset ->
                            let w' = get_alias w in
                            if w'.nset = Colored || w'.nset = Precolored then
                                let cw = 
                                    (match color.(w'.n) with 
                                    | Some(v) -> v
                                    | _ -> failwith "error in assign_colors") in
                                S.remove cw cset
                            else 
                                cset)
                    adjlist.(cnode.n)
                    (S.of_list (if t = Type.Int then registers else fregisters)) in
                if S.is_empty ok_colors then
                (
                    cnode.nset <- Spilled;
                    spilled_nodes := cnode :: !spilled_nodes
                )
                else
                (
                    cnode.nset <- Colored;
                    colored_nodes := cnode :: !colored_nodes;
                    color.(cnode.n) <- Some(S.choose ok_colors);
                ))
        !select_stack;
        select_stack := [];
        List.iter
            (fun cnode -> 
                let alias = get_alias cnode in
                color.(cnode.n) <- color.(alias.n))
        !coalesced_nodes in

    (* body *)
    build ();
    make_worklist ();

    let rec loop () =
        (
        if !simplify_worklist <> [] then simplify ()
        else if !worklist_moves <> [] then coalesce ()
        else if !freeze_worklist <> [] then freeze ()
        else if !spill_worklist <> [] then select_spill ()
        );
        if !simplify_worklist <> [] || !worklist_moves <> [] ||
            !freeze_worklist <> [] || !spill_worklist <> [] then loop () in

    loop ();
    assign_colors ();

    let allocation' = 
        List.fold_left
            (fun alloc cnode ->
                let color = color.(cnode.n) in
                    match color with
                    | Some c -> M.add (fst (node2id cnode.node)) c alloc
                    | _ -> allocation)
        allocation (!colored_nodes @ !coalesced_nodes) in
    let spilled = List.map (fun cnode -> fst (node2id cnode.node)) !spilled_nodes in
        (allocation', spilled)




    


