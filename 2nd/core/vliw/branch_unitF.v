`timescale 1ns / 100ps
`default_nettype none

module branch_unitF
    (input wire [5:0] Op,
     input wire branch_prediction,
     output wire branch_type,
     output wire [1:0] branch_predicted);

     assign {branch_predicted,branch_type} = (Op == 6'b100000 || Op == 6'b100001)  ? 3'b010 //jal,jump
                    : ((Op == 6'b100100 || Op == 6'b100101 || Op == 6'b100110) ? {branch_prediction,2'b01} //beq,bne,blt
                    : ((Op == 6'b100111 || Op == 6'b101000 || Op == 6'b101001) ? {branch_prediction,2'b01} //fbeq,fbne,fblt
                    : ((Op == 6'b110000 || Op == 6'b111000) ? {branch_prediction,branch_prediction,1'b0} //beqi,blti
                    : 3'b000)));

endmodule