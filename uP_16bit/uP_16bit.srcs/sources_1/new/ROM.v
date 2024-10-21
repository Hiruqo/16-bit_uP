`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2024 08:59:00 PM
// Design Name: 
// Module Name: ROM
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

module ROM(
    input wire [5:0] ADDR,
    output reg [37:0] OUT
    );
    
    // ==========================================================
    //  ----- ----- ----- - always comb loop - ----- ----- ----- 
    // ==========================================================
    
    always @(ADDR)
        case (ADDR)
            6'd0  : OUT = {NOOP         ,16'd0  ,16'd0};    // NOOP
            6'd1  : OUT = {MOV_A_INST   ,16'd0  ,16'd4};    // MOV A, #4
            6'd2  : OUT = {MOV_RAM_A    ,16'd2  ,16'd0};    // MOV 2, A
            6'd3  : OUT = {MOV_A_INST   ,16'd0  ,16'd8};    // MOV A, #8
            6'd4  : OUT = {MOV_RAM_A    ,16'd3  ,16'd0};    // MOV 4, A
            6'd5  : OUT = {MOV_A_INST   ,16'd0  ,16'd11};   // MOV A, #11
            6'd6  : OUT = {MOV_REG_A    ,16'd2  ,16'd0};    // MOV R2, A
//          6'd7  : OUT = {}; 
//          6'd8  : OUT = {}; 
//          6'd9  : OUT = {}; 
//          6'd10 : OUT = {}; 
//          6'd11 : OUT = {}; 
//          6'd12 : OUT = {}; 
//          6'd13 : OUT = {}; 
//          6'd14 : OUT = {}; 
//          6'd15 : OUT = {}; 
//          6'd16 : OUT = {}; 
//          6'd17 : OUT = {}; 
//          6'd18 : OUT = {}; 
//          6'd19 : OUT = {}; 
//          6'd20 : OUT = {}; 
//          6'd21 : OUT = {}; 
//          6'd22 : OUT = {}; 
//          6'd23 : OUT = {}; 
//          6'd24 : OUT = {}; 
//          6'd25 : OUT = {}; 
//          6'd26 : OUT = {}; 
//          6'd27 : OUT = {}; 
//          6'd28 : OUT = {}; 
//          6'd29 : OUT = {}; 
//          6'd30 : OUT = {}; 
//          6'd31 : OUT = {}; 
//          6'd32 : OUT = {};
//          6'd33 : OUT = {};
//          6'd34 : OUT = {};
//          6'd35 : OUT = {};
//          6'd36 : OUT = {};
//          6'd37 : OUT = {};
//          6'd38 : OUT = {};
//          6'd39 : OUT = {};
//          6'd40 : OUT = {};
//          6'd41 : OUT = {};
//          6'd42 : OUT = {};
//          6'd43 : OUT = {};
//          6'd44 : OUT = {};
//          6'd45 : OUT = {};
//          6'd46 : OUT = {};
//          6'd47 : OUT = {};
//          6'd48 : OUT = {};
//          6'd49 : OUT = {};
//          6'd50 : OUT = {};
//          6'd51 : OUT = {};
//          6'd52 : OUT = {};
//          6'd53 : OUT = {};
//          6'd54 : OUT = {};
//          6'd55 : OUT = {};
//          6'd56 : OUT = {};
//          6'd57 : OUT = {};
//          6'd58 : OUT = {};
//          6'd59 : OUT = {};
//          6'd60 : OUT = {};
//          6'd61 : OUT = {};
//          6'd62 : OUT = {};
//          6'd63 : OUT = {};
            default : OUT = {NOOP       ,16'd0  ,16'd0}; // NOOP
        endcase
        
endmodule
