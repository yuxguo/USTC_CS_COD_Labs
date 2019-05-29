`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2019 05:40:18 PM
// Design Name: 
// Module Name: Data_Distributor
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


module Data_Distributor(
    input select,is_bluetooth_data,
    input [31:0]in_data,
    output reg [31:0]data_0,data_1,data_2
    );
    //0 is LED, 1 is SEG
    always @ (*)
    begin
        if (is_bluetooth_data)
        begin
            data_0=0;
            data_1=0;
            data_2=in_data;
        end
        else
        begin
            if (~select)
            begin
                data_0=in_data;
                data_1=0;
                data_2=0;
            end
            else
            begin
                data_0=0;
                data_1=in_data;
                data_2=0;
            end
        end
    end
endmodule
