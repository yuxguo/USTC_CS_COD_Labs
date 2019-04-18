`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/20 19:25:07
// Design Name: 
// Module Name: REG
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


module REG(
    input [7:0] in,
    input en,rst,clk,
    output [7:0]out
    );
    reg [7:0]tmp;
    always @ (posedge clk or posedge rst)
    begin
        if (rst)
            tmp=8'b00000000;
        else
        begin
            if (en)
            begin
                tmp=in;
            end
            else
            begin
                tmp=tmp;
            end
        end
    end
    assign out=tmp;
endmodule
