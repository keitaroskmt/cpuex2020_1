// Single-Port Block RAM Read-First Mode
// rams_sp_rf.v
module rams_sp_rf (clk,en,we, addr, di, dout);

input clk;
input we;
input en;
input [31:0] addr;
input [31:0] di;
output [31:0] dout;


(*ram_style = "block"*)reg [31:0] RAM [400000:0];
reg [31:0] dout;

initial begin
    $readmemb("main_data1.mem",RAM,0,12000);
end

//integer i;
//initial for (i=11001; i<524287; i=i+1) RAM[i] = 0;


always @(posedge clk)
begin
  if (en)
    begin
      if (we) begin
        RAM[addr] <= di;
        //RAM[addr]<=di[7:0];
        //RAM[addr+1]<=di[15:0];
        //RAM[addr+2]<=di[23:16];
        //RAM[addr+3]<=di[31:24];
      end
      //dout <= {RAM[addr+3],RAM[addr+2],RAM[addr+1],RAM[addr]};
      dout <= RAM[addr];
    end
end

endmodule

