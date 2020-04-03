`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2020 05:47:16 PM
// Design Name: 
// Module Name: test_frame_begin
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


module test_frame_begin(
    input frame_begin,
    input [6:0] x,
    input [5:0] y,
    output reg [15:0] oled_data
    );
    
    reg [2:0] frames = 0;
    wire [15:0] back_color = 16'h0000;
    wire [15:0] game_color = 16'hFFFF;
    reg [6:0] counter = 0;
    always @ (posedge frame_begin) begin
        counter = counter + 1;
        if (counter == 0) begin  
            frames = frames + 1;
        end
    end
    
    always @ (frames) begin
        oled_data = back_color;
        if (frames == 0) begin
            if (y == x - 16)begin
                oled_data = game_color;
            end
        end
        if (frames == 1) begin
            if (y == x - 16)begin
                oled_data = game_color;
            end
            if (y == 70 - x)begin
                oled_data = game_color;
            end
        end
        if (frames == 2) begin
            if (36 * ((x - 48) * (x - 48)) + 9 * ((y - 32) * (y - 32)) == 324)begin
                oled_data = game_color;
            end
        end
    end
endmodule
