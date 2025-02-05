`timescale 1ns / 1ps

module Accumulator_splitter(
    input wire [15:0] IN,
    output [15:0] OUT1,
    output [15:0] OUT0
    );
    
    assign OUT1 = IN;
    assign OUT0 = IN;
endmodule
