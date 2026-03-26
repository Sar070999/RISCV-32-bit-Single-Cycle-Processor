`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2026 17:07:44
// Design Name: 
// Module Name: Data_memory
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


module Data_memory( input [31:0]A,
                    input [31:0]WD, //Write data in A address 
                    input clk, WE,rst,  //WE: Write enable 
                    output [31:0]RD
                   );  // this is used for store and load data after ALU operation, it is present outside the CPU . During opeartion we used Reguster files

//Creating memory for data memory
   reg [31:0]data_mem[1023:0];
   
  // Reading data from A address of data_memory
  assign RD = (rst) ? data_mem[A] : 32'h00000000 ;

  always@(posedge clk)
  begin
  if(WE)
     begin
     data_mem[A]<=WD;
     end
  else  ;   
  end
  
  initial begin
  data_mem[28] = 32'h00000070;
  end
  

endmodule
