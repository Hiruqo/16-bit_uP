`timescale 1ns / 1ps

module RAM_tb();
parameter ADDR_WIDTH = 4;
parameter DATA_WIDTH = 16;
parameter DEPTH = 16;

reg clk;
reg cs;
reg [15:0] addr;
reg we;
reg [15:0] d;
wire [15:0] out;

RAM #(.DATA_WIDTH(DATA_WIDTH)) RAM_test_unit (
    .CLK(clk),
    .CS(cs),
    .ADDR(addr),
    .WE(we),
    .D(d),
    .OUT(out)
);

always #10 clk = ~clk;

initial begin
    {clk, cs, addr, we, d} <= 0;

    repeat (2) @(posedge clk);
    
    cs = 1;
    
    repeat (5) @(posedge clk); ;
    we = 1;
    d = 5;
    
    repeat (5) @(posedge clk); 
    d = 3;
    addr = 1;
    
    repeat (5) @(posedge clk); 
    addr = 0;
    we = 0;
    d = 0;
    
    repeat (5) @(posedge clk); 
    addr = 1;

    repeat (5) @(posedge clk); 
    $finish;
end


endmodule
