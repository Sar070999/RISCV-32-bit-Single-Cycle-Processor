`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2026 17:19:33
// Design Name: 
// Module Name: Main_decoder
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


module Main_decoder ( input [6:0]opcode, input zero, output PCSrc, ResultSrc, MemWrite, ALUSrc, RegWrite , output [1:0]ImmSrc, output [1:0]ALUOp );

wire Branch ;

assign RegWrite = ((opcode==7'b0000011) ||(opcode==7'b0110011)) ? 1'b1 : 1'b0  ;

assign ImmSrc = (opcode==7'b0100011) ? 2'b01 :
                (opcode==7'b1100011)? 2'b10:
                1'b0;

assign ALUSrc =((opcode==7'b0000011) |(opcode==7'b0100011)) ? 1'b1 : 1'b0;

assign MemWrite = (opcode==7'b0100011) ? 1'b1 : 1'b0;

assign ResultSrc= (opcode==7'b0000011) ? 1'b1 : 1'b0;

assign Branch = (opcode==7'b1100011) ? 1'b1 : 1'b0;

assign PCSrc = Branch & zero;

assign ALUOp = (opcode==7'b0110011) ? 2'b10 :
               (opcode==7'b1100011)? 2'b01:
                1'b0;


endmodule