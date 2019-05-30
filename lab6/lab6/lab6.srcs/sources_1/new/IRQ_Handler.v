`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2019 09:17:42 PM
// Design Name: 
// Module Name: IRQ_Handler
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


module IRQ_Handler(
    input Input_IR,SEG_IR,LED_IR,Blue_IR,
    input [2:0]Input_mode,SEG_mode,LED_mode,Blue_mode,
    output Interrupt,
    output reg [2:0]mode
    );
    assign Interrupt=Input_IR | SEG_IR | LED_IR | Blue_IR;
    always @(*)
    begin
        if (LED_IR)
        begin
            mode=LED_mode;
        end
        else if (SEG_IR)
        begin
            mode=SEG_mode;
        end
        else if (Input_IR)
        begin
            mode=Input_mode;
        end
        else if (Blue_IR)
        begin
            mode=Blue_mode;
        end
        else
            mode=3'b000;
    end
endmodule
