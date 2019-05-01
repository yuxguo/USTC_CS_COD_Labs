`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2019 10:39:45 AM
// Design Name: 
// Module Name: SignExtend_Unit
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


module SignExtend_Unit(
    input [15:0]in,
    output [31:0]out
    );
    assign out=(in[15]==0)?{16'h0000,in}:{16'hffff,in};
endmodule
