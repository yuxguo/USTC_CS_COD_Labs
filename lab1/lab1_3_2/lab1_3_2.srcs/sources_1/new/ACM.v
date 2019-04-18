`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/20 20:07:03
// Design Name: 
// Module Name: ACM
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


module ACM(
    input [7:0]x,
    input clk,rst,
    output [7:0]s
    );
    reg [7:0]tmp;
    always @ (posedge clk or posedge rst)
    begin
        if (rst)
        begin
            tmp=0;
        end
        else 
        begin   
            tmp=tmp+x;
        end
    end
    assign s=tmp;
endmodule
