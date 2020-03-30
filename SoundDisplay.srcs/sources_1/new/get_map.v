`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2020 11:06:57 AM
// Design Name: 
// Module Name: get_map
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


module get_map(
    input CLK100MHZ,
    input sw,
    input [11:0] mic_in,
    output reg [3:0] map,
    output reg [4:0] a2 = 10,
    output reg [4:0] a3 = 10,
    output reg [15:0] led
    );
    
    reg [15:0] currled = 0;
    reg [11:0] max = 0;
    reg [23:0] clock_2s = 0;
    always @ (posedge CLK100MHZ) begin
        clock_2s <= clock_2s + 1;
        if (mic_in > max) begin
            max <= mic_in;
        end
        
        if (sw == 1) begin
            led <= mic_in;
            a2 <= 10;
            a3 <= 10;
        end
        else begin
            led <= currled;
        end
        
        if (clock_2s == 0) begin
            map <= (max - 2048) / 128;
            currled <= 16'b1111111111111111 >> (15 - map);
            case (map)
                0: begin a2 <= 10; a3 <= 0; max <= 0; end
                1: begin a2 <= 10; a3 <= 1; max <= 0; end
                2: begin a2 <= 10; a3 <= 2; max <= 0; end
                3: begin a2 <= 10; a3 <= 3; max <= 0; end
                4: begin a2 <= 10; a3 <= 4; max <= 0; end
                5: begin a2 <= 10; a3 <= 5; max <= 0; end
                6: begin a2 <= 10; a3 <= 6; max <= 0; end
                7: begin a2 <= 10; a3 <= 7; max <= 0; end
                8: begin a2 <= 10; a3 <= 8; max <= 0; end
                9: begin a2 <= 10; a3 <= 9; max <= 0; end
                10: begin a2 <= 1; a3 <= 0; max <= 0; end
                11: begin a2 <= 1; a3 <= 1; max <= 0; end
                12: begin a2 <= 1; a3 <= 2; max <= 0; end
                13: begin a2 <= 1; a3 <= 3; max <= 0; end
                14: begin a2 <= 1; a3 <= 4; max <= 0; end
                15: begin a2 <= 1; a3 <= 5; max <= 0; end
                default: begin a2 <= 10; a3 <= 0; max <= 0; end
            endcase
        end
    end
endmodule
