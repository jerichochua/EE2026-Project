`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2020 11:08:05 AM
// Design Name: 
// Module Name: ttt_display
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


module ttt_display(
    input [1:0] s1,
    input [1:0] s2,
    input [1:0] s3,
    input [1:0] s4,
    input [1:0] s5,
    input [1:0] s6,
    input [1:0] s7,
    input [1:0] s8,
    input [1:0] s9,
    input [3:0] curr,
    input [6:0] x,
    input [5:0] y,
    output reg [15:0] ttt_oled_data
    );
    
    wire [15:0] back_color = 16'h0000;
    wire [15:0] game_color = 16'hFFFF;
    
    always @ (*) begin
        ttt_oled_data <= back_color;
        if (s1 == 1) begin 
            if (x >= 22 && x <= 31 && y >= 6 && y <= 15) begin
                if (y == x - 16 || y == 36 - x) begin
                    ttt_oled_data <= game_color;
                end
            end
        end
        else if (s1 == 2) begin 
            if ((x == 22 || x == 31) && (y == 6 || y == 15)) begin
                ttt_oled_data <= game_color;
            end     
        end
        
        if (s1 == 2) begin 
            if (x >= 43 && x <= 52 && y >= 6 && y <= 15) begin
                if (y == x - 37 || y == 57 - x) begin
                    ttt_oled_data <= game_color;
                end
            end
        end
        else if (s1 == 2) begin 
            if ((x == 43 || x == 52) && (y == 6 || y == 15)) begin
                ttt_oled_data <= game_color;
            end     
        end
    end
    
    
endmodule
