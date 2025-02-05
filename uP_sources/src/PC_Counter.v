`timescale 1ns / 1ps

module PC_Counter(
    input wire CLK,
    input wire RST,
    input wire WRAP_FLAG,
    input wire NOOP_FLAG,
    input wire PC_JMP,
    input wire PC_JMP_PATHED,
    input wire [5:0] jmp_ADDR,
    input wire [5:0] jmp_NMBR_OF_TICKS,
    output reg PATHED_JUMP_END_FLAG,
    output reg [5:0] Q
    );
    
    reg noop_pending; // Internal signal to track when NOOP_FLAG is processed
    reg jmp_pending;
    reg jmp_pathed;
    reg [5:0] jmp_origin_holder;

    reg [5:0] jpm_pathed_counter;

    always @(posedge CLK or posedge RST) begin
        if (RST) begin
            noop_pending <= 1'b0;
            jmp_pending <= 1'b0;
            jmp_pathed <= 1'b0;
            jpm_pathed_counter <= 1'b0;
            jmp_origin_holder <= 1'b0;
            PATHED_JUMP_END_FLAG <= 1'b1;
            Q <= 6'd0;
        end else begin
            if (NOOP_FLAG && !noop_pending) begin
                // Enter NOOP state, holding Q and setting NOOP_done
                Q <= Q; // Q + 0 explicitly
                noop_pending <= 1'b1; // Latch NOOP processing
            end else if (noop_pending) begin
                // Clear NOOP state and resume normal counting
                noop_pending <= 1'b0;
                Q <= Q + 1;
            end else if (PC_JMP && !jmp_pending) begin
                Q <= jmp_ADDR;
                jmp_pending <= 1;
            end else if (jmp_pending) begin
                jmp_pending <= 1'b0;
                Q <= Q + 1;
            end else if (PC_JMP_PATHED && !jmp_pathed) begin
                Q <= jmp_ADDR;
                PATHED_JUMP_END_FLAG <= 1'b0;
                jmp_pathed <= 1'b1;
                jmp_origin_holder <= Q;
            end else if (jmp_pathed) begin
                if (jpm_pathed_counter < jmp_NMBR_OF_TICKS) begin
                    Q <= Q + 1;
                    jpm_pathed_counter <= jpm_pathed_counter + 1'b1;
                end else begin
                    jmp_pathed <= 1'b0;
                    PATHED_JUMP_END_FLAG <= 1'b1;
                    jpm_pathed_counter <= 6'd0;
                    Q <= jmp_origin_holder + 1'b1;
                end
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
                
                if (!PC_JMP_PATHED) begin
                    PATHED_JUMP_END_FLAG <= 1'b1;
                    jmp_pathed <= 1'b0;
                    jpm_pathed_counter <= 6'd0;
                end
            end
        end
    end
endmodule
