`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2019 02:27:40 PM
// Design Name: 
// Module Name: Bluetooth_ReceiveData
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


module Bluetooth_ReceiveData(
    input clk_9600hz,rst,
    input RX,
    output ready,
    output reg [31:0]R_Data
    );
    reg [31:0]data_buffer;
    reg [5:0]cnt;
    reg begin_receive;
    parameter LENTH=39;
    
    assign ready=(cnt==39)?1:0;
    
    always @ (posedge clk_9600hz or posedge rst)
    begin
        if (rst)
        begin
            cnt<=0;
            begin_receive<=0;
        end
        else
        begin
            if (begin_receive==0)
            begin
                if (RX==0)
                begin
                    begin_receive<=1;
                    cnt<=cnt+1;
                end
                else
                begin
                    begin_receive<=0;
                    cnt<=0;
                end
            end
            else
            begin
                if (cnt<LENTH)
                begin
                    if (cnt>=1 && cnt<=8)
                    begin
                        data_buffer[cnt-1]<=RX;
                    end
                    else if (cnt>=11 && cnt<=18)
                    begin
                        data_buffer[cnt-3]<=RX;
                    end
                    else if (cnt>=21 && cnt<=28)
                    begin
                        data_buffer[cnt-5]<=RX;
                    end
                    else if (cnt>=31 && cnt<=38)
                    begin
                        data_buffer[cnt-7]<=RX;
                    end
                    cnt=cnt+1;
                    begin_receive=1;
                end
                else
                begin
                    begin_receive<=0;
                    cnt<=0;
                end
            end
        end
    end
    
    always @ (posedge clk_9600hz or posedge rst)
    begin
        if (rst)
        begin
            R_Data<=0;
        end
        else
        begin
            if (cnt==LENTH)
            begin
                R_Data<=data_buffer;
            end
        end
    end
    

endmodule
