`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2019 12:49:55 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input signed [31:0]a,b,
    input signed[3:0]s,
    output reg [31:0]y,
    output zero
    );
    parameter AND=4'b0000;
    parameter OR=4'b0001;
    parameter ADD=4'b0010;
    parameter SUB=4'b0110;
    parameter SLT=4'b0111;
    parameter NOR=4'b1100;
    parameter XOR=4'b1101;
    
    
    always @ (*)
    begin
        case(s)
            ADD:y=a+b;
            SUB:y=a+~b+1;
            AND:y=a&b;
            OR:y=a|b;
            XOR:y=a^b;
            NOR:y=~(a|b);
            SLT:y=(a<b)?1:0;
            default:y=0;
        endcase
    end
    
    assign zero = (y == 0) ? 1:0;
    
endmodule

