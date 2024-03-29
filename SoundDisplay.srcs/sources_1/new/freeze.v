`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2020 11:36:45 AM
// Design Name: 
// Module Name: freeze
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


module freeze(
    input CLK100MHZ,
    input sw7,
    input [3:0] map,
    output reg [5:0] min
    );
    
    reg [5:0] freeze_value;
    always @ (posedge CLK100MHZ) begin
        if (sw7) begin
            min <= freeze_value;
        end
        else begin
            min <= 56 - (map + 1) * 3;
            freeze_value <= min;
        end
    end
    
endmodule
