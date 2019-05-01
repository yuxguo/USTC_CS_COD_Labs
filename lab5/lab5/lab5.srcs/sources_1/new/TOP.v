`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/28/2019 04:41:15 PM
// Design Name: 
// Module Name: TOP
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


module TOP(
    input cont,step,mem,inc,dec,clk_in,rst,DEBUGING,
    output [15:0]led,
    output [6:0]seg,
    output [7:0]an
    );
    wire clk_500hz,clk_5hz,clk_5mhz;
    wire locked;
    wire run;
    wire cpu_clock;
    wire [31:0]data;
    
    wire [4:0]reg_addr;
    wire [7:0]mem_addr;
    wire [31:0]reg_data,mem_data;
    
    wire [6:0]seg_o;
    wire [7:0]an_o;
    wire [7:0]pc;
    
    assign data = (mem == 1)? mem_data:reg_data;
    
    
    assign cpu_clock = run;
    assign seg = (DEBUGING == 0)? 7'b1111111:seg_o;
    assign an = (DEBUGING == 0)? 8'b11111111:an_o;
    
    clk_wiz_0 CLK5MHZ (clk_5mhz,0,locked,clk_in);
    clock_500hz CLK500HZ (clk_5mhz,0,0,clk_500hz);
    clock_5hz CLK5HZ (clk_5mhz,0,0,clk_5hz);
    CPU cpu (cpu_clock,rst,DEBUGING,reg_addr,mem_addr,reg_data,mem_data,pc);
    DDU ddu (cont,step,mem,inc,dec,clk_500hz,clk_5hz,rst,pc,data,run,reg_addr,mem_addr,led,seg_o,an_o);
endmodule
