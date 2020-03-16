`timescale 1ns / 1ps

module clk20k_divider(input CLOCK, output clk20k);
    reg [11:0] count = 0;
    always @ (posedge CLOCK) begin
        count <= count + 1;
    end
    assign clk20k = count[11];
endmodule