`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2019 11:17:32 AM
// Design Name: 
// Module Name: control_paint
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


module control_paint(
    input upbt,downbt,leftbt,rightbt,clk_5hz,rst,draw,
    input [3:0]Ri,Gi,Bi,
    output [15:0]a,
    output reg [11:0]data,
    output reg [7:0]x,y,
    output we
    
    );
    parameter RESET_X=128;
    parameter RESET_Y=128;
    
    
    wire u,d,l,r,ul,ur,dl,dr;
    
    assign a=x+256*y;
    
    assign u = upbt & ~downbt & ~leftbt & ~rightbt;
    assign d = ~upbt & downbt & ~leftbt & ~rightbt;
    assign l = ~upbt & ~downbt & leftbt & ~rightbt;
    assign r = ~upbt & ~downbt & ~leftbt & rightbt;
    assign ul = upbt & ~downbt & leftbt & ~rightbt;
    assign ur = upbt & ~downbt & ~leftbt & rightbt;
    assign dl = ~upbt & downbt & leftbt & ~rightbt;
    assign dr = ~upbt & downbt & ~leftbt & rightbt;
    
    assign we=draw;
    
    always @ (posedge rst or posedge clk_5hz)
    begin
        if (rst)
        begin
            x<=RESET_X;
            y<=RESET_Y;
        end
        else
        begin
            if (u)
            begin
                x<=x;
                y<= (y>0) ? (y-1) : y;
            end
            else if (d)
            begin
                x<=x;
                y<= (y<255) ? (y+1) : y;
            end
            else if (l)
            begin
                y<=y;
                x<= (x>0) ? (x-1) : x;
            end
            else if (r)
            begin
                y<=y;
                x<= (x<255) ? (x+1) : x;
            end
            else if (ul)
            begin
                x<= (x>0) ? (x-1) : x;
                y<= (y>0) ? (y-1) : y; 
            end
            else if (ur)
            begin
                x<= (x<255) ? (x+1) : x;
                y<= (y>0) ? (y-1) : y;
            end
            else if (dl)
            begin
                x<= (x>0) ? (x-1) : x;
                y<= (y<255) ? (y+1) : y;
            end
            else if (dr)
            begin
                x<= (x<255) ? (x+1) : x;
                y<= (y<255) ? (y+1) : y;
            end
            else 
            begin
                x<=x;
                y<=y;
            end
        end
    end
    
    always @ (posedge clk_5hz)
    begin
        if (draw)
        begin
            data<={Ri,Gi,Bi};
        end
        else 
        begin
            data<=12'hfff;
        end
    end
    
endmodule
