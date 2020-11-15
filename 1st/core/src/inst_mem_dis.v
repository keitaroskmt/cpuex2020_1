module inst_mem_dis (ra,rd);
input [31:0] ra;
output [31:0] rd;
(*ram_style = "distributed"*)reg [31:0] RAM [0:127];

initial begin
    $readmemb("inst.txt",RAM,0,127);
end

assign rd = RAM[ra];

endmodule
