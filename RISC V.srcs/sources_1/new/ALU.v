`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2026 12:59:29
// Design Name: 
// Module Name: ALU_32
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


module ALU_32(
    input [31:0]A,
    input [31:0]B,
    input [2:0]ALUcontrol,
    output[31:0]Result,
    output V, C, N, Z// V:overflow , C=carry, N=negative, Z=Zero flag 
    );
    
    // OR logic operation
    wire [31:0]AorB;
    assign AorB=A||B;
  
    // And logic operation
    wire [31:0]AandB;
    assign AandB=A&&B;
    
    //Not operation
    wire [31:0]notB;
    assign notB = ~B; 
    
    //mux1
    wire [31:0]mux_1;
    assign mux_1=ALUcontrol[0]?notB:B; 
    
    //SUM_Logic  and Cout
    wire [31:0]sum;
    wire Cout;
  assign {Cout,sum}=ALUcontrol[0] & A>B ? A+mux_1+1:
                    ALUcontrol[0] & A<B  ? ~(A+mux_1+1) +1:
                    A+mux_1;
                    
    //Zero extionsion
  wire [31:0]slt;
  assign slt={31'b0000000000000000000000000000000,sum[31]};
  
                   
   //mux2
   wire [31:0]mux_2;
  assign mux_2=ALUcontrol[2:0]==3'b000 ? sum :
               ALUcontrol[2:0]==3'b001 ? sum:
               ALUcontrol[2:0]==3'b010 ? AandB:
               ALUcontrol[2:0]==3'b011 ? AorB:
               ALUcontrol[2:0]==3'b101 ? slt:
               32'h00000000;
   
   //Final Result             
   assign Result=mux_2;  
  
  //Zero Flag (reduction And opeartion used)
  assign Z=&(~mux_2);
  
  //Negative Flag
  assign N=mux_2[31];
  
  //Carry Flag
  assign C=Cout&(~ALUcontrol[2:1]);// We are taking Cout as Borrow for subtraction case
  
  //Overflow Flag
  assign V=(~ALUcontrol[2:1]) && (sum[31]^A[31]) && (A[31]^B[31]^ALUcontrol[2:1]);
  

  
endmodule
