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
    input wire nRST,
    input wire WRAP_FLAG,
    output reg [5:0] Q
    );
    
    always @(posedge CLK or posedge ~nRST) begin
        if (~nRST)
            Q = 6'd0;
        else
            if (Q >= 6'd63)
                if (WRAP_FLAG)
                    Q <= 6'd0;
                else
                    Q <= Q + 1'b0;
            else
                Q <= Q + 1'b1;
    end
    
endmodule
