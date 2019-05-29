`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2019 02:28:15 PM
// Design Name: 
// Module Name: Bluetooth_TransmitData
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


module Bluetooth_TransmitData(
    input clk_9600hz,rst,ready,
    input [63:0]T_Data,
    output reg TX
    );
    reg [6:0]cnt;
    reg begin_transmit;
    parameter LENTH=79;
    
    always @ (posedge clk_9600hz or posedge rst)
    begin
        if (rst)
        begin
            begin_transmit<=0;
            cnt<=0;
            TX<=1;
        end
        else 
        begin
            if (begin_transmit==0)
            begin
                if (ready==1)
                begin
                    begin_transmit<=1;
                    cnt<=cnt+1;
                    TX<=0;
                end
                else 
                begin
                    begin_transmit<=0;
                    cnt<=0;
                    TX<=1;
                end
            end
            else 
            begin
                if (cnt<LENTH)
                begin
                    if (cnt>=1 && cnt<=8)
                    begin
                        TX=T_Data[cnt-1];
                    end
                    else if (cnt==9)
                    begin
                        TX=1;
                    end
                    else if (cnt==10)
                    begin
                        TX=0;
                    end
                    else if (cnt>=11 && cnt<=18)
                    begin
                        TX=T_Data[cnt-3];
                    end 
                    else if (cnt==19)
                    begin
                        TX=1;
                    end
                    else if (cnt==20)
                    begin
                        TX=0;
                    end
                    else if (cnt>=21 && cnt<=28)
                    begin
                        TX=T_Data[cnt-5];
                    end
                    else if (cnt==29)
                    begin
                        TX=1;
                    end
                    else if (cnt==30)
                    begin
                        TX=0;
                    end
                    else if (cnt>=31 && cnt<=38)
                    begin
                        TX=T_Data[cnt-7];
                    end
                    else if (cnt==39)
                    begin
                        TX=1;
                    end
                    else if (cnt==40)
                    begin
                        TX=0;
                    end
                    else if (cnt>=41 && cnt<=48)
                    begin
                        TX=T_Data[cnt-9];
                    end 
                    else if (cnt==49)
                    begin
                        TX=1;
                    end
                    else if (cnt==50)
                    begin
                        TX=0;
                    end
                    else if (cnt>=51 && cnt<=58)
                    begin
                        TX=T_Data[cnt-11];
                    end
                    else if (cnt==59)
                    begin
                        TX=1;
                    end
                    else if (cnt==60)
                    begin
                        TX=0;
                    end
                    else if (cnt>=61 && cnt<=68)
                    begin
                        TX=T_Data[cnt-13];
                    end
                    else if (cnt==69)
                    begin
                        TX=1;
                    end
                    else if (cnt==70)
                    begin
                        TX=0;
                    end
                    else if (cnt>=71 && cnt<=78)
                    begin
                        TX=T_Data[cnt-15];
                    end
                    begin_transmit=1;
                    cnt=cnt+1;
                end
                else
                begin
                    begin_transmit<=0;
                    cnt<=0;
                    TX<=1;
                end
            end
        end
    end
    
endmodule
