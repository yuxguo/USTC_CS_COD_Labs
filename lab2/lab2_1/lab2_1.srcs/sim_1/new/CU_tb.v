`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2019 06:52:56 PM
// Design Name: 
// Module Name: CU_tb
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


module CU_tb(

    );
    
    wire [3:0]s0,s1,s2,s3;
    wire done;
    reg clk,rst;
    reg [3:0]x0,x1,x2,x3;
    CU U (x0,x1,x2,x3,rst,clk,s0,s1,s2,s3,done);
    initial clk=0;
    always #5 clk=~clk;
    initial 
    begin
        rst=1;#1;
        rst=0;
    end
    initial 
    begin
        x0=4'd5;
        x1=4'd1;
        x2=4'd3;
        x3=4'd6;
    end
endmodule
