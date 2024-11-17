`timescale 1ns / 1ps

module SEG_DECODER(
    input [1:0] ANODE_POINTER,
    input [15:0] ACU_DATA,
    output [6:0] DATA_OUT
    );
    
    reg [6:0] LED_out;
    
    always @(*) begin
        if (ANODE_POINTER == 2'b00) begin
            case (ACU_DATA[3:0])
                4'b0000: LED_out = 7'b0000001; // "0"     
                4'b0001: LED_out = 7'b1001111; // "1" 
                4'b0010: LED_out = 7'b0010010; // "2" 
                4'b0011: LED_out = 7'b0000110; // "3" 
                4'b0100: LED_out = 7'b1001100; // "4" 
                4'b0101: LED_out = 7'b0100100; // "5" 
                4'b0110: LED_out = 7'b0100000; // "6" 
                4'b0111: LED_out = 7'b0001111; // "7" 
                4'b1000: LED_out = 7'b0000000; // "8"     
                4'b1001: LED_out = 7'b0000100; // "9"
                4'b1010: LED_out = 7'b0001000; // "A"  
                4'b1011: LED_out = 7'b1100000; // "b" 
                4'b1100: LED_out = 7'b1110010; // "c" 
                4'b1101: LED_out = 7'b1000010; // "d" 
                4'b1110: LED_out = 7'b0110000; // "E" 
                4'b1111: LED_out = 7'b0111000; // "F"
                default: LED_out = 7'b1110111; // "_"
            endcase
        end else if (ANODE_POINTER == 2'b01) begin
            case (ACU_DATA[7:4])
                4'b0000: LED_out = 7'b0000001; // "0"     
                4'b0001: LED_out = 7'b1001111; // "1" 
                4'b0010: LED_out = 7'b0010010; // "2" 
                4'b0011: LED_out = 7'b0000110; // "3" 
                4'b0100: LED_out = 7'b1001100; // "4" 
                4'b0101: LED_out = 7'b0100100; // "5" 
                4'b0110: LED_out = 7'b0100000; // "6" 
                4'b0111: LED_out = 7'b0001111; // "7" 
                4'b1000: LED_out = 7'b0000000; // "8"     
                4'b1001: LED_out = 7'b0000100; // "9"
                4'b1010: LED_out = 7'b0001000; // "A"  
                4'b1011: LED_out = 7'b1100000; // "b" 
                4'b1100: LED_out = 7'b1110010; // "c" 
                4'b1101: LED_out = 7'b1000010; // "d" 
                4'b1110: LED_out = 7'b0110000; // "E" 
                4'b1111: LED_out = 7'b0111000; // "F"
                default: LED_out = 7'b1110111; // "_"
            endcase
        end else if (ANODE_POINTER == 2'b10) begin
            case (ACU_DATA[11:8])
                4'b0000: LED_out = 7'b0000001; // "0"     
                4'b0001: LED_out = 7'b1001111; // "1" 
                4'b0010: LED_out = 7'b0010010; // "2" 
                4'b0011: LED_out = 7'b0000110; // "3" 
                4'b0100: LED_out = 7'b1001100; // "4" 
                4'b0101: LED_out = 7'b0100100; // "5" 
                4'b0110: LED_out = 7'b0100000; // "6" 
                4'b0111: LED_out = 7'b0001111; // "7" 
                4'b1000: LED_out = 7'b0000000; // "8"     
                4'b1001: LED_out = 7'b0000100; // "9"
                4'b1010: LED_out = 7'b0001000; // "A"  
                4'b1011: LED_out = 7'b1100000; // "b" 
                4'b1100: LED_out = 7'b1110010; // "c" 
                4'b1101: LED_out = 7'b1000010; // "d" 
                4'b1110: LED_out = 7'b0110000; // "E" 
                4'b1111: LED_out = 7'b0111000; // "F"
                default: LED_out = 7'b1110111; // "_"
            endcase
        end else if (ANODE_POINTER == 2'b11) begin
            case (ACU_DATA[15:12])
                4'b0000: LED_out = 7'b0000001; // "0"     
                4'b0001: LED_out = 7'b1001111; // "1" 
                4'b0010: LED_out = 7'b0010010; // "2" 
                4'b0011: LED_out = 7'b0000110; // "3" 
                4'b0100: LED_out = 7'b1001100; // "4" 
                4'b0101: LED_out = 7'b0100100; // "5" 
                4'b0110: LED_out = 7'b0100000; // "6" 
                4'b0111: LED_out = 7'b0001111; // "7" 
                4'b1000: LED_out = 7'b0000000; // "8"     
                4'b1001: LED_out = 7'b0000100; // "9"
                4'b1010: LED_out = 7'b0001000; // "A"  
                4'b1011: LED_out = 7'b1100000; // "b" 
                4'b1100: LED_out = 7'b1110010; // "c" 
                4'b1101: LED_out = 7'b1000010; // "d" 
                4'b1110: LED_out = 7'b0110000; // "E" 
                4'b1111: LED_out = 7'b0111000; // "F"
                default: LED_out = 7'b1110111; // "_"
            endcase
        end    
    end
    
    assign DATA_OUT = LED_out;
endmodule
