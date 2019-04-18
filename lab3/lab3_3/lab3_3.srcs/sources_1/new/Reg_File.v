`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2019 08:33:35 PM
// Design Name: 
// Module Name: Reg_File
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
    input [2:0]ra0,ra1,wa,
    input [3:0]wd,
    input we,rst,clk,
    output [3:0]rd0,rd1
    );
    reg [3:0]reg_file[7:0];
    always @ (posedge clk or posedge rst)
    begin
        if (rst)
        begin
            reg_file[0]=10;
            reg_file[1]=10;
            reg_file[2]=10;
            reg_file[3]=10;
            reg_file[4]=10;
            reg_file[5]=10;
            reg_file[6]=10;
            reg_file[7]=10;
        end
        else
        begin
            if (we)
            begin
                reg_file[wa]=wd;
            end
        end
    end
        assign rd0=reg_file[ra0];
        assign rd1=reg_file[ra1];
endmodule
