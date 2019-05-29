`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2019 06:31:29 PM
// Design Name: 
// Module Name: B_Data_Encode
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


module B_Data_Encode(
    input [31:0]d_in,
    output [63:0]d_out
    );
    Hex2Ascii U0 (d_in[31:28],d_out[7:0]);
    Hex2Ascii U1 (d_in[27:24],d_out[15:8]);
    Hex2Ascii U2 (d_in[23:20],d_out[23:16]);
    Hex2Ascii U3 (d_in[19:16],d_out[31:24]);
    Hex2Ascii U4 (d_in[15:12],d_out[39:32]);
    Hex2Ascii U5 (d_in[11:8],d_out[47:40]);
    Hex2Ascii U6 (d_in[7:4],d_out[55:48]);
    Hex2Ascii U7 (d_in[3:0],d_out[63:56]);
endmodule
