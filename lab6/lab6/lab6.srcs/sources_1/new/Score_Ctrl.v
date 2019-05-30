`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2019 03:50:32 PM
// Design Name: 
// Module Name: Score_Ctrl
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


module Score_Ctrl #(parameter cycles=4999999)(
    input clk_cpu,rst,en_Interrupt,
    input [31:0]data_in,
    output [31:0]mem_addr,
    output Interrupt,is_seg,
    output [2:0]mode,
    output reg [31:0]number
    );
    
    localparam SEG_IO_In_Mem = 32'd117;
    localparam SEG_IRQ = 3'b100;
    localparam SEG_RefreshCycles = cycles;
    localparam point=10002;
    
    reg [31:0]cnt;
    
    assign is_seg = (cnt==point-1);
    assign mem_addr=(cnt==point-1)?SEG_IO_In_Mem:0;
    assign Interrupt = ((cnt==point)&&(en_Interrupt))?1:0;
    assign mode = ((cnt==point)&&(en_Interrupt))?SEG_IRQ:0;
    
    always @(posedge clk_cpu or posedge rst)
    begin
        if (rst)
        begin
            number<=0;
        end
        else
        begin
            case(cnt)
                (point-1):number<=data_in;
                default:;
            endcase
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
            if (cnt<SEG_RefreshCycles)
            begin
                cnt<=cnt+1;
            end
            else
            begin
                cnt=0;
            end
        end
    end
    
endmodule
