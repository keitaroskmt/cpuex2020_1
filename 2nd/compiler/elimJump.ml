open Assem

let rec jump_label list env = 
    match list with
    | [] -> env
    | inst :: [] -> env
    | inst :: rest -> 
        let env' = 
            (match inst with
            | Label(l) -> 
                let next = List.hd rest in
                (match next with
                | J(s) -> M.add l s env
                | _ -> env)
            | _ -> env) in
        jump_label rest env'

let rec pursue_jump l env = 
    if M.mem l env then
        pursue_jump (M.find l env) env
    else
        l

let f list = 
    let env = jump_label list M.empty in
    let list' = 
        List.fold_left
            (fun ret inst -> 
                (match inst with
                | J(l) -> (J(pursue_jump l env) :: ret)
                | Beq(x, y, l) -> (Beq(x, y, (pursue_jump l env)) :: ret)
                | Beqi(x, y, l) -> (Beqi(x, y, (pursue_jump l env)) :: ret)
                | Bne(x, y, l) -> (Bne(x, y, (pursue_jump l env)) :: ret)
                | Blt(x, y, l) -> (Blt(x, y, (pursue_jump l env)) :: ret)
                | Blti(x, y, l) -> (Blti(x, y, (pursue_jump l env)) :: ret)
                | FBeq(x, y, l) -> (FBeq(x, y, (pursue_jump l env)) :: ret)
                | FBne(x, y, l) -> (FBne(x, y, (pursue_jump l env)) :: ret)
                | FBlt(x, y, l) -> (FBlt(x, y, (pursue_jump l env)) :: ret)
                | _ -> inst :: ret)
            )
        [] list in
    List.rev list'