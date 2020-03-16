`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2020 04:18:22 PM
// Design Name: 
// Module Name: debounce
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


module debounce(
    input slow_clock,
    input D,
    output debounced_out
    );
    
    wire Q, QB;
    dff d1(slow_clock, D, Q);
    dff d2(slow_clock, Q, QB);
    assign debounced_out = Q & ~QB;
    
endmodule
