// Dual-Port Block RAM Write-First Mode for Register File
// File: rams_sp_wf.v
//register file for 1st architecture
module rams_dp_wf (clk, we, wa, wd, ra, rd);
input clk;
input we;
input [5:0] wa;
input [31:0] wd;
input [5:0] ra;
output [31:0] rd;
(* ram_style = "distributed" *)reg [31:0] RAM [0:63];

integer i;
initial for (i=0; i<64; i=i+1) RAM[i] = 0;

//initial begin
  //  $readmemb("initialize.mem",RAM,0,63);
//end

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
