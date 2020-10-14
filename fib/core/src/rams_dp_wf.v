// Dual-Port Block RAM Write-First Mode for Register File
// File: rams_sp_wf.v
module rams_dp_wf (clk, we, wa, wd, ra, rd);
input clk;
input we;
input [4:0] wa;
input [31:0] wd;
input [4:0] ra;
output [31:0] rd;
(* ram_style = "distributed" *)reg [31:0] RAM [0:31];

integer i;
initial for (i=0; i<32; i=i+1) RAM[i] = 0;

//reg [31:0] rd_reg;
//assign rd = rd_reg;

//always @(posedge clk) begin
//   if (we) begin
//       RAM[wa] <= wd;
//       if (wa == ra) begin
//           rd <= wd;
//       end
//   end else begin
//       rd <= RAM[ra];
//   end
//end
//endmodule

always @(posedge clk) begin
    if (we) begin
        RAM[wa] <=  wd;
    end 
end 

assign rd = RAM[ra];

endmodule
