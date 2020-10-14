`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/25/2020 07:21:41 PM
// Design Name: 
// Module Name: multiplexer_32
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module multiplexer_32(
    input [31:0] inp1,
    input [31:0] inp2,
    input selector,
    output [31:0] y
    );
    assign y = selector ? inp2 : inp1;
endmodule

