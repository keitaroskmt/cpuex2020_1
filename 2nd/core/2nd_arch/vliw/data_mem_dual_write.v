// Dual-Port Block RAM with Two Write Ports
// File: rams_tdp_rf_rf.v
module data_mem_dual_write(clka,clkb,ena,enb,wea,web,addra,addrb,dia,dib,doa,dob);
input clka,clkb,ena,enb,wea,web;
input [31:0] addra,addrb;
input [31:0] dia,dib;
output [31:0] doa,dob;
reg [31:0] ram [140000:0];
reg [31:0] doa,dob;
initial begin
    $readmemb("main_data.mem",ram,0,12000);
end

always @(posedge clka)
begin
 if (ena)
 begin
 if (wea)
 ram[addra] <= dia;
 doa <= ram[addra];
 end
end
always @(posedge clkb)
begin
 if (enb)
 begin
 if (web)
 ram[addrb] <= dib;
 dob <= ram[addrb];
 end
end
endmodule