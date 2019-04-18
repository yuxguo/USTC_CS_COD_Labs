`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/21 11:59:58
// Design Name: 
// Module Name: FIB_tb
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


module FIB_tb(

);
    reg [7:0]f0,f1;
    reg clk,rst;
    wire [15:0]fn;
    FIB U (f0,f1,clk,rst,fn);
    initial clk=0;
    always #2 clk=~clk;
    initial 
    begin
        f0=8'd1;#50;
        f0=8'd10;#30;
    end

    initial 
    begin
        f1=8'd1;#50;
        f1=8'd2;#30;
    end

    initial 
    begin
        rst=1;#1;
        rst=0;#29;
        rst=1;#1;
        rst=0;#19;
        rst=1;#1;
        rst=0;
    end

    initial 
    begin

    end
endmodule
