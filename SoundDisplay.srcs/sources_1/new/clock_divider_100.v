`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2020 11:35:27 AM
// Design Name: 
// Module Name: clock_divider_100
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


module clock_divider_5(
    input clk100M,
    output clk5
    );
    reg [24:0] counter = 0;
    parameter factor = 25'd20000000;
    always @ (posedge clk100M) begin
        counter <= counter + 1;
        if (counter >= (factor - 1)) begin
            counter <= 0;
        end
    end
    assign clk5 = (counter < (factor >> 1)) ? 1'd0 : 1'd1;
endmodule
