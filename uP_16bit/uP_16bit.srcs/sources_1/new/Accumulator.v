`timescale 1ns /1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2024 08:59:51 PM
// Design Name: 
// Module Name: Accumulator
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


module Accumulator(
    input wire CLK,
    input wire [15:0] D,
    input wire CE,
    output [15:0] OUT
    );
    
    reg [15:0] temp_reg;
    
    always @(posedge CLK)
        if (CE)
            temp_reg <= D;

    assign OUT = temp_reg;

endmodule
