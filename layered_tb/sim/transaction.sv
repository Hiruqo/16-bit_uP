`ifndef TRANSACTION_SV
`define TRANSACTION_SV

`include "share.sv";

class Transaction;
    rand bit [15:0] in0, in1;
    rand bit carry_in;
    rand instruction operation;

    bit [15:0] expected_out;
    bit expected_carry;

    function new();
        // Inicjalizacja wartosci domyslnych dla pol klasy
        in0 = 0;
        in1 = 0;
        carry_in = 0;
        operation = L_SHIFT_INST;
    endfunction

    function void display();
      $display("Transaction: IN0=%0d, IN1=%0d, CARRY_IN=%b, INSTR=%s", 
                 in0, in1, carry_in, operation.name());
    endfunction
endclass

`endif
