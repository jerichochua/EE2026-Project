`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2020 04:21:11 PM
// Design Name: 
// Module Name: clock_divider_3
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


module clock_divider_3(
    input clock_in,
    output clock_out
    );
    
    reg [24:0] counter = 25'b0; // 3Hz
    
    always @ (posedge clock_in) begin
        counter <= counter + 25'b1;
    end
    
    assign clock_out = counter[24];
    
endmodule
