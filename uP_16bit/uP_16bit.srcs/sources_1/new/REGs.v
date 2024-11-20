`timescale 1ns / 1ps

module REGs #(
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
    
    reg [DATA_WIDTH-1:0] REG_mem [2**DEPTH:0];
    reg [DATA_WIDTH-1:0] reg_out;
    
    always @(posedge CLK) begin
        if (CS & WE)
            REG_mem[ADDR] <= D;
            
        if (CS & ~WE)
            reg_out <= REG_mem[ADDR];
    end
    
    assign OUT = (CS & ~WE) ? reg_out : 'hz;
endmodule
