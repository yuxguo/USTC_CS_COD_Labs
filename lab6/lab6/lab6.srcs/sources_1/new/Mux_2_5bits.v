`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2019 12:46:16 PM
// Design Name: 
// Module Name: Mux_2_5bits
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


module Mux_2_5bits(
    input [4:0]in0,in1,
    input select,
    output [4:0]out
    );
    assign out = (select == 0) ? in0 : in1;
endmodule
