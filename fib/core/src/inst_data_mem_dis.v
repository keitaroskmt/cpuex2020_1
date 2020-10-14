module inst_data_mem_dis (clk,we,a,wd,rd);
input clk;
input we;
input [31:0] a;
input [31:0] wd;
output [31:0] rd;
(*ram_style = "block"*)reg [31:0] RAM [0:8192];

initial begin
    $readmemb("inst.txt",RAM,0,8192);
end

always @(posedge clk) begin 
    if (we) begin
        RAM[a] <= wd;
    end
end

assign rd = RAM[a];

endmodule
