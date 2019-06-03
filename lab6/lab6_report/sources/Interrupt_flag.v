`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2019 05:04:32 PM
// Design Name: 
// Module Name: Interrupt_flag
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


module Interrupt_flag(
    input clk,rst,in,
    output reg Q
    );
    
    reg flag;
    
    always @ (posedge clk or posedge rst)
    begin
        if (rst)
        begin
            Q<=0;
            flag<=0;
        end
        else 
        begin
            if (in)
            begin
                flag<=1;
                Q<=1;
            end
            else
            begin
                if (flag==1)
                begin
                    Q<=1;
                end
                else
                begin
                    Q<=0;
                end
            end
        end
    end
endmodule
