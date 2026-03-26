`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2026 17:33:04
// Design Name: 
// Module Name: Alu_decoder
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


module Alu_decoder( input [1:0]ALUop,
                    input [2:0]funct3,
                    input [6:0]funct7,opcode,
                    output [2:0]ALUcontrol
    );

 wire [1:0]concat;
 
 assign concat={opcode[5],funct7[5]}; 
 
 assign ALUcontrol  = (ALUop == 2'b00)? 3'b000 :
                      (ALUop == 2'b01)? 3'b001:
                      (ALUop == 2'b10) & (funct3 == 3'b000) & (concat != 2'b00) ? 3'b000:
                      (ALUop == 2'b10) & (funct3 == 3'b000) & (concat == 2'b11) ? 3'b001:  
                      (ALUop == 2'b10) & (funct3 == 3'b010) ? 3'b101:
                      (ALUop == 2'b10) & (funct3 == 3'b110) ? 3'b011:
                      (ALUop == 2'b10) & (funct3 == 3'b111) ? 3'b010:
                      3'b000;
endmodule
