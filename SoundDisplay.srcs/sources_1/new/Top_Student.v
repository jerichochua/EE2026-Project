`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
//  FILL IN THE FOLLOWING INFORMATION:
//
//  LAB SESSION DAY (Delete where applicable): THURSDAY A.M.
//
//  STUDENT A NAME: Jericho Chua Wei Quan
//  STUDENT A MATRICULATION NUMBER: A0201663N
//
//  STUDENT B NAME: Chen Qixing
//  STUDENT B MATRICULATION NUMBER: A0196669A
//
//////////////////////////////////////////////////////////////////////////////////


module Top_Student (
    input  J_MIC3_Pin3,   // Connect from this signal to Audio_Capture.v
    input CLK100MHZ,
    output J_MIC3_Pin1,   // Connect to this signal from Audio_Capture.v
    output J_MIC3_Pin4,    // Connect to this signal from Audio_Capture.v
    output [11:0] led,
    input sw,
    input sw1,
    input sw2,
    input sw3,
    input sw4,
    input sw5,
    input btnC,
    output cs, // JX[0]
    output sdin, // JX[1]
    output sclk, // JX[3]
    output d_cn, // JX[4]
    output resn, // JX[5]
    output vccen, // JX[6]
    output pmoden // JX[7]
    );
    
    wire clk20k;
    wire [11:0] mic_in;
    
    wire clk6p25m, clk3;
    wire reset;
    wire [15:0] oled_data;
    
    wire frame_begin, sending_pixels, sample_pixel;
    wire [12:0] pixel_index;
    wire [4:0] teststate;

    wire [6:0] x;
    wire [5:0] y;
    
    wire [15:0] border_color;
    wire [15:0] back_color;
    wire [15:0] top_color;
    wire [15:0] mid_color;
    wire [15:0] bot_color;

    clock_divider_20k clk20 (CLK100MHZ, clk20k);
    Audio_Capture audio (CLK100MHZ, clk20k, J_MIC3_Pin3, J_MIC3_Pin1, J_MIC3_Pin4, mic_in);
    
    assign oled_data = {8'h3f, mic_in[11:7]};
    clock_divider_6p25m c1(CLK100MHZ, clk6p25m);
    clock_divider_3 c2(CLK100MHZ, clk3);
    debounce db(clk3, btnC, reset);
    Oled_Display OD(clk6p25m, reset, frame_begin, sending_pixels,
                    sample_pixel, pixel_index, oled_data, cs, sdin, sclk, d_cn, resn, vccen,
                    pmoden, teststate);

    coordinate xy(pixel_index, x, y);
    sel_color_scheme scs(sw4, sw5, border_color, back_color, top_color, mid_color, bot_color);
    border p1(x, y, sw1, sw2, sw3, border_color, back_color, top_color, mid_color, bot_color, oled_data);
    
    assign led = (sw == 1) ? mic_in : 12'b000000000000;
endmodule