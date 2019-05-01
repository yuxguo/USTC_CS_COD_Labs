`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2019 08:22:44 AM
// Design Name: 
// Module Name: Mux_4
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


module Mux_4(
    input [31:0]in0,in1,in2,in3,
    input [1:0]select,
    output reg [31:0]out
    );
    
    always @ (*)
    begin
        case (select)
            2'b00:out=in0;
            2'b01:out=in1;
            2'b10:out=in2;
            2'b11:out=in3;
        endcase
    end
    
endmodule
