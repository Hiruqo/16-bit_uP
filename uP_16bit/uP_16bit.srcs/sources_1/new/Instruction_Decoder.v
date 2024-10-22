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

`include "sys_params.vh"

module Instruction_Decoder(
    input wire CLK,

    // instruction
    input wire [37:0] INSTRUCTION,
    
    // PC management
    output reg PC_noop,
    output reg [5:0] PC_jmp_addr,       // floating for now
    output reg PC_wrap,                 // floating for now
    
    // ALU instruction
    output [5:0] ALU_inst,
    
    // Memory
    output reg [15:0] RAM_addr,
    output reg [15:0] REG_addr,
    
    // #
    output reg [15:0] INSTA_nmbr,
    
    // Muxes
    output reg MUX_A_INST,          // 0 <- A   ,1 <- INST
    output reg MUX_REG_RAM,         // 0 <- REG ,1 <- RAM
    
    // WE
    output reg WE_RAM,
    output reg WE_REG,
    
    // CS
    output reg CS_RAM,
    output reg CS_REG
    );
    
    always @(INSTRUCTION)
        case (INSTRUCTION[37:32])
            NOOP : begin
                PC_noop <= 1'b1;         
            end
            
            MOV_A_INST : begin
                PC_noop         <= 1'b0; // Close the NOOP
                
                CS_RAM          <= 1'b0;
                CS_REG          <= 1'b0;
                                
                MUX_A_INST      <= 1'b1;
                MUX_REG_RAM     <= 1'b0;
                
                INSTA_nmbr      <= INSTRUCTION[15:0];
                
                RAM_addr        <= 16'hxxxx;
                REG_addr        <= 16'hxxxx;
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            MOV_A_RAM : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b1;
                CS_REG          <= 1'b0;
                                
                MUX_A_INST      <= 1'b0;
                MUX_REG_RAM     <= 1'b1;
                
                INSTA_nmbr      <= 16'hxxxx;
                
                RAM_addr        <= INSTRUCTION[15:0];
                REG_addr        <= 16'hxxxx;
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            MOV_A_REG : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b0;
                CS_REG          <= 1'b1;
                                
                MUX_A_INST      <= 1'b0;
                MUX_REG_RAM     <= 1'b0;
                
                INSTA_nmbr      <= 16'hxxxx;
                
                RAM_addr        <= 16'hxxxx;
                REG_addr        <= INSTRUCTION[15:0];
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            MOV_REG_A : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b0;
                CS_REG          <= 1'b1;
                                
                MUX_A_INST      <= 1'b0;
                MUX_REG_RAM     <= 1'b1;
                
                INSTA_nmbr      <= 16'hxxxx;
                
                RAM_addr        <= 16'hxxxx;
                REG_addr        <= INSTRUCTION[31:16];
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b1;
            end
            
            MOV_RAM_A : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b1;
                CS_REG          <= 1'b0;
                                
                MUX_A_INST      <= 1'b0;
                MUX_REG_RAM     <= 1'b0;
                
                INSTA_nmbr      <= 16'hxxxx;
                
                RAM_addr        <= INSTRUCTION[31:16];
                REG_addr        <= 16'hxxxx;
                
                WE_RAM          <= 1'b1;
                WE_REG          <= 1'b0;
            end
            
            ADD_RAM_INST : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b1;
                CS_REG          <= 1'b0;
                                
                MUX_A_INST      <= 1'b1;
                MUX_REG_RAM     <= 1'b1;
                
                INSTA_nmbr      <= INSTRUCTION[15:0];
                
                RAM_addr        <= INSTRUCTION[31:16];
                REG_addr        <= 16'hxxxx;
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            ADD_REG_INST : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b0;
                CS_REG          <= 1'b1;
                                
                MUX_A_INST      <= 1'b1;
                MUX_REG_RAM     <= 1'b0;
                
                INSTA_nmbr      <= INSTRUCTION[15:0];
                
                RAM_addr        <= 16'hxxxx;
                REG_addr        <= INSTRUCTION[31:16];
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            ADD_RAM_A : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b1;
                CS_REG          <= 1'b0;
                                
                MUX_A_INST      <= 1'b0;
                MUX_REG_RAM     <= 1'b1;
                
                INSTA_nmbr      <= 16'hxxxx;
                
                RAM_addr        <= INSTRUCTION[31:16];
                REG_addr        <= 16'hxxxx;
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            ADD_REG_A : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b0;
                CS_REG          <= 1'b1;
                                
                MUX_A_INST      <= 1'b0;
                MUX_REG_RAM     <= 1'b0;
                
                INSTA_nmbr      <= 16'hxxxx;
                
                RAM_addr        <= 16'hxxxx;
                REG_addr        <= INSTRUCTION[31:16];
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            SUB_INST_RAM : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b1;
                CS_REG          <= 1'b0;
                                
                MUX_A_INST      <= 1'b1;
                MUX_REG_RAM     <= 1'b1;
                
                INSTA_nmbr      <= INSTRUCTION[31:16];
                
                RAM_addr        <= INSTRUCTION[15:0];
                REG_addr        <= 16'hxxxx;
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            SUB_INST_REG : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b0;
                CS_REG          <= 1'b1;
                                
                MUX_A_INST      <= 1'b1;
                MUX_REG_RAM     <= 1'b0;
                
                INSTA_nmbr      <= INSTRUCTION[31:16];
                
                RAM_addr        <= 16'hxxxx;
                REG_addr        <= INSTRUCTION[15:0];
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            SUB_A_RAM : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b1;
                CS_REG          <= 1'b0;
                                
                MUX_A_INST      <= 1'b0;
                MUX_REG_RAM     <= 1'b1;
                
                INSTA_nmbr      <= 16'hxxxx;
                
                RAM_addr        <= INSTRUCTION[15:0];
                REG_addr        <= 16'hxxxx;
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            SUB_A_REG : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b0;
                CS_REG          <= 1'b1;
                                
                MUX_A_INST      <= 1'b0;
                MUX_REG_RAM     <= 1'b0;
                
                INSTA_nmbr      <= 16'hxxxx;
                
                RAM_addr        <= 16'hxxxx;
                REG_addr        <= INSTRUCTION[15:0];
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            SUB_RAM_INST : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b1;
                CS_REG          <= 1'b0;
                                
                MUX_A_INST      <= 1'b1;
                MUX_REG_RAM     <= 1'b1;
                
                INSTA_nmbr      <= INSTRUCTION[15:0];
                
                RAM_addr        <= INSTRUCTION[31:16];
                REG_addr        <= 16'hxxxx;
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            SUB_RAM_A : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b1;
                CS_REG          <= 1'b0;
                                
                MUX_A_INST      <= 1'b0;
                MUX_REG_RAM     <= 1'b1;
                
                INSTA_nmbr      <= 16'hxxxx;
                
                RAM_addr        <= INSTRUCTION[31:16];
                REG_addr        <= 16'hxxxx;
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            SUB_REG_INST : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b0;
                CS_REG          <= 1'b1;
                                
                MUX_A_INST      <= 1'b1;
                MUX_REG_RAM     <= 1'b0;
                
                INSTA_nmbr      <= INSTRUCTION[15:0];
                
                RAM_addr        <= 16'hxxxx;
                REG_addr        <= INSTRUCTION[31:16];
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            SUB_REG_A : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b0;
                CS_REG          <= 1'b1;
                                
                MUX_A_INST      <= 1'b0;
                MUX_REG_RAM     <= 1'b0;
                
                INSTA_nmbr      <= 16'hxxxx;
                
                RAM_addr        <= 16'hxxxx;
                REG_addr        <= INSTRUCTION[31:16];
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            INC_INST : begin
                PC_noop <= 1'b0; // Close the NOOP
                
                CS_RAM          <= 1'b0;
                CS_REG          <= 1'b0;
                                
                MUX_A_INST      <= 1'b1;
                MUX_REG_RAM     <= 1'b0;
                
                INSTA_nmbr      <= INSTRUCTION[15:0];
                
                RAM_addr        <= 16'hxxxx;
                REG_addr        <= 16'hxxxx;
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            INC_A : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b0;
                CS_REG          <= 1'b0;
                                
                MUX_A_INST      <= 1'b0;
                MUX_REG_RAM     <= 1'b0;
                
                INSTA_nmbr      <= 16'hxxxx;
                
                RAM_addr        <= 16'hxxxx;
                REG_addr        <= 16'hxxxx;
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            INC_REG : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b0;
                CS_REG          <= 1'b1;
                                
                MUX_A_INST      <= 1'b1;
                MUX_REG_RAM     <= 1'b0;
                
                INSTA_nmbr      <= 16'hxxxx;
                
                RAM_addr        <= 16'hxxxx;
                REG_addr        <= INSTRUCTION[15:0];
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            INC_RAM : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b1;
                CS_REG          <= 1'b0;
                                
                MUX_A_INST      <= 1'b0;
                MUX_REG_RAM     <= 1'b1;
                
                INSTA_nmbr      <= 16'hxxxx;
                
                RAM_addr        <= INSTRUCTION[15:0];
                REG_addr        <= 16'hxxxx;
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            DEC_INST : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b0;
                CS_REG          <= 1'b0;
                                
                MUX_A_INST      <= 1'b1;
                MUX_REG_RAM     <= 1'b0;
                
                INSTA_nmbr      <= INSTRUCTION[15:0];
                
                RAM_addr        <= 16'hxxxx;
                REG_addr        <= 16'hxxxx;
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            DEC_A : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b0;
                CS_REG          <= 1'b0;
                                
                MUX_A_INST      <= 1'b0;
                MUX_REG_RAM     <= 1'b0;
                
                INSTA_nmbr      <= 16'hxxxx;
                
                RAM_addr        <= 16'hxxxx;
                REG_addr        <= 16'hxxxx;
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            DEC_REG : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b0;
                CS_REG          <= 1'b1;
                                
                MUX_A_INST      <= 1'b1;
                MUX_REG_RAM     <= 1'b0;
                
                INSTA_nmbr      <= 16'hxxxx;
                
                RAM_addr        <= 16'hxxxx;
                REG_addr        <= INSTRUCTION[15:0];
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            DEC_RAM : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b1;
                CS_REG          <= 1'b0;
                                
                MUX_A_INST      <= 1'b0;
                MUX_REG_RAM     <= 1'b1;
                
                INSTA_nmbr      <= 16'hxxxx;
                
                RAM_addr        <= INSTRUCTION[15:0];
                REG_addr        <= 16'hxxxx;
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            CMP_H_INST_REG : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b0;
                CS_REG          <= 1'b1;
                                
                MUX_A_INST      <= 1'b1;
                MUX_REG_RAM     <= 1'b0;
                
                INSTA_nmbr      <= INSTRUCTION[15:0];
                
                RAM_addr        <= 16'hxxxx;
                REG_addr        <= INSTRUCTION[31:16];
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            CMP_H_INST_RAM : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b1;
                CS_REG          <= 1'b0;
                                
                MUX_A_INST      <= 1'b1;
                MUX_REG_RAM     <= 1'b1;
                
                INSTA_nmbr      <= INSTRUCTION[31:16];
                
                RAM_addr        <= INSTRUCTION[15:0];
                REG_addr        <= 16'hxxxx;
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            CMP_H_A_REG : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b0;
                CS_REG          <= 1'b1;
                                
                MUX_A_INST      <= 1'b0;
                MUX_REG_RAM     <= 1'b0;
                
                INSTA_nmbr      <= 16'hxxxx;
                
                RAM_addr        <= 16'hxxxx;
                REG_addr        <= INSTRUCTION[15:0];
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            CMP_H_A_RAM : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b1;
                CS_REG          <= 1'b0;
                                
                MUX_A_INST      <= 1'b0;
                MUX_REG_RAM     <= 1'b1;
                
                INSTA_nmbr      <= 16'hxxxx;
                
                RAM_addr        <= INSTRUCTION[15:0];
                REG_addr        <= 16'hxxxx;
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            CMP_H_REG_INST : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b0;
                CS_REG          <= 1'b1;
                                
                MUX_A_INST      <= 1'b1;
                MUX_REG_RAM     <= 1'b0;
                
                INSTA_nmbr      <= INSTRUCTION[15:0];
                
                RAM_addr        <= 16'hxxxx;
                REG_addr        <= INSTRUCTION[31:16];
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            CMP_H_REG_A : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b0;
                CS_REG          <= 1'b1;
                                
                MUX_A_INST      <= 1'b0;
                MUX_REG_RAM     <= 1'b0;
                
                INSTA_nmbr      <= 16'hxxxx;
                
                RAM_addr        <= 16'hxxxx;
                REG_addr        <= INSTRUCTION[31:16];
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            CMP_H_RAM_INST : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b1;
                CS_REG          <= 1'b0;
                                
                MUX_A_INST      <= 1'b1;
                MUX_REG_RAM     <= 1'b1;
                
                INSTA_nmbr      <= INSTRUCTION[15:0];
                
                RAM_addr        <= INSTRUCTION[31:16];
                REG_addr        <= 16'hxxxx;
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            CMP_H_RAM_A : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b1;
                CS_REG          <= 1'b0;
                                
                MUX_A_INST      <= 1'b0;
                MUX_REG_RAM     <= 1'b1;
                
                INSTA_nmbr      <= 16'hxxxx;
                
                RAM_addr        <= INSTRUCTION[31:16];
                REG_addr        <= 16'hxxxx;
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            CMP_E_INST_REG : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b0;
                CS_REG          <= 1'b1;
                                
                MUX_A_INST      <= 1'b1;
                MUX_REG_RAM     <= 1'b0;
                
                INSTA_nmbr      <= INSTRUCTION[31:16];
                
                RAM_addr        <= 16'hxxxx;
                REG_addr        <= INSTRUCTION[15:0];
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            CMP_E_INST_RAM : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b1;
                CS_REG          <= 1'b0;
                                
                MUX_A_INST      <= 1'b1;
                MUX_REG_RAM     <= 1'b1;
                
                INSTA_nmbr      <= INSTRUCTION[15:0];
                
                RAM_addr        <= INSTRUCTION[31:16];
                REG_addr        <= 16'hxxxx;
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            CMP_E_A_REG : begin
                PC_noop <= 1'b0; // Close the NOOP
                
                CS_RAM          <= 1'b0;
                CS_REG          <= 1'b1;
                                
                MUX_A_INST      <= 1'b0;
                MUX_REG_RAM     <= 1'b0;
                
                INSTA_nmbr      <= 16'hxxxx;
                
                RAM_addr        <= 16'hxxxx;
                REG_addr        <= INSTRUCTION[15:0];
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
             
            CMP_E_A_RAM : begin
                PC_noop <= 1'b0; // Close the NOOP
                
                CS_RAM          <= 1'b1;
                CS_REG          <= 1'b0;
                                
                MUX_A_INST      <= 1'b0;
                MUX_REG_RAM     <= 1'b1;
                
                INSTA_nmbr      <= 16'hxxxx;
                
                RAM_addr        <= INSTRUCTION[15:0];
                REG_addr        <= 16'hxxxx;
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            CMP_L_INST_REG : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b0;
                CS_REG          <= 1'b1;
                                
                MUX_A_INST      <= 1'b1;
                MUX_REG_RAM     <= 1'b0;
                
                INSTA_nmbr      <= INSTRUCTION[15:0];
                
                RAM_addr        <= 16'hxxxx;
                REG_addr        <= INSTRUCTION[31:16];
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            CMP_L_INST_RAM : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b1;
                CS_REG          <= 1'b0;
                                
                MUX_A_INST      <= 1'b1;
                MUX_REG_RAM     <= 1'b1;
                
                INSTA_nmbr      <= INSTRUCTION[31:16];
                
                RAM_addr        <= INSTRUCTION[15:0];
                REG_addr        <= 16'hxxxx;
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            CMP_L_A_REG : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b0;
                CS_REG          <= 1'b1;
                                
                MUX_A_INST      <= 1'b0;
                MUX_REG_RAM     <= 1'b0;
                
                INSTA_nmbr      <= 16'hxxxx;
                
                RAM_addr        <= 16'hxxxx;
                REG_addr        <= INSTRUCTION[15:0];
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            CMP_L_A_RAM : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b1;
                CS_REG          <= 1'b0;
                                
                MUX_A_INST      <= 1'b0;
                MUX_REG_RAM     <= 1'b1;
                
                INSTA_nmbr      <= 16'hxxxx;
                
                RAM_addr        <= INSTRUCTION[15:0];
                REG_addr        <= 16'hxxxx;
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            CMP_L_REG_INST : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b0;
                CS_REG          <= 1'b1;
                                
                MUX_A_INST      <= 1'b1;
                MUX_REG_RAM     <= 1'b0;
                
                INSTA_nmbr      <= INSTRUCTION[15:0];
                
                RAM_addr        <= 16'hxxxx;
                REG_addr        <= INSTRUCTION[31:16];
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            CMP_L_REG_A : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b0;
                CS_REG          <= 1'b1;
                                
                MUX_A_INST      <= 1'b0;
                MUX_REG_RAM     <= 1'b0;
                
                INSTA_nmbr      <= 16'hxxxx;
                
                RAM_addr        <= 16'hxxxx;
                REG_addr        <= INSTRUCTION[31:16];
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            CMP_L_RAM_INST : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b1;
                CS_REG          <= 1'b0;
                                
                MUX_A_INST      <= 1'b1;
                MUX_REG_RAM     <= 1'b1;
                
                INSTA_nmbr      <= INSTRUCTION[15:0];
                
                RAM_addr        <= INSTRUCTION[31:16];
                REG_addr        <= 16'hxxxx;
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            CMP_L_RAM_A : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b1;
                CS_REG          <= 1'b0;
                                
                MUX_A_INST      <= 1'b0;
                MUX_REG_RAM     <= 1'b1;
                
                INSTA_nmbr      <= 16'hxxxx;
                
                RAM_addr        <= INSTRUCTION[31:16];
                REG_addr        <= 16'hxxxx;
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            NOT_INST : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b0;
                CS_REG          <= 1'b0;
                                
                MUX_A_INST      <= 1'b1;
                MUX_REG_RAM     <= 1'b0;
                
                INSTA_nmbr      <= INSTRUCTION[15:0];
                
                RAM_addr        <= 16'hxxxx;
                REG_addr        <= 16'hxxxx;
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            NOT_A : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b0;
                CS_REG          <= 1'b0;
                                
                MUX_A_INST      <= 1'b0;
                MUX_REG_RAM     <= 1'b0;
                
                INSTA_nmbr      <= 16'hxxxx;
                
                RAM_addr        <= 16'hxxxx;
                REG_addr        <= 16'hxxxx;
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            NOT_RAM : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b1;
                CS_REG          <= 1'b0;
                                
                MUX_A_INST      <= 1'b0;
                MUX_REG_RAM     <= 1'b1;
                
                INSTA_nmbr      <= 16'hxxxx;
                
                RAM_addr        <= INSTRUCTION[15:0];
                REG_addr        <= 16'hxxxx;
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            NOT_REG : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b0;
                CS_REG          <= 1'b1;
                                
                MUX_A_INST      <= 1'b1;
                MUX_REG_RAM     <= 1'b0;
                
                INSTA_nmbr      <= 16'hxxxx;
                
                RAM_addr        <= 16'hxxxx;
                REG_addr        <= INSTRUCTION[15:0];
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            R_SHIFT_INST : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b0;
                CS_REG          <= 1'b0;
                                
                MUX_A_INST      <= 1'b1;
                MUX_REG_RAM     <= 1'b0;
                
                INSTA_nmbr      <= INSTRUCTION[15:0];
                
                RAM_addr        <= 16'hxxxx;
                REG_addr        <= 16'hxxxx;
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            R_SHIFT_A : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b0;
                CS_REG          <= 1'b0;
                                
                MUX_A_INST      <= 1'b0;
                MUX_REG_RAM     <= 1'b0;
                
                INSTA_nmbr      <= 16'hxxxx;
                
                RAM_addr        <= 16'hxxxx;
                REG_addr        <= 16'hxxxx;
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            R_SHIFT_RAM : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b1;
                CS_REG          <= 1'b0;
                                
                MUX_A_INST      <= 1'b0;
                MUX_REG_RAM     <= 1'b1;
                
                INSTA_nmbr      <= 16'hxxxx;
                
                RAM_addr        <= INSTRUCTION[15:0];
                REG_addr        <= 16'hxxxx;
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            R_SHIFT_REG : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b0;
                CS_REG          <= 1'b1;
                                
                MUX_A_INST      <= 1'b1;
                MUX_REG_RAM     <= 1'b0;
                
                INSTA_nmbr      <= 16'hxxxx;
                
                RAM_addr        <= 16'hxxxx;
                REG_addr        <= INSTRUCTION[15:0];
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            L_SHIFT_INST : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b0;
                CS_REG          <= 1'b0;
                                
                MUX_A_INST      <= 1'b1;
                MUX_REG_RAM     <= 1'b0;
                
                INSTA_nmbr      <= INSTRUCTION[15:0];
                
                RAM_addr        <= 16'hxxxx;
                REG_addr        <= 16'hxxxx;
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            L_SHIFT_A : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b0;
                CS_REG          <= 1'b0;
                                
                MUX_A_INST      <= 1'b0;
                MUX_REG_RAM     <= 1'b0;
                
                INSTA_nmbr      <= 16'hxxxx;
                
                RAM_addr        <= 16'hxxxx;
                REG_addr        <= 16'hxxxx;
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            L_SHIFT_RAM : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b1;
                CS_REG          <= 1'b0;
                                
                MUX_A_INST      <= 1'b0;
                MUX_REG_RAM     <= 1'b1;
                
                INSTA_nmbr      <= 16'hxxxx;
                
                RAM_addr        <= INSTRUCTION[15:0];
                REG_addr        <= 16'hxxxx;
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            L_SHIFT_REG : begin
                PC_noop <= 1'b0; // Close the NOOP
            
                CS_RAM          <= 1'b0;
                CS_REG          <= 1'b1;
                                
                MUX_A_INST      <= 1'b1;
                MUX_REG_RAM     <= 1'b0;
                
                INSTA_nmbr      <= 16'hxxxx;
                
                RAM_addr        <= 16'hxxxx;
                REG_addr        <= INSTRUCTION[15:0];
                
                WE_RAM          <= 1'b0;
                WE_REG          <= 1'b0;
            end
            
            JMP_rA : begin
                PC_noop <= 1'b0; // Close the NOOP
            
            end
            
            JMP_rA_ra : begin
                PC_noop <= 1'b0; // Close the NOOP
            
            end
            
            default : begin
                PC_noop <= 1'b1;
                
                CS_RAM          <= 1'bx;
                CS_REG          <= 1'bx;
                                
                MUX_A_INST      <= 1'bx;
                MUX_REG_RAM     <= 1'bx;
                
                INSTA_nmbr      <= 16'hxxxx;
                
                RAM_addr        <= 16'hxxxx;
                REG_addr        <= 16'hxxxx;
                
                WE_RAM          <= 1'bx;
                WE_REG          <= 1'bx;
            end
        endcase
    
    assign ALU_inst = INSTRUCTION[37:32];
    
endmodule
