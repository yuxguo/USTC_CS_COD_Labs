`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/28/2019 04:40:25 PM
// Design Name: 
// Module Name: CPU
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


module CPU(
    input clk_10hz,rst,DEBUGING,
    input [4:0]reg_addr,
    input [7:0]mem_addr,
    output [31:0]reg_data,mem_data,
    output [7:0]pc
    //output [31:0]ir,dr,a,b,aluout,
    //output PCWriteCond_E,PCWriteCond_NE,PCWrite,IorD,MemWrite,MemtoReg,IRWrite,ALUSrcA,RegWrite,RegDst,
    //output [1:0] PCSource,ALUSrcB,
    //output [3:0]ALUOp,
    //output [31:0]ext,
    //output [4:0]writeregisteraddr
    );
    wire PCWriteCond_E,PCWriteCond_NE,PCWrite,IorD,MemWrite,MemtoReg,IRWrite;
    wire [1:0]PCSource,ALUSrcB;
    wire [3:0]ALUOp;
    wire ALUSrcA,RegWrite,RegDst;
    
    wire zero,PC_WE;
    wire [31:0]ALU_out,PC_out,MEM_out,IR_out,DR_out;
    wire [31:0]RF1_out,RF2_out,A_out,B_out;
    wire [31:0]ALU_res;
    wire [31:0]PC_mux_out,ALUSrcA_mux_out;
    wire [31:0]Writedata,WriteData_mux_out,SignExtend_out,ALUSrcB_mux_out,PCSource_mux_out;
    wire [4:0]WriteReg_mux_out;
    
    
    wire [4:0]Display_ra;
    wire [31:0]Display_rd;

    wire [7:0]MEM_ADDR;
    
    wire [2:0]state;
    
    assign PC_WE=(((zero & PCWriteCond_E) | (~zero & PCWriteCond_NE)) | PCWrite);
    
    /******************************-- display_code --*****************************************/
    assign Display_ra=reg_addr;
    assign reg_data=Display_rd;
    
    assign mem_data=MEM_out;
    
    assign MEM_ADDR = (DEBUGING ==1)? mem_addr:PC_mux_out[7:0];
    assign pc=PC_out[7:0];
    /******************************-- display_code --*****************************************/
    
    
    /******************************-- display_code --*****************************************/
    /*
    assign ir=IR_out;
    assign dr=DR_out;
    assign a=A_out;
    assign b=B_out;
    assign aluout=ALU_out;
    assign ext=SignExtend_out;
    assign writeregisteraddr=WriteReg_mux_out;
    */
    /******************************-- display_code --*****************************************/
    
    Register PC (PCSource_mux_out,clk_10hz,rst,PC_WE,PC_out);
    Register IR (MEM_out,clk_10hz,rst,IRWrite,IR_out);
    Register DR (MEM_out,clk_10hz,rst,1,DR_out);
    Register A (RF1_out,clk_10hz,rst,1,A_out);
    Register B (RF2_out,clk_10hz,rst,1,B_out);
    Register ALUOut (ALU_res,clk_10hz,rst,1,ALU_out);
    
    Mux_2 PC_mux (PC_out,ALU_out,IorD,PC_mux_out);
    Mux_2 ALUSrcA_mux (PC_out,A_out,ALUSrcA,ALUSrcA_mux_out);
    Mux_2 WriteData_mux (ALU_out,DR_out,MemtoReg,WriteData_mux_out);
    Mux_2_5bits WriteRegister_mux (IR_out[20:16],IR_out[15:11],RegDst,WriteReg_mux_out);
    
    Mux_4 ALUSrcB_mux (B_out,1,SignExtend_out,SignExtend_out,ALUSrcB,ALUSrcB_mux_out);
    Mux_4 PCSource_mux (ALU_res,ALU_out,{PC_out[31:26],IR_out[25:0]},0,PCSource,PCSource_mux_out);
    
    State_Machine SM (clk_10hz,rst,state);
    
    Control_Unit CU (IR_out[31:26],IR_out[5:0],state,PCWriteCond_E,PCWriteCond_NE,PCWrite,IorD,MemWrite,MemtoReg,IRWrite,PCSource,ALUOp,ALUSrcB,ALUSrcA,RegWrite,RegDst); 
    
    Reg_File RF (IR_out[25:21],IR_out[20:16],Display_ra,WriteReg_mux_out,WriteData_mux_out,RegWrite,rst,clk_10hz,RF1_out,RF2_out,Display_rd);
    ALU alu (ALUSrcA_mux_out,ALUSrcB_mux_out,ALUOp,ALU_res,zero);
    MEM mem (.a(PC_mux_out[7:0]),.d(B_out),.dpra(MEM_ADDR),.clk(clk_10hz),.we(MemWrite),.dpo(MEM_out));
    SignExtend_Unit SEU (IR_out[15:0],SignExtend_out);
endmodule
