
module inst_mem_dis_vliw(clk, ra, rd);
input clk;
input [31:0] ra;
output [127:0] rd;
(* ram_style = "distributed" *)reg [127:0] RAM [0:18000];

initial begin
    $readmemb("main_128_200b_vliw_v_2.mem",RAM,0,18000);
end

assign rd = RAM[ra];

endmodule