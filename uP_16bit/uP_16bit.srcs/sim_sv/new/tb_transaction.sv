`ifndef UP_TRANSACTION
`define UP_TRANSACTION

class uP_transaction;
  rand bit CLK_btn;
  rand bit RST_btn;
  bit [6:0] expected_SEG_NMBR_OUT;
  bit [3:0] expected_ANODES_OUT;

  // Constraints for randomness
  constraint clk_btn_constr { CLK_btn dist {0 := 1, 1 := 1}; }
  constraint rst_btn_constr { RST_btn dist {0 := 1, 1 := 3}; }

  function void display();
    $display("[TRANSACTION] CLK_btn=%0b, RST_btn=%0b", CLK_btn, RST_btn);
  endfunction
endclass

`endif