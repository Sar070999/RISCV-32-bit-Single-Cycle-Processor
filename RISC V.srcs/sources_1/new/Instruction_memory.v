`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2026 14:56:15
// Design Name: 
// Module Name: Instruction_mem
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


module Instruction_mem( input [31:0]A,                 //A=Address of instruction that need to read sent by PC 
                        input rst,
                        output  [31:0]RD    );         //Instruction sent to decoder
                                                
                                                
    //declaration of memory for instrcution memory 
    reg [31:0] mem[1023:0];  //1024 differnt locations with 32bit size
    
    assign RD = (rst==1'b0) ? 32'h00000000 : mem[A>>2]; //Doing 2 right shift to counter the PC address (X00004, X00008)
    
    initial begin
    mem[1]=32'h0062E233;
    mem[2]=32'hFFC4A303;
    mem[3]=32'h0064A423;
 
    end
                        
                        
endmodule
