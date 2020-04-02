`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2020 08:54:15 AM
// Design Name: 
// Module Name: pong
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


module pong(
    input [5:0] left_bar_yL,
    input [5:0] left_bar_yH,
    input [5:0] right_bar_yL,
    input [5:0] right_bar_yH,
    input [6:0] x,
    input [5:0] y,
    input clk,
//    input clk2,
//    output reg reset,
    output reg [15:0] oled_data
    );
    
    wire [1:0] borderWidth = 3;
    wire [3:0] bar_length = 10;
//    wire [1:0] ball_length = 3;

    wire [2:0] left_bar_x = 4;
    wire [6:0] right_bar_x = 91;
    
    wire [15:0] back_color = 16'h0000;
    wire [15:0] game_color = 16'hFFFF; 
    
    reg [6:0] ball_x = 47; // starts @ center but random direction
    reg [5:0] ball_y = 31;
//    reg [5:0] ball_yL;
//    reg [5:0] ball_yH;
    
//    reg [5:0] left_bar_yL = 24;
//    reg [5:0] left_bar_yH = 33;
//    reg [5:0] right_bar_yL = 24;
//    reg [5:0] right_bar_yH = 33;
    
    reg x_dirc = 1; // 0 : -1, 1 : +1
    reg y_dirc = 1; // 0 : -1, 1 : +1
    
//    reg stop = 0; // TO BE CHANGED
    
    always @ (posedge clk) begin
//        reset <= 0;
        // ball position
        
        case (x_dirc)
            0 : ball_x <= ball_x - 1;
            1 : ball_x <= ball_x + 1;
        endcase
        
        case (y_dirc)
            0 : ball_y <= ball_y - 1;
            1 : ball_y <= ball_y + 1;
        endcase
        
        if (ball_y == 3) begin
            if (x_dirc) begin
                ball_x <= ball_x + 1;
            end
            else begin
                ball_x <= ball_x - 1;
            end
            y_dirc <= y_dirc + 1; // toggle y_dirc
            ball_y <= 4; // 4
        end
        
        if (ball_y == 60) begin
            if (x_dirc) begin
                ball_x <= ball_x + 1;
            end
            else begin
                ball_x <= ball_x - 1;
            end
            y_dirc <= y_dirc + 1; // toggle y_dirc
            ball_y <= 59; // 59
        end
        
        if (ball_x == 5) begin
            // check left bar
//            if (((ball_y + ((y_dirc) ? 1 : -1)) >= left_bar_yL) && ((ball_y + ((y_dirc) ? 1 : -1)) <= left_bar_yH))  begin
            if ((ball_y > left_bar_yL) && (ball_y < left_bar_yH))  begin
                if (y_dirc) begin
                    ball_y <= ball_y + 1;
                end
                else begin
                    ball_y <= ball_y - 1;
                end
                x_dirc <= x_dirc + 1; // toggle x_dirc
                ball_x <= 6; // 6
            end
            else begin
                ball_x <= 47;
                ball_y <= 31; 
//                reset <= 1;
            end
        end
        
        if (ball_x == 90) begin
            // check right bar
//            if (((ball_y + (y_dirc) ? 1 : -1) >= right_bar_yL) && ((ball_y + (y_dirc) ? 1 : -1) <= right_bar_yH))  begin
            if ((ball_y > right_bar_yL) && (ball_y < right_bar_yH))  begin
                if (y_dirc) begin
                    ball_y <= ball_y + 1;
                end
                else begin
                    ball_y <= ball_y - 1;
                end
                x_dirc <= x_dirc + 1; // toggle x_dirc
                ball_x <= 89; // 89
            end
            else begin
                ball_x <= 47;
                ball_y <= 31;
//                reset <= 1; 
            end
        end
    end
    
//    always @ (posedge clk2) begin
//    // buttons
//        if (btnU) begin // player 1 (left) up
//            if (left_bar_yH < 60) begin
//                left_bar_yH <= left_bar_yH + 1;
//                left_bar_yL <= left_bar_yL + 1;
//            end
//        end
        
//        if (btnD) begin // player 1 (left) down
//            if (left_bar_yL > 3) begin
//                left_bar_yH <= left_bar_yH - 1;
//                left_bar_yL <= left_bar_yL - 1;
//            end
//        end
        
//        if (btnL) begin // player 2 (right) up
//            if (right_bar_yH < 60) begin
//                right_bar_yH <= right_bar_yH + 1;
//                right_bar_yL <= right_bar_yL + 1;
//            end
//        end
        
//        if (btnR) begin // player 2 (right) down
//            if (right_bar_yL > 3) begin
//                right_bar_yH <= right_bar_yH - 1;
//                right_bar_yL <= right_bar_yL - 1;
//            end
//        end    
//    end
    
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
        
        if (x == ball_x && y == ball_y) begin
            oled_data <= game_color;
        end
    end
    
endmodule
