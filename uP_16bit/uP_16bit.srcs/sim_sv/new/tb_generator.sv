`ifndef TB_GENERATOR
`define TB_GENERATOR

`include "tb_transaction.sv"

class uP_generator;
  mailbox gen_mbx;

  function new(mailbox gen_mbx);
    this.gen_mbx = gen_mbx;
  endfunction

  task main();
    repeat (20) begin
      uP_transaction trans = new();
      trans.randomize();
      gen_mbx.put(trans);
      $display("[GENERATOR] Generated transaction: CLK_btn=%b, RST_btn=%b", trans.CLK_btn, trans.RST_btn);
    end
  endtask
endclass

`endif