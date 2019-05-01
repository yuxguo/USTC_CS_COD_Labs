`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/28/2019 07:14:00 PM
// Design Name: 
// Module Name: RegFile
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


module Reg_File(
    input [4:0]ra0,ra1,ra2,wa,
    input [31:0]wd,
    input we,rst,clk,
    output [31:0]rd0,rd1,rd2
    );
    reg [31:0]rf[31:0];
    always @ (posedge clk or posedge rst)
    begin
        if (rst)
        begin
            rf[0]=0;
            rf[1]=0;
            rf[2]=0;
            rf[3]=0;
            rf[4]=0;
            rf[5]=0;
            rf[6]=0;
            rf[7]=0;
            rf[8]=0;
            rf[9]=0;
            rf[10]=0;
            rf[11]=0;
            rf[12]=0;
            rf[13]=0;
            rf[14]=0;
            rf[15]=0;
            rf[16]=0;
            rf[17]=0;
            rf[18]=0;
            rf[19]=0;
            rf[20]=0;
            rf[21]=0;
            rf[22]=0;
            rf[23]=0;
            rf[24]=0;
            rf[25]=0;
            rf[26]=0;
            rf[27]=0;
            rf[28]=0;
            rf[29]=0;
            rf[30]=0;
            rf[31]=0;
        end
        else
        begin
            if (we)
            begin
                rf[wa]=wd;
                rf[0]=0;
            end
        end
    end
    assign rd0=rf[ra0];
    assign rd1=rf[ra1];
    assign rd2=rf[ra2];
endmodule
