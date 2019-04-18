`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2019 08:45:18 PM
// Design Name: 
// Module Name: DIV
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


module DIV #(parameter WIDTH = 4)(
    input [WIDTH-1:0]x,y,
    input rst,clk,
    output reg [2*WIDTH-1:0]r,//yushu
    output reg [WIDTH-1:0]q,//shang
    output reg error,done
    );
    reg [2*WIDTH-1:0]tmp;
    //wire [2*WIDTH-1:0]sub_result,rshift_result;
    //wire [WIDTH-1:0]lshift_result;
    //wire [2:0]f0,f1,f2;
    //localparam SUB = 3'd1;
    //localparam RSHIFT = 3'd7;
    //localparam LSHIFT = 3'd6;
    //ALU #(.WIDTH(2*WIDTH)) U1 (r,tmp,SUB,sub_result,f0);
    //ALU #(.WIDTH(2*WIDTH)) U2 (tmp,0,RSHIFT,rshift_result,f1);
    //ALU #(.WIDTH(WIDTH)) U3 (q,0,LSHIFT,lshift_result,f2);
    
    reg [WIDTH-1:0]count;
    initial
    begin
        count = 3'd0;
        q=0;
        tmp[2*WIDTH-1:WIDTH]=y;
        tmp[WIDTH-1:0]=0;
        r=x;
        done=0;
        error=0;
    end
    always @ (posedge clk)
    begin
        if (y==0)
            error=1;
        else 
            error=0;
    end
    
    always @ (posedge clk or posedge rst)
    begin
        if (rst)
        begin
            count = 3'd0;
            q=0;
            tmp[2*WIDTH-1:WIDTH]=y;
            tmp[WIDTH-1:0]=0;
            r=x;
            done=0;
        end
        else
        begin
            if (count<=WIDTH)
            begin
                if (r>=tmp)
                begin
                    r=r-tmp;
                    q=q<<1;
                    q[0]=1'b1;
                end
                else
                begin
                    q=q<<1;
                    q[0]=1'b0;
                end
                count=count+1;
                done=0;
                tmp=tmp>>1;
            end
            else
            begin
                done=1;
            end
        end
    end
endmodule
