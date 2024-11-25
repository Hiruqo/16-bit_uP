`timescale 1ns/1ps
`include "tb_interface.sv"
`include "tb_test.sv"

module testbench;
  bit CLK;
  bit CLK_btn;
  bit RST_btn;

  always #5 CLK = ~CLK;

  initial begin
    CLK = 0;
    RST_btn = 1;
    #20 RST_btn = 0;
  end

  uP_intf intf(CLK, CLK_btn, RST_btn);

  uP_top DUT(
    .CLK(intf.CLK),
    .CLK_btn(intf.CLK_btn),
    .RST_btn(intf.RST_btn),
    .CARRY(intf.driver_cb.CARRY),
    .ZERO(intf.driver_cb.ZERO),
    .ANODES_OUT(intf.driver_cb.ANODES_OUT),
    .SEG_NMBR_OUT(intf.driver_cb.SEG_NMBR_OUT)
  );

  uP_test test1(intf);

  initial begin
    $dumpfile("uP_top.vcd");
    $dumpvars(0, testbench);
  end
endmodule
