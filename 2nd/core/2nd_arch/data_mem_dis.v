module data_mem_dis (clk, we, a, wd, rd);
input clk;
input we;
input [31:0] a;
input [31:0] wd;
output [31:0] rd;
(* ram_style = "distributed" *)reg [31:0] RAM [0:50000];

//integer i;
//initial for (i=0; i<50001; i=i+1) RAM[i] = 0;

initial begin
    $readmemb("float_fib.mem",RAM,0,50000);
end

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
        RAM[a] <=  wd;
    end
end

assign rd = RAM[a];

endmodule