`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2019 12:44:15 PM
// Design Name: 
// Module Name: Register
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


module Register #(parameter WIDTH=32)(
    input [WIDTH-1:0]in,
    input clk,rst,we,
    output reg [WIDTH-1:0]out
    );
    
    always @ (posedge clk or posedge rst)
    begin
        if (rst)
            out<=0;
        else
        begin
            if (we)
                out<=in;
        end        
    end
   
endmodule
