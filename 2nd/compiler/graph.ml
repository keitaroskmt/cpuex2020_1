
type noderep = {succ: int list; pred: int list}
type graph = noderep DynArray.t
type node = graph * int

let empty_node = {succ=[]; pred=[]}

let eq ((_, a): node) ((_, b): node) = a = b

let augment (g: graph) (n: int) = (g, n)

let nodes g = 
    let len = DynArray.length g in
    let rec f i = 
        if i = len then [] else (g, i) :: f (i+1) in
    f 0

let succ (g, i) = 
    let {succ; _} = DynArray.get g i in
    List.map (augment g) succ

let pred (g, i) = 
    let {pred; _} = DynArray.get g i in
    List.map (augment g) pred

let adj gi = pred gi @ succ gi

let new_graph () = DynArray.create ()

let new_node g = 
    let i = DynArray.length g in
    DynArray.add g empty_node; (g, i)

exception GraphEdge
let diddle_edge change (g, i) (g', j) =  (* g = g' *)
    let {succ = si; pred = pi} = DynArray.get g i in
    let {succ = sj; pred = pj} = DynArray.get g j in
    DynArray.set g i {succ = change j si; pred = pi};
    DynArray.set g j {succ = sj; pred = change i pj}

let rec delete s t = 
    match t with
    | [] -> raise GraphEdge
    | u :: rest -> if s = u then rest else u :: (delete s rest)

let mk_edge = diddle_edge (fun s t -> s :: t)
let rm_edge = diddle_edge delete

let nodename (g, i) = 
    "node: " ^ string_of_int i
  
module Table =
  Map.Make
    (struct
      type t = node
      let compare (_, i) (_, j) = compare i j 
    end)
