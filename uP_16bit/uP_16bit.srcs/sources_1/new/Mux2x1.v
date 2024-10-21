`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2024 09:01:49 PM
// Design Name: 
// Module Name: Mux2x1
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


module Mux2x1(
    input wire [15:0] IN1,
    input wire [15:0] IN0,
    input wire SEL,
    output [15:0] OUT
    );
    
    assign OUT = SEL ? IN1 : IN0;
    
endmodule
