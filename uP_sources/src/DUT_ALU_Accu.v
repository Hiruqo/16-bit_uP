`timescale 1ns / 1ps

module DUT_ALU_Accu(
    // ALU inputs
    input [15:0] ALU_IN0,
    input [15:0] ALU_IN1,
    input [5:0] ALU_OPERATION,
    input ALU_CARRY_IN,
    
    // Accumulaotr inputs
    input CLK,
    input CE,
    
    // ALU outputs
    output ALU_CARRY_OUT,
    output ALU_ZERO_FLAG,
    
    // Accumulator outptus
    output [15:0] ACCUMULATOR_OUTPUT
    );
    
    wire [15:0] ALU_OUT;
    
    ALU U1(
        .INSTRUCTION(ALU_OPERATION),
        .IN1(ALU_IN1),
        .IN0(ALU_IN0),
        .CARRY_IN(ALU_CARRY_IN),
        .CARRY(ALU_CARRY_OUT),
        .ZERO_FLAG(ALU_ZERO_FLAG),
        .OUT(ALU_OUT)
    );
    
    Accumulator U2(
        .CLK(CLK),
        .CE(CE),
        .D(ALU_OUT),
        .OUT(ACCUMULATOR_OUTPUT)
    );
    
endmodule
