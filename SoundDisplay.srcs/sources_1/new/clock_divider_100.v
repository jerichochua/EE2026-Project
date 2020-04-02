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


module clock_divider_100(
    input clk100M,
    output clk100
    );
    reg [19:0] counter = 0;
    parameter factor = 20'd1000000;
    always @ (posedge clk100M) begin
        counter <= counter + 1;
        if (counter >= (factor - 1)) begin
            counter <= 0;
        end
    end
    assign clk100 = (counter < (factor >> 1)) ? 1'd0 : 1'd1;
endmodule
