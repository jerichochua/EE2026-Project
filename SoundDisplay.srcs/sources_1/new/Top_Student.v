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
    input sw,
    input sw1,
    input sw2,
    input sw3,
    input sw4,
    input sw5,
    input sw6,
    input sw7,
    input sw15,
//    input sw8,
    input btnC,
    input btnU,
    input btnD,
    input btnL,
    input btnR,
    output cs, // JX[0]
    output sdin, // JX[1]
    output sclk, // JX[3]
    output d_cn, // JX[4]
    output resn, // JX[5]
    output vccen, // JX[6]
    output pmoden, // JX[7]
    output [15:0] led,
    output [3:0] an,
    output [7:0] seg
    );
    
    wire clk20k;
    wire [11:0] mic_in;
    
    wire clk6p25m, clk3, clk5, clk100;
    wire reset;
    wire [15:0] oled_data;
    
    wire [15:0] basic_oled_data;
    wire [15:0] vis_oled;
    
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
    
    wire [4:0] a0;
    wire [4:0] a1;
    wire [4:0] a2;
    wire [4:0] a3;
    wire [3:0] map;

    assign oled_data = (sw15 == 1) ? vis_oled : basic_oled_data;
    wire [15:0] pong_game_oled_data;    
    wire dbU;
    wire dbD;
    wire dbL;
    wire dbR;

    get_map gm(CLK100MHZ, sw, mic_in, map, a0, a1, a2, a3, led);
    sevensegdisp ssd (CLK100MHZ, a0, a1, a2, a3, an[3:0], seg[7:0]);
    
    visualizer vis (CLK100MHZ, mic_in, x, y, vis_oled);
    
    clock_divider_6p25m c1(CLK100MHZ, clk6p25m);
    clock_divider_3 c2(CLK100MHZ, clk3);
    clock_divider_10 c3(CLK100MHZ, clk5);
    clock_divider_100 c4(CLK100MHZ, clk100);
    debounce db(clk3, btnC, reset);
    Oled_Display OD(clk6p25m, reset, frame_begin, sending_pixels,
                    sample_pixel, pixel_index, oled_data, cs, sdin, sclk, d_cn, resn, vccen,
                    pmoden, teststate);

    coordinate xy(pixel_index, x, y);
    sel_color_scheme scs(sw4, sw5, border_color, back_color, top_color, mid_color, bot_color);

    wire [5:0] min;
    
    freeze f(CLK100MHZ, sw7, map, min);

    border p1(x, y, sw1, sw2, sw3, sw6,
              border_color, back_color, top_color, mid_color, bot_color, min, basic_oled_data); 

    debounce dbtnU(clk3, btnU, dbU);
    debounce dbtnD(clk3, btnD, dbD);
    debounce dbtnL(clk3, btnL, dbL);
    debounce dbtnR(clk3, btnR, dbR);
              
    wire [5:0] left_bar_yL;
    wire [5:0] left_bar_yH;
    wire [5:0] right_bar_yL;
    wire [5:0] right_bar_yH;
    //    wire reset_bar;
    buttons btns(clk5, dbD, dbU, dbR, dbL, 0, left_bar_yL, left_bar_yH, right_bar_yL, right_bar_yH); // 6 6
    pong pong_game(left_bar_yL, left_bar_yH, right_bar_yL, right_bar_yH, x, y, clk5, pong_game_oled_data);
    // can try to change frame_begin to other clk OR debounce clk to improve
    assign oled_data = pong_game_oled_data;
endmodule