`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/20 20:19:51
// Design Name: 
// Module Name: FIB
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


module FIB(
    input [7:0]f0,f1,
    input clk,rst,
    output [15:0]fn
    );
    reg [15:0]tmp0,tmp1,tmp2;
    wire [5:0]x;
    wire [2:0]g;
    ALU U (tmp0,tmp1,3'b000,x,g);

    always @ (posedge clk or posedge rst)
    begin
        if (rst)
        begin
            tmp0=f0;
            tmp1=f1;
            tmp2=16'd0;
        end
        else
        begin
            tmp2=x;
            tmp0=tmp1;
            tmp1=tmp2;
        end
    end
    assign fn=tmp2;
endmodule
