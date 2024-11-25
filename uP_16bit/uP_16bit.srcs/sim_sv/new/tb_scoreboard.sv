`ifndef TB_SCOREBOARD
`define TB_SCOREBOARD

class uP_scoreboard;
  mailbox mon_mbx;

  function new(mailbox mon_mbx);
    this.mon_mbx = mon_mbx;
  endfunction

  task main();
    uP_transaction trans;
    forever begin
      mon_mbx.get(trans);
      if (trans.expected_ANODES_OUT !== trans.expected_ANODES_OUT) begin
        $error("[SCOREBOARD] Mismatch: ANODES_OUT");
      end
      if (trans.expected_SEG_NMBR_OUT !== trans.expected_SEG_NMBR_OUT) begin
        $error("[SCOREBOARD] Mismatch: SEG_NMBR_OUT");
      end
    end
  endtask
endclass

`endif