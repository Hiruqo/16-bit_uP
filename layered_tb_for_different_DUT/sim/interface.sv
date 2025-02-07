`ifndef INTERFACE_SV
`define INTERFACE_SV

interface alu_accu_if();
    logic [7:0] ALU_IN0, ALU_IN1;        // 8-bit operands A and B
    logic [2:0] ALU_OPERATION;           // 3-bit ALU opcode
    logic ALU_CARRY_IN, ALU_CARRY_OUT;   // Carry-in and Carry-out
    logic CLK, CE, RST;                  // Clock and Clock Enable and Reset
    logic [7:0] ACCUMULATOR_OUTPUT;      // Output from the accumulator

    modport drv (output ALU_IN0, ALU_IN1, ALU_OPERATION, ALU_CARRY_IN, input CLK, CE, RST);
    modport mon (input ALU_IN0, ALU_IN1, ALU_OPERATION, ALU_CARRY_IN, ALU_CARRY_OUT, CLK, CE, RST, ACCUMULATOR_OUTPUT);
endinterface

`endif
