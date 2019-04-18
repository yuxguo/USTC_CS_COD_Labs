`timescale 10ns / 10ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2019 08:31:00 PM
// Design Name: 
// Module Name: FIFO
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


module FIFO(
    input en_out,en_in,rst,clk_in,
    input [3:0]in,
    output [3:0]out,
    output [15:0]display,
    output empty,full,
    output reg [2:0]addr_in
    );
    wire clk_5mhz,clk_500hz,lock;
    clk_wiz_0 U1 (clk_5mhz,0,lock,clk_in);
    clock_500hz U2 (clk_5mhz,0,0,clk_500hz);
    reg [3:0]addr_dis,addr_out;
    wire en_queue,de_queue,en_queue_able,de_queue_able;
    wire [3:0]dis_data;
    reg [7:0]used;
    reg [3:0]count;
    reg [2:0]head;
    reg [1:0]flag_in,flag_out;
    always @ (posedge rst or posedge clk_500hz)
    begin
        if (rst)
            flag_in=2'b00;
        else
        begin
            if (en_in && flag_in==2'b00)
                flag_in=2'b01;
            else if (en_in && flag_in==2'b01)
                flag_in=2'b10;
            else if (en_in && flag_in==2'b11)
                flag_in=2'b10;
            else if (en_in && flag_in==2'b10)
                flag_in=2'b10;
            else 
                flag_in=2'b00;
        end
    end
        
    always @ (posedge rst or posedge clk_500hz)
    begin
        if (rst)
            flag_out=2'b00;
        else
        begin
            if (en_out && flag_out==2'b00)
                flag_out=2'b01;
            else if (en_out && flag_out==2'b01)
                flag_out=2'b10;
            else if (en_out && flag_out==2'b11)
                flag_out=2'b10;
            else if (en_out && flag_out==2'b10)
                flag_out=2'b10;
            else
                flag_out=2'b00;
        end
    end
    assign en_queue=flag_in[0];
    assign de_queue=flag_out[0];
    assign en_queue_able=en_queue & ~full;
    assign de_queue_able=de_queue & ~empty;
    assign full=(count==4'd8);
    assign empty=(count==4'd0);
    
    
    /*主状态机*/
        always @ (posedge clk_500hz or posedge rst)
        begin
            if (rst)
            begin
                count=4'b000;
                head=4'b0000;
                used=8'b00000000;
                addr_in=4'b0000;
                addr_out=4'b0000;
            end
            else
            begin
                if (en_queue_able)//EnQueue
                begin
                    count=count+1;
                    used[addr_in]=1'b1;
                    addr_in = addr_in+1;//传出addr到reg_file,写入新元素
                end
                else if (de_queue_able)
                begin
                    count=count-1;
                    addr_out = head;//传出addr到reg_file的ra1,读出出队元素
                    head=head+1;
                    used[addr_out]=1'b0;
                end
            end
        end
    
    
    Reg_File U4 (addr_dis,addr_out,addr_in[2:0],in,en_queue_able,rst,clk_500hz,dis_data,out);//rd0用于读取数码管信息，rd1读取出队列信息
    
    wire is_head,is_dis;
    assign is_head = (addr_dis==head);
    assign is_dis = (used[addr_dis]==1);
    bcd_decoder U5 (is_dis,is_head,addr_dis,dis_data,display);
    
    
    always @ (posedge clk_500hz or posedge rst)
    begin
        if (rst)
            addr_dis=0;
        else
            addr_dis=addr_dis+1;
    end
    
endmodule
