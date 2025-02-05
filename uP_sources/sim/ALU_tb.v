`timescale 1ns / 1ps

module ALU_tb;

`include "instr_params.txt"

reg [5:0] instruction;
reg [15:0] in1;
reg [15:0] in0;
wire [15:0] out;
wire carry;

ALU alu_unit(
    .INSTRUCTION(instruction),
    .IN1(in1),
    .IN0(in0),
    .CARRY(carry),
    .OUT(out)
);

initial begin
    instruction = 16'd1;
    in1         = 16'd6;
    in0         = 16'd2;
end

initial begin
    #20;
    instruction = MOV_A_RAM;
    
    #20;
    instruction = MOV_A_INST;
    
    #20;
    instruction = ADD_RAM_INST;
    
    #20;
    instruction = SUB_INST_RAM;
    
    #20;
    instruction = SUB_RAM_INST;
    
    #20;
    instruction = INC_INST;
    
    #20;
    instruction = INC_RAM;
    
    #20;
    instruction = DEC_INST;
    
    #20;
    instruction = DEC_RAM;
    
    #20;
    instruction = CMP_H_INST_REG;
    
    #20;
    instruction = CMP_H_REG_INST;
    
    #20;
    instruction = NOT_INST;
    
    #20;
    instruction = R_SHIFT_INST;
    
    #20;
    instruction = L_SHIFT_INST;
    
    #20;
    $finish();
end

endmodule
