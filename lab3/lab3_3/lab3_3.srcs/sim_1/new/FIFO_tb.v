`timescale 10ns / 10ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2019 02:09:16 PM
// Design Name: 
// Module Name: FIFO_tb
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


module FIFO_tb(

    );
    reg en_out,en_in,rst,clk;
    reg [3:0]in;
    wire [3:0]out;
    wire [15:0]display;
    wire empty,full;
    wire [2:0]bits;
    wire [3:0]dis_data;
    wire en_queue_able,de_queue_able;
    wire [2:0]dis_addr;
    FIFO U (en_out,en_in,rst,clk,in,out,display,empty,full,dis_data,dis_addr);
    initial clk=0;
    always #1 clk=~clk;
    initial 
    begin
        rst=1;#10;
        rst=0;#1990;
        rst=0;
    end
    initial 
    begin
        en_out=0;
        
    end
    initial en_in=0;
    always #200000en_in=~en_in;
    initial in=4;
    
endmodule
