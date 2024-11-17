`timescale 1ns / 1ps

module Mux2x1(
    input wire [15:0] IN1,
    input wire [15:0] IN0,
    input wire SEL,
    output [15:0] OUT
    );
    
    assign OUT = SEL ? IN1 : IN0;
    
endmodule
