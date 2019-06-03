`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2019 08:59:36 PM
// Design Name: 
// Module Name: Input_Priority
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


module Input_Priority(
    input [3:0]in,
    input en_Interrupt,
    input [2:0]mode0,mode1,mode2,mode3,
    output out,
    output reg [2:0]out_mode
    );
    
    assign out=(in[0] | in[1] | in[2] | in[3]) & en_Interrupt;
    
    always @ (*)
    begin
        if (in[0])
        begin
            out_mode=mode0;
        end
        else if (in[1])
        begin
            out_mode=mode1;
        end
        else if (in[2])
        begin
            out_mode=mode2;
        end
        else if (in[3])
        begin
            out_mode=mode3;
        end
        else
        begin
            out_mode=3'b000;
        end
    end
endmodule
