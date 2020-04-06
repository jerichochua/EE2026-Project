`timescale 1ns / 1ps

/*
    Simple stopwatch on the 7 segment display
    Use switch to start/stop the stopwatch, button to reset stopwatch
*/

module stopwatch(input clk, input start, input reset, output reg [4:0] a0 = 20, output reg [4:0] a1 = 0, output reg [4:0] a2 = 20, output reg [4:0] a3 = 0);
    reg [23:0] count = 0;
    wire tick;
    
    assign tick = (count == 10000000) ? 1 : 0;
    
    always @ (posedge clk) begin
        if (reset) begin
            count <= 0;
            a0 <= 20;
            a1 <= 0;
            a2 <= 20;
            a3 <= 0;
        end
    
        if (count == 10000000) begin // To get 0.1s
            count <= 0;
        end
        else if (start) begin
            count <= count + 1;
        end
        
        if (tick) begin
            if (a3 == 9) begin
                a3 <= 0;
                if (a2 == 29) begin
                    a2 <= 20;
                    if (a1 == 5) begin
                        a1 <= 0;
                        if (a0 == 29) begin
                            a0 <= 20;
                        end
                        else begin
                            a0 <= a0 + 1;
                        end
                    end
                    else begin
                        a1 <= a1 + 1;
                    end
                end
                else begin
                    a2 <= a2 + 1;
                end
            end
            else begin
                a3 <= a3 + 1;
            end
        end
        
    end
endmodule
