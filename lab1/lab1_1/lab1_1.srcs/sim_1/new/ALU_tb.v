`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/21 11:56:42
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb(
    
);
    reg [5:0]a,b;
    reg [2:0]s;
    wire [5:0]y;
    wire [2:0]f;
    initial
    begin
        a=6'd0;
        a=6'b111111;
        #30;
        a=6'b110010;
        #30;
        a=6'b010010;
        #30;
        a=6'b100000;
        #30;
    end

    initial 
    begin
        b=6'd0;
        b=6'b101001;
        #30;
        b=6'b011001;
        #30;
        b=6'b101000;
        #30;
        b=6'b000001;
        #30;
    end

    integer k=0;
    initial 
    begin
        for (k=0;k<5;k=k+1)
        begin
            s=3'd0;#5;
            s=3'd1;#5;
            s=3'd2;#5;
            s=3'd3;#5;
            s=3'd4;#5;
            s=3'd5;#5;
        end
    end
    
    ALU U (a,b,s,y,f);
endmodule
