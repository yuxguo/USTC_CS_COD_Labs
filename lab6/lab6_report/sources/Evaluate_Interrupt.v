`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2019 06:15:26 PM
// Design Name: 
// Module Name: Evaluate_Interrupt
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


module Evaluate_Interrupt(
    input clk,rst,dequeue,enqueue,
    input [2:0]In_mode,
    output Q,
    output [2:0] mode
    );
    
    reg [3:0]count; 
    reg [2:0]I_modes[7:0];  
    wire full,empty;
    reg [2:0]head,dir;
    assign full = (count == 8)? 1:0;
    assign empty = (count ==0)? 1:0;
    assign Q = ~empty;
    assign mode = I_modes[head];
    always @ (posedge clk or posedge rst)
    begin
        if (rst)
        begin
            I_modes[0]=3'b000;
            I_modes[1]=3'b000;
            I_modes[2]=3'b000;
            I_modes[3]=3'b000;
            I_modes[4]=3'b000;
            I_modes[5]=3'b000;
            I_modes[6]=3'b000;
            I_modes[7]=3'b000;
            count=0;
            head=0;
        end
        else 
        begin
            if (dequeue)
            begin
                if (~empty)
                begin
                    count =count -1;
                    I_modes[head]=3'b000;
                    head=head+1;
                end
            end
            else if (enqueue)
            begin
                if (~full)
                begin
                    dir=count+head;
                    I_modes[dir]=In_mode;
                    count=count+1;
                end
            end
        end
    end
endmodule
