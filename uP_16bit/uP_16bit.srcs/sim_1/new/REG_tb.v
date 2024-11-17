`timescale 1ns / 1ps

module REG_tb;
parameter DATA_WIDTH = 16;
parameter ADDR_WIDTH = 4;
parameter DEPTH = 16;

reg clk;
reg cs;
reg we;
reg [ADDR_WIDTH-1:0] addr;
reg [DATA_WIDTH-1:0] data;
wire [DATA_WIDTH-1:0] out;

REGs #(.DATA_WIDTH(DATA_WIDTH)) REG_table (
    .CLK(clk),
    .CS(cs),
    .ADDR(addr),
    .WE(we),
    .D(data),
    .OUT(out)
);

always #10 clk = ~clk;

initial begin
    {clk, cs, we, addr} <= 0;
    
    repeat (2) @(posedge clk);
    cs = 1;
    we = 1;
    data = 20;
    
    repeat (2) @(posedge clk);
    addr = 1;
    data = 10;
    
    repeat (2) @(posedge clk);
    we = 0;
    addr = 0;
    
    repeat (2) @(posedge clk);
    addr = 1;
    
    repeat (2) @(posedge clk);
    $finish;
end
        
endmodule
