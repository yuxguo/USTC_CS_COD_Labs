`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2019 12:47:39 PM
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
    input clk,rst,Interrupt,
    output reg [2:0]state
    );
    
    always @ (posedge clk or posedge rst)
    begin
        if (rst)
            state<=3'b000;
        else
        begin
            if(state == 3'b100 && Interrupt)
                state<=3'b101;
            else if (state == 3'b100 && ~Interrupt)
                state<=3'b000;
            else if (state ==3'b101)
                state<=3'b000;
            else
                state<=state+1;
        end
    end
    
endmodule
