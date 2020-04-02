`timescale 1ns / 1ps

module visualizer(input clk, input [11:0] mic_in, input [6:0] x, input [5:0] y, output reg [15:0] vis_oled);
    reg [5:0] map_y = 0; // 64 values along y-axis
    reg [6:0] x_ctr = 0; // 8 bits, but only count from 0 to 95
    
    reg [23:0] clock_2s = 0;
    reg [11:0] max = 0;
    
    always @ (posedge clk) begin
        clock_2s <= clock_2s + 1;
        
        // Obtain max value from mic_in
        if (mic_in > max) begin
            max <= mic_in;
        end
        
        if (clock_2s == 0) begin
            map_y <= (max - 2048) / 32; // Get value to map along y-axis of display
            max <= 0;
            
            if (x_ctr == 95) begin
                x_ctr = 0;
            end
            else begin
               x_ctr <= x_ctr + 1;
            end
        end
        
        if (y == (63 - map_y)) begin
            if (y >= 0 && y <= 19)
                vis_oled <= 16'b1111100000000000; // Green
            else if (y >= 20 && y <= 39)
                vis_oled <= 16'b1111111111100000; // Yellow
            else
                vis_oled <= 16'b0000011111100000; // Red
        end
        else if (x == x_ctr) begin
            vis_oled <= 16'b0000000000011111;
        end
        else begin
            vis_oled <= 16'b0000000000000000;
        end
    end
endmodule
