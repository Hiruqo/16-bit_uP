`ifndef TB_TEST
`define TB_TEST

`include "tb_environment.sv"

program uP_test(uP_intf intf);
  uP_environment env;

  initial begin
    env = new(intf);
    env.run();
    #10 $finish;
  end
endprogram

`endif