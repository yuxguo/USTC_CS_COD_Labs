`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2019 09:07:33 PM
// Design Name: 
// Module Name: CPU_tb
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


module CPU_tb(

    );
    reg clk,rst;
    wire [7:0]pc;
    wire [31:0]ir,dr,a,b,aluout;
    wire [31:0]reg_data,mem_data;
    reg [4:0] reg_addr;
    reg [7:0] mem_addr;
    wire PCWriteCond_E,PCWriteCond_NE,PCWrite,IorD,MemWrite,MemtoReg,IRWrite,ALUSrcA,RegWrite,RegDst;
    wire [1:0]PCSource,ALUSrcB;
    wire [3:0]ALUOp;
    wire [31:0]ext;
    wire [4:0] writeregisteraddr;
    CPU U (clk,rst,0,reg_addr,mem_addr,reg_data,mem_data,pc,ir,dr,a,b,aluout,PCWriteCond_E,PCWriteCond_NE,PCWrite,IorD,MemWrite,MemtoReg,IRWrite,ALUSrcA,RegWrite,RegDst,PCSource,ALUSrcB,ALUOp,ext,writeregisteraddr);
    initial 
    begin
        clk=0;
        reg_addr=8;
        mem_addr=0;
        rst=1;#1;
        rst=0;
    end
    always #2 clk=~clk;
    always #20 reg_addr=reg_addr+1;
endmodule
