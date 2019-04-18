`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2019 10:53:30 AM
// Design Name: 
// Module Name: get_data
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


module get_data(
    input clk_25_2mhz,rst,
    output reg [15:0]dpra
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
    
    always @ (posedge clk_25_2mhz or posedge rst)
    begin
        if (rst)
        begin
            line<=0;//1040-1
            row<=0;//666-1
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
    
    always @ (posedge clk_25_2mhz or posedge rst)
    begin
        if (rst)
            dpra<=0;
        else
        begin
            if (row<ROW1-1)
            begin
                dpra<=0;
            end
            else if (row>=ROW1-1 && row<ROW2-1)
            begin
                if (line<LINE1-1)
                begin
                    dpra<=0;
                end
                else if (line>=LINE1-1 && line<LINE2-1)
                begin
                    dpra<=(line-LINE1+1)+(row-ROW1+1)*256;
                end
                else 
                begin
                    dpra<=0;
                end
            end
            else 
            begin
                dpra<=0;
            end
        end
    end
    
endmodule
