`timescale 1ns / 1ps


module ANODE_SWITCHER(
    input wire CLK,
    output reg [3:0] ANODES,
    output reg [1:0] ANODE_POINTER
    );
      
    reg [19:0] refresh_counter = 20'd0; // 20-bit for creating 10.5ms refresh period or 380Hz refresh rate 
    reg [3:0] anode_decoder;
    
    always @(posedge CLK) begin
        refresh_counter <= refresh_counter + 1;
       
        if (refresh_counter[19:18] == 2'b00) begin
            ANODES <= 4'b0111;
            ANODE_POINTER <= 2'b00;
        end else if (refresh_counter[19:18] == 2'b01) begin
            ANODES <= 4'b1011;
            ANODE_POINTER <= 2'b01;
        end else if (refresh_counter[19:18] == 2'b10) begin
            ANODES <= 4'b1101;
            ANODE_POINTER <= 2'b10;
        end else if (refresh_counter[19:18] == 2'b11) begin
            ANODES <= 4'b1110;
            ANODE_POINTER <= 2'b11;
        end 
    end
    
endmodule
