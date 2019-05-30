`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2019 01:03:20 PM
// Design Name: 
// Module Name: clock_500hz
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


module clock_500hz(
    input clk,enable,rst,
    output reg Q
    );
    reg [22:0]cnt;
            initial 
            begin
                Q<=0;
                cnt=23'd0; 
            end
            always @ (posedge clk)
            begin
                if (enable)
                begin
                    Q<=0;
                    cnt<=23'd0;
                end
                else if (cnt>=23'd4999)
                begin
                    Q<=~Q;
                    cnt<=23'd0;
                end
                else 
                    cnt=cnt+23'd1;
            end
endmodule

