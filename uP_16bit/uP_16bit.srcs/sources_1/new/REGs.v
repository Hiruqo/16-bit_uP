`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2024 10:30:11 PM
// Design Name: 
// Module Name: REGs
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


module REGs(
    input wire CLK,
    input wire CE,
    input wire CS,
    input wire [15:0] ADDR,
    input wire WR,
    input wire [15:0] D,
    output [15:0] OUT
    );
    
    reg [15:0] REG_mem [65_535:0];
    reg [15:0] reg_out;
    
    always @(posedge CLK) begin
        if (CS & CE & WR)
            REG_mem[ADDR] <= D;
            
        if (CS & CE & ~WR)
            reg_out <= REG_mem[ADDR];
    end
    
    assign OUT = (CS & CE & ~WR) ? reg_out : 16'hzzzz;
    
endmodule
