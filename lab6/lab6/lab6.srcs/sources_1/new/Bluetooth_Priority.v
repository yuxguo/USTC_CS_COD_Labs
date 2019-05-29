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
    input select,
    output we,
    output [31:0]data_o,
    output reg [31:0]addr_o
    );
    always @ (*)
    begin
        if (select==1|| addr_normal !=0)
        begin
            addr_o=addr_normal;
        end
        else
        begin
            addr_o=addr_bluetooth;
        end
    end
    assign we=we_bluetooth | we_normal;
    assign data_o=(select==1)?data_normal:data_bluetooth;
    
endmodule
