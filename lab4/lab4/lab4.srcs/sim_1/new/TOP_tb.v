`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2019 03:33:07 PM
// Design Name: 
// Module Name: TOP_tb
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


module TOP_tb(
    input clk_in
    );
    wire [3:0]Ro,Bo,Go;
    wire hs,vs;
    
    TOP U (0,0,0,0,clk_in,0,0,4'b0000,4'b0000,4'b0000,Ro,Go,Bo,hs,vs);
    
endmodule
