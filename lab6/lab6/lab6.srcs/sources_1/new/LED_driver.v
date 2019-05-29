`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2019 03:37:53 PM
// Design Name: 
// Module Name: LED_driver
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


module LED_driver(
    input clk_cpu,clk_50khz,rst,en_Interrupt,
    input [31:0]data_in,
    output Interrupt,
    output [2:0]mode,
    output [31:0]addr,
    output [3:0]line,
    output Latch,G,Data_in
    );
    
    wire [15:0]L0,L1,L2,L3,L4,L5,L6,L7,L8,L9,La,Lb,Lc,Ld,Le,Lf;
    LED_Ctrl U1 (clk_cpu,rst,en_Interrupt,data_in,Interrupt,mode,addr,L0,L1,L2,L3,L4,L5,L6,L7,L8,L9,La,Lb,Lc,Ld,Le,Lf);
    LED_Display U2 (L0,L1,L2,L3,L4,L5,L6,L7,L8,L9,La,Lb,Lc,Ld,Le,Lf,clk_50khz,line,Latch,G,Data_in);
endmodule
