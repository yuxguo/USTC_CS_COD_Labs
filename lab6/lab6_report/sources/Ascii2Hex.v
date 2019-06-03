`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2019 06:46:11 PM
// Design Name: 
// Module Name: Ascii2Hex
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


module Ascii2Hex(
    input [7:0]in,
    output reg [3:0]out
    );
    always @ (*)
    begin
        case (in)
            8'h30:out=4'h0;
            8'h31:out=4'h1;
            8'h32:out=4'h2;
            8'h33:out=4'h3;
            8'h34:out=4'h4;
            8'h35:out=4'h5;
            8'h36:out=4'h6;
            8'h37:out=4'h7;
            8'h38:out=4'h8;
            8'h39:out=4'h9;
            8'h61:out=4'ha;
            8'h62:out=4'hb;
            8'h63:out=4'hc;
            8'h64:out=4'hd;
            8'h65:out=4'he;
            8'h66:out=4'hf;
            default:out=4'h0;
        endcase
    end
endmodule
