`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2019 08:14:14 PM
// Design Name: 
// Module Name: CU
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


module CU #(parameter WIDTH=4)(
    input [WIDTH-1:0]x0,x1,x2,x3,
    input rst,clk,
    output reg [WIDTH-1:0]s0,s1,s2,s3,
    output reg done
    );
    reg [WIDTH-1:0]count,tmp;
    
    always @ (posedge clk or posedge rst)
    begin
        if (rst)
            done=0;
        else
        begin
            if (count == 6)
                done=1;
            else
                done=0;
        end
    end
    
    always @ (posedge clk or posedge rst)
    begin
        if (rst)
            count=0;
        else 
        begin
            if (count ==6)
                count=count;
            else 
                count=count+1;
        end
    end
    
    always @ (posedge clk or posedge rst)
    begin
        if (rst)
        begin
            s0=x0;
            s1=x1;
            s2=x2;
            s3=x3;
        end
        else 
        begin
            case(count)
                4'd0:
                begin
                    if (s0>s1)
                    begin
                        tmp=s0;
                        s0=s1;
                        s1=tmp;
                    end
                end
                4'd1:
                begin
                    if (s1>s2)
                    begin
                        tmp=s1;
                        s1=s2;
                        s2=tmp;
                    end
                end
                4'd2:
                begin
                    if (s2>s3)
                    begin
                        tmp=s2;
                        s2=s3;
                        s3=tmp;
                    end
                end
                4'd3:
                begin
                    if (s0>s1)
                    begin
                        tmp=s0;
                        s0=s1;
                        s1=tmp;
                    end
                end
                4'd4:
                begin
                    if (s1>s2)
                    begin
                        tmp=s1;
                        s1=s2;
                        s2=tmp;
                    end
                end
                4'd5:
                begin
                    if (s0>s1)
                    begin
                        tmp=s0;
                        s0=s1;
                        s1=tmp;
                    end
                end
                default:
                begin
                    s0=s0;
                    s1=s1;
                    s2=s2;
                    s3=s3;
                end
            endcase
        end
    end
endmodule
