`timescale 1ns /1ps

module Accumulator(
    input wire CLK,
    input wire CE,
    input wire [15:0] D,
    output [15:0] OUT
    );
    
    reg [15:0] temp_reg;
    
    always @(posedge CLK)
        if (CE)
            temp_reg <= D;

    assign OUT = temp_reg;

endmodule
