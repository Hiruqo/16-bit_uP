`timescale 1ns / 1ps

module Mux_tb;

reg [15:0] in1;
reg [15:0] in0;
reg sel;
wire [15:0] out;

Mux2x1 mux_unit (
    .IN1(in1),
    .IN0(in0),
    .SEL(sel),
    .OUT(out)
);

initial begin
    {in1, in0, sel} <= 0;
    
    #10;
    in1 = 5;
    in0 = 2;
    
    #10;
    sel = 1;

    #10;
    $finish;
end

endmodule
