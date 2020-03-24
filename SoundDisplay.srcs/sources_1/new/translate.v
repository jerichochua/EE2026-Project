`timescale 1ns / 1ps

module translate(input [4:0] value, output reg [7:0] segdisp);
    always @ (value) begin
        case (value)
            0: segdisp <= 8'b11000000; // 0
            1: segdisp <= 8'b11111001; // 1
            2: segdisp <= 8'b10100100; // 2
            3: segdisp <= 8'b10110000; // 3
            4: segdisp <= 8'b10011001; // 4
            5: segdisp <= 8'b10010010; // 5
            6: segdisp <= 8'b10000010; // 6
            7: segdisp <= 8'b11111000; // 7
            8: segdisp <= 8'b10000000; // 8
            9: segdisp <= 8'b10010000; // 9
            default: segdisp <= 8'b11111111; // empty
        endcase
    end
endmodule
