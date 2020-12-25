
module inst_mem_dis (clk, ra, rd);
input clk;
input [31:0] ra;
output [31:0] rd;
(* ram_style = "distributed" *)reg [31:0] RAM [0:15000];

//integer i;
//initial for (i=0; i<64; i=i+1) RAM[i] = 0;

initial begin
    $readmemb("main1.mem",RAM,0,15000);
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

//always @(posedge clk) begin
    //if (we) begin
        //RAM[wa] <=  wd;
    //end
//end

assign rd = RAM[ra];

endmodule
