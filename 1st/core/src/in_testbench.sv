module send_10 #(CLK_PER_HALF_BIT = 5208)
    (input wire clk,
    input wire rstn,
    output logic data);

   localparam e_clk_bit = CLK_PER_HALF_BIT * 2 - 1;

   localparam e_clk_stop_bit = (CLK_PER_HALF_BIT*2*9)/10 - 1;
   logic [31:0] counter;
   logic [9:0] send_data;


    always @(posedge clk) begin
        if(~rstn) begin
          counter <= 0;
          send_data <= 10'd41;
          data <= 1'b1;
        end else begin
          counter <= counter + 1;
          if(counter==e_clk_bit) begin
            counter <= 0;
            data <= send_data[0];
            send_data[8:0] <= send_data[9:1];
          end
        end
    end

endmodule