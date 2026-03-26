`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2026 14:33:00
// Design Name: 
// Module Name: ALU_tb
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
module tb;

reg clk,rst;

Single_Cycle_Top tb( .clk(clk), .rst(rst));

initial begin
clk=1;
end

initial begin

  rst =0;
#100  rst=1;

#400 $finish;


end

always #50 clk=~clk;



endmodule