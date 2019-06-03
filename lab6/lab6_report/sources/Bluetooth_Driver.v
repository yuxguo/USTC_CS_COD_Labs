`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2019 01:55:01 PM
// Design Name: 
// Module Name: Bluetooth_Driver
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


module Bluetooth_Driver(
    input clk_cpu,clk_9600hz,rst,
    input [31:0]bluetooth_rdata,
    input RX,
    input [2:0]state,
    output [31:0]bluetooth_raddr,bluetooth_waddr,
    output [31:0]bluetooth_wdata,
    output reg bluetooth_we,
    output is_bluetooth,
    output TX,
    output Interrupt,
    output [2:0]mode
    );
    
    wire [31:0]Receive_Data;
    wire [63:0]Transmit_Data;
    wire [31:0]decode_data,encode_data;
    wire ready,ok;
    
    
    parameter Bluetooth_Handler = 3'b001;
    parameter Bluetooth_IO = 32'd118;
    parameter wait_cycles = 9999;
    parameter ok_cycles = 100;
    parameter II=3'b000;
    
    Bluetooth_ReceiveData BRD (clk_9600hz,rst,RX,ready,Receive_Data);
    B_Data_Decode BDD (Receive_Data,decode_data);
    Bluetooth_TransmitData BTD (clk_9600hz,rst,ok,Transmit_Data,TX);
    B_Data_Encode BDE (encode_data,Transmit_Data);
    
    reg flag_w_mem;
    reg [31:0]cnt;
    reg [31:0]data_buffer;
    
    assign encode_data = data_buffer;
    assign bluetooth_wdata = (bluetooth_we==1)?decode_data:0;
    assign bluetooth_waddr = (bluetooth_we==1)?Bluetooth_IO:0;
    
    reg flag_ok;
    reg [31:0]cnt_ok;
    assign ok = (cnt_ok == ok_cycles)?1:0;
    always @ (posedge clk_9600hz or posedge rst)
    begin
        if (rst)
        begin
            flag_ok<=0;
            cnt_ok<=0;
        end
        else
        begin
            if (flag_ok==0)
            begin
                if (ready)
                begin
                    flag_ok<=1;
                    cnt_ok<=cnt_ok+1;
                end
                else
                begin
                    flag_ok<=0;
                    cnt_ok<=0;
                end
            end
            else 
            begin
                if (cnt_ok<ok_cycles)
                begin
                    cnt_ok<=cnt_ok+1;
                end
                else
                begin
                    cnt_ok<=0;
                    flag_ok<=0;
                end
            end
        end
    end
    
    
    
    always @ (posedge clk_cpu or posedge rst)
    begin
        if (rst)
        begin
            flag_w_mem<=0;
            bluetooth_we<=0;
        end
        else 
        begin
            if (ready && state==II)
            begin
                if (flag_w_mem==0)
                begin
                    flag_w_mem<=1;
                    bluetooth_we<=1;
                end
                else
                begin
                    bluetooth_we=0;
                end
            end
            else
            begin
                flag_w_mem<=0;
                bluetooth_we<=0;
            end
        end
    end
    
    reg flag_cnt;
    
    always @ (posedge clk_cpu or posedge rst)
    begin
        if (rst)
        begin
            flag_cnt<=0;
            cnt<=0;
        end
        else 
        begin
            if (flag_cnt == 0)
            begin
                if (bluetooth_we)
                begin
                    flag_cnt<=1;
                    cnt<=cnt+1;
                end
                else
                begin
                    flag_cnt<=0;
                    cnt<=0;
                end
            end
            else
            begin
                if (cnt<wait_cycles)
                begin
                    cnt<=cnt+1;
                    flag_cnt<=1;
                end
                else
                begin
                    cnt<=0;
                    flag_cnt<=0;
                end
            end
        end
    end
    
    assign bluetooth_raddr = (cnt==wait_cycles)?32'd116:0;
    assign is_bluetooth = (cnt==wait_cycles)?1:0;
    assign Interrupt = (cnt == 5)?1:0;
    assign mode = (cnt==5)? Bluetooth_Handler:0;
    
    always @(posedge clk_cpu or posedge rst)
    begin
        if (rst)
        begin
            data_buffer<=0;
        end
        else 
        begin
            if (cnt==wait_cycles)
            begin
                data_buffer<=bluetooth_rdata;
            end
        end 
    end
endmodule
