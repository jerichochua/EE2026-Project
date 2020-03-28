`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2020 11:16:22 AM
// Design Name: 
// Module Name: border_1p
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


module border(
    input [6:0] x,
    input [5:0] y,
//    input [1:0] borderWidth,
    input sw1,
    input sw2,
    input sw3,
    input sw6,
    input sw7,
    input [15:0] border_color,
    input [15:0] back_color,
    input [15:0] top_color,
    input [15:0] mid_color,
    input [15:0] bot_color,
    input [3:0] map,
    output reg [15:0] oled_data
    );
    wire [1:0] borderWidth = (sw6) ? 2'd0 : ((sw1) ? ((sw3) ? 2'd3 : 2'd1) : 2'd0);
    wire [15:0] top = (sw6) ? back_color : ((sw2) ? top_color : back_color); 
    wire [15:0] mid = (sw6) ? back_color : ((sw2) ? mid_color : back_color); 
    wire [15:0] bot = (sw6) ? back_color : ((sw2) ? bot_color : back_color); 
    
    reg [5:0] min = 9;
    reg [5:0] freeze_value;
    
    always @ (*) begin
        if (sw7) begin
            min <= freeze_value;
        end
        else begin
            min <= 56 - (map+1)*3;
            freeze_value <= min;
        end
        
        if (x < borderWidth || x > (7'd95 - borderWidth) || y < borderWidth || y > (6'd63 - borderWidth)) begin
            oled_data <= border_color;
        end
        else if (x >= 44 && x <= 51) begin
            if (y >= min && y <= 55) begin
                if ((y-8)%3 == 0)
                    oled_data <= back_color;
                else if (y <= 23) // red
                    //oled_data <= 16'b1111100000000000;
                    //oled_data <= 16'b1111110000000000; //orange
//                    oled_data <= 16'b0011011111100110; //light green
                    oled_data <= top;
                else if (y <= 38) // yellow
                    //oled_data <= 16'b1111111111100000;
                    //oled_data <= 16'b1001100000010011; //purple
//                    oled_data <= 16'b0000010101100000; //dark green
                    oled_data <= mid;
                else // green
                    //oled_data <= 16'b0000011111100000;
                    //oled_data <= 16'b0000010011000000; //green
//                    oled_data <= 16'b0011110011111010; //light blue
                    oled_data <= bot;
            end
            else begin
                oled_data <= back_color;
            end
        end
        else begin
            oled_data <= back_color;
        end
    end
endmodule
