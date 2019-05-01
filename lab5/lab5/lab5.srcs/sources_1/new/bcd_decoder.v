`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/28/2019 07:49:37 PM
// Design Name: 
// Module Name: bcd_decoder
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


module bcd_decoder(
    input [2:0]count,
    input [3:0]x,
    output reg [6:0]seg,
    output reg [7:0]an
    );
    
    always @ (x)
    begin
        case(x)
            4'b0000:seg <= 7'b1000000;
            4'b0001:seg <= 7'b1111001;
            4'b0010:seg <= 7'b0100100;
            4'b0011:seg <= 7'b0110000;
            4'b0100:seg <= 7'b0011001;
            4'b0101:seg <= 7'b0010010;
            4'b0110:seg <= 7'b0000010;
            4'b0111:seg <= 7'b1111000;
            4'b1000:seg <= 7'b0000000;
            4'b1001:seg <= 7'b0010000;
            4'b1010:seg <= 7'b0001000;
            4'b1011:seg <= 7'b0000011;
            4'b1100:seg <= 7'b1000110;
            4'b1101:seg <= 7'b0100001;
            4'b1110:seg <= 7'b0000110;
            4'b1111:seg <= 7'b0001110;
        endcase
    end
    
    always @ (*)
    begin
        case(count)
            3'b000:an=8'b01111111;
            3'b001:an=8'b10111111;
            3'b010:an=8'b11011111;
            3'b011:an=8'b11101111;
            3'b100:an=8'b11110111;
            3'b101:an=8'b11111011;
            3'b110:an=8'b11111101;
            3'b111:an=8'b11111110;
        endcase
    end
endmodule
