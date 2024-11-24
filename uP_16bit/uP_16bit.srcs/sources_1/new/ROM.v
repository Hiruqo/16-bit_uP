`timescale 1ns / 1ps

module ROM(
        input wire [5:0] ADDR,
        output reg [37:0] OUT
    );

    `include "global_parameters.txt"
    
    // ==========================================================
    //  ----- ----- ----- - always comb loop - ----- ----- ----- 
    // ==========================================================
    
    always @(ADDR)
        case (ADDR)
        // test ADD
//            6'd0  : OUT = {MOV_A_INST   ,16'd0  ,16'd4};    // MOV A, #4
//            6'd1  : OUT = {MOV_RAM_A    ,16'd2  ,16'd0};    // MOV 2, A
//            6'd2  : OUT = {ADD_RAM_INST ,16'd2  ,16'hFFFF};
//            6'd1  : OUT = {MOV_RAM_A    ,16'd3  ,16'd0};    // MOV 2, A
//            6'd4  : OUT = {ADD_RAM_INST ,16'd2  ,16'd1};
        
            // test RAM
            6'd0  : OUT = {MOV_A_INST   ,16'd0  ,16'd4};    // MOV A, #4
            6'd1  : OUT = {MOV_RAM_A    ,16'd2  ,16'd0};    // MOV 2, A
            6'd2  : OUT = {ADD_RAM_INST ,16'd2  ,16'd3};
            6'd3  : OUT = {SUB_A_RAM    ,16'd0  ,16'd2};
            6'd4  : OUT = {NOOP         ,16'd0  ,16'd0};    // NOOP
            6'd5  : OUT = {MOV_A_INST   ,16'd0  ,16'd8};    // MOV A, #8
            6'd6  : OUT = {MOV_RAM_A    ,16'd3  ,16'd0};    // MOV 4, A
            6'd7  : OUT = {MOV_A_INST   ,16'd0  ,16'd11};   // MOV A, #11
            6'd8  : OUT = {MOV_REG_A    ,16'd2  ,16'd0};    // MOV R2, A
            
            // test REG
//            6'd0  : OUT = {MOV_A_INST   ,16'd0  ,16'd4};    // MOV A, #4
//            6'd1  : OUT = {MOV_REG_A    ,16'd2  ,16'd0};    // MOV 2, A
//            6'd2  : OUT = {ADD_REG_INST ,16'd2  ,16'd3};
//            6'd3  : OUT = {SUB_REG_INST ,16'd2  ,16'd12};
//            6'd4  : OUT = {NOOP         ,16'd0  ,16'd0};    // NOOP
            
            // test JMP
//            6'd0  : OUT = {MOV_A_INST   ,16'd0  ,16'd4};    // MOV A, #4
//            6'd1  : OUT = {MOV_REG_A    ,16'd2  ,16'd0};    // MOV 2, A
//            6'd2  : OUT = {ADD_REG_INST ,16'd2  ,16'd3};
//            6'd3  : OUT = {SUB_REG_INST ,16'd2  ,16'd12};
//            6'd4  : OUT = {NOOP         ,16'd0  ,16'd0};    // NOOP
//            6'd5  : OUT = {JMP_rA       ,16'd0  ,10'd0, 6'd0};
            
            // test JMP PATHED
//            6'd0  : OUT = {MOV_A_INST      ,16'd0  ,16'd4};    // MOV A, #4
//            6'd1  : OUT = {MOV_REG_A       ,16'd2  ,16'd0};    // MOV 2, A
//            6'd2  : OUT = {ADD_REG_INST    ,16'd2  ,16'd3};
//            6'd3  : OUT = {SUB_REG_INST    ,16'd2  ,16'd12};
//            6'd4  : OUT = {JMP_rA_ra       ,10'd0, 6'd3, 10'd0, 6'd0};
//            6'd5  : OUT = {NOOP            ,16'd0  ,16'd0};    // NOOP
            
//          6'd59 : OUT = {};
//          6'd60 : OUT = {};
//          6'd61 : OUT = {};
//          6'd62 : OUT = {};
//          6'd63 : OUT = {};

            default : OUT = {MOV_A_INST   ,16'd0  ,16'd0};    // MOV A, #0    <-- TODO there should be NOOP
        endcase
        
endmodule
