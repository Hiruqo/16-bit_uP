`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2024 09:01:36 PM
// Design Name: 
// Module Name: Instruction_Decoder
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


module Instruction_Decoder(
    input wire CLK,

    // instruction
    input wire [37:0] INSTRUCTION,
    
    // PC management
    output [5:0] PC_jmp_addr,
    output [3:0] PC_noop_edges,
    
    // ALU instruction
    output [5:0] ALU_inst,
    
    // WE
    output WE_RAM
    
    );
    
    
    
endmodule
