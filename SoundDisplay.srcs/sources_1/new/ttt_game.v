`timescale 1ns / 1ps

/*
    Tic Tac Toe
    Game Logic Module
*/

module ttt_game(input clk, input btnU, input btnD, input btnL, output reg currentPlayer = 0,
    output reg [3:0] currentBox = 1,
    output reg [1:0] box1 = 0,
    output reg [1:0] box2 = 0,
    output reg [1:0] box3 = 0,
    output reg [1:0] box4 = 0,
    output reg [1:0] box5 = 0,
    output reg [1:0] box6 = 0,
    output reg [1:0] box7 = 0,
    output reg [1:0] box8 = 0,
    output reg [1:0] box9 = 0
    );
    
    always @ (posedge clk) begin
        if (btnU == 1) begin
            if (currentBox != 9)
                currentBox <= currentBox + 1;
        end
       
        if (btnD == 1) begin
            if (currentBox != 1)
                currentBox <= currentBox - 1;
        end
        
        if (btnL == 1) begin
            if (currentBox == 1) begin
                if (box1 == 0) begin
                    if (currentPlayer == 0) box1 = 1;
                    else box1 = 2;
                    currentPlayer <= ~currentPlayer;
                end
            end
            else if (currentBox == 2) begin
                if (box2 == 0) begin
                    if (currentPlayer == 0) box2 = 1;
                    else box2 = 2;
                    currentPlayer <= ~currentPlayer;
                end
            end
            else if (currentBox == 3) begin
                if (box3 == 0) begin
                    if (currentPlayer == 0) box3 = 1;
                    else box3 = 2;
                    currentPlayer <= ~currentPlayer;
                end
            end
            else if (currentBox == 4) begin
                if (box4 == 0) begin
                    if (currentPlayer == 0) box4 = 1;
                    else box4 = 2;
                    currentPlayer <= ~currentPlayer;
                end
            end    
            else if (currentBox == 5) begin
                if (box5 == 0) begin
                    if (currentPlayer == 0) box5 = 1;
                    else box5 = 2;
                    currentPlayer <= ~currentPlayer;
                end
            end
            else if (currentBox == 6) begin
                if (box6 == 0) begin
                    if (currentPlayer == 0) box6 = 1;
                    else box6 = 2;
                    currentPlayer <= ~currentPlayer;
                end
            end
            else if (currentBox == 7) begin
                if (box7 == 0) begin
                    if (currentPlayer == 0) box7 = 1;
                    else box7 = 2;
                    currentPlayer <= ~currentPlayer;
                end
            end
            else if (currentBox == 8) begin
                if (box8 == 0) begin
                    if (currentPlayer == 0) box8 = 1;
                    else box8 = 2;
                    currentPlayer <= ~currentPlayer;
                end
            end
            else if (currentBox == 9) begin
                if (box9 == 0) begin
                    if (currentPlayer == 0) box9 = 1;
                    else box9 = 2;
                    currentPlayer <= ~currentPlayer;
                end
            end                           
        end
        
        /*
        if (box1 == box4 && box4 == box7 && (box1 == 1 || box1 == 2)) begin
        
        end
        else if (box2 == box5 && box5 == box8 && (box2 == 1 || box2 == 2)) begin
        
        end
        else if (box3 == box6 && box6 == box9 && (box3 == 1 || box3 == 2)) begin
        
        end
        else if (box1 == box2 && box2 == box3 && (box1 == 1 || box1 == 2)) begin
        
        end
        else if (box4 == box5 && box5 == box6 && (box4 == 1 || box4 == 2)) begin
        
        end
        else if (box7 == box8 && box8 == box9 && (box7 == 1 || box7 == 2)) begin
        
        end
        else if (box1 == box5 && box5 == box9 && (box1 == 1 || box1 == 2)) begin
        
        end
        else if (box3 == box5 && box5 == box7 && (box3 == 1 || box3 == 2)) begin
        
        end
        */
    end
endmodule
