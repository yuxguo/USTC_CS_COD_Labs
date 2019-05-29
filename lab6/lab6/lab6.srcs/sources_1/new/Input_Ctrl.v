`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2019 08:23:42 PM
// Design Name: 
// Module Name: Input_Ctrl
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


module Input_Ctrl # (parameter IRQ=3'b101)(
    input clk,rst,in,
    output reg Interrupt,
    output [2:0]mode
    );
    
    reg flag2;
    assign mode=(Interrupt)?IRQ:3'b000;

    always @(posedge clk or posedge rst)
    begin
        if (rst)
        begin
            flag2<=0;
            Interrupt<=0;
        end
        else
        begin
            if (in)
            begin
                if (flag2==0)
                begin
                    flag2<=1;
                    Interrupt<=1;
                end
                else
                begin
                    Interrupt<=0;
                end
            end
            else
            begin
                flag2<=0;
                Interrupt<=0;
            end
        end
    end
    
endmodule
