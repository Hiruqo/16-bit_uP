`ifndef MONITOR_SV
`define MONITOR_SV

`include "transaction.sv"

class Monitor;
    virtual alu_accu_if.mon vif;
    mailbox mon2sb;

    function new(virtual alu_accu_if.mon vif, mailbox mon2sb);
        this.vif = vif;
        this.mon2sb = mon2sb;
    endfunction

    task run;
        forever begin
            Transaction tr = new();
          @(posedge vif.CLK) begin
            tr.in0 = vif.ALU_IN0;
            tr.in1 = vif.ALU_IN1;
          end
            tr.operation = vif.ALU_OPERATION;
            tr.carry_in = vif.ALU_CARRY_IN;
            mon2sb.put(tr);
          @(posedge vif.CLK);
          //$display("\nVif: %p\n", vif);
        end
    endtask
endclass

`endif
