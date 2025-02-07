`ifndef GENERATOR_SV
`define GENERATOR_SV

`include "transaction.sv"

class Generator;
    mailbox gen2drv;
    int num_transactions;

    function new(mailbox gen2drv, int num_transactions);
        this.gen2drv = gen2drv;
        this.num_transactions = num_transactions;
    endfunction

    task run();
        repeat(num_transactions) begin
            Transaction tr = new();
            assert(tr.randomize());
            tr.display();
            gen2drv.put(tr);
        end
    endtask
endclass

`endif
