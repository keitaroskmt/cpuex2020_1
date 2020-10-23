//module inst_data_mem_dis (clk,we,a,wd,rd);
//input clk;
//input we;
//input [31:0] a;
//input [31:0] wd;
//output [31:0] rd;
//(*ram_style = "block"*)reg [31:0] RAM [0:8191];

//reg [31:0] rd_reg;

//initial begin
    //$readmemb("inst.mem",RAM,0,8191);
//end

//always @(posedge clk) begin
    //if (we) begin
        //RAM[a] <= wd;
    //end
    //rd_reg <= RAM[a];
//end

//assign rd = rd_reg;

//endmodule

module rams_sp_rf_rst (clk, we, addr, di, dout);
input clk;
input en;
input we;
input rst;
input [9:0] addr;
input [15:0] di;
output [15:0] dout;
(*ram_style = "block"*)reg [31:0] ram [8191:0];
reg [31:0] dout;
initial begin
    $readmemb("inst.mem",ram,0,8191);
end
always @(posedge clk)
begin
 //if (en) //optional enable
 //begin
 if (we) begin //write enable
 ram[addr] <= di;
 //if (rst) //optional reset
 //dout <= 0;
 end else begin
 dout <= ram[addr];
 end
end
//end
endmodule