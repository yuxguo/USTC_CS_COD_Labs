`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2019 03:37:53 PM
// Design Name: 
// Module Name: LED_driver
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

module LED_Ctrl #(parameter cycles=999999)(
    input clk_cpu,rst,en_Interrupt,
    input [31:0]data_in,
    output Interrupt,
    output [2:0]mode,
    output [31:0]addr,
    output reg [15:0]L01,L11,L21,L31,L41,L51,L61,L71,L81,L91,La1,Lb1,Lc1,Ld1,Le1,Lf1
    );
    localparam LED_RefreshCycles = cycles;//clk_cpu == 5Mhz
    localparam LED_IO_In_Mem = 32'd119;///////////////////////////
    localparam LED_IRQ = 3'b011;
    localparam point=20000;
    
    reg [31:0]cnt;
    wire [15:0]data;
    reg [15:0]L0,L1,L2,L3,L4,L5,L6,L7,L8,L9,La,Lb,Lc,Ld,Le,Lf;
    assign data = {data_in[3],data_in[3],data_in[3],data_in[3],data_in[2],data_in[2],data_in[2],data_in[2],data_in[1],data_in[1],data_in[1],data_in[1],data_in[0],data_in[0],data_in[0],data_in[0]};
    
    assign addr = (cnt<=15) ? (LED_IO_In_Mem+cnt):0;
    assign Interrupt = ((cnt==point) && (en_Interrupt)) ? 1:0;
    assign mode = ((cnt==point) && (en_Interrupt)) ? LED_IRQ:3'b000;
    always @ (posedge clk_cpu or posedge rst)//当且仅当为0的时候某个像素亮
    begin
        if (rst)
        begin
            L0<=16'hffff;
            L1<=16'hffff;
            L2<=16'hffff;
            L3<=16'hffff;
            L4<=16'hffff;
            L5<=16'hffff;
            L6<=16'hffff;
            L7<=16'hffff;
            L8<=16'hffff;
            L9<=16'hffff;
            La<=16'hffff;
            Lb<=16'hffff;
            Lc<=16'hffff;
            Ld<=16'hffff;
            Le<=16'hffff;
            Lf<=16'hffff;
        end
        else 
        begin
            case (cnt)
                32'h0:L0<=data;
                32'h1:L1<=data;
                32'h2:L2<=data;
                32'h3:L3<=data;
                32'h4:L4<=data;
                32'h5:L5<=data;
                32'h6:L6<=data;
                32'h7:L7<=data;
                32'h8:L8<=data;
                32'h9:L9<=data;
                32'ha:La<=data;
                32'hb:Lb<=data;
                32'hc:Lc<=data;
                32'hd:Ld<=data;
                32'he:Le<=data;
                32'hf:Lf<=data;
                default:;
            endcase
        end
    end
    
    always @(posedge clk_cpu or posedge rst)
    begin
        if (rst)
        begin
            L01<=16'hffff;
            L11<=16'hffff;
            L21<=16'hffff;
            L31<=16'hffff;
            L41<=16'hffff;
            L51<=16'hffff;
            L61<=16'hffff;
            L71<=16'hffff;
            L81<=16'hffff;
            L91<=16'hffff;
            La1<=16'hffff;
            Lb1<=16'hffff;
            Lc1<=16'hffff;
            Ld1<=16'hffff;
            Le1<=16'hffff;
            Lf1<=16'hffff;
        end
        else
        begin
            if (cnt==point)
            begin
                L01<=L0;
                L11<=L1;
                L21<=L2;
                L31<=L3;
                L41<=L4;
                L51<=L5;
                L61<=L6;
                L71<=L7;
                L81<=L8;
                L91<=L9;
                La1<=La;
                Lb1<=Lb;
                Lc1<=Lc;
                Ld1<=Ld;
                Le1<=Le;
                Lf1<=Lf;
            end
        end
    end
    always @ (posedge clk_cpu or posedge rst)
    begin
        if (rst)
        begin
            cnt<=0;
        end
        else 
        begin
            if (cnt < LED_RefreshCycles)
                cnt<=cnt+1;
            else
                cnt<=0;
        end
    end
endmodule