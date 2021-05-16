module tx_buf(clk,we,wa,wd,ra,rd);

input clk;
input we;
input [19:0] wa;
input [7:0] wd;
input [19:0] ra;
input [7:0] rd;

reg [7:0] RAM [50000:0];

//integer i;
//initial for (i=11001; i<524287; i=i+1) RAM[i] = 0;


always @(posedge clk) begin
      if (we) begin
        RAM[wa] <= wd;
      end
      //dout <= {RAM[addr+3],RAM[addr+2],RAM[addr+1],RAM[addr]};
end
assign rd = (ra == wa && we == 1'b1) ? wd : RAM[ra];

endmodule

