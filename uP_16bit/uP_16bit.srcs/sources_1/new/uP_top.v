`timescale 1ns / 1ps

module uP_top(
    input wire CLK,         // 100 MHz
    input wire CLK_btn,     // button clock
    input wire RST_btn,
    
    output CARRY,
    output [3:0] ANODES_OUT,
    output [6:0] SEG_NMBR_OUT
);

// =========================================================
// ============= variables for further units ===============
// =========================================================

// Instruction_Decoder <line 40>
wire INSTRUCTION_NOOP;
wire INSTRUCTION_PC_WRAP;

// Accumulator Spitter <line 180>
wire [15:0] A_FOR_CIRCUIT;

// =========================================================
// =========================================================
// =========================================================

// -----------------------------
// -- PC_Counter
// --
wire [5:0] PC_Q;

PC_Counter pc_unit(
    .CLK(CLK_btn),
    .RST(RST_btn),
    .WRAP_FLAG(INSTRUCTION_PC_WRAP),
    .NOOP_FLAG(INSTRUCTION_NOOP),
    .Q(PC_Q)
);

// -----------------------------
// -- ROM
// --
wire [37:0] ROM_OUT;

ROM rom_unit(
    .ADDR(PC_Q),
    .OUT(ROM_OUT)
);

// -----------------------------
// -- Instruction_Decoder
// --
wire [5:0] INSTRUCTION_PC_JMP_ADDR;

wire [5:0] INSTRUCTION_ALU_OPERATION;

wire [15:0] INSTRUCTION_RAM_ADDR;
wire [15:0] INSTRUCTION_REG_ADDR;

wire [15:0] INSTRUCTION_INSTA_NMBR;

wire INSTRUCTION_MUX_SEL_A_INST;
wire INSTRUCTION_MUX_SEL_REG_RAM;

wire INSTRUCTION_CS_RAM;
wire INSTRUCTION_CS_REG;

wire INSTRUCTION_WE_RAM;
wire INSTRUCTION_WE_REG;

wire INSTRUCTION_CE_A;

Instruction_Decoder inst_decoder_unit(
    .CLK(CLK_btn),
    
    .INSTRUCTION(ROM_OUT),
    
    .PC_noop(INSTRUCTION_NOOP),
    .PC_jmp_addr(INSTRUCTION_PC_JMP_ADDR),
    .PC_wrap(INSTRUCTION_PC_WRAP),
    
    .ALU_operation(INSTRUCTION_ALU_OPERATION),
    
    .RAM_addr(INSTRUCTION_RAM_ADDR),
    .REG_addr(INSTRUCTION_REG_ADDR),
    
    .INSTA_nmbr(INSTRUCTION_INSTA_NMBR),
    
    .MUX_SEL_A_INST(INSTRUCTION_MUX_SEL_A_INST),
    .MUX_SEL_REG_RAM(INSTRUCTION_MUX_SEL_REG_RAM),
    
    .CS_RAM(INSTRUCTION_CS_RAM),
    .CS_REG(INSTRUCTION_CS_REG),
    
    .WE_RAM(INSTRUCTION_WE_RAM),
    .WE_REG(INSTRUCTION_WE_REG),
    
    .CE_A(INSTRUCTION_CE_A)
);

// -----------------------------
// -- RAM
// --
// #(.ADDR_WIDTH(), .DATA_WIDTH(), .DEPTH()) 
wire [15:0] RAM_OUT_DATA;

RAM ram_unit(
    .CLK(CLK_btn),
    .CS(INSTRUCTION_CS_RAM),
    .ADDR(INSTRUCTION_RAM_ADDR),
    .WE(INSTRUCTION_WE_RAM),
    .D(A_FOR_CIRCUIT),
    .OUT(RAM_OUT_DATA)
);

// -----------------------------
// -- REG
// --
// #(.ADDR_WIDTH(), .DATA_WIDTH(), .DEPTH()) 
wire [15:0] REG_OUT_DATA;

REGs regs_unit(
    .CLK(CLK_btn),
    .CS(INSTRUCTION_CS_REG),
    .ADDR(INSTRUCTION_REG_ADDR),
    .WE(INSTRUCTION_WE_REG),
    .D(A_FOR_CIRCUIT),
    .OUT(REG_OUT_DATA)
);

// -----------------------------
// -- MUX INST_A
// --
wire [15:0] MUX_A_INST_OUT;

Mux2x1 mux_inst_accu_unit(
    .IN1(INSTRUCTION_INSTA_NMBR),
    .IN0(A_FOR_CIRCUIT),
    .SEL(INSTRUCTION_MUX_SEL_A_INST),
    .OUT(MUX_A_INST_OUT)
);

// -----------------------------
// -- MUX INST_A
// --
wire [15:0] MUX_REG_RAM_OUT;

Mux2x1 mux_reg_ram_unit(
    .IN1(RAM_OUT_DATA),
    .IN0(REG_OUT_DATA),
    .SEL(INSTRUCTION_MUX_SEL_REG_RAM),
    .OUT(MUX_REG_RAM_OUT)
);

// -----------------------------
// -- ALU
// --
wire [15:0] ALU_OUT;

ALU alu_unit(
    .INSTRUCTION(INSTRUCTION_ALU_OPERATION),
    .IN1(MUX_REG_RAM_OUT),
    .IN0(MUX_A_INST_OUT),
    .CARRY(CARRY),
    .OUT(ALU_OUT)
);

// -----------------------------
// -- Accumulator
// --
wire [15:0] A_OUT;

Accumulator acu_unit(
    .CLK(CLK_btn),
    .CE(INSTRUCTION_CE_A),
    .D(ALU_OUT),
    .OUT(A_OUT)
);

// -----------------------------
// -- Accumulator Splitter
// --
wire [15:0] A_FOR_TESTING;

Accumulator_splitter acu_split_unit(
    .IN(A_OUT),
    .OUT1(A_FOR_TESTING),
    .OUT0(A_FOR_CIRCUIT)
);

// =========================================================
// ================= FPGA Visualisation ====================
// =========================================================

// -----------------------------
// -- Anode Switcher
// --
wire [1:0] ANODE_SW_POINTER_OUT;

ANODE_SWITCHER anode_switch_unit(
    .CLK(CLK),
    .ANODES(ANODES_OUT),                    // which anode 4'bxxxx
    .ANODE_POINTER(ANODE_SW_POINTER_OUT)
);

// -----------------------------
// -- Anode Switcher
// --
SEG_DECODER seg_disp_decoder_unit(
    .ANODE_POINTER(ANODE_SW_POINTER_OUT),
    .ACU_DATA(A_FOR_TESTING),
    .DATA_OUT(SEG_NMBR_OUT)                 // 7'bxxxxxxx number
);

endmodule
