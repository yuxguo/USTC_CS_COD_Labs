`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2019 05:47:40 PM
// Design Name: 
// Module Name: Addr_Mux
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


module Addr_Mux(
    input DEBUGING,is_seg,is_bluetooth,
    input [31:0]debug_addr,seg_addr,led_addr,bluetooth_addr,
    output reg is_bluetooth_data,
    output [31:0]out
    );
    wire [31:0]out1;
    reg [31:0]out2;
    always @ (*)
    begin
        if (is_bluetooth)
        begin
            if (seg_addr==0 && led_addr==0)
            begin
                out2=bluetooth_addr;
                is_bluetooth_data=1;
            end
            else
            begin
                out2=out1;
                is_bluetooth_data=0;
            end
        end
        else
        begin
            out2=out1;
            is_bluetooth_data=0;
        end
    end
    Mux_2 U1 (led_addr,seg_addr,is_seg,out1);
    Mux_2 U2 (out2,debug_addr,DEBUGING,out);
endmodule
