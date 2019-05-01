`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2019 04:04:11 PM
// Design Name: 
// Module Name: clock_5hz
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


module clock_5hz(
    input clk,enable,rst,
    output reg Q
    );
    reg [22:0]cnt;
    always @ (posedge clk)
    begin
        if (enable)
        begin
            Q<=0;
            cnt<=23'd0;
        end
        else if (cnt>=23'd499999)
        begin
            Q<=~Q;
            cnt<=23'd0;
        end
        else 
            cnt=cnt+23'd1;
    end
endmodule
