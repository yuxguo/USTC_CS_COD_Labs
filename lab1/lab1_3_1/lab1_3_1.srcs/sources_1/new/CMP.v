`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/20 19:43:27
// Design Name: 
// Module Name: CMP
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


module CMP(
    input [7:0]a,b,
    output reg u_big,u_equ,u_lit,
    output reg s_big,s_equ,s_lit
    );
    
    reg [8:0]tmp;
    always @ (*)
    begin
        if (a==b)
            {u_big,u_equ,u_lit}=3'b010;
        else if (a>b)
            {u_big,u_equ,u_lit}=3'b100;
        else
            {u_big,u_equ,u_lit}=3'b001;
    end
    
    always @ (*)
    begin
        if (a==b)
            {s_big,s_equ,s_lit}=3'b010;
        else
        begin
            tmp={a[7],a}+~{b[7],b}+1;
            if (tmp[8]==0)
                {s_big,s_equ,s_lit}=3'b100;
            else
                {s_big,s_equ,s_lit}=3'b001;
        end
            
    end
endmodule
