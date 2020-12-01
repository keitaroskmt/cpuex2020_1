module send_reset(
    input wire clk,
    input wire rstn,
    output reg reset
);

reg [31:0] counter;

initial begin
  reset = 1'b1;
  counter = 0;
end

always @(posedge clk) begin
    if (counter == 32'd80 || counter == 32'd81 || counter == 32'd82) begin
        reset <= 1'b0;
    end else begin
        reset <= 1'b1;
    end
    counter <= counter + 1;
end

endmodule