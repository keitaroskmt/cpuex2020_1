module uart_tx_top_bl (
    input wire clk,
    input wire rstn,
    input wire In,
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
reg en;
reg [1:0] state1;
reg [1:0] state2;
reg In_first;

localparam s_idle = 0;
localparam s_wait = 1;
localparam s_wrote = 2;
localparam s_start = 3;


uart_tx ut(sdata_reg,tx_start,tx_busy,txd,clk,rstn);
tx_buf_bl tbb(clk,en,en,we,wa,counter_uart,data_reg,sdata);

always @(posedge clk) begin
    if(~rstn)begin
      en <= 1'b1;
      counter_core <= 0;
      counter_uart <= 0;
      tx_start <= 0;
      sdata_reg <= 0;
      data_reg <= 0;
      we <= 1'b0;
      state1 <= s_idle;
      state2 <= s_idle;
    end else begin
        if (In && In_first == 1'b0) begin
            counter_core <= 1'b1;
            In_first <= 1'b1;
        end else if(state1 == s_idle)begin
            if(Tx_start)begin
            we <= 1'b1;
            data_reg <= data;
            wa <= counter_core;
            state1 <= s_wait;
            end
        end else if(state1 == s_wait)begin
            we <= 1'b0;
            state1 <= s_wrote;
        end else if(state1 == s_wrote) begin
            state1 <= s_idle;
            if(counter_core == 19'd199999)begin
                counter_core <= 0;
            end else begin
                counter_core <= counter_core + 1;
            end
        end
        if((counter_core != counter_uart) && (tx_busy == 1'b0) && (state2 == s_idle))begin
            state2 <= s_start;
            sdata_reg <= sdata;
            tx_start <= 1'b1;
            if(counter_uart == 19'd199999)begin
                counter_uart <= 0;
            end else begin
                counter_uart <= counter_uart + 1;
            end
        end else if (state2 == s_start)begin
            state2 <= s_idle;
            tx_start <= 1'b0;
        end else begin
            tx_start <= 1'b0;
            state2 <= s_idle;
        end

    end
end


endmodule