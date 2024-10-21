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
    input wire CE,
    input wire CS,
    input wire [15:0] ADDR,
    input wire WR,
    inout wire [15:0] DQ
    );
    
    reg [15:0] MEM [65_535:0];
    reg [15:0] data_out;
 
    always @(posedge CLK) begin
        if (CS & CE & WR)
            MEM[ADDR] <= DQ;
            
        if (CS & CE & ~WR)
            data_out <= MEM[ADDR];
    end
    
    assign DQ = (CS & CE & ~WR) ? data_out : 16'hzzzz;
    
endmodule
