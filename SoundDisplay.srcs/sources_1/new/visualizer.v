`timescale 1ns / 1ps

module visualizer(input clk, input [11:0] mic_in, input x, input y, output reg [15:0] vis_oled);
    reg [5:0] map_y = 0; // 64 values along y-axis
    reg [7:0] x_ctr = 95; // 8 bits, but only count from 0 to 95
    
    reg [23:0] clock_2s = 0;
    reg [11:0] max = 0;
    
    always @ (posedge clk) begin
        clock_2s <= clock_2s + 1;
        
        // Obtain max value from mic_in
        if (mic_in > max) begin
            max <= mic_in;
        end
        
        // Get value to map along y-axis of display
        if (clock_2s == 0) begin
            x_ctr <= x_ctr + 1;
            map_y <= (max - 2048) / 32;
            
            if (x == x_ctr && y == map_y) begin
                vis_oled <= 16'b1111111111111111; // Display white dot
            end
        end  
    end
endmodule
