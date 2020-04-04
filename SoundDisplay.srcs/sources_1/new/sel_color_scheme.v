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
    
    assign border_color = (sw4) ? ((sw5) ? 16'h0000 : 16'hFFFF) 
                        : 16'hFFFF;
    assign back_color = (sw4) ? ((sw5) ? 16'hFFFF :16'h0000)
                        : 16'h0000;
    assign top_color = (sw4) ? ((sw5) ? 16'hFF22 : 16'hFC00) 
                        : 16'hF800;
    assign mid_color = (sw4) ? ((sw5) ? 16'hFE02 : 16'h9813) 
                        : 16'hFFE0;
    assign bot_color = (sw4) ? ((sw5) ? 16'hFD02 : 16'h04C0) 
                        : 16'h07E0;
endmodule
