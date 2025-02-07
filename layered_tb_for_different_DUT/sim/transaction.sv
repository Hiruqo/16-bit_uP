`ifndef TRANSACTION_SV
`define TRANSACTION_SV

`include "share_pkg.sv"

class Transaction;
    rand bit [7:0] in0, in1;
    rand bit carry_in;
    rand bit [2:0] operation;

  	bit rst;
    bit [7:0] expected_out;
    bit expected_carry;

    function new();
        // Initialization of default values
    	rst = 0;
        in0 = 0;
        in1 = 0;
        carry_in = 0;
        operation = 3'b000; // Default: ADD operation
    endfunction

    function void display();
        $display("Transaction: IN0=%0d, IN1=%0d, CARRY_IN=%b, INSTR=%b", 
                 in0, in1, carry_in, operation);
    endfunction
endclass

`endif
