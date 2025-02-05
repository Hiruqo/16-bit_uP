`include "test.sv"
`include "interface.sv"


module testbench;
  alu_accu_if vif();
  test testUwU;
  	
  	DUT_ALU_Accu dut (
        .ALU_IN0(vif.ALU_IN0),
        .ALU_IN1(vif.ALU_IN1),
        .ALU_OPERATION(vif.ALU_OPERATION),
        .ALU_CARRY_IN(vif.ALU_CARRY_IN),
        .ALU_CARRY_OUT(vif.ALU_CARRY_OUT),
        .ALU_ZERO_FLAG(vif.ALU_ZERO_FLAG),
        .CLK(vif.CLK),
        .CE(vif.CE),
        .ACCUMULATOR_OUTPUT(vif.ACCUMULATOR_OUTPUT)
    );
  
  	initial begin
      vif.CLK = 0;
    end
  
  	always #10 vif.CLK = ~vif.CLK;
  
    initial begin
      	testUwU = new(vif);
      	//#100;
      	testUwU.run();
      $finish;
    end
  
  	initial begin
      	$dumpfile("wave.vcd");
        $dumpvars(0, testbench);
    end
  
endmodule
