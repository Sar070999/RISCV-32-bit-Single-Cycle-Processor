`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2026 20:42:57
// Design Name: 
// Module Name: Single_Cycle_Top
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
`include "Program_counter.v"
`include "Instruction_memory.v"
`include "Register_file.v"
`include "Signed_Extend.v"
`include "ALU.v"
`include "Control_Unit_Top.v"
`include "Data_memory.v"
`include "PC_Adder.v"
`include "Mux.v"


module Single_Cycle_Top( input clk,rst
                        );
                        
        // Connecting wire between PC o/p and instruction memory
       wire [31:0] PCounter,RF_instruct,ImmExt_ALU, RF_ALU, ALU_Result, Read_data, PCnext, Write_data, Mux1_out,  Mux2_out; 
       wire [2:0]ALU_control;
       wire [1:0]ImmSrc;
       wire zero_flag, RegWrite, Memwrite, ResultSrc, ALUSrc;
                       
       Program_counter PC (.PCNext(PCnext), .rst(rst), .clk(clk), .PC( PCounter)); //instantiation of Program counter module
       
       Instruction_mem Ins_mem( .A(PCounter), .rst(rst), .RD(RF_instruct));  //instantiation of instruction memory module   
       
       Register_file R_file( .A1(RF_instruct[19:15]), .A2(RF_instruct[24:20]), .A3(RF_instruct[11:7]), .clk(clk), .rst(rst), .WE3(RegWrite), .WD3(Mux2_out), .RD1(RF_ALU), .RD2(Write_data));     
       
       Signed_Extend SE(.In(RF_instruct), .ImmSrc(ImmSrc), .Imm_Ext(ImmExt_ALU));                
                        
       ALU_32 ALU(.A(RF_ALU),.B(Mux1_out),.ALUcontrol(ALU_control),.Result(ALU_Result),.V(), .C(), .N(), .Z(zero_flag));// V:overflow , C=carry, N=negative, Z=Zero flag 
   
       Control_Unit_Top CUT( .zero(zero_flag), .opcode(RF_instruct[6:0]), .funct7(RF_instruct[31:25]), .funct3(RF_instruct[14:12]), .PCSrc(), .ResultSrc(ResultSrc), .MemWrite(Memwrite), .ALUSrc(ALUSrc), .RegWrite(RegWrite),  .ImmSrc(ImmSrc), .ALUcontrol(ALU_control));  
       
       Data_memory DM( .A(ALU_Result),.WD(Write_data),  .clk(clk), .rst(rst), .WE(Memwrite), .RD(Read_data));  
       
       PC_Adder PA( .a(PCounter), .b(32'd4), .c(PCnext));   
       
       Mux RegFile_ALU( .clk(clk), .a(Write_data), .b(ImmExt_ALU), .sel(ALUSrc), .out(Mux1_out));  
        
       Mux DataMem_RegFile( .clk(clk), .a(ALU_Result), .b(Read_data), .sel(ResultSrc), .out(Mux2_out));      
                        
endmodule
