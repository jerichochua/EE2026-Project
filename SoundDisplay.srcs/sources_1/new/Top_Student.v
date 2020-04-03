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
    input sw8,
    input sw14,
    input sw15,
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
    
    wire clk6p25m, clk3, clk5, clk6;
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
    
    reg [4:0] a0;
    reg [4:0] a1;
    reg [4:0] a2;
    reg [4:0] a3;
    
    wire [4:0] map_a0;
    wire [4:0] map_a1;
    wire [4:0] map_a2;
    wire [4:0] map_a3;
    
    reg [4:0] ttt_a0;
    reg [4:0] ttt_a1;
    reg [4:0] ttt_a2;
    reg [4:0] ttt_a3;
    
    wire [3:0] map;

    wire [15:0] pong_game_oled_data;    
    wire dbU;
    wire dbD;
    wire dbL;
    wire dbR;
    
    wire currentPlayer;

    get_map gm(CLK100MHZ, sw, mic_in, map, map_a0, map_a1, map_a2, map_a3, led);
    sevensegdisp ssd (CLK100MHZ, a0, a1, a2, a3, an[3:0], seg[7:0]);
    
    // Change 7 segment display between volume and game
    always @ (sw14) begin
        if (sw14 == 1) begin
            a0 <= ttt_a0; a1 <= ttt_a1; a2 <= ttt_a2; a3 <= ttt_a3;
        end
        else begin
            a0 <= map_a0; a1 <= map_a1; a2 <= map_a2; a3 <= map_a3;
        end
    end
    
    // Change 7 segment display for player 1 and 2
    always @ (currentPlayer) begin
        if (currentPlayer == 0) begin
            ttt_a0 <= 10; ttt_a1 <= 10; ttt_a2 <= 11; ttt_a3 <= 1;
        end
        else begin
            ttt_a0 <= 10; ttt_a1 <= 10; ttt_a2 <= 11; ttt_a3 <= 2;
        end
    end    
    
    visualizer vis (CLK100MHZ, mic_in, x, y, vis_oled);
    
    clock_divider_6p25m c1(CLK100MHZ, clk6p25m);
    clock_divider_3 c2(CLK100MHZ, clk3);
    clock_divider_6 c3(CLK100MHZ, clk6);
    clock_divider_5 c4(CLK100MHZ, clk5);
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
    buttons btns(clk6, dbD, dbU, dbR, dbL, 0, left_bar_yL, left_bar_yH, right_bar_yL, right_bar_yH); // 6 6
    pong pong_game(left_bar_yL, left_bar_yH, right_bar_yL, right_bar_yH, x, y, clk5, pong_game_oled_data);
    // can try to change frame_begin to other clk OR debounce clk to improve
    
    
    wire [3:0] curr_box;
    wire [1:0] box1;
    wire [1:0] box2; 
    wire [1:0] box3;
    wire [1:0] box4;
    wire [1:0] box5;
    wire [1:0] box6;
    wire [1:0] box7; 
    wire [1:0] box8;
    wire [1:0] box9;
    wire [15:0] ttt_oled_data;
         
    ttt_game tttgamelogic (clk3, dbU, dbD, dbL, currentPlayer, curr_box, 
            box1, box2, box3, box4, box5, box6, box7, box8, box9);
    ttt_display td(box1, box2, box3, box4, box5, box6, box7, box8, box9, curr_box, x, y, ttt_oled_data);
    assign oled_data = (sw15 == 1) ? vis_oled : (sw8 == 1) ? pong_game_oled_data : basic_oled_data;
//    assign oled_data = ttt_oled_data;    
endmodule