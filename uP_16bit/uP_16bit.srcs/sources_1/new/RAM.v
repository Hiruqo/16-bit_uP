`timescale 1ns / 1ps

module RAM #(
        parameter ADDR_WIDTH = 4,
        parameter DATA_WIDTH = 32,
        parameter DEPTH = 16
    )(
        input wire CLK,
        input wire CS,
        input wire [ADDR_WIDTH-1:0] ADDR,
        input wire WE,
        input wire [DATA_WIDTH-1:0] D,
        output reg [DATA_WIDTH-1:0] OUT
    );
    
    reg [DATA_WIDTH-1:0] MEM [2**DEPTH:0];

    always @(posedge CLK) begin
        if (CS) begin
            if (WE)
                MEM[ADDR] <= D;
            else
                OUT <= MEM[ADDR];
        end
    end
endmodule
