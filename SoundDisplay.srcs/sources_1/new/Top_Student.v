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
    input btnC,
    output cs, // JX[0]
    output sdin, // JX[1]
    output sclk, // JX[3]
    output d_cn, // JX[4]
    output resn, // JX[5]
    output vccen, // JX[6]
    output pmoden, // JX[7]
    output reg [15:0] led,
    output [3:0] an,
    output [7:0] seg
    );
    
    wire clk20k;
    wire [11:0] mic_in;
    
    wire clk6p25m, clk3;
    wire reset;
    wire [15:0] oled_data;
    
    wire frame_begin, sending_pixels, sample_pixel;
    wire [12:0] pixel_index;
    wire [4:0] teststate;
    
    reg [15:0] currled = 0;
    reg [11:0] max = 0;
    reg [3:0] map;
    reg [4:0] a2 = 10;
    reg [4:0] a3 = 10;
    
    reg [24:0] clock_2s = 0;

    wire [6:0] x;
    wire [5:0] y;
    
    wire [15:0] border_color;
    wire [15:0] back_color;
    wire [15:0] top_color;
    wire [15:0] mid_color;
    wire [15:0] bot_color;

    clock_divider_20k clk20 (CLK100MHZ, clk20k);
    Audio_Capture audio (CLK100MHZ, clk20k, J_MIC3_Pin3, J_MIC3_Pin1, J_MIC3_Pin4, mic_in);
    
    always @ (posedge CLK100MHZ) begin
        clock_2s <= clock_2s + 1;
        if (mic_in > max) begin
            max <= mic_in;
        end
        
        if (sw == 1) begin
            led <= mic_in;
            a2 <= 10;
            a3 <= 10;
        end
        else begin
            led <= currled;
        end
        
        if (clock_2s == 0) begin
            map <= (max - 2048) / 128;
            currled <= 16'b1111111111111111 >> (15 - map);
            case (map)
                0: begin a2 <= 10; a3 <= 0; max <= 0; end
                1: begin a2 <= 10; a3 <= 1; max <= 0; end
                2: begin a2 <= 10; a3 <= 2; max <= 0; end
                3: begin a2 <= 10; a3 <= 3; max <= 0; end
                4: begin a2 <= 10; a3 <= 4; max <= 0; end
                5: begin a2 <= 10; a3 <= 5; max <= 0; end
                6: begin a2 <= 10; a3 <= 6; max <= 0; end 
                7: begin a2 <= 10; a3 <= 7; max <= 0; end
                8: begin a2 <= 10; a3 <= 8; max <= 0; end
                9: begin a2 <= 10; a3 <= 9; max <= 0; end
                10: begin a2 <= 1; a3 <= 0; max <= 0; end
                11: begin a2 <= 1; a3 <= 1; max <= 0; end
                12: begin a2 <= 1; a3 <= 2; max <= 0; end
                13: begin a2 <= 1; a3 <= 3; max <= 0; end
                14: begin a2 <= 1; a3 <= 4; max <= 0; end
                15: begin a2 <= 1; a3 <= 5; max <= 0; end
                default: begin a2 <= 10; a3 <= 0; max <= 0; end
            endcase
        end
    end
    
    sevensegdisp ssd (CLK100MHZ, 10, 10, a2, a3, an[3:0], seg[7:0]);
    
    clock_divider_6p25m c1(CLK100MHZ, clk6p25m);
    clock_divider_3 c2(CLK100MHZ, clk3);
    debounce db(clk3, btnC, reset);
    Oled_Display OD(clk6p25m, reset, frame_begin, sending_pixels,
                    sample_pixel, pixel_index, oled_data, cs, sdin, sclk, d_cn, resn, vccen,
                    pmoden, teststate);

    coordinate xy(pixel_index, x, y);
    sel_color_scheme scs(sw4, sw5, border_color, back_color, top_color, mid_color, bot_color);
    border p1(x, y, sw1, sw2, sw3, border_color, back_color, top_color, mid_color, bot_color, map, oled_data);   
endmodule