`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2019 10:48:12 AM
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
    input upbt,downbt,leftbt,rightbt,clk_in,rst,draw,
    input [3:0]R,G,B,
    output [3:0]Ro,Go,Bo,
    output hs,vs
    );
    wire clk_25_2mhz,clk_5mhz,clk_5hz,locked;
    wire [15:0]a,dpra;
    wire [11:0]d,dpo;
    wire we;
    wire [3:0]Ri,Gi,Bi;
    wire [3:0]Rt,Gt,Bt;
    wire [7:0]x,y;
    
    assign {Ri,Gi,Bi}=dpo;
    
    clk_wiz_0 U1(clk_25_2mhz,clk_5mhz,0,locked,clk_in);
    clock_5hz U2 (clk_5mhz,0,0,clk_5hz);
    control_paint U3 (upbt,downbt,leftbt,rightbt,clk_5hz,rst,draw,R,G,B,a,d,x,y,we);
    get_data U4 (clk_25_2mhz,rst,dpra);
    
    vga U5 (clk_25_2mhz,rst,Ri,Gi,Bi,Rt,Gt,Bt,hs,vs);
    
    mask U6 (clk_25_2mhz,rst,Rt,Gt,Bt,x,y,Ro,Go,Bo);
    
    VRAM U7 (
        .a(a),            // input wire [15 : 0] a
        .d(d),            // input wire [11 : 0] d
        .dpra(dpra),      // input wire [15 : 0] dpra
        .clk(clk_5hz),  // input wire clk
        .we(we),          // input wire we
        .dpo(dpo)        // output wire [11 : 0] dpo
    );
endmodule
