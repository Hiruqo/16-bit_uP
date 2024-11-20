`timescale 1ns / 1ps

module PC_Counter(
    input wire CLK,
    input wire RST,
    input wire WRAP_FLAG,
    input wire NOOP_FLAG,
    output reg [5:0] Q
    );
    
    reg noop_pending; // Internal signal to track when NOOP_FLAG is processed

    always @(posedge CLK or posedge RST) begin
        if (RST) begin
            Q <= 6'd0;
            noop_pending <= 1'b0;
        end else begin
            if (NOOP_FLAG && !noop_pending) begin
                // Enter NOOP state, holding Q and setting NOOP_done
                Q <= Q; // Q + 0 explicitly
                noop_pending <= 1'b1; // Latch NOOP processing
            end else if (noop_pending) begin
                // Clear NOOP state and resume normal counting
                noop_pending <= 1'b0;
                Q <= Q + 1;
            end else begin
                // Normal counting behavior
                if (Q >= 6'd63) begin
                    if (WRAP_FLAG)
                        Q <= 6'd0; // Wrap to 0
                    else
                        Q <= 6'd63; // Hold at maximum
                end else begin
                    Q <= Q + 1; // Increment normally
                end
            end
        end
    end
endmodule
