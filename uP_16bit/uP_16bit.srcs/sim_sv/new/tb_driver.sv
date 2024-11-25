`ifndef TB_DRIVER
`define TB_DRIVER

class uP_driver;
  virtual uP_intf uP_virt_intf;
  mailbox drv_mbx;

  function new(virtual uP_intf uP_virt_intf, mailbox drv_mbx);
    this.uP_virt_intf = uP_virt_intf;
    this.drv_mbx = drv_mbx;
  endfunction

  task main();
    forever begin
      uP_transaction trans;
      drv_mbx.get(trans);
      @(posedge uP_virt_intf.driver_cb.CLK);
      uP_virt_intf.driver_cb.CLK_btn <= trans.CLK_btn;
      uP_virt_intf.driver_cb.RST_btn <= trans.RST_btn;
      $display("[DRIVER] Sent transaction to DUT: CLK_btn=%b, RST_btn=%b", trans.CLK_btn, trans.RST_btn);
    end
  endtask
endclass

`endif