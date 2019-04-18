`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2019 12:38:00 PM
// Design Name: 
// Module Name: mask
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


module mask(
    input clk_25_2mhz,rst,
    input [3:0]Ri,Gi,Bi,
    input [7:0]x,y,
    output [3:0]Ro,Go,Bo
    );
    reg [15:0]line,row;
    
    wire is_arrow_x,is_arrow_y,is_arrow;
    wire is_arrow_u_x,is_arrow_u_y,is_arrow_u;
    wire is_arrow_d_x,is_arrow_d_y,is_arrow_d;
    wire is_arrow_l_x,is_arrow_l_y,is_arrow_l;
    wire is_arrow_r_x,is_arrow_r_y,is_arrow_r;
    wire is_mask;
    
    
    
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
    
    ///
    assign is_arrow_x = ((line>=LINE1-1) && (line<LINE2-1) && (line-LINE1-1 == x)) ? 1:0; 
    assign is_arrow_y = ((row>=ROW1-1) && (row<ROW2-1) && (row-ROW1+1 == y)) ? 1:0;
    assign is_arrow = is_arrow_x & is_arrow_y;
    ///
    
    ///
    assign is_arrow_u_x = ((line>=LINE1-1) && (line<LINE2-1) && (line-LINE1-1 == x)) ? 1:0; 
    assign is_arrow_u_y = ((row>=ROW1) && (row<ROW2-1) && (row-ROW1+1 == y-1)) ? 1:0;
    assign is_arrow_u = is_arrow_u_x & is_arrow_u_y;
    ///
    
    ///
    assign is_arrow_d_x = ((line>=LINE1-1) && (line<LINE2-1) && (line-LINE1-1 == x)) ? 1:0; 
    assign is_arrow_d_y = ((row>=ROW1-1) && (row<ROW2-2) && (row-ROW1+1 == y+1)) ? 1:0;
    assign is_arrow_d = is_arrow_d_x & is_arrow_d_y;
    ///
    
    ///
    assign is_arrow_l_x = ((line>=LINE1) && (line<LINE2-1) && (line-LINE1-1 == x-1)) ? 1:0; 
    assign is_arrow_l_y = ((row>=ROW1-1) && (row<ROW2-1) && (row-ROW1+1 == y)) ? 1:0;
    assign is_arrow_l = is_arrow_l_x & is_arrow_l_y;
    ///
    
    ///
    assign is_arrow_r_x = ((line>=LINE1-1) && (line<LINE2-2) && (line-LINE1-1 == x+1)) ? 1:0; 
    assign is_arrow_r_y = ((row>=ROW1-1) && (row<ROW2-1) && (row-ROW1+1 == y)) ? 1:0;
    assign is_arrow_r = is_arrow_r_x & is_arrow_r_y;
    ///
    
    assign is_mask = is_arrow | is_arrow_u | is_arrow_d | is_arrow_r | is_arrow_l;
    
    ///
    assign Ro = is_mask ? 4'b0000 : Ri;
    assign Go = is_mask ? 4'b0000 : Gi;
    assign Bo = is_mask ? 4'b0000 : Bi;
    ///
    
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
endmodule
