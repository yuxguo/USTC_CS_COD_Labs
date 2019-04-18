`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2019 07:50:16 PM
// Design Name: 
// Module Name: Reg_File_tb
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


module Reg_File_tb(

    );
    wire [3:0]rd0,rd1;
    reg rst,clk,we;
    reg [2:0]ra0,ra1,wa;
    reg [3:0]wd;
    Reg_File U (ra0,ra1,wa,wd,we,rst,clk,rd0,rd1);
    
    initial clk=0;
    always #2 clk=~clk;
    
    initial
    begin
        rst=0;#1;
        rst=1;#1;
        rst=0;
    end
    
    initial 
    begin
        ra0=0;
        ra1=0;
        #11;
        ra0=3;
        ra1=5;
    end
    
    initial 
    begin
        we=0;#10;
        we=1;#2;
        we=0;
    end
    
    initial 
    begin
        wa=0;wd=1;#10;
        wa=3;wd=4;#3;
        wa=0;#2;
    end
    
endmodule
