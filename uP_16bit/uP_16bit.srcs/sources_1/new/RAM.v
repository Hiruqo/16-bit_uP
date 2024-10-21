`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2024 08:58:51 PM
// Design Name: 
// Module Name: RAM
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

module RAM(
    input wire CLK,
    input wire nCS,
    input wire [11:0] ADDR,
    input wire nWR,
    input wire nOE,
    inout wire [15:0] DQ
    );
    
    reg [15:0] MEM [4095:0];
    reg [15:0] data_out;
 
    always @(posedge CLK)
        if (~nCS & ~nWR)
            MEM[ADDR] = DQ;
            
    always @(posedge CLK)
        if (~nCS & nWR)
            data_out = MEM[ADDR];
    
    assign DQ = (~nCS & ~nOE & nWR) ? data_out : 16'hzzzz;
    
endmodule
