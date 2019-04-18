`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/21 21:07:35
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [5:0]a,b,
    input [2:0]s,
    output reg [5:0]y,
    output reg [2:0]f
    );
    parameter ADD=3'd0;
    parameter SUB=3'd1;
    parameter AND=3'd2;
    parameter OR=3'd3;
    parameter NOT=3'd4;
    parameter XOR=3'd5;
    reg flag1,flag2,flag3,flag4;
    reg [4:0] t1,t2;
    initial flag1=0;
    initial flag2=0;
    always @ (*)
    begin
        case(s)
            ADD:{flag1,y}=a+b;
            SUB:{flag2,y}=a+~b+1;
            AND:y=a&b;
            OR:y=a|b;
            NOT:y=~a;
            XOR:y=a^b;
            default:y=0;
        endcase
    end
    
    always @ (*)
    begin
        {flag3,t1}=a[4:0]+b[4:0];
        {flag4,t2}=a[4:0]+~b[4:0]+1;
    end
    
    always @ (*)
    begin
        if (y==0)
            f[0]=1;
        else
            f[0]=0;
    end
    
    always @ (*)
    begin
        if (s==ADD)
        begin
            if (flag1==1)
                f[1]=1;
            else
                f[1]=0;
            if (flag1^flag3==1)
                f[2]=1;
            else 
                f[2]=0;
        end
        else if (s==SUB)
        begin
            if (flag2==1)
                f[1]=1;
            else
                f[1]=0;
            if (flag2^flag4==1)
                f[2]=1;
            else 
                f[2]=0;
        end
        else
        begin
            f[1]=0;
            f[2]=0;
        end
    end
endmodule
