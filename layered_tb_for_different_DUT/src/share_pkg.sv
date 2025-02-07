`ifndef SHARE_PKG_SV
`define SHARE_PKG_SV

typedef enum logic [2:0] {
    ADD = 3'b000,
    SUBTRACT = 3'b001,
    AND_OP = 3'b010,
    OR_OP = 3'b011,
    XOR_OP = 3'b100,
    NOT_OP = 3'b101,
    LOAD_OP = 3'b111
} alu_instructions;

`endif
