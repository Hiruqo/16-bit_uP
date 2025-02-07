`include "test.sv"
`include "interface.sv"

module testbench;
    alu_accu_if vif();
    test testUwU;

    // Instantiate DUT (Device Under Test)
    alu_accu_top uut (
        .input_data_0(vif.ALU_IN0),
        .input_data_1(vif.ALU_IN1),
        .alu_opcode(vif.ALU_OPERATION),
        .carry_in(vif.ALU_CARRY_IN),
        .carry_out(vif.ALU_CARRY_OUT),
        .rst(vif.RST),
        .clk(vif.CLK),
        .accumulator_ce(vif.CE),
        .output_data(vif.ACCUMULATOR_OUTPUT)
    );

    initial begin
        vif.CLK = 0;
    end

    always #10 vif.CLK = ~vif.CLK;

    initial begin
        testUwU = new(vif);
        testUwU.run();
        $finish;
    end

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, testbench);
    end

endmodule
