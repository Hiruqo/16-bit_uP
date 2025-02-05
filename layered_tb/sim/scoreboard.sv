`ifndef SCOREBOARD_SV
`define SCOREBOARD_SV

`include "share.sv"

class Scoreboard;
    mailbox mon2sb;

    function new(mailbox mon2sb);
        this.mon2sb = mon2sb;
    endfunction

    task run();
        forever begin
            logic [15:0] expected_out;
            logic expected_carry;
            Transaction tr;
            mon2sb.get(tr);
          	tr.display();
          
            case(tr.operation)
                ADD_RAM_INST: {expected_carry, expected_out} = tr.in0 + tr.in1 + tr.carry_in;
              	ADD_REG_A: {expected_carry, expected_out} = tr.in0 + tr.in1 + tr.carry_in;
                SUB_INST_RAM: expected_out = tr.in0 - tr.in1 + tr.carry_in;
                NOT_INST: expected_out = ~tr.in0;
                L_SHIFT_INST: expected_out = tr.in0 << 1;
                R_SHIFT_INST: expected_out = tr.in0 >> 1;
                default: expected_out = 0;
            endcase

            if (expected_out !== tr.in0)
              $display("Mismatch: Expected %d, Got %d", expected_out, tr.in0);
        end
    endtask
endclass

`endif
