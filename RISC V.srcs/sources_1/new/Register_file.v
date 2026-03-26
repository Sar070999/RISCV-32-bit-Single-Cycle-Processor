`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2026 16:20:16
// Design Name: 
// Module Name: Register_file
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


module Register_file( input [4:0]A1,A2,A3, //A1:address for first resource, A2:address for second resource , A3: address to write data
                      input clk,WE3,rst,
                      input [31:0]WD3 ,  //Write data
                      output [31:0]RD1,
                      output [31:0]RD2  //Read data from A1,A2 recpectively                   
                    );
                    
 //32 space memory with 5 bits
   reg [31:0]Register[31:0];
   
 // read data from sourec 1
 assign RD1 = (!rst) ? 32'h00000000 : Register[A1];
 
 //read data from second sourec              
 assign RD2 = (!rst) ? 32'h00000000 : Register[A2];
 
 always@(posedge clk)
 begin
    if(WE3)
    Register[A3]<=WD3;
    else
    ;
 end
 
 
 initial begin
 
 Register[6]=32'h00000040;
 Register[9]=32'h00000020;
 Register[5]=32'h000000A0;
 
 
 end 
 
endmodule
