module clock_5hz(
    input clk,enable,rst,
    output reg Q
    );
    reg [22:0]cnt;
            initial 
            begin
                Q<=0;
                cnt=23'd0; 
            end
            always @ (posedge clk)
            begin
                if (enable)
                begin
                    Q<=0;
                    cnt<=23'd0;
                end
                else if (cnt>=23'd499999)
                begin
                    Q<=~Q;
                    cnt<=23'd0;
                end
                else 
                    cnt=cnt+23'd1;
            end
endmodule