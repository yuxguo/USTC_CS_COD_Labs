`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2019 01:00:10 PM
// Design Name: 
// Module Name: Bluetooth_Priority
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


module Bluetooth_WPriority(
    input [31:0]addr_bluetooth,addr_normal,
    input [31:0]data_bluetooth,data_normal,
    input we_bluetooth,we_normal,
    input [2:0]state,
    output reg we,
    output reg [31:0]data_o,
    output reg [31:0]addr_o
    );
    parameter II=3'b001;
    always @ (*)
    begin
        if (state == II)
        begin
            if (we_bluetooth)
            begin
                we=1;
                data_o=data_bluetooth;
                addr_o=addr_bluetooth;
            end
            else 
            begin
                we=we_normal;
                data_o=data_normal;
                addr_o=addr_normal;
            end
        end
        else
        begin
            we=we_normal;
            data_o=data_normal;
            addr_o=addr_normal;
        end
    end

    
endmodule
