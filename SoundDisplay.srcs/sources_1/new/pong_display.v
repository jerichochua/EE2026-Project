`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2020 08:59:24 AM
// Design Name: 
// Module Name: pong_display
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


module pong_display(
    input [5:0] left_bar_yL,
    input [5:0] left_bar_yH,
    input [5:0] right_bar_yL,
    input [5:0] right_bar_yH,
    input [6:0] x,
    input [5:0] y,
    input [6:0] ball_x,
    input [5:0] ball_y,
    output reg [15:0] oled_data
    );
    
    parameter [1:0] borderWidth = 3;
    parameter [3:0] bar_length = 10;

    parameter [2:0] left_bar_x = 4;
    parameter [6:0] right_bar_x = 91;
    
    parameter [15:0] back_color = 16'h0000;
    parameter [15:0] game_color = 16'hFFFF; 
    
    always @ (x, y) begin
    
        if (x < borderWidth || x > (7'd95 - borderWidth) || y < borderWidth || y > (6'd63 - borderWidth)) begin
            oled_data <= game_color;
        end
        else if (x == left_bar_x) begin
            if (y >= left_bar_yL && y <= left_bar_yH) begin
                oled_data <= game_color;
            end
            else begin
                oled_data <= back_color;
            end
        end
        else if (x == right_bar_x) begin
            if (y >= right_bar_yL && y <= right_bar_yH) begin
                oled_data <= game_color;
            end
            else begin
                oled_data <= back_color;
            end
        end
        else begin
            oled_data <= back_color; 
        end
        
        if (x == ball_x && y == ball_y) begin // ball
            oled_data <= game_color;
        end
        
        if (x == 47) begin // mid line
            if (y % 5 == 0 || (y + 1) % 5 == 0) begin
                oled_data <= game_color;
            end
        end
        
    end
endmodule
