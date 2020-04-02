`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2020 10:56:22 AM
// Design Name: 
// Module Name: buttons
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


module buttons(
    input clk,
    input btnU,
    input btnD,
    input btnL,
    input btnR,
    input reset,
    output reg [5:0] left_bar_yL = 24,
    output reg [5:0] left_bar_yH = 33,
    output reg [5:0] right_bar_yL = 24,
    output reg [5:0] right_bar_yH = 33
    );
    
    always @ (posedge clk) begin
        if (reset) begin
            left_bar_yL <= 24;
            left_bar_yH <= 33;
            right_bar_yL <= 24;
            right_bar_yH <= 33;
        end
        
        if (btnU) begin // player 1 (left) up
            if (left_bar_yH < 60) begin
               left_bar_yH <= left_bar_yH + 1;
               left_bar_yL <= left_bar_yL + 1;
               end
            end
                
        if (btnD) begin // player 1 (left) down
            if (left_bar_yL > 3) begin
               left_bar_yH <= left_bar_yH - 1;
               left_bar_yL <= left_bar_yL - 1;
            end
        end
                
        if (btnL) begin // player 2 (right) up
            if (right_bar_yH < 60) begin
                right_bar_yH <= right_bar_yH + 1;
                right_bar_yL <= right_bar_yL + 1;
            end
        end
                
        if (btnR) begin // player 2 (right) down
            if (right_bar_yL > 3) begin
                right_bar_yH <= right_bar_yH - 1;
                right_bar_yL <= right_bar_yL - 1;
            end
        end    
    end    
    
    
endmodule
