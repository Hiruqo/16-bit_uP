`ifndef TEST_SV
`define TEST_SV

`include "environment.sv"
`include "interface.sv"

class test;
  	virtual alu_accu_if vif;
    Environment env;

  function new(virtual alu_accu_if aai);
    vif = aai;
  endfunction
  
  	task run();
        env = new(vif);
        env.run();
    endtask
endclass

`endif
