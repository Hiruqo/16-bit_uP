`ifndef TB_MONITOR
`define TB_MONITOR

`include "tb_transaction.sv"

class uP_monitor;
  virtual uP_intf uP_virt_intf;
  mailbox mon_mbx;

  function new(virtual uP_intf uP_virt_intf, mailbox mon_mbx);
    this.uP_virt_intf = uP_virt_intf;
    this.mon_mbx = mon_mbx;
  endfunction

  task main();
    forever begin
      uP_transaction trans;
      trans = new();
      
      @(posedge uP_virt_intf.driver_cb.CLK);
      
      trans.expected_ANODES_OUT = uP_virt_intf.driver_cb.ANODES_OUT;
      trans.expected_SEG_NMBR_OUT = uP_virt_intf.driver_cb.SEG_NMBR_OUT;
      mon_mbx.put(trans);
      $display("[MONITOR] Observed DUT output: ANODES_OUT=%h, SEG_NMBR_OUT=%h", trans.expected_ANODES_OUT, trans.expected_SEG_NMBR_OUT);
    end
  endtask
endclass

`endif