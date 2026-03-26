`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2026 11:14:43
// Design Name: 
// Module Name: Control_Unit_Top
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
`include "Alu_decoder.v"
`include "Main_decoder.v"  

module Control_Unit_Top( input zero, 
                         input [6:0]opcode,funct7,
                         input [2:0]funct3,
                         output PCSrc, ResultSrc, MemWrite, ALUSrc, RegWrite , 
                         output [1:0]ImmSrc,
                         output [2:0]ALUcontrol

    );
    
    wire [1:0]ALUopcode;
    
    Alu_decoder ALUdecoder( .ALUop(ALUopcode),.opcode(opcode),.funct3(funct3),.funct7(funct7),.ALUcontrol(ALUcontrol));
    
    Main_decoder Maindecoder( .opcode(opcode), .zero(zero), .PCSrc(PCSrc), .ResultSrc(ResultSrc), .MemWrite(MemWrite), .ALUSrc(ALUSrc), .RegWrite(RegWrite) , .ImmSrc(ImmSrc),  .ALUOp(ALUopcode) );
    
     
endmodule
