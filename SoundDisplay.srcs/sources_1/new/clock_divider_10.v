`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2020 05:17:33 PM
// Design Name: 
// Module Name: clock_divider_10
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


module clock_divider_10(
    input clk100M,
    output clk10
    );
    reg [23:0] counter = 0;
    parameter factor = 24'd16666666;
    always @ (posedge clk100M) begin
        counter <= counter + 1;
        if (counter >= (factor - 1)) begin
            counter <= 0;
        end
    end
    assign clk10 = (counter < (factor >> 1)) ? 1'd0 : 1'd1;
endmodule
