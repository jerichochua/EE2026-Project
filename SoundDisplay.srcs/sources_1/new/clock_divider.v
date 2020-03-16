`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2020 02:28:58 PM
// Design Name: 
// Module Name: clock_divider
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


module clock_divider_6p25m( // clock_out work on posedge
    input clock_in,
    output clock_out
    );
    
    reg [3:0] counter = 4'b0; // 6.25MHz
    
    always @ (posedge clock_in) begin
        counter <= counter + 4'b1;
    end
    
    assign clock_out = counter[3];
    
endmodule
