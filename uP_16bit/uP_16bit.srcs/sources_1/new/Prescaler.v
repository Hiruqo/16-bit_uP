`timescale 1ns / 1ps

module Prescaler #(parameter DIVISOR = 2) (
    input CLK_IN,       // input clock
    output reg CLK_OUT  // output clock
    );
    
    reg [27:0] counter = 28'd0;

    always @(posedge CLK_IN) begin
        counter <= counter + 1;
        if (counter >= (DIVISOR - 1))
            counter <= 28'd0;
            CLK_OUT <= (counter < DIVISOR / 2) ? 1'b1 : 1'b0;
    end
    
endmodule
