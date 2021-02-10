module reg_file_vliw
(input wire clk,
 input wire we1,
 input wire [5:0] wa1,
 input wire [31:0] wd1,
 input wire [5:0] ra11,
 output wire [31:0] rd11,
 input wire [5:0] ra21,
 output wire [31:0] rd21,
 input wire we2,
 input wire [5:0] wa2,
 input wire [31:0] wd2,
 input wire [5:0] ra12,
 output wire [31:0] rd12,
 input wire [5:0] ra22,
 output wire [31:0] rd22,
 input wire we3,
 input wire [5:0] wa3,
 input wire [31:0] wd3,
 input wire [5:0] ra13,
 output wire [31:0] rd13,
 input wire [5:0] ra23,
 output wire [31:0] rd23,
 input wire we4,
 input wire [5:0] wa4,
 input wire [31:0] wd4,
 input wire [5:0] ra14,
 output wire [31:0] rd14,
 input wire [5:0] ra24,
 output wire [31:0] rd24
 );

(* ram_style = "distributed" *)reg [31:0] RAM [0:63];

integer i;
initial for (i=0; i<64; i=i+1) RAM[i] = 0;

 always @(posedge clk) begin
   if (we1) begin
       RAM[wa1] <= wd1;
   end
   if (we2) begin
       RAM[wa2] <= wd2;
   end
   if (we3) begin
       RAM[wa3] <= wd3;
   end
   if (we4) begin
       RAM[wa4] <= wd4;
   end
 end

 assign rd11 = (ra11 == wa1 && we1 == 1'b1) ? wd1
               :((ra11 == wa2 && we2 == 1'b1) ? wd2
               :((ra11 == wa3 && we3 == 1'b1) ? wd3
               :((ra11 == wa4 && we4 == 1'b1) ? wd4
                : RAM[ra11])));
 assign rd21 = (ra21 == wa1 && we1 == 1'b1) ? wd1
               :((ra21 == wa2 && we2 == 1'b1) ? wd2
               :((ra21 == wa3 && we3 == 1'b1) ? wd3
               :((ra21 == wa4 && we4 == 1'b1) ? wd4
                : RAM[ra21])));
 assign rd12 = (ra12 == wa1 && we1 == 1'b1) ? wd1
               :((ra12 == wa2 && we2 == 1'b1) ? wd2
               :((ra12 == wa3 && we3 == 1'b1) ? wd3
               :((ra12 == wa4 && we4 == 1'b1) ? wd4
                : RAM[ra12])));
 assign rd22 = (ra22 == wa1 && we1 == 1'b1) ? wd1
               :((ra22 == wa2 && we2 == 1'b1) ? wd2
               :((ra22 == wa3 && we3 == 1'b1) ? wd3
               :((ra22 == wa4 && we4 == 1'b1) ? wd4
                : RAM[ra22])));
 assign rd13 = (ra13 == wa1 && we1 == 1'b1) ? wd1
               :((ra13 == wa2 && we2 == 1'b1) ? wd2
               :((ra13 == wa3 && we3 == 1'b1) ? wd3
               :((ra13 == wa4 && we4 == 1'b1) ? wd4
                : RAM[ra13])));
 assign rd23 = (ra23 == wa1 && we1 == 1'b1) ? wd1
               :((ra23 == wa2 && we2 == 1'b1) ? wd2
               :((ra23 == wa3 && we3 == 1'b1) ? wd3
               :((ra23 == wa4 && we4 == 1'b1) ? wd4
                : RAM[ra23])));
 assign rd14 = (ra14 == wa1 && we1 == 1'b1) ? wd1
               :((ra14 == wa2 && we2 == 1'b1) ? wd2
               :((ra14 == wa3 && we3 == 1'b1) ? wd3
               :((ra14 == wa4 && we4 == 1'b1) ? wd4
                : RAM[ra14])));
 assign rd24 = (ra24 == wa1 && we1 == 1'b1) ? wd1
               :((ra24 == wa2 && we2 == 1'b1) ? wd2
               :((ra24 == wa3 && we3 == 1'b1) ? wd3
               :((ra24 == wa4 && we4 == 1'b1) ? wd4
                : RAM[ra24])));


endmodule