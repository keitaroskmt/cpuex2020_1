open Assem

(* 
bnei_else.7616ではなく, bnei_cont.7613にとびたい

   beqi    %v0, 0, bnei_else.7616
   ...
   j   bnei_cont.7613
bnei_else.7616:
bnei_cont.7617:
   j   bnei_cont.7613
*)

let rec next_inst list l env = 
    match list with
    | [] -> env
    | _ -> 
        let next = List.hd list in
        (match next with
        | J(s) -> M.add l s env
        | Label(_) -> next_inst (List.tl list) l env
        | _ -> env)

let rec jump_label list env = 
    match list with
    | [] -> env
    | inst :: rest -> 
        let env' = 
            (match inst with
            | Label(l) -> next_inst rest l env
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