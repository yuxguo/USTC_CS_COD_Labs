`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/28/2019 04:40:41 PM
// Design Name: 
// Module Name: DDU
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


module DDU(
    input cont,step,mem,inc,dec,clk_500hz,clk_5hz,rst,
    input [7:0]pc,
    input [31:0]data,
    output run,
    output reg [4:0]reg_addr,
    output reg [7:0]mem_addr,
    output [15:0]led,
    output [6:0]seg,
    output [7:0]an
    );
    
    wire [7:0]addr;
    assign run = (cont == 1) ? clk_500hz:step;
    
    assign addr=(mem == 1)? mem_addr:{3'b000,reg_addr};
    
    assign led = {pc,addr};
    reg [2:0]count;
    wire [3:0]display[7:0];
    wire [3:0]d;
    assign display[0]=data[3:0];
    assign display[1]=data[7:4];
    assign display[2]=data[11:8];
    assign display[3]=data[15:12];
    assign display[4]=data[19:16];
    assign display[5]=data[23:20];
    assign display[6]=data[27:24];
    assign display[7]=data[31:28];
    
    bcd_decoder U (count,d,seg,an);
    
    assign d=display[7-count];
    
    initial count=0;
    
    always @ (posedge rst or posedge clk_5hz)
    begin
        if (rst)
            mem_addr<=0;
        else 
        begin
            if (inc && mem)
            begin
                mem_addr <= (mem_addr<255) ? (mem_addr+1):mem_addr;
            end
            else if (dec && mem)
            begin
                mem_addr <= (mem_addr>0) ? (mem_addr-1):mem_addr;
            end
        end
    end
    
    always @ (posedge rst or posedge clk_5hz)
    begin
        if (rst)
            reg_addr<=0;
        else 
        begin
            if (inc && ~mem)
            begin
                reg_addr <= (reg_addr<31) ? (reg_addr+1):reg_addr;
            end
            else if (dec && ~mem)
            begin
                reg_addr <= (reg_addr>0) ? (reg_addr-1):reg_addr;
            end
        end
    end
    
    
    
    always @ (posedge clk_500hz or posedge rst)
    begin
        if (rst)
        begin
            count=0;
        end
        else
        begin
            count=count+1;
        end
        
    end
    
    
    
    
    
    
endmodule
