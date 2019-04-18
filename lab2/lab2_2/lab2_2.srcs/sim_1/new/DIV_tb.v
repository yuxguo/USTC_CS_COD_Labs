`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2019 10:34:11 PM
// Design Name: 
// Module Name: DIV_tb
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


module DIV_tb(

    );
    reg clk,rst;
    initial clk=0;
    initial
    begin
        rst=0;#1;
        rst=1;#1;
        rst=0;
    end
    always #3clk=~clk;
    wire [3:0]q;
    wire [7:0]r;
    reg [3:0]x,y;
    wire done,error;
    DIV #(.WIDTH(4)) U (x,y,rst,clk,r,q,error,done); 
    initial 
    begin
        x=4'd7;
        y=4'd2;
    end
endmodule
