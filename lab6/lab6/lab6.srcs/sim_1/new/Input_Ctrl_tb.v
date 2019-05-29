`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2019 08:54:16 PM
// Design Name: 
// Module Name: Input_Ctrl_tb
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


module Input_Ctrl_tb(

    );
    reg clk,rst,in;
    wire I;
    wire [2:0]out;
    initial
    begin
        rst=1;#1
        rst=0;
    end
    initial clk=0;
    always #2 clk=~clk;
    initial
    begin
        in=0;#9;
        in=1;#10;
        in=0;
    end
    Input_Ctrl U (clk,rst,in,I,out);
endmodule
