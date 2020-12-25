module reg_file
(input wire clk,
 input wire we,
 input wire [5:0] wa,
 input wire [31:0] wd,
 input wire [5:0] ra1,
 output wire [31:0] rd1,
 input wire [5:0] ra2,
 output wire [31:0] rd2);

(* ram_style = "distributed" *)reg [31:0] RAM [0:63];

integer i;
initial for (i=0; i<64; i=i+1) RAM[i] = 0;

 always @(posedge clk) begin
   if (we) begin
       RAM[wa] <= wd;
   end
 end

 assign rd1 = (ra1 == wa && we == 1'b1) ? wd : RAM[ra1];
 assign rd2 = (ra2 == wa && we == 1'b1) ? wd : RAM[ra2];

endmodule