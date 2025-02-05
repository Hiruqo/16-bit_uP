`timescale 1ns / 1ps

module D_flop(
    input wire CLK,
    input wire RST,
    input wire D,
    output reg Q
    );
    
    always @(posedge CLK or posedge RST) begin
        if (RST)
            Q <= 1'b0;
        else
            Q <= D;
    end
endmodule
