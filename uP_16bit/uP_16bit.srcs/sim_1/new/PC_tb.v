`timescale 1ns / 1ps

module PC_tb;

reg clk;
reg rst;
reg wrap_flag;
reg noop_flag;
wire [5:0] q;

PC_Counter pc (
    .CLK(clk),
    .RST(rst),
    .WRAP_FLAG(wrap_flag),
    .NOOP_FLAG(noop_flag),
    .Q(q)
);

always #10 clk = ~clk;

initial begin
    {clk, wrap_flag, noop_flag} <= 0;
    rst = 1;
    
    repeat (2) @(posedge clk);
    rst = 0;
    
    repeat (10) @(posedge clk);
    noop_flag = 1;
    
    repeat (5) @(posedge clk);
    noop_flag = 0;
    
    repeat (2) @(posedge clk);
    $finish;
end

endmodule
