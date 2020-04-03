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
    
    
    parameter x_ss147L = 22;
    parameter x_ss147H = 31;
    parameter x_ss258L = 43;
    parameter x_ss258H = 52;
    parameter x_ss369L = 64;
    parameter x_ss369H = 73;
    
    parameter y_ss123L = 6;
    parameter y_ss123H = 14;
    parameter y_ss456L = 26;
    parameter y_ss456H = 34;
    parameter y_ss789L = 46;
    parameter y_ss789H = 54;
    
    parameter x_bs147L = 17;
    parameter x_bs147H = 36;
    parameter x_bs258L = 37;
    parameter x_bs258H = 58;
    parameter x_bs369L = 59;
    parameter x_bs369H = 77;
    
    parameter y_bs123L = 1;
    parameter y_bs123H = 20;
    parameter y_bs456L = 21;
    parameter y_bs456H = 40;
    parameter y_bs789L = 41;
    parameter y_bs789H = 60;

    always @ (*) begin
        ttt_oled_data <= back_color;
        
        
        // big_squares
        if (curr == 1) begin
            if ((x >= x_bs147L && x <= x_bs147H) && (y == y_bs123L || y == y_bs123H))  begin
                ttt_oled_data <= game_color;
            end
            if ((x == x_bs147L || x == x_bs147H) && (y >= y_bs123L && y <= y_bs123H))  begin
                ttt_oled_data <= game_color;
            end
        end
 
        if (curr == 2) begin
            if ((x >= x_bs258L && x <= x_bs258H) && (y == y_bs123L || y == y_bs123H))  begin
                ttt_oled_data <= game_color;
            end
            if ((x == x_bs258L || x == x_bs258H) && (y >= y_bs123L && y <= y_bs123H))  begin
                ttt_oled_data <= game_color;
            end
        end
        
        if (curr == 3) begin
            if ((x >= x_bs369L && x <= x_bs369H) && (y == y_bs123L || y == y_bs123H))  begin
                ttt_oled_data <= game_color;
            end
            if ((x == x_bs369L || x == x_bs369H) && (y >= y_bs123L && y <= y_bs123H))  begin
                ttt_oled_data <= game_color;
            end
        end

        if (curr == 4) begin
            if ((x >= x_bs147L && x <= x_bs147H) && (y == y_bs456L || y == y_bs456H))  begin
                ttt_oled_data <= game_color;
            end
            if ((x == x_bs147L || x == x_bs147H) && (y >= y_bs456L && y <= y_bs456H))  begin
                ttt_oled_data <= game_color;
            end
        end

        if (curr == 5) begin
            if ((x >= x_bs258L && x <= x_bs258H) && (y == y_bs456L || y == y_bs456H))  begin
                ttt_oled_data <= game_color;
            end
            if ((x == x_bs258L || x == x_bs258H) && (y >= y_bs456L && y <= y_bs456H))  begin
                ttt_oled_data <= game_color;
            end
        end

        if (curr == 6) begin
            if ((x >= x_bs369L && x <= x_bs369H) && (y == y_bs456L || y == y_bs456H))  begin
                ttt_oled_data <= game_color;
            end
            if ((x == x_bs369L || x == x_bs369H) && (y >= y_bs456L && y <= y_bs456H))  begin
                ttt_oled_data <= game_color;
            end
        end

        if (curr == 7) begin
            if ((x >= x_bs147L && x <= x_bs147H) && (y == y_bs789L || y == y_bs789H))  begin
                ttt_oled_data <= game_color;
            end
            if ((x == x_bs147L || x == x_bs147H) && (y >= y_bs789L && y <= y_bs789H))  begin
                ttt_oled_data <= game_color;
            end
        end

        if (curr == 8) begin
            if ((x >= x_bs258L && x <= x_bs258H) && (y == y_bs789L || y == y_bs789H))  begin
                ttt_oled_data <= game_color;
            end
            if ((x == x_bs258L || x == x_bs258H) && (y >= y_bs789L && y <= y_bs789H))  begin
                ttt_oled_data <= game_color;
            end
        end

        if (curr == 9) begin
            if ((x >= x_bs369L && x <= x_bs369H) && (y == y_bs789L || y == y_bs789H))  begin
                ttt_oled_data <= game_color;
            end
            if ((x == x_bs369L || x == x_bs369H) && (y >= y_bs789L && y <= y_bs789H))  begin
                ttt_oled_data <= game_color;
            end
        end
        
        
        // small_squares
        if (s1 == 1) begin 
            if (x >= x_ss147L && x <= x_ss147H && y >= y_ss123L && y <= y_ss123H) begin
                if (y == x - 16 || y == 36 - x) begin
                    ttt_oled_data <= game_color;
                end
            end
        end
        else if (s1 == 2) begin 
            if ((x >= x_ss147L && x <= x_ss147H) && (y == y_ss123L || y == y_ss123H))  begin
                ttt_oled_data <= game_color;
            end
            if ((x == x_ss147L || x == x_ss147H) && (y >= y_ss123L && y <= y_ss123H))  begin
                ttt_oled_data <= game_color;
            end    
        end
        
        if (s2 == 1) begin 
            if (x >= x_ss258L && x <= x_ss258H && y >= y_ss123L && y <= y_ss123H) begin
                if (y == x - 37 || y == 57 - x) begin
                    ttt_oled_data <= game_color;
                end
            end
        end
        else if (s2 == 2) begin 
            if ((x >= x_ss258L && x <= x_ss258H) && (y == y_ss123L || y == y_ss123H))  begin
                ttt_oled_data <= game_color;
            end
            if ((x == x_ss258L || x == x_ss258H) && (y >= y_ss123L && y <= y_ss123H))  begin
                ttt_oled_data <= game_color;
            end      
        end

        if (s3 == 1) begin 
            if (x >= x_ss369L && x <= x_ss369H && y >= y_ss123L && y <= y_ss123H) begin
                if (y == x - 58 || y == 78 - x) begin
                    ttt_oled_data <= game_color;
                end
            end
        end
        else if (s3 == 2) begin 
            if ((x >= x_ss369L && x <= x_ss369H) && (y == y_ss123L || y == y_ss123H))  begin
                ttt_oled_data <= game_color;
            end
            if ((x == x_ss369L || x == x_ss369H) && (y >= y_ss123L && y <= y_ss123H))  begin
                ttt_oled_data <= game_color;
            end      
        end

        if (s4 == 1) begin 
            if (x >= x_ss147L && x <= x_ss147H && y >= y_ss456L && y <= y_ss456H) begin
                if (y == x + 4 || y == 56 - x) begin
                    ttt_oled_data <= game_color;
                end
            end
        end
        else if (s4 == 2) begin 
            if ((x >= x_ss147L && x <= x_ss147H) && (y == y_ss456L || y == y_ss456H))  begin
                ttt_oled_data <= game_color;
            end
            if ((x == x_ss147L || x == x_ss147H) && (y >= y_ss456L && y <= y_ss456H))  begin
                ttt_oled_data <= game_color;
            end     
        end

        if (s5 == 1) begin 
            if (x >= x_ss258L && x <= x_ss258H && y >= y_ss456L && y <= y_ss456H) begin
                if (y == x - 17 || y == 77 - x) begin
                    ttt_oled_data <= game_color;
                end
            end
        end
        else if (s5 == 2) begin 
            if ((x >= x_ss258L && x <= x_ss258H) && (y == y_ss456L || y == y_ss456H))  begin
                ttt_oled_data <= game_color;
            end
            if ((x == x_ss258L || x == x_ss258H) && (y >= y_ss456L && y <= y_ss456H))  begin
                ttt_oled_data <= game_color;
            end   
        end

        if (s6 == 1) begin 
            if (x >= x_ss369L && x <= x_ss369H && y >= y_ss456L && y <= y_ss456H) begin
                if (y == x - 38 || y == 98 - x) begin
                    ttt_oled_data <= game_color;
                end
            end
        end
        else if (s6 == 2) begin 
            if ((x >= x_ss369L && x <= x_ss369H) && (y == y_ss456L || y == y_ss456H))  begin
                ttt_oled_data <= game_color;
            end
            if ((x == x_ss369L || x == x_ss369H) && (y >= y_ss456L && y <= y_ss456H))  begin
                ttt_oled_data <= game_color;
            end    
        end

        if (s7 == 1) begin 
            if (x >= x_ss147L && x <= x_ss147H && y >= y_ss789L && y <= y_ss789H) begin
                if (y == x + 24 || y == 76 - x) begin
                    ttt_oled_data <= game_color;
                end
            end
        end
        else if (s7 == 2) begin 
            if ((x >= x_ss147L && x <= x_ss147H) && (y == y_ss789L || y == y_ss789H))  begin
                ttt_oled_data <= game_color;
            end
            if ((x == x_ss147L || x == x_ss147H) && (y >= y_ss789L && y <= y_ss789H))  begin
                ttt_oled_data <= game_color;
            end     
        end

        if (s8 == 1) begin 
            if (x >= x_ss258L && x <= x_ss258H && y >= y_ss789L && y <= y_ss789H) begin
                if (y == x + 3 || y == 97 - x) begin
                    ttt_oled_data <= game_color;
                end
            end
        end
        else if (s8 == 2) begin 
            if ((x >= x_ss258L && x <= x_ss258H) && (y == y_ss789L || y == y_ss789H))  begin
                ttt_oled_data <= game_color;
            end
            if ((x == x_ss258L || x == x_ss258H) && (y >= y_ss789L && y <= y_ss789H))  begin
                ttt_oled_data <= game_color;
            end     
        end

        if (s9 == 1) begin 
            if (x >= x_ss369L && x <= x_ss369H && y >= y_ss789L && y <= y_ss789H) begin
                if (y == x - 18 || y == 118 - x) begin
                    ttt_oled_data <= game_color;
                end
            end
        end
        else if (s9 == 2) begin 
            if ((x >= x_ss369L && x <= x_ss369H) && (y == y_ss789L || y == y_ss789H))  begin
                ttt_oled_data <= game_color;
            end
            if ((x == x_ss369L || x == x_ss369H) && (y >= y_ss789L && y <= y_ss789H))  begin
                ttt_oled_data <= game_color;
            end    
        end
    end
    
    
endmodule
