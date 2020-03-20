`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2020 04:08:41 PM
// Design Name: 
// Module Name: sel_color_scheme
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


module sel_color_scheme(
    input sw4,
    input sw5,
    output [15:0] border_color,
    output [15:0] back_color,
    output [15:0] top_color,
    output [15:0] mid_color,
    output [15:0] bot_color
    );
    
    assign border_color = (sw4) ? ((sw5) ? 16'b1111111111111111 : 16'b1111111111111111) 
                        : 16'b1111111111111111;
    assign back_color = (sw4) ? ((sw5) ? 16'b0 : 16'b0) 
                        : 16'b0;
    assign top_color = (sw4) ? ((sw5) ? 16'b0011011111100110 : 16'b1111110000000000) 
                        : 16'b1111100000000000;
    assign mid_color = (sw4) ? ((sw5) ? 16'b0000010101100000 : 16'b1001100000010011) 
                        : 16'b1111111111100000;
    assign bot_color = (sw4) ? ((sw5) ? 16'b0011110011111010 : 16'b0000010011000000) 
                        : 16'b0000011111100000;
endmodule
