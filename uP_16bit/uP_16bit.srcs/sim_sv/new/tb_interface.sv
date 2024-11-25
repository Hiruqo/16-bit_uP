`ifndef TB_INTERFACE
`define TB_INTERFACE

interface uP_intf (
  input logic CLK,
  input logic CLK_btn,
  input logic RST_btn
);

  // Output signals
  logic CARRY;
  logic ZERO;
  logic [3:0] ANODES_OUT;
  logic [6:0] SEG_NMBR_OUT;

  // Clocking block for the driver
  clocking driver_cb @(posedge CLK);
    default input #1 output #1;
    input CLK_btn;
    input RST_btn;
    output CARRY;
    output ZERO;
    output ANODES_OUT;
    output SEG_NMBR_OUT;
  endclocking

  modport driver_mode (clocking driver_cb, input CLK);

endinterface

`endif