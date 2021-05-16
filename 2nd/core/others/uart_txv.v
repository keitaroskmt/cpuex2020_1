module uart_txv (
    input wire clk,
    input wire rstn,
    output wire txd
);

reg tx_start;
reg [31:0] sdata;

always @(posedge clk) begin
  if(~rstn)begin
    tx_start <= 1'b1;
    sdata <= 32'd65536;
  end else begin
    tx_start <= 1'b0;
  end
end

wire tx_busy;

uart_tx ut(sdata,tx_start,tx_busy,txd,clk,rstn);

endmodule