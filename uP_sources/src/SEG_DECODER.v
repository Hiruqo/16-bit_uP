`timescale 1ns / 1ps

module SEG_DECODER(
    input [1:0] ANODE_POINTER,
    input [5:0] PC_DATA,
    input [15:0] ACU_DATA,
    output [6:0] DATA_OUT
    );
    
    reg [6:0] LED_out;
    
    always @(*) begin
        if (ANODE_POINTER == 2'b00) begin
            case (PC_DATA)
                6'd0: LED_out = 7'b0000001; // "0"
                6'd1: LED_out = 7'b1001111; // "1"
                6'd2: LED_out = 7'b0010010; // "2"
                6'd3: LED_out = 7'b0000110; // "3"
                6'd4: LED_out = 7'b1001100; // "4"
                6'd5: LED_out = 7'b0100100; // "5"
                6'd6: LED_out = 7'b0100000; // "6"
                6'd7: LED_out = 7'b0001111; // "7"
                6'd8: LED_out = 7'b0000000; // "8"
                6'd9: LED_out = 7'b0000100; // "9"
                6'd10: LED_out = 7'b0001000; // "A"
                6'd11: LED_out = 7'b1100000; // "b"
                6'd12: LED_out = 7'b1110010; // "c"
                6'd13: LED_out = 7'b1000010; // "d"
                6'd14: LED_out = 7'b0110000; // "E"
                6'd15: LED_out = 7'b0111000; // "F"
                default: LED_out = 7'b1110111; // "_"
            endcase
        end else if (ANODE_POINTER == 2'b01) begin
            LED_out = 7'b1111111; // " "
        end else if (ANODE_POINTER == 2'b10) begin
            if (ACU_DATA[15] == 1'b1)
                LED_out = 7'b1111110; // "-"
            else
                LED_out = 7'b1111111; // " "
        end else if (ANODE_POINTER == 2'b11) begin
            if (ACU_DATA[15] == 1'b0) begin
                case (ACU_DATA)
                    16'd0: LED_out = 7'b0000001; // "0"     
                    16'd1: LED_out = 7'b1001111; // "1" 
                    16'd2: LED_out = 7'b0010010; // "2" 
                    16'd3: LED_out = 7'b0000110; // "3" 
                    16'd4: LED_out = 7'b1001100; // "4" 
                    16'd5: LED_out = 7'b0100100; // "5" 
                    16'd6: LED_out = 7'b0100000; // "6" 
                    16'd7: LED_out = 7'b0001111; // "7" 
                    16'd8: LED_out = 7'b0000000; // "8"     
                    16'd9: LED_out = 7'b0000100; // "9"
                    16'd10: LED_out = 7'b0001000; // "A"  
                    16'd11: LED_out = 7'b1100000; // "b" 
                    16'd12: LED_out = 7'b1110010; // "c" 
                    16'd13: LED_out = 7'b1000010; // "d" 
                    16'd14: LED_out = 7'b0110000; // "E" 
                    16'd15: LED_out = 7'b0111000; // "F"
                    default: LED_out = 7'b1110111; // "_"
                endcase
            end else
                case (ACU_DATA)
                    16'b0000_0000_0000_0000: LED_out = 7'b0000001; // "0"     
                    16'b1111_1111_1111_1111: LED_out = 7'b1001111; // "1" 
                    16'b1111_1111_1111_1110: LED_out = 7'b0010010; // "2" 
                    16'b1111_1111_1111_1101: LED_out = 7'b0000110; // "3" 
                    16'b1111_1111_1111_1100: LED_out = 7'b1001100; // "4" 
                    16'b1111_1111_1111_1011: LED_out = 7'b0100100; // "5" 
                    16'b1111_1111_1111_1010: LED_out = 7'b0100000; // "6" 
                    16'b1111_1111_1111_1001: LED_out = 7'b0001111; // "7" 
                    16'b1111_1111_1111_1000: LED_out = 7'b0000000; // "8"     
                    16'b1111_1111_1111_0111: LED_out = 7'b0000100; // "9"
                    16'b1111_1111_1111_0110: LED_out = 7'b0001000; // "A"  
                    16'b1111_1111_1111_0101: LED_out = 7'b1100000; // "b" 
                    16'b1111_1111_1111_0100: LED_out = 7'b1110010; // "c" 
                    16'b1111_1111_1111_0011: LED_out = 7'b1000010; // "d" 
                    16'b1111_1111_1111_0010: LED_out = 7'b0110000; // "E" 
                    16'b1111_1111_1111_0001: LED_out = 7'b0111000; // "F"
                    default: LED_out = 7'b1110111; // "_"
                endcase
        end
    end
    
    assign DATA_OUT = LED_out;
endmodule
