`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2024 10:20:26 PM
// Design Name: 
// Module Name: RAM_tb
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


module RAM_tb();

reg clk;
reg cs;
reg [11:0] addr;
reg wr;
reg oe;
wire [15:0] dq;
reg [15:0] data_temp;

RAM RAM_test_unit(
    .CLK(clk)
    ,.nCS(cs)
    ,.ADDR(addr)
    ,.nWR(wr)
    ,.nOE(oe)
    ,.DQ(dq)
);

always #1 clk = ~clk;
assign dq = ~oe ? data_temp : 'hz;

initial begin
    clk = 1'b0;
    cs = 1;
    addr = 12'd0;
    wr = 1;
    oe = 1;
    data_temp = 0;
end


initial begin
    #20;
    cs = 1'b0;
    wr = 1'b0;
    oe = 1'b1;
    data_temp = 16'd5;
    
    #20
    addr = 12'd1;
    data_temp = 16'd20;
    
    #20;
    wr = 1'b1;
    oe = 1'b0;
    addr = 12'd0;
    
    #20;
    addr = 12'd1;
    
    #100;
    $finish();
end

endmodule
