`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2019 04:54:19 PM
// Design Name: 
// Module Name: Score_Driver
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


module Score_Driver(
    input clk_cpu,clk_500hz,rst,en_Interrupt,
    input [31:0]data_in,
    output [31:0]mem_addr,
    output Interrupt,is_seg,
    output [2:0]mode,
    output [6:0]seg,
    output [7:0]an
    );
    
    wire [31:0]number;
    wire [3:0]spilt_number[7:0];
    wire [3:0]d;
    reg [2:0]count;
    assign spilt_number[0]=number[3:0];
    assign spilt_number[1]=number[7:4];
    assign spilt_number[2]=number[11:8];
    assign spilt_number[3]=number[15:12];
    assign spilt_number[4]=number[19:16];
    assign spilt_number[5]=number[23:20];
    assign spilt_number[6]=number[27:24];
    assign spilt_number[7]=number[31:28];
    assign d=spilt_number[7-count];
    always @ (posedge clk_500hz or posedge rst)
    begin
        if (rst)
        begin
            count<=0;
        end
        else 
        begin
            count<=count+1;
        end
    end
    Score_Ctrl U1 (clk_cpu,rst,en_Interrupt,data_in,mem_addr,Interrupt,is_seg,mode,number);
    bcd_decoder U2 (count,d,seg,an);
endmodule
