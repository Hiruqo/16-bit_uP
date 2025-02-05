`ifndef ENVIRONMENT_SV
`define ENVIRONMENT_SV

`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class Environment;
    Generator gen;
    Driver drv;
    Monitor mon;
    Scoreboard sb;
    mailbox gen2drv, mon2sb;

    function new(virtual alu_accu_if vif);
        gen2drv = new();
        mon2sb = new();
        gen = new(gen2drv, 10);
        drv = new(vif.drv, gen2drv);
        mon = new(vif.mon, mon2sb);
        sb = new(mon2sb);
    endfunction

    task run();
        fork
            gen.run();
            drv.run();
            mon.run();
            sb.run();
        join
    endtask
endclass

`endif
