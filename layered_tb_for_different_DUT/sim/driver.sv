`ifndef DRIVER_SV
`define DRIVER_SV

class Driver;
    virtual alu_accu_if.drv vif;
    mailbox gen2drv;

    function new(virtual alu_accu_if.drv vif, mailbox gen2drv);
        this.vif = vif;
        this.gen2drv = gen2drv;
    endfunction

    task run();
        forever begin
            Transaction tr;
            gen2drv.get(tr);
            vif.ALU_IN0 = tr.in0;
            vif.ALU_IN1 = tr.in1;
            vif.ALU_OPERATION = tr.operation;
            vif.ALU_CARRY_IN = tr.carry_in;
        end
    endtask
endclass

`endif
