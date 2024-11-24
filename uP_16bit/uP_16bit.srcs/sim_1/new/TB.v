`timescale 1ns / 1ps

module TB;

integer i = 0;

reg CLK;        // 100 MHz
reg CLK_btn;    // button clock
reg RST_btn;    

wire CARRY;
wire [3:0] ANODES_OUT;
wire [6:0] SEG_NMBR_OUT;

uP_top test_unit(
    .CLK(CLK),         // 100 MHz
    .CLK_btn(CLK_btn),     // button clock
    .RST_btn(RST_btn),
    .CARRY(CARRY),
    .ANODES_OUT(ANODES_OUT),
    .SEG_NMBR_OUT(SEG_NMBR_OUT)
);

initial begin
    {CLK, CLK_btn} <= 0;
    RST_btn <= 1; 
end

always #10 CLK = ~CLK;

initial begin
    repeat (5) @(posedge CLK);
    RST_btn <= 0;
    
    for (i = 0; i < 20; i = i + 1) begin
        repeat (5) @(posedge CLK);

        CLK_btn <= 1;
        @(posedge CLK);
        CLK_btn <= 0;
    end

    repeat (5) @(posedge CLK);
    $finish;
end

endmodule
