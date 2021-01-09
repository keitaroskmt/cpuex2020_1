type node' = int

type noderep = {succ: node' list; pred: node' list}

let empty_node = {succ=[]; pred=[]}

type graph = noderep DynArray.t