open Asm
open Assem

(* あまり効果ない *)

let assem_list = ref []

let concat list = assem_list := list @ !assem_list

let rec cut_tail list =   
    match list with
    | [] -> []
    | x :: [] -> []
    | x :: rest -> x :: (cut_tail rest)

let rec g list flag i acm = 
    match list with
    | [] -> concat acm
    | ((Addi(x, y, j)) as inst) :: rest when x = reg_sp && y = reg_sp && flag -> 
    (
        (
        if i = (-1) * j then 
            concat (cut_tail acm)
        else
            concat (inst :: acm)
        );
        g rest false 0 []
    )
    | ((Addi(x, y, j)) as inst) :: rest when x = reg_sp && y = reg_sp && (not flag) -> 
    (
        concat acm;
        g rest true j [inst]
    )
    | inst :: rest -> 
    (
        (match inst with
        | Jr(_) | Jalr(_) | J(_) | Jal(_) | Label(_) 
        | Beq(_) | Beqi(_) | Bne(_) | Blt(_) | Blti(_) | FBeq(_) | FBne(_) | FBlt(_) ->
            concat (inst :: acm);
            g rest false 0 []
        | Add(x, y, z) | Sub(x, y, z) | And(x, y, z) | Or(x, y, z) | Nor(x, y, z) | Sll(x, y, V(z)) | Srl(x, y, V(z)) | Slt(x, y, z) when x = reg_sp || y = reg_sp || z = reg_sp ->
            concat (inst :: acm);
            g rest false 0 []
        | Addi(x, y, _) | Movl(x, y) | Ori(x, y, _) | Sll(x, y, _) | Srl(x, y, _) 
        | Lw(x, _, y) | Sw(x, _, y) when x = reg_sp || y = reg_sp -> 
            concat (inst :: acm);
            g rest false 0 []
        | Ftoi(x, _) | Itof(_, x) | FLw(_, _, x) | FSw(_, _, x) | In(x) | Lui(x, _) | FSlt(x, _, _) when x = reg_sp -> 
            concat (inst :: acm);
            g rest false 0 []
        | _ ->
            if flag then
                g rest flag i (inst :: acm)
            else
            (
                concat (inst :: acm);
                g rest false 0 []))
    )

let f list = 
    assem_list := [];
    g list false 0 [];
    List.rev !assem_list


let test () = 
    let list = 
    [
        Label("bnei_cont");
        Sw("%v0", 124, "%zero");
        Addi("%sp", "%sp", 5);
        Jal("write_ppm_header");
        Addi("%sp", "%sp", -5);
        Addi("%a2", "%zero", 120);
        Addi("%v0", "%zero", 3);
        FMov("%f0", "%fzero");
        Addi("%sp", "%sp", 5);
        Jal("mincaml_create");
        Addi("%sp", "%sp", -5)
    ] in
    assem_debug stdout list;
    Printf.fprintf stdout "\n";
    assem_list := [];
    g list false 0 [];
    assem_debug stdout (List.rev !assem_list)
