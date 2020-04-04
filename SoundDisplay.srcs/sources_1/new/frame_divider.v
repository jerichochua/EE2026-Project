`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2020 08:38:58 AM
// Design Name: 
// Module Name: frame_divider
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


module frame_divider(
    input frame_begin,
    output reg out
    );
    reg [4:0] counter = 0;
    
    always @ (posedge frame_begin) begin
        counter = counter + 1;
        if (counter == 0) begin
            out = 1;
        end
    end
endmodule
