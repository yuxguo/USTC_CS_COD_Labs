`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2019 12:59:26 PM
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
    input cont,step,mem,inc,dec,clk_in,rst,DEBUGING,
    input [3:0]in,
    input en_Interrupt,RX,
    output [15:0]led,
    output [6:0]seg,
    output [7:0]an,
    output [3:0]line,
    output Latch,G,Data_in,clk,TX
    );
    wire clk_500hz,clk_5hz,clk_5mhz,clk_50khz;
    wire locked;
    wire run;
    wire cpu_clock;
    wire [31:0]data;
    
    wire [4:0]reg_addr;
    wire [31:0]debug_addr,seg_addr,led_addr,read_addr,bluetooth_raddr,bluetooth_waddr;
    wire [31:0]reg_data,mem_data;
    
    wire [6:0]seg_o;
    wire [7:0]an_o;
    wire [6:0]seg_S;
    wire [7:0]an_S;
    wire [31:0]MEM_out,Mem_Addr,MemWriteData,pc;
    wire MemWrite;
    wire clk_9600hz,clk9_6MHz;
    
    assign data = (mem == 1)? mem_data:reg_data;
    assign clk=clk_50khz;
    
    assign cpu_clock = run;
    assign seg = (DEBUGING == 0)? seg_S:seg_o;
    assign an = (DEBUGING == 0)? an_S:an_o;
    
    clk_wiz_0 CLK5MHZ (clk_5mhz,clk9_6MHz,0,locked,clk_in);
    clock_9600hz CLK9600HZ (clk9_6MHz,0,0,clk_9600hz);
    clock_500hz CLK500HZ (clk_5mhz,0,0,clk_500hz);
    clock_5hz CLK5HZ (clk_5mhz,0,0,clk_5hz);
    clock_50khz CLK50KHZ (clk_5mhz,0,0,clk_50khz);
    
    wire Input_Interrupt,LED_Interrupt,SEG_Interrupt,Bluetooth_Interrupt;
    wire [2:0]Input_mode,LED_mode,SEG_mode,Bluetooth_mode;
    
    Input_Driver IPD (cpu_clock,rst,in,en_Interrupt,Input_Interrupt,Input_mode);
    wire is_seg,is_bluetooth,is_bluetooth_data,bluetooth_we;
    Addr_Mux AM (DEBUGING,is_seg,is_bluetooth,debug_addr,seg_addr,led_addr,bluetooth_raddr,is_bluetooth_data,read_addr);
    wire [31:0]led_data,seg_data,bluetooth_wdata,bluetooth_rdata;
    LED_driver LD (cpu_clock,clk_50khz,rst,en_Interrupt,led_data,LED_Interrupt,LED_mode,led_addr,line,Latch,G,Data_in);
    
    Score_Driver SD (cpu_clock,clk_500hz,rst,en_Interrupt,seg_data,seg_addr,SEG_Interrupt,is_seg,SEG_mode,seg_S,an_S);
    wire Interrupt;
    wire [2:0]type;
    wire cpu_we;
    wire [31:0]cpu_addr,cpu_write_data;
    IRQ_Handler IRQH (Input_Interrupt,SEG_Interrupt,LED_Interrupt,Bluetooth_Interrupt,Input_mode,SEG_mode,LED_mode,Bluetooth_mode,Interrupt,type);/*Bluetooth_Interrupt*/
    
    Data_Distributor DD (is_seg,is_bluetooth_data,mem_data,led_data,seg_data,bluetooth_rdata);
    Bluetooth_WPriority BWP (bluetooth_waddr,cpu_addr,bluetooth_wdata,cpu_write_data,bluetooth_we,cpu_we,cpu_we,MemWrite,MemWriteData,Mem_Addr);
    Bluetooth_Driver BLD (cpu_clock,clk_9600hz,rst,bluetooth_rdata,RX,bluetooth_raddr,bluetooth_waddr,bluetooth_wdata,bluetooth_we,is_bluetooth,TX,Bluetooth_Interrupt,Bluetooth_mode);
    
    //MemWrite,MemWriteData
    CPU cpu (cpu_clock,rst,reg_addr,MEM_out,Interrupt,type,cpu_we,reg_data,pc,cpu_addr,cpu_write_data);
    DDU ddu (cont,step,mem,inc,dec,clk_5mhz,clk_500hz,clk_5hz,rst,pc,data,run,reg_addr,debug_addr,led,seg_o,an_o);
    MEM Mem (.a(Mem_Addr),.d(MemWriteData),.dpra(read_addr),.clk(cpu_clock),.we(MemWrite),.dpo(mem_data),.spo(MEM_out));//

endmodule

