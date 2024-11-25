`ifndef TB_ENVIRONMENT
`define TB_ENVIRONMENT

`include "tb_generator.sv"
`include "tb_driver.sv"
`include "tb_monitor.sv"
`include "tb_scoreboard.sv"

class uP_environment;
  uP_generator gen;
  uP_driver driv;
  uP_monitor mon;
  uP_scoreboard scb;

  mailbox gen_mbx, mon_mbx;
  virtual uP_intf uP_virt_intf;

  function new(virtual uP_intf uP_virt_intf);
    this.uP_virt_intf = uP_virt_intf;
    gen_mbx = new();
    mon_mbx = new();
    gen = new(gen_mbx);
    driv = new(uP_virt_intf, gen_mbx);
    mon = new(uP_virt_intf, mon_mbx);
    scb = new(mon_mbx);
  endfunction

  task run();
    fork
      gen.main();
      driv.main();
      mon.main();
      scb.main();
    join_any
  endtask
endclass

`endif