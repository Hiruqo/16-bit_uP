`timescale 1ns / 1ps

module RAM #(
        parameter ADDR_WIDTH = 4,
        parameter DATA_WIDTH = 16,
        parameter DEPTH = 16
    )(
        input wire CLK,
        input wire CS,
        input wire [ADDR_WIDTH-1:0] ADDR,
        input wire WE,
        input wire [DATA_WIDTH-1:0] D,
        output [DATA_WIDTH-1:0] OUT
    );
    
    reg [DATA_WIDTH-1:0] MEM [2**DEPTH:0];

    always @(posedge CLK) begin
        if (CS)
            if (WE)
                MEM[ADDR] <= D;
    end
    
    assign OUT = (CS & ~WE) ? MEM[ADDR] : 'hz;
endmodule
