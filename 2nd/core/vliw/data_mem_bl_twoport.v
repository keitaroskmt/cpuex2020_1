// Simple Dual-Port Block RAM with One Clock
// File: simple_dual_one_clock.v

module data_mem_bl_twoport(clk,ena,enb,wea,addra,addrb,dia,dob);
input clk,ena,enb,wea;
input [31:0] addra,addrb;
input [31:0] dia;
output [31:0] dob;
(*ram_style = "block"*)reg [31:0] ram [140000:0];
reg [31:0] doa,dob;
reg [31:0] dout;

initial begin
    $readmemb("main_128_200b_data.mem",ram,0,12000);
end
always @(posedge clk) begin
    if (ena) begin
        if (wea)
            ram[addra] <= dia;
    end
end
always @(posedge clk) begin
    if (enb)
        dob <= ram[addrb];
end
endmodule