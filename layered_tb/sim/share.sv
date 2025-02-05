`ifndef SHARE_SV
`define SHARE_SV

enum bit [5:0] {
        NOOP = 6'b000000,
        MOV_A_INST = 6'b000001,
        MOV_A_RAM = 6'b000010,
        MOV_A_REG = 6'b000011,
        ADD_RAM_INST = 6'b000110,
        ADD_REG_INST = 6'b000111,
        ADD_RAM_A = 6'b001000,
        ADD_REG_A = 6'b001001,
        SUB_INST_RAM = 6'b001010,
        SUB_INST_REG = 6'b001011,
        SUB_A_RAM = 6'b001100,
        SUB_A_REG = 6'b001101,
        NOT_INST = 6'b101110,
        NOT_A = 6'b101111,
        L_SHIFT_INST = 6'b110110,
        L_SHIFT_A = 6'b110111,
        R_SHIFT_INST = 6'b110010,
        R_SHIFT_A = 6'b110011
    } instruction;

`endif
