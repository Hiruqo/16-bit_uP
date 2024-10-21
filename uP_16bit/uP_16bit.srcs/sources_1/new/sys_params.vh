    // ===========================================================
    //  ----- ----- ----- Commands & parameters ----- ----- -----
    // ===========================================================
    
    // 000001 - MOV A, INST             <- MOVE <- instant nmbr to accu
    // 000010 - MOV A, RAM              <- MOVE <- RAM to accu
    // 000011 - MOV A, REG              <- MOVE <- REG to accu
    // 000100 - MOV REG, A              <- MOVE <- accu to REG
    // 000101 - MOV RAM, A              <- MOVE <- accu to RAM
    parameter MOV_A_INST       = 6'b000001;
    parameter MOV_A_RAM        = 6'b000010;
    parameter MOV_A_REG        = 6'b000011;
    parameter MOV_REG_A        = 6'b000100;
    parameter MOV_RAM_A        = 6'b000101;
    
    // 000110 - ADD RAM, INST           <- ADD <- instant nmbr + RAM
    // 000111 - ADD REG, INST           <- ADD <- instant nmbr + REG
    // 001000 - ADD RAM, A              <- ADD <- acc + RAM
    // 001001 - ADD REG, A              <- ADD <- acc + REG
    parameter ADD_RAM_INST     = 6'b000110;
    parameter ADD_REG_INST     = 6'b000111;
    parameter ADD_RAM_A        = 6'b001000;
    parameter ADD_REG_A        = 6'b001001;
    
    // 001010 - SUB INST, RAM           <- SUB <- RAM from instant nmbr
    // 001011 - SUB INST, REG           <- SUB <- REG from instant nmbr
    // 001100 - SUB A, RAM              <- SUB <- RAM from acc
    // 001101 - SUB A, REG              <- SUB <- REG from acc
    // 001110 - SUB RAM, INST           <- SUB <- instant nmbr from RAM
    // 001111 - SUB RAM, A              <- SUB <- acc from RAM
    // 010000 - SUB REG, INST           <- SUB <- instant nmbr from REG
    // 010001 - SUB REG, A              <- SUB <- acc from REG
    parameter SUB_INST_RAM     = 6'b001010;
    parameter SUB_INST_REG     = 6'b001011;
    parameter SUB_A_RAM        = 6'b001100;
    parameter SUB_A_REG        = 6'b001101;
    parameter SUB_RAM_INST     = 6'b001110;
    parameter SUB_RAM_A        = 6'b001111;
    parameter SUB_REG_INST     = 6'b010000;
    parameter SUB_REG_A        = 6'b010001;
    
    // 010010 - INC INST                <- INC <- increment instant nmbr
    // 010011 - INC A                   <- INC <- increment acc
    // 010100 - INC REG                 <- INC <- increment REG
    // 010101 - INC RAM                 <- INC <- increment RAM
    parameter INC_INST         = 6'b010010;
    parameter INC_A            = 6'b010011;
    parameter INC_REG          = 6'b010100;
    parameter INC_RAM          = 6'b010101;
    
    // 010110 - DEC INST                <- DEC <- decrement instant nmbr
    // 010111 - DEC A                   <- DEC <- decrement acc
    // 011000 - DEC REG                 <- DEC <- decrement REG
    // 011001 - DEC RAM                 <- DEC <- decrement RAM
    parameter DEC_INST         = 6'b010110;
    parameter DEC_A            = 6'b010111;
    parameter DEC_REG          = 6'b011000;
    parameter DEC_RAM          = 6'b011001;
    
    // 011010 - CMP_H INST, REG         <- CMP_H <- is instant nmbr higher than REG
    // 011011 - CMP_H INST, RAM         <- CMP_H <- is instant nmbr higher than RAM
    // 011100 - CMP_H A, REG            <- CMP_H <- is acc higher than REG
    // 011101 - CMP_H A, RAM            <- CMP_H <- is acc higher than REG
    // 011110 - CMP_H REG, INST         <- CMP_H <- is REG higher than instant nmbr
    // 011111 - CMP_H REG, A            <- CMP_H <- is REG higher than acc
    // 100000 - CMP_H RAM, INST         <- CMP_H <- is RAM higher than instant nmbr
    // 100001 - CMP_H RAM, A            <- CMP_H <- is RAM higher than acc
    parameter CMP_H_INST_REG   = 6'b011010;
    parameter CMP_H_INST_RAM   = 6'b011011;
    parameter CMP_H_A_REG      = 6'b011100;
    parameter CMP_H_A_RAM      = 6'b011101;
    parameter CMP_H_REG_INST   = 6'b011110;
    parameter CMP_H_REG_A      = 6'b011111;
    parameter CMP_H_RAM_INST   = 6'b100000;
    parameter CMP_H_RAM_A      = 6'b100001;
              
    // 100010 - CMP_E INST, REG         <- CMP_E <- is instant nmbr equal REG
    // 100011 - CMP_E INST, RAM         <- CMP_E <- is instant nmbr equal RAM
    // 100100 - CMP_E A, REG            <- CPM_E <- is acc equal REG
    // 100101 - CMP_E A, RAM            <- CPM_E <- is acc equal REG
    parameter CMP_E_INST_REG   = 6'b100010;
    parameter CMP_E_INST_RAM   = 6'b100011;
    parameter CMP_E_A_REG      = 6'b100100;
    parameter CMP_E_A_RAM      = 6'b100101;
                  
    // 100110 - CMP_L INST, REG         <- CMP_L <- is instant nmbr lower than REG
    // 100111 - CMP_L INST, RAM         <- CMP_L <- is instant nmbr lower than RAM
    // 101000 - CMP_L A, REG            <- CMP_L <- is acc lower than REG
    // 101001 - CMP_L A, RAM            <- CMP_L <- is acc lower than REG
    // 101010 - CMP_L REG, INST         <- CMP_L <- is REG lower than instant nmbr
    // 101011 - CMP_L REG, A            <- CMP_L <- is REG lower than acc
    // 101100 - CMP_L RAM, INST         <- CMP_L <- is RAM lower than instant nmbr
    // 101101 - CMP_L RAM, A            <- CMP_L <- is RAM lower than acc
    parameter CMP_L_INST_REG   = 6'b100110;
    parameter CMP_L_INST_RAM   = 6'b100111;
    parameter CMP_L_A_REG      = 6'b101000;
    parameter CMP_L_A_RAM      = 6'b101001;
    parameter CMP_L_REG_INST   = 6'b101010;
    parameter CMP_L_REG_A      = 6'b101011;
    parameter CMP_L_RAM_INST   = 6'b101100;
    parameter CMP_L_RAM_A      = 6'b101101;
    
    // 101110 - NOT INST                <- NOT <- negated instant nmbr
    // 101111 - NOT A                   <- NOT <- negated acc
    // 110000 - NOT RAM                 <- NOT <- negated RAM
    // 110001 - NOT REG                 <- NOT <- negated REG
    parameter NOT_INST         = 6'b101110;
    parameter NOT_A            = 6'b101111;
    parameter NOT_RAM          = 6'b110000;
    parameter NOT_REG          = 6'b110001;
    
    // 110010 - R_SHIFT INST            <- R_SHIFT <- right shifted instant nmbr
    // 110011 - R_SHIFT A               <- R_SHIFT <- right shifted acc
    // 110100 - R_SHIFT RAM             <- R_SHIFT <- right shifted RAM
    // 110101 - R_SHIFT REG             <- R_SHIFT <- right shifted REG
    parameter R_SHIFT_INST     = 6'b110010;
    parameter R_SHIFT_A        = 6'b110011;
    parameter R_SHIFT_RAM      = 6'b110100;
    parameter R_SHIFT_REG      = 6'b110101;
    
    // 110110 - L_SHIFT INST            <- L_SHIFT <- left shifted instant nmbr 
    // 110111 - L_SHIFT A               <- L_SHIFT <- left shifted acc          
    // 111000 - L_SHIFT RAM             <- L_SHIFT <- left shifted RAM          
    // 111001 - L_SHIFT REG             <- L_SHIFT <- left shifted REG
    parameter L_SHIFT_INST     = 6'b110110;
    parameter L_SHIFT_A        = 6'b110111;
    parameter L_SHIFT_RAM      = 6'b111000;
    parameter L_SHIFT_REG      = 6'b111001;        
    
    // 000000 - NOOP                    <- NOOP <- No operation
    parameter NOOP             = 6'b000000;
    
    // 111010 - JMP rA                  <- JMP <- jump to 'rA' address in PC_Counter
    parameter JMP_rA           = 6'b111010;
    // {JMP_rA, 16'd0, 16'd<address to jump>}
    
    // 111011 - JMP_pathed rA, ra       <- JMP_pathed <- jump to 'rA' address in PC_Counter with return 'ra' address
    parameter JMP_rA_ra        = 6'b111011;
    // {JMP_rA_rA, 16'd{10'd0 ,6'd<addr to jump>}, 16'd{10'd0 ,6'd<current addr>}}
    
    // NOT used
    // 111100
    // 111101
    // 111110
    // 111111
    
    // =======================================================
    //  ----- ----- ----- Instruction types ----- ----- -----
    // =======================================================
    
    // A, #<n>    <- instant nbr to accu
    // A, <n>     <- RAM data to accu
    // A, R<n>    <- REG data to accu
    
    // <n>, A     <- acc to RAM
    // R<n>, A    <- acc to REG
    