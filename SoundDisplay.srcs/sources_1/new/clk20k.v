`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2020 10:26:11 PM
// Design Name: 
// Module Name: clk20k
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


module clock_divider_20k(
    input clk100M,
    output clk20k
    );
    reg [12:0] counter = 13'd0;
    parameter factor = 13'd5000;
    always @ (posedge clk100M) begin
        counter = counter + 13'd1;
        if (counter >= (factor - 1)) begin
            counter <= 13'd0;
        end
    end
    assign clk20k = (counter < (factor >> 1)) ? 1'd0 : 1'd1;
endmodule
