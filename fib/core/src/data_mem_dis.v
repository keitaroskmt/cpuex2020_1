module data_mem_dis (clk,we,a,wd,rd);
input clk;
input we;
input [31:0] a;
input [31:0] wd;
output [31:0] rd;
(*ram_style = "distributed"*)reg [31:0] RAM [0:131071];

integer i;
initial for (i=0; i<131071; i=i+1) RAM[i] = 0;

always @(posedge clk) begin 
    if (we) begin
        RAM[a] <= wd;
    end
end

assign rd = RAM[a];

endmodule
