`ifndef INTERFACE_SV
`define INTERFACE_SV

interface alu_accu_if();
    logic [15:0] ALU_IN0, ALU_IN1;
    logic [5:0] ALU_OPERATION;
    logic ALU_CARRY_IN, ALU_CARRY_OUT, ALU_ZERO_FLAG;
    logic CLK, CE;
    logic [15:0] ACCUMULATOR_OUTPUT;

    modport drv (output ALU_IN0, ALU_IN1, ALU_OPERATION, ALU_CARRY_IN, input CLK, CE);
    modport mon (input ALU_IN0, ALU_IN1, ALU_OPERATION, ALU_CARRY_IN, ALU_CARRY_OUT, ALU_ZERO_FLAG, CLK, CE, ACCUMULATOR_OUTPUT);
endinterface

`endif
