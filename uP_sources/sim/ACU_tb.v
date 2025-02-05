`timescale 1ns / 1ps

module ACU_tb;

reg clk;
reg ce;
reg [15:0] d;
wire [15:0] out;

Accumulator accu_unit (
    .CLK(clk),
    .CE(ce),
    .D(d),
    .OUT(out)
);

always #10 clk = ~clk;

initial begin
    {clk, ce, d} <= 9;
    
    repeat (2) @(posedge clk);
    ce <= 1;
    d <= 3;
    
    repeat (2) @(posedge clk);
    d <= 10;

    repeat (2) @(posedge clk);
    ce <= 0;

    repeat (2) @(posedge clk);
    $finish;
end

endmodule
