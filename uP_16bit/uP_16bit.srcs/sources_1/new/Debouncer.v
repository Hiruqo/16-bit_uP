`timescale 1ns / 1ps

module Debouncer(
    input wire CLK,
    input wire RST,
    input wire D,
    output OUT
    );
    
    wire clk_slowed;
    
    // wires for D flip-flops
    wire Q0, Q1, Q2, nQ2;
    
    Prescaler #(12_500_00) (CLK, clk_slowed);
    D_flop (clk_slowed, RST, D,  Q0);
    D_flop (clk_slowed, RST, Q0, Q1);
    D_flop (clk_slowed, RST, Q1, Q2);
    
    assign nQ2 = ~Q2;
    assign OUT = Q1 & nQ2;
    
endmodule
