`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2024 08:59:37 PM
// Design Name: 
// Module Name: PC_Counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PC_Counter(
    input wire CLK,
    input wire RST,
    input wire WRAP_FLAG,
    input wire NOOP_flag,
    output reg [5:0] Q
    );
    
    reg noop_tick_flag;
    
    always @(posedge CLK or posedge RST) begin
        if (RST) begin
            Q <= 6'd0;
            noop_tick_flag <= 1'b0;
        end else 
            if (NOOP_flag) begin
                Q <= Q + 1'b0;
                noop_tick_flag <= 1'b1;
            end else begin
                if (Q >= 6'd63)
                    if (WRAP_FLAG)
                        Q <= 6'd0;
                    else
                        Q <= Q + 1'b0;
                else
                    Q <= Q + 1'b1;
            end
            
            if (noop_tick_flag) begin
                noop_tick_flag <= 1'b0;
                Q <= Q + 1'b1;
            end
    end
    
    
    
endmodule
