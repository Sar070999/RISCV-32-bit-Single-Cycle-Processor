`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2026 15:52:52
// Design Name: 
// Module Name: Program_counter
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


module Program_counter( input [31:0]PCNext,
                       input rst, clk,
                       output reg [31:0]PC
    );
    
    
    always@(posedge clk)
    begin 
    if(!rst)
    PC<=32'h0000000;
    else
        begin
        PC<=PCNext;
        end
    end
endmodule
