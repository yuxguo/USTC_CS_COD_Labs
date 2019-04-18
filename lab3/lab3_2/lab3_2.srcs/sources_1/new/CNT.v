`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2019 08:14:37 PM
// Design Name: 
// Module Name: CNT
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


module CNT(
    input ce,pe,rst,clk,
    input [3:0]d,
    output reg [3:0]q
    );
    
    always @ (posedge clk or posedge rst)
    begin
        if (rst)
        begin
            q=0;
        end
        else
        begin
            if (pe)
                q=d;
            else if (ce)
                q=q+1;
            else 
                q=q;
        end
    end
endmodule
