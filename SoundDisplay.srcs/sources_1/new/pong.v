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
    input clk,
    output reg reset,
    output reg [6:0] ball_x = 47,
    output reg [5:0] ball_y = 31,
    output reg [1:0] pong_state = 0
    );

    parameter [2:0] left_bar_x = 4;
    parameter [6:0] right_bar_x = 91;
    
    reg x_dirc = 1; // 0 : -1, 1 : +1
    reg y_dirc = 1; // 0 : -1, 1 : +1
    
//    reg stop = 0; // TO BE CHANGED
    
    always @ (posedge clk) begin
        reset <= 0;
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
        
        if (ball_x == left_bar_x + 1) begin
            // check left bar
//            if (((ball_y + ((y_dirc) ? 1 : -1)) >= left_bar_yL) &&
//               ((ball_y + ((y_dirc) ? 1 : -1)) <= left_bar_yH))  begin
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
                pong_state <= 2;
                reset <= 1;
            end
        end
        
        if (ball_x == right_bar_x - 1) begin
            // check right bar
//            if (((ball_y + ((y_dirc) ? 1 : -1)) >= left_bar_yL) &&
//               ((ball_y + ((y_dirc) ? 1 : -1)) <= left_bar_yH))  begin
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
                pong_state <= 1;
                reset <= 1; 
            end
        end
    end
    
endmodule
