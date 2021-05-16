module uart_tx_top (
    input wire clk,
    input wire rstn,
    input wire Tx_start,
    input wire [7:0] data,
    output wire txd
//    output wire tx_busy
);

wire tx_busy;
wire [7:0] sdata;
reg [19:0] counter_core;
reg [19:0] counter_uart;
reg tx_start;
reg [7:0] sdata_reg;
reg [7:0] data_reg;
reg we;
reg [19:0] wa;
reg [1:0] state;

localparam s_idle = 0;
localparam s_start = 1;


uart_tx ut(sdata_reg,tx_start,tx_busy,txd,clk,rstn);
tx_buf tb(clk,we,wa,data_reg,counter_uart,sdata);

always @(posedge clk) begin
    if(~rstn)begin
      counter_core <= 0;
      counter_uart <= 0;
      tx_start <= 0;
      sdata_reg <= 0;
      data_reg <= 0;
      we <= 1'b0;
      state <= s_idle;
    end else begin
        if(Tx_start)begin
          we <= 1'b1;
          data_reg <= data;
          wa <= counter_core;
          if(counter_core == 18'd199999)begin
            counter_core <= 0;
          end else begin
            counter_core <= counter_core + 1;
          end
        end else begin
          we <= 1'b0;
        end
        if((counter_core != counter_uart) && (tx_busy == 1'b0) && (state == s_idle))begin
          state <= s_start;
          sdata_reg <= sdata;
          tx_start <= 1'b1;
          if(counter_uart == 18'd199999)begin
            counter_uart <= 0;
          end else begin
            counter_uart <= counter_uart + 1;
          end
        end else if (state == s_start)begin
          state <= s_idle;
          tx_start <= 1'b0;
        end else begin
          tx_start <= 1'b0;
          state <= s_idle;
        end

    end
end


endmodule