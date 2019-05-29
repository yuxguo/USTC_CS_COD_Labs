`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2019 05:04:08 PM
// Design Name: 
// Module Name: Interrupt_Ctrl
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


module Interrupt_Ctrl(
    input clk,rst,Interrupt,
    input [2:0]state,
    input [2:0]Int_type,
    input ret,
    output reg signal,
    output [2:0] type
    );
    
    assign type= (ret==0) ? Int_type:3'b000;
    
    reg flag;
    always @(posedge clk or posedge rst)
    begin
        if (rst)
        begin
            signal=0;
            flag=0;
        end
        else 
        begin
            if (Interrupt)
            begin
                if (state == 3'b011)
                begin
                    if (flag==0)
                    begin
                        signal=1;
                        flag=1;
                    end
                    else
                    begin
                        signal=0;
                    end
                end
                else 
                begin
                    signal=0; 
                end
            end
            else 
            begin
                signal=0;
                flag=0;
            end
        end
    end
    
endmodule
