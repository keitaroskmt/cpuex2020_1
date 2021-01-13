`timescale 1ns / 100ps
`default_nettype none

module branch_unitDEM
    (input wire Branch_predicted, //pc_branchF or pc_plusF
     input wire Branch,
     input wire ToggleEqual,
     input wire [1:0] Blt,
     input wire done_before,
     input wire Hazard_existence,
     input wire signed [31:0] brancha,
     input wire signed [31:0] branchb,
     output wire done_after,
     output wire Branch_dest,
     output wire branch);

     wire done;
    //assign bres = (BltD == 2'b00) ? brancha == branchb    //beq,fbeq,bne,fbne,beqi
                    //:((BltD == 2'b01) ? brancha < branchb  //blt,blti
                    //:((BltD == 2'b10) ? ((brancha[31]==1'b1&&branchb[31]==1'b1) ? brancha > branchb : brancha < branchb)//fblt
                    //:1'b0));

    assign {branch,done} = (!Hazard_existence && Branch && !done_before) ?
                    ((Blt == 2'b00) ? (ToggleEqual ? {(!(brancha == branchb)^Branch_predicted),1'b1} : {((brancha == branchb)^Branch_predicted),1'b1})    //beq,fbeq,bne,fbne,beqi
                    :((Blt == 2'b01) ? {((brancha < branchb)^Branch_predicted),1'b1}  //blt,blti
                    :((Blt == 2'b10) ? ((brancha[31]==1'b1&&branchb[31]==1'b1) ? {((brancha > branchb)^Branch_predicted),1'b1} : {((brancha < branchb)^Branch_predicted),1'b1})//fblt
                    :2'b01)))
                    :2'b00;

    assign Branch_dest = !Branch_predicted; //branch to the opposite way        ex. pc_plus predicted -> pc_branch

    assign done_after = done_before | done;


endmodule