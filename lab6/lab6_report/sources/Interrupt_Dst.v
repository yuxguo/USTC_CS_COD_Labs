`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2019 04:40:11 PM
// Design Name: 
// Module Name: Interrupt_Dst
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


module Interrupt_Dst(
    input clk,rst,
    input [2:0]Int_type,
    input [31:0]pc,
    input we,
    output reg [31:0]Dst_Addr
    );
    wire [31:0]out;
    parameter Dir1=32'd80;
    parameter Dir2=32'd109;
    parameter Dir3=32'd43;
    parameter Dir4=32'd78;
    parameter Dir5=32'd88;
    parameter Dir6=32'd95;
    parameter Dir7=32'd102;


    Register R (pc,clk,rst,we,out);
    always @ (*)
    begin
        case(Int_type)
            3'd0:Dst_Addr=out;
            3'd1:Dst_Addr=Dir1;
            3'd2:Dst_Addr=Dir2;
            3'd3:Dst_Addr=Dir3;
            3'd4:Dst_Addr=Dir4;
            3'd5:Dst_Addr=Dir5;
            3'd6:Dst_Addr=Dir6;
            3'd7:Dst_Addr=Dir7;
            default:Dst_Addr=0;
        endcase
    end
endmodule
