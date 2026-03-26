`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2026 20:43:41
// Design Name: 
// Module Name: Signed_Extend
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


module Signed_Extend(  input [31:0]In,        //31:20
                       input [1:0]ImmSrc,
                       output [31:0]Imm_Ext
                      );
                       
    assign Imm_Ext = (ImmSrc[0]==1'b0) ? {{20{In[31]}},In[31:20]}:
                     {{20{In[31]}}, In[31:25], In[11:7]};
endmodule
