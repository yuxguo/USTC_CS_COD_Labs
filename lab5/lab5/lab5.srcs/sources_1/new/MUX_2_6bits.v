`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2019 09:02:31 AM
// Design Name: 
// Module Name: MUX_2_6bits
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
