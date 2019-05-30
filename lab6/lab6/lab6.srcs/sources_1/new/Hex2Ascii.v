`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2019 07:14:06 PM
// Design Name: 
// Module Name: Hex2Ascii
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


module Hex2Ascii(
    input [3:0]in,
    output reg [7:0]out
    );
    always @ (*)
    begin
        case(in)
            4'h0:out=8'h30;
            4'h1:out=8'h31;
            4'h2:out=8'h32;
            4'h3:out=8'h33;
            4'h4:out=8'h34;
            4'h5:out=8'h35;
            4'h6:out=8'h36;
            4'h7:out=8'h37;
            4'h8:out=8'h38;
            4'h9:out=8'h39;
            4'ha:out=8'h61;
            4'hb:out=8'h62;
            4'hc:out=8'h63;
            4'hd:out=8'h64;
            4'he:out=8'h65;
            4'hf:out=8'h66;
            default:out=0;
        endcase
    end
endmodule
