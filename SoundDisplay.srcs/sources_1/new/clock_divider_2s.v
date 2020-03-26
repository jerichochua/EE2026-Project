`timescale 1ns / 1ps

module clock_divider_2s(input CLOCK, output newclk);
    reg [12:0] count = 0;
    always @ (posedge CLOCK) begin
        count <= count + 1;
    end
    assign newclk = count[12];
endmodule