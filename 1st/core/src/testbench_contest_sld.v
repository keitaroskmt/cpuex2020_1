`default_nettype none

module send_contest_sld#(CLK_PER_HALF_BIT = 435) ( // 115200bits/s
               output reg     txd,
               input wire       clk,
               input wire       rstn);

   localparam e_clk_bit = CLK_PER_HALF_BIT * 2 - 1;

   localparam e_clk_stop_bit = (CLK_PER_HALF_BIT*2*9)/10 - 1;

   reg [7:0]                  txbuf;
   reg [5:0]                  status;
   reg [31:0]                 counter;
   reg [31:0]                 counter2;
   reg [31:0]                 count;
   reg                        next;
   reg                        fin_stop_bit;
   reg                        rst_ctr;
   reg                        tx_start;
   reg [31:0]                 ra;
   wire [7:0]                 rd;

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
   localparam s_Start = 11;

   rams_dp_wf2 sld(clk,ra,rd);

   // generate event signal
   always @(posedge clk) begin
      if (~rstn) begin
         counter <= 0;
         next <= 0;
         fin_stop_bit <=0;
         counter2 <= 0;
      end else begin
         if (counter == e_clk_bit || rst_ctr) begin
            counter <= 0;
         end else begin
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
         counter2 <= counter2 + 1;
      end
   end

   always @(posedge clk) begin
      if (~rstn) begin
         txbuf <= 8'b0;
         status <= s_Start;
         rst_ctr <= 0;
         txd <= 1;
         ra <= 0;
         tx_start <= 1'b0;
         count <= 0;
      end else begin
         rst_ctr <= 0;
         if (status==s_Start && counter2==32'd1400000)begin
            txbuf <= rd;
            status <= s_start_bit;
            rst_ctr <= 1;
            txd <= 0;
            ra <= ra + 1;
            tx_start <= 1'b0;
            count <= count + 1;
         end else if(status==s_Start) begin

         end else if (status == s_idle) begin
            if (tx_start) begin
               txbuf <= rd;
               status <= s_start_bit;
               rst_ctr <= 1;
               txd <= 0;
               ra <= ra + 1;
               tx_start <= 1'b0;
               count <= count + 1;
            end else if( counter2 == 32'd1000) begin
               tx_start <= 1'b1;
            end
         end else if (status == s_stop_bit) begin
            if (fin_stop_bit) begin
               txd <= 1;
               status <= s_idle;
               counter2 <= 0;
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
