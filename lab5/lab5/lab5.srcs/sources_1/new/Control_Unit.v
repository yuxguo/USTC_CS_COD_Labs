`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2019 08:31:06 AM
// Design Name: 
// Module Name: Control_Unit
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


module Control_Unit(
    input [5:0]op,
    input [5:0]funct,
    input [2:0]state,
    output PCWriteCond_E,PCWriteCond_NE,PCWrite,IorD,MemWrite,MemToReg,IRWrite,
    output [1:0]PCSource,
    output [3:0]ALUOp,
    output [1:0]ALUSrcB,
    output ALUSrcA,RegWrite,RegDst
    );
    
    parameter I=3'b000;
    parameter II=3'b001;
    parameter III=3'b010;
    parameter IV=3'b011;
    parameter V=3'b100;
    
    parameter AND=4'b0000;
    parameter OR=4'b0001;
    parameter ADD=4'b0010;
    parameter SUB=4'b0110;
    parameter SLT=4'b0111;
    parameter NOR=4'b1100;
    parameter XOR=4'b1101;
    
    parameter ADD_f=6'b100000;
    parameter AND_f=6'b100100;
    parameter NOR_f=6'b100111;
    parameter OR_f=6'b100101;
    parameter SLT_f=6'b101010;
    parameter XOR_f=6'b100110;
    parameter SUB_f=6'b100010;
    
    parameter SW=6'b101011;
    parameter LW=6'b100011;
    parameter Rtype=6'b000000;
    parameter BEQ=6'b000100;
    parameter BNE=6'b000101;
    parameter J=6'b000010;
    parameter ADDI=6'b001000;
    parameter ANDI=6'b001100;
    parameter ORI=6'b001101;
    parameter XORI=6'b001110;
    parameter SLTI=6'b001010;
    parameter Imm=3'b001;
    
    reg  [17:0]signal;
    assign {PCWriteCond_E,PCWriteCond_NE,PCWrite,IorD,MemWrite,MemToReg,IRWrite,ALUSrcA,RegWrite,RegDst,PCSource,ALUOp,ALUSrcB}=signal;
    
    always @ (state)
    begin
        if (state==I)
        begin
            signal=18'b001000100000001001;
        end
        else if (state==II)
        begin
            signal=18'b000000000000001011;
        end
        else if (state==III)
        begin
            if (op == LW || op == SW)
            begin
                signal=18'b000000010000001010;
            end
            else if (op[5:3]==Imm)//PCWriteCond_E,PCWriteCond_NE,PCWrite,IorD,MemWrite,MemToReg,IRWrite,ALUSrcA,RegWrite,RegDst,PCSource,ALUOp,ALUSrcB
            begin
                case(op)
                    ADDI:signal=18'b000000010000001010;
                    ANDI:signal=18'b000000010000000010;
                    ORI:signal=18'b000000010000000110;
                    XORI:signal=18'b000000010000110110;
                    SLTI:signal=18'b000000010000011110;
                    default:signal=18'd0;
                endcase
            end
            else if (op == Rtype)
            begin
                case(funct)
                    ADD_f:signal=18'b000000010000001000;
                    AND_f:signal=18'b000000010000000000;
                    NOR_f:signal=18'b000000010000110000;
                    OR_f:signal=18'b000000010000000100;
                    SLT_f:signal=18'b000000010000011100;
                    SUB_f:signal=18'b000000010000011000;
                    XOR_f:signal=18'b000000010000110100;
                    default:signal=18'd0;
                endcase
            end
            else if (op == BEQ)
            begin
                signal=18'b100000010001011000;
            end
            else if (op == BNE)
            begin
                signal=18'b010000010001011000;
            end
            else if (op == J)//PCWriteCond_E,PCWriteCond_NE,PCWrite,IorD,MemWrite,MemToReg,IRWrite,ALUSrcA,RegWrite,RegDst,PCSource,ALUOp,ALUSrcB
            begin
                signal=18'b001000000010001000;
            end
            else 
            begin
                signal=18'd0;
            end
        end
        else if (state==IV)
        begin
            if (op == LW)
            begin
                signal=18'b000100000000001000;
            end
            else if (op == SW)
            begin
                signal=18'b000110000000001000;
            end
            else if (op == Rtype)//PCWriteCond_E,PCWriteCond_NE,PCWrite,IorD,MemWrite,MemToReg,IRWrite,ALUSrcA,RegWrite,RegDst,PCSource,ALUOp,ALUSrcB
            begin
                signal=18'b000000001100001000;
            end
            else if (op[5:3] ==Imm) 
            begin
                signal=18'b000000001000001000;
            end
            else 
            begin
                signal=18'd0;
            end
        end
        else if (state==V)
        begin
            if (op == LW)
            begin
                signal=18'b000001001000001000;
            end
            else 
            begin
                signal=18'd0;
            end
        end
        else
        begin
            signal=18'd0;
        end
    end
    
endmodule
