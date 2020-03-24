`timescale 1ns / 1ps

module sevensegdisp(input CLOCK, [4:0] a0, [4:0] a1, [4:0] a2, [4:0] a3, output reg [3:0] an, [7:0] seg);
    reg [1:0] count = 0; // Turn on and off each segment
    reg [4:0] segmapping = 10; // for initial display - empty
    reg [17:0] disp = 0;
    
    translate tr (segmapping, seg);
    
    always @ (posedge CLOCK) begin
        disp <= disp + 1;
        if (disp == 0) begin
            count <= count + 1;
            if (count == 0) begin
                an <= 4'b0111;
                segmapping <= a0;
            end
            else if (count == 1) begin
                an <= 4'b1011;
                segmapping <= a1;
            end
            else if (count == 2) begin
                an <= 4'b1101;
                segmapping <= a2;
            end
            else begin
                an <= 4'b1110;
                segmapping <= a3;
            end
        end
    end
endmodule
