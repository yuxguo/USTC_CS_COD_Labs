`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2019 06:31:05 PM
// Design Name: 
// Module Name: B_Data_Decode
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


module B_Data_Decode(
    input [31:0]R_Data,
    output [31:0]decode_data
    );
    parameter m=8'h6d;
    parameter r=8'h72;
    
    Ascii2Hex U0 (R_Data[15:8],decode_data[11:8]);
    Ascii2Hex U1 (R_Data[23:16],decode_data[7:4]);
    Ascii2Hex U2 (R_Data[31:24],decode_data[3:0]);
    assign decode_data[12] = (R_Data[7:0]==m)?1:0;
    
endmodule
