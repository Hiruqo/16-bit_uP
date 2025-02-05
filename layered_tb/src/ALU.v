module ALU(
    input wire [5:0] INSTRUCTION,
    input wire [15:0] IN1,
    input wire [15:0] IN0,
    input wire CARRY_IN,
    output CARRY,
    output ZERO_FLAG,
    output [15:0] OUT
    );
    
    `include "instr_params.txt"
    
    reg [15:0] temp_out;
    reg temp_carry;
    
    always @(*) begin
        case(INSTRUCTION)
            NOOP : begin
                temp_out = temp_out;
                temp_carry = temp_carry;
            end
        
            // --------------
            // - MOV section
            // --------------
            MOV_A_INST : begin
                temp_out = IN0;
            end
            
            MOV_A_RAM : begin
                temp_out = IN1;
            end
            
            MOV_A_REG : begin
                temp_out = IN1;
            end
            
            // --------------
            // - ADD section
            // --------------
            ADD_RAM_INST : begin
                {temp_carry, temp_out} = IN1 + IN0 + CARRY_IN;
            end
            
            ADD_REG_INST : begin
                {temp_carry, temp_out} = IN1 + IN0 + CARRY_IN;
            end
            
            ADD_RAM_A : begin
                {temp_carry, temp_out} = IN1 + IN0 + CARRY_IN;
            end
            
            ADD_REG_A : begin
                {temp_carry, temp_out} = IN1 + IN0 + CARRY_IN;
            end
            
            // --------------
            // - SUB section
            // --------------
            SUB_INST_RAM : begin
                temp_out = IN0 - IN1 + CARRY_IN;
            end
            
            SUB_INST_REG : begin
                temp_out = IN0 - IN1 + CARRY_IN;
            end
            
            SUB_A_RAM : begin
                temp_out = IN0 - IN1 + CARRY_IN;
            end
            
            SUB_A_REG : begin
                temp_out = IN0 - IN1 + CARRY_IN;
            end
           
            // --
           
            SUB_RAM_INST : begin
                temp_out = IN1 - IN0 + CARRY_IN;
            end
            
            SUB_RAM_A : begin
                temp_out = IN1 - IN0 + CARRY_IN;
            end
            
            SUB_REG_INST : begin
                temp_out = IN1 - IN0 + CARRY_IN;
            end
            
            SUB_REG_A : begin
                temp_out = IN1 - IN0 + CARRY_IN;
            end
            
            // --------------
            // - INC section
            // --------------
            INC_INST : begin
                temp_out = IN0 + 1;
            end
            
            INC_A : begin
                temp_out = IN0 + 1;
            end
            
            // --
            
            INC_REG : begin
                temp_out = IN1 + 1;
            end
            
            INC_RAM : begin
                temp_out = IN1 + 1;
            end
            
            // --------------
            // - DEC section
            // --------------
            DEC_INST | DEC_A : begin
                temp_out = IN0 - 1;
            end
            
            DEC_REG | DEC_RAM : begin
                temp_out = IN1 - 1;
            end
            
            // ----------------
            // - CMP_H section
            // ----------------
            CMP_H_INST_REG : begin
                temp_out = (IN0 > IN1) ? 1 : 0;
            end
            
            CMP_H_INST_RAM : begin
                temp_out = (IN0 > IN1) ? 1 : 0;
            end
            
            CMP_H_A_REG : begin
                temp_out = (IN0 > IN1) ? 1 : 0;
            end
            
            CMP_H_A_RAM : begin
                temp_out = (IN0 > IN1) ? 1 : 0;
            end
            
            // --
            
            CMP_H_REG_INST : begin
                temp_out = (IN1 > IN0) ? 1 : 0;
            end
            
            CMP_H_REG_A : begin
                temp_out = (IN1 > IN0) ? 1 : 0;
            end
            
            CMP_H_RAM_INST : begin
                temp_out = (IN1 > IN0) ? 1 : 0;
            end
            
            CMP_H_RAM_A : begin
                temp_out = (IN1 > IN0) ? 1 : 0;
            end
            
            // ----------------
            // - CMP_E section
            // ----------------
            CMP_E_INST_REG : begin
                temp_out = (IN1 == IN0) ? 1 : 0;
            end
            
            CMP_E_INST_RAM : begin
                temp_out = (IN1 == IN0) ? 1 : 0;
            end
            
            CMP_E_A_REG : begin
                temp_out = (IN1 == IN0) ? 1 : 0;
            end
            
            CMP_E_A_RAM : begin
                temp_out = (IN1 == IN0) ? 1 : 0;
            end
            
            // ----------------
            // - CMP_L section
            // ----------------
            CMP_L_INST_REG : begin
                temp_out = (IN0 < IN1) ? 1 : 0;
            end
            
            CMP_L_INST_RAM : begin
                temp_out = (IN0 < IN1) ? 1 : 0;
            end
            
            CMP_L_A_REG : begin
                temp_out = (IN0 < IN1) ? 1 : 0;
            end
            
            CMP_L_A_RAM : begin
                temp_out = (IN0 < IN1) ? 1 : 0;
            end
            
            // --
            
            CMP_L_REG_INST : begin
                temp_out = (IN1 < IN0) ? 1 : 0;
            end
            
            CMP_L_REG_A : begin
                temp_out = (IN1 < IN0) ? 1 : 0;
            end
            
            CMP_L_RAM_INST : begin
                temp_out = (IN1 < IN0) ? 1 : 0;
            end
            
            CMP_L_RAM_A : begin
                temp_out = (IN1 < IN0) ? 1 : 0;
            end
            
            // --------------
            // - NOT section
            // --------------
            NOT_INST : begin
                temp_out = ~IN0 + 1;
            end
            
            NOT_A : begin
                temp_out = ~IN0 + 1;
            end
            
            // --
            
            NOT_RAM : begin
                temp_out = ~IN1 + 1;
            end
            
            NOT_REG : begin
                temp_out = ~IN1 + 1;
            end
            
            // ------------------
            // - R_SHIFT section
            // ------------------
            R_SHIFT_INST : begin
                temp_out = IN0 >> 1;
            end
            
            R_SHIFT_A : begin
                temp_out = IN0 >> 1;
            end
            
            // --
            
            R_SHIFT_RAM : begin
                temp_out = IN1 >> 1;
            end
            
            R_SHIFT_REG : begin
                temp_out = IN1 >> 1;
            end
            
            // ------------------
            // - L_SHIFT section
            // ------------------
            L_SHIFT_INST : begin
                temp_out = IN0 << 1;
            end
            
            L_SHIFT_A : begin
                temp_out = IN0 << 1;
            end
            
            // --
            
            L_SHIFT_RAM : begin
                temp_out = IN1 << 1;
            end
            
            L_SHIFT_REG : begin
                temp_out = IN1 << 1;
            end
            
            // ------------------
            // TODO
            
            default : begin
                temp_carry = 0;
                temp_out = 0;
            end
        endcase
    end
    
    assign OUT = temp_out;
    assign CARRY = temp_carry;
    assign ZERO_FLAG = (OUT == 0) ? 1'b1 : 1'b0;
    
endmodule

