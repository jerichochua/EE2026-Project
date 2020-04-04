`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2020 07:34:30 PM
// Design Name: 
// Module Name: frame_display
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


module frame_display(
    input frame_begin,
    input [6:0] x,
    input [5:0] y,
    output reg [15:0] oled_data
    );
    
    
    parameter [15:0] black_color = 16'h0000;
    parameter [15:0] white_color = 16'hFFFF;
    parameter [15:0] red_color = 16'hF800;
    parameter [15:0] green_color = 16'h07E0;
    parameter [15:0] blue_color = 16'h001F;
    parameter [15:0] yellow_color = 16'hFFE0;
    reg [6:0] counter = 0;
    reg [2:0] frames = 0;
    always @ (posedge frame_begin) begin
        counter = counter + 1;
        if (counter == 0) begin  
            frames = frames + 1;
        end
        if (frames == 6) begin
            frames = frames + 1;
        end
    end
    
    always @ (frames) begin
        oled_data = black_color;
        if (frames == 0) begin // I
            if (y >= 16 && y <=47)begin
                if (x >= 0 && x <= 15) begin            
                    if (x >= 0 && x <= 15 && y >= 16 && y <= 21)  begin
                        oled_data = white_color;
                    end
                    if (x >= 6 && x <= 9 && y >= 22 && y <= 41)  begin
                        oled_data = white_color;
                    end
                    if (x >= 0 && x <= 15 && y >= 42 && y <= 47)  begin
                        oled_data = white_color;
                    end              
                end
            end
        end
        
        if (frames == 1) begin
            if (y >= 16 && y <=47) begin // I
                if (x >= 0 && x <= 15) begin      
                    if (x >= 0 && x <= 15 && y >= 16 && y <= 21)  begin
                        oled_data = white_color;
                    end
                    if (x >= 6 && x <= 9 && y >= 22 && y <= 41)  begin
                        oled_data = white_color;
                    end
                    if (x >= 0 && x <= 15 && y >= 42 && y <= 47)  begin
                        oled_data = white_color;
                    end               
                end
            end
            if (y >= 16 && y <=47)begin // heart
                if (x >= 16 && x <= 31) begin
                    oled_data = red_color;
                    if ((7 * y > 18 * x - 85) || (7 * y > 761 - 18 * x)) begin
                        oled_data = black_color;
                    end
                    if ((3 * y < 11 * x - 172) && (3 * y < 345 - 11 * x)) begin
                        oled_data = black_color;
                    end
//                    if ((3 * y < 143 - 5 * x) || (3 * y < 5 * x - 92)) begin //68
//                        oled_data = black_color;
//                    end               
                end
            end
        end
        if (frames == 2) begin
            if (y >= 16 && y <=47) begin // I
                if (x >= 0 && x <= 15) begin      
                    if (x >= 0 && x <= 15 && y >= 16 && y <= 21)  begin
                        oled_data = white_color;
                    end
                    if (x >= 6 && x <= 9 && y >= 22 && y <= 41)  begin
                        oled_data = white_color;
                    end
                    if (x >= 0 && x <= 15 && y >= 42 && y <= 47)  begin
                        oled_data = white_color;
                    end               
                end
            end
            if (y >= 16 && y <=47)begin // heart
                if (x >= 16 && x <= 31) begin
                    oled_data = red_color;
                    if ((7 * y > 18 * x - 85) || (7 * y > 761 - 18 * x)) begin
                        oled_data = black_color;
                    end
                    if ((3 * y < 11 * x - 172) && (3 * y < 345 - 11 * x)) begin
                        oled_data = black_color;
                    end            
                end
            end
            if (y >= 16 && y <=47) begin // 2
                if (x >= 32 && x <= 47) begin      
                    if (x >= 32 && x <= 47 && y >= 16 && y <= 21)  begin
                        oled_data = yellow_color;
                    end
                    if ((15 * y < 1537 - 26 * x) && (15 * y > 1462 - 26 * x)) begin
                        oled_data = yellow_color;
                    end
                    if (x >= 32 && x <= 47 && y >= 42 && y <= 47)  begin
                        oled_data = yellow_color;
                    end               
                end
            end            
        end
        
        if (frames == 3) begin
            if (y >= 16 && y <=47) begin // I
                if (x >= 0 && x <= 15) begin      
                    if (x >= 0 && x <= 15 && y >= 16 && y <= 21)  begin
                        oled_data = white_color;
                    end
                    if (x >= 6 && x <= 9 && y >= 22 && y <= 41)  begin
                        oled_data = white_color;
                    end
                    if (x >= 0 && x <= 15 && y >= 42 && y <= 47)  begin
                        oled_data = white_color;
                    end               
                end
            end
            if (y >= 16 && y <=47)begin // heart
                if (x >= 16 && x <= 31) begin
                    oled_data = red_color;
                    if ((7 * y > 18 * x - 85) || (7 * y > 761 - 18 * x)) begin
                        oled_data = black_color;
                    end
                    if ((3 * y < 11 * x - 172) && (3 * y < 345 - 11 * x)) begin
                        oled_data = black_color;
                    end              
                end
            end
            if (y >= 16 && y <=47) begin // 2
                if (x >= 32 && x <= 47) begin      
                    if (x >= 32 && x <= 47 && y >= 16 && y <= 21)  begin
                        oled_data = yellow_color;
                    end
                    if ((15 * y < 1537 - 26 * x) && (15 * y > 1462 - 26 * x)) begin
                        oled_data = yellow_color;
                    end
                    if (x >= 32 && x <= 47 && y >= 42 && y <= 47)  begin
                        oled_data = yellow_color;
                    end               
                end
            end 
            if (y >= 16 && y <=47) begin // 0
                if (x >= 48 && x <= 63) begin
                    oled_data = green_color;   
                    if (x >= 52 && x <= 59 && y >= 22 && y <= 41)  begin
                        oled_data = black_color;
                    end              
                end
            end                        
        end
        
        if (frames == 4) begin
            if (y >= 16 && y <=47) begin // I
                if (x >= 0 && x <= 15) begin      
                    if (x >= 0 && x <= 15 && y >= 16 && y <= 21)  begin
                        oled_data = white_color;
                    end
                    if (x >= 6 && x <= 9 && y >= 22 && y <= 41)  begin
                        oled_data = white_color;
                    end
                    if (x >= 0 && x <= 15 && y >= 42 && y <= 47)  begin
                        oled_data = white_color;
                    end               
                end
            end
            if (y >= 16 && y <=47)begin // heart
                if (x >= 16 && x <= 31) begin
                    oled_data = red_color;
                    if ((7 * y > 18 * x - 85) || (7 * y > 761 - 18 * x)) begin
                        oled_data = black_color;
                    end
                    if ((3 * y < 11 * x - 172) && (3 * y < 345 - 11 * x)) begin
                        oled_data = black_color;
                    end              
                end
            end
            if (y >= 16 && y <=47) begin // 2
                if (x >= 32 && x <= 47) begin      
                    if (x >= 32 && x <= 47 && y >= 16 && y <= 21)  begin
                        oled_data = yellow_color;
                    end
                    if ((15 * y < 1537 - 26 * x) && (15 * y > 1462 - 26 * x)) begin
                        oled_data = yellow_color;
                    end
                    if (x >= 32 && x <= 47 && y >= 42 && y <= 47)  begin
                        oled_data = yellow_color;
                    end               
                end
            end 
            if (y >= 16 && y <=47) begin // 0
                if (x >= 48 && x <= 63) begin
                    oled_data = green_color;   
                    if (x >= 52 && x <= 59 && y >= 22 && y <= 41)  begin
                        oled_data = black_color;
                    end              
                end
            end
            if (y >= 16 && y <=47) begin // 2
                if (x >= 64 && x <= 79) begin      
                    if (x >= 64 && x <= 79 && y >= 16 && y <= 21)  begin
                        oled_data = yellow_color;
                    end
                    if ((15 * y < 2369 - 26 * x) && (15 * y > 2294 - 26 * x)) begin
                        oled_data = yellow_color;
                    end
                    if (x >= 64 && x <= 79 && y >= 42 && y <= 47)  begin
                        oled_data = yellow_color;
                    end               
                end
            end                               
        end

        if (frames == 5) begin
            if (y >= 16 && y <=47) begin // I
                if (x >= 0 && x <= 15) begin      
                    if (x >= 0 && x <= 15 && y >= 16 && y <= 21)  begin
                        oled_data = white_color;
                    end
                    if (x >= 6 && x <= 9 && y >= 22 && y <= 41)  begin
                        oled_data = white_color;
                    end
                    if (x >= 0 && x <= 15 && y >= 42 && y <= 47)  begin
                        oled_data = white_color;
                    end               
                end
            end
            if (y >= 16 && y <=47)begin // heart
                if (x >= 16 && x <= 31) begin
                    oled_data = red_color;
                    if ((7 * y > 18 * x - 85) || (7 * y > 761 - 18 * x)) begin
                        oled_data = black_color;
                    end
                    if ((3 * y < 11 * x - 172) && (3 * y < 345 - 11 * x)) begin
                        oled_data = black_color;
                    end               
                end
            end
            if (y >= 16 && y <=47) begin // 2
                if (x >= 32 && x <= 47) begin      
                    if (x >= 32 && x <= 47 && y >= 16 && y <= 21)  begin
                        oled_data = yellow_color;
                    end
                    if ((15 * y < 1537 - 26 * x) && (15 * y > 1462 - 26 * x)) begin
                        oled_data = yellow_color;
                    end
                    if (x >= 32 && x <= 47 && y >= 42 && y <= 47)  begin
                        oled_data = yellow_color;
                    end               
                end
            end 
            if (y >= 16 && y <=47) begin // 0
                if (x >= 48 && x <= 63) begin
                    oled_data = green_color;   
                    if (x >= 52 && x <= 59 && y >= 22 && y <= 41)  begin
                        oled_data = black_color;
                    end              
                end
            end
            if (y >= 16 && y <=47) begin // 2
                if (x >= 64 && x <= 79) begin      
                    if (x >= 64 && x <= 79 && y >= 16 && y <= 21)  begin
                        oled_data = yellow_color;
                    end
                    if ((15 * y < 2369 - 26 * x) && (15 * y > 2294 - 26 * x)) begin
                        oled_data = yellow_color;
                    end
                    if (x >= 64 && x <= 79 && y >= 42 && y <= 47)  begin
                        oled_data = yellow_color;
                    end               
                end
            end         
            if (y >= 16 && y <=47) begin // 6
                if (x >= 80 && x <= 95) begin      
                    if (x >= 80 && x <= 83) begin
                        oled_data = blue_color;
                    end
                    if (x >= 80 && x <= 95 && y >= 29 && y <= 47)  begin
                        oled_data = blue_color;
                    end         
                    if (x >= 84 && x <= 91 && y >= 36 && y <= 41)  begin
                        oled_data = black_color;
                    end       
                end
            end                        
        end    
             
    end
endmodule
