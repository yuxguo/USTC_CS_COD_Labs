`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2019 09:37:39 AM
// Design Name: 
// Module Name: vga
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


module vga(
    input clk_25_2mhz,rst,
    input [3:0]R,G,B,
    output reg [3:0]Ro,Go,Bo,
    output reg hs,vs
    );
    
    parameter LINE1=200;
        parameter LINE2=456;
        parameter LINE3=640;
        parameter LINE4=656;
        parameter LINE5=752;
        parameter LINE6=800;
          
        parameter ROW1=100;
        parameter ROW2=356;
        parameter ROW3=480;
        parameter ROW4=490;
        parameter ROW5=492;
        parameter ROW6=525;
   
    reg [15:0]line,row;
    
    
    always @ (posedge clk_25_2mhz)
    begin
        if (row<ROW1-1)
        begin
            Ro<=0;
            Go<=0;
            Bo<=0;
        end
        else 
        begin
            if (row>=ROW1-1 && row<ROW2-1)
            begin
                if (line<LINE1-1)
                begin
                    Ro<=0;
                    Go<=0;
                    Bo<=0;
                end
                else if (line>=LINE1-1 && line<LINE2-1)
                begin
                    Ro<=R;
                    Go<=G;
                    Bo<=B;
                end
                else 
                begin
                    Ro<=0;
                    Go<=0;
                    Bo<=0;
                end
            end
            else 
            begin
                Ro<=0;
                Go<=0;
                Bo<=0;
            end
        end
    end
    
    always @ (posedge clk_25_2mhz or posedge rst)
    begin
        if (rst)
        begin
            hs<=0;
        end
        else 
        begin
            if (line<LINE4-1)
                hs<=0;
            else if (line>=LINE4-1 && line<LINE5-1)
                hs<=1;
            else
                hs<=0;
        end
    end
    
    always @ (posedge clk_25_2mhz or posedge rst)
    begin
        if (rst)
            vs<=0;
        else 
        begin
            if (row<ROW4-1)
                vs<=0;
            else if (row>=ROW4-1 && row<ROW5-1)
                vs<=1;
            else 
                vs<=0;
        end
    end
    
    
    always @ (posedge clk_25_2mhz or posedge rst)
    begin
        if (rst)
        begin
            line<=0;
            row<=0;
        end
        else
        begin
            if (line<LINE6-1)
            begin
                line<=line+1;
                row<=row;
            end
            else if(line==LINE6-1 && row!=ROW6-1)
            begin
                line<=0;
                row<=row+1;
            end 
            else if(line==LINE6-1 && row==ROW6-1)
            begin
                line<=0;
                row<=0;
            end 
        end
    end
    
endmodule
