`timescale 1ns / 1ps

module DUT_verilog;

// inputs
reg [15:0] in0, in1;
reg [5:0] operation;
reg carry_in;
reg clk;
reg ce;

// outputs
wire [15:0] accu_out;
wire carry_out, zero_flag;

// DUT instance
DUT_ALU_Accu DUT(
    // ALU inputs
        .ALU_IN0(in0),
        .ALU_IN1(in1),
        .ALU_OPERATION(operation),
        .ALU_CARRY_IN(carry_in),
    
    // Accumulaotr inputs
        .CLK(clk),
        .CE(ce),
    
    // ALU outputs
        .ALU_CARRY_OUT(carry_out),
        .ALU_ZERO_FLAG(zero_flag),
    
    // Accumulator outptus
        .ACCUMULATOR_OUTPUT(accu_out)
);

initial begin
    in0 = 0;
    in1 = 0;
    operation = 0;
    carry_in = 0;
    clk = 0;
    ce = 0;
end

always #10 clk = ~clk;

initial begin
    in0 = 2;
    in1 = 1;
    operation = 6'b000110;
    
    #20;
    ce = 1;
    
    #20;
    operation = 6'b001010;
    
    #100;
    $finish;
end

endmodule
