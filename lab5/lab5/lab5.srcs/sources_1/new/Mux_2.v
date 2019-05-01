`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2019 08:19:44 AM
// Design Name: 
// Module Name: Mux_2
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


module Mux_2(
    input [31:0]in0,in1,
    input select,
    output [31:0]out
    );
    assign out = (select == 0) ? in0 : in1;
endmodule
