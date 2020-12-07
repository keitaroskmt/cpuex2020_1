// Dual-Port Block RAM Write-First Mode for Register File
// File: rams_sp_wf.v
//register file for 1st architecture
module rams_dp_wf2 (clk, ra, rd);
input wire clk;
input wire [11:0] ra;
output wire [7:0] rd;
(* ram_style = "distributed" *)reg [7:0] RAM [0:1500];

//integer i;
//initial for (i=0; i<64; i=i+1) RAM[i] = 0;

initial begin
    $readmemb("contest_sld.mem",RAM,0,1500);
end

assign rd = RAM[ra];

endmodule
