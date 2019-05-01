`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2019 08:26:35 AM
// Design Name: 
// Module Name: State_Machine
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


module State_Machine(
    input clk,rst,
    output reg [2:0]state
    );
    
    always @ (posedge clk or posedge rst)
    begin
        if (rst)
            state<=3'b000;
        else
        begin
            if(state == 3'b100)
                state<=3'b000;
            else
                state<=state+1;
        end
    end
    
endmodule
