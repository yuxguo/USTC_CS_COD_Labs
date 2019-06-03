`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2019 08:50:53 PM
// Design Name: 
// Module Name: Input_Driver
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


module Input_Driver(
    input clk,rst,
    input [3:0]in,
    input en_Interrupt,
    output Interrupt,
    output [2:0]mode
    );
    wire [3:0]I;
    wire [2:0]mode0,mode1,mode2,mode3;
    Input_Ctrl #(3'b101) U0 (clk,rst,in[0],I[0],mode0);
    Input_Ctrl #(3'b110) U1 (clk,rst,in[1],I[1],mode1);
    Input_Ctrl #(3'b111) U2 (clk,rst,in[2],I[2],mode2);
    Input_Ctrl #(3'b010) U3 (clk,rst,in[3],I[3],mode3);
    Input_Priority U (I,en_Interrupt,mode0,mode1,mode2,mode3,Interrupt,mode);
    
endmodule
