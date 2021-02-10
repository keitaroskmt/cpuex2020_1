`default_nettype none

module uart_tx #(CLK_PER_HALF_BIT = 391) ( // 115200bits/s 100MHz:435 90MHz:391 75MHz:326
               input wire [7:0] sdata,
               input wire       tx_start,
               output logic     tx_busy,
               output logic     txd,
               input wire       clk,
               input wire       rstn);

   localparam e_clk_bit = CLK_PER_HALF_BIT * 2 - 1;

   localparam e_clk_stop_bit = (CLK_PER_HALF_BIT*2*9)/10 - 1;

   logic [7:0]                  txbuf;
   logic [5:0]                  status;
   logic [31:0]                 counter;
   logic                        next;
   logic                        fin_stop_bit;
   logic                        rst_ctr;

   localparam s_idle = 0;
   localparam s_start_bit = 1;
   localparam s_bit_0 = 2;
   localparam s_bit_1 = 3;
   localparam s_bit_2 = 4;
   localparam s_bit_3 = 5;
   localparam s_bit_4 = 6;
   localparam s_bit_5 = 7;
   localparam s_bit_6 = 8;
   localparam s_bit_7 = 9;
   localparam s_stop_bit = 10;


   // generate event signal
   always @(posedge clk) begin
      if (~rstn) begin
         counter <= 0;
         next <= 0;
         fin_stop_bit <=0;
      end else begin
         if (counter == e_clk_bit || rst_ctr) begin
            counter <= 0;
         end else if (status != s_idle)begin //もとのcodeではs_idle時にcounterは常に動いていて、counterがe_clk_bitになった瞬間にnextを立てていてもs_idle時にはそれを見て状態遷移しないので "問題ない" という実装になっていたが実はcounterがe_clk_bitになったと同時にたまたまtx_startがたち、nextがたつと同時にs_start_bitに状態遷移が行われていると、nextが加味されて次クロックでさらに次の状態へと遷移してしまうこととなり、s_start_bitをe_clk_bit分保つことができない。よってcounterはs_idleに遷移時に0にし、さらにs_idle時にはインクリメントしないという実装に変更。
            counter <= counter + 1;
         end
         if (~rst_ctr && counter == e_clk_bit) begin
            next <= 1;
         end else begin
            next <= 0;
         end
         if (~rst_ctr && counter == e_clk_stop_bit) begin
            fin_stop_bit <= 1;
         end else begin
            fin_stop_bit <= 0;
         end
      end
   end

   always @(posedge clk) begin
      if (~rstn) begin
         txbuf <= 8'd0;
         status <= s_idle;
         rst_ctr <= 0;
         txd <= 1;
         tx_busy <= 0;
      end else begin
         rst_ctr <= 0;
         if (status == s_idle) begin

            if (tx_start) begin
               txbuf <= sdata;
               status <= s_start_bit;
               rst_ctr <= 1;
               txd <= 0;
               tx_busy <= 1;
            end
         end else if (status == s_stop_bit) begin
            if (fin_stop_bit) begin
               txd <= 1;
               status <= s_idle;
               tx_busy <= 0;
               //counter <= 0; //s_idle時はcounterは0に固定
            end
         end else if (next) begin
            if (status == s_bit_7) begin
               txd <= 1;
               status <= s_stop_bit;
            end else begin
               txd <= txbuf[0];
               txbuf <= txbuf >> 1;
               status <= status + 1;
            end
         end
      end
   end
endmodule // uart_tx
`default_nettype wire
