`timescale 1ns / 1ps

module PC_Counter(
    input wire CLK,
    input wire RST,
    input wire WRAP_FLAG,
    input wire NOOP_FLAG,
    output reg [5:0] Q
    );
    
    always @(posedge CLK or posedge RST) begin
        if (RST) begin
            Q <= 6'd0;
        end else 
            if (NOOP_FLAG) begin
                Q <= Q + 1'b0;
            end else begin
                if (Q >= 6'd63)
                    if (WRAP_FLAG)
                        Q <= 6'd0;
                    else
                        Q <= Q + 1'b0;
                else
                    Q <= Q + 1'b1;
            end
    end
     
endmodule
