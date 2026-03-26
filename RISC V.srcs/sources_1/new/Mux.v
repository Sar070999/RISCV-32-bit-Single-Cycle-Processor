`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2026 06:58:35
// Design Name: 
// Module Name: Mux
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


module Mux( input[31:0]a,b,
            input sel,
            input clk,
            output [31:0]out
             );
             
             assign out = (sel==1'b0) ? a : b;
            
         //   always@(posedge clk) begin
           //  $display("Out: %0d,  a=%0d, b=%0d ",out,a, b);
             //end
endmodule
