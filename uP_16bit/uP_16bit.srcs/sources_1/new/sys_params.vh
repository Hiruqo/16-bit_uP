    // ===========================================================
    //  ----- ----- ----- Commands & parameters ----- ----- -----
    // ===========================================================
    
    // 000001 - MOV A, INST             <- MOVE <- instant nmbr to accu
    // 000010 - MOV A, RAM              <- MOVE <- RAM to accu
    // 000011 - MOV A, REG              <- MOVE <- REG to accu
    // 000100 - MOV REG, A              <- MOVE <- accu to REG
    // 000101 - MOV RAM, A              <- MOVE <- accu to RAM
    integer MOV_A_INST       = 6'b000001;
    integer MOV_A_RAM        = 6'b000010;
    integer MOV_A_REG        = 6'b000011;
    integer MOV_REG_A        = 6'b000100;
    integer MOV_RAM_A        = 6'b000101;
    
    // 000110 - ADD RAM, INST           <- ADD <- instant nmbr + RAM
    // 000111 - ADD REG, INST           <- ADD <- instant nmbr + REG
    // 001000 - ADD RAM, A              <- ADD <- acc + RAM
    // 001001 - ADD REG, A              <- ADD <- acc + REG
    integer ADD_RAM_INST     = 6'b000110;
    integer ADD_REG_INST     = 6'b000111;
    integer ADD_RAM_A        = 6'b001000;
    integer ADD_REG_A        = 6'b001001;
    
    // 001010 - SUB INST, RAM           <- SUB <- RAM from instant nmbr
    // 001011 - SUB INST, REG           <- SUB <- REG from instant nmbr
    // 001100 - SUB A, RAM              <- SUB <- RAM from acc
    // 001101 - SUB A, REG              <- SUB <- REG from acc
    // 001110 - SUB RAM, INST           <- SUB <- instant nmbr from RAM
    // 001111 - SUB RAM, A              <- SUB <- acc from RAM
    // 010000 - SUB REG, INST           <- SUB <- instant nmbr from REG
    // 010001 - SUB REG, A              <- SUB <- acc from REG
    integer SUB_INST_RAM     = 6'b001010;
    integer SUB_INST_REG     = 6'b001011;
    integer SUB_A_RAM        = 6'b001100;
    integer SUB_A_REG        = 6'b001101;
    integer SUB_RAM_INST     = 6'b001110;
    integer SUB_RAM_A        = 6'b001111;
    integer SUB_REG_INST     = 6'b010000;
    integer SUB_REG_A        = 6'b010001;
    
    // 010010 - INC INST                <- INC <- increment instant nmbr
    // 010011 - INC A                   <- INC <- increment acc
    // 010100 - INC REG                 <- INC <- increment REG
    // 010101 - INC RAM                 <- INC <- increment RAM
    integer INC_INST         = 6'b010010;
    integer INC_A            = 6'b010011;
    integer INC_REG          = 6'b010100;
    integer INC_RAM          = 6'b010101;
    
    // 010110 - DEC INST                <- DEC <- decrement instant nmbr
    // 010111 - DEC A                   <- DEC <- decrement acc
    // 011000 - DEC REG                 <- DEC <- decrement REG
    // 011001 - DEC RAM                 <- DEC <- decrement RAM
    integer DEC_INST         = 6'b010110;
    integer DEC_A            = 6'b010111;
    integer DEC_REG          = 6'b011000;
    integer DEC_RAM          = 6'b011001;
    
    // 011010 - CMP_H INST, REG         <- CMP_H <- is instant nmbr higher than REG
    // 011011 - CMP_H INST, RAM         <- CMP_H <- is instant nmbr higher than RAM
    // 011100 - CMP_H A, REG            <- CMP_H <- is acc higher than REG
    // 011101 - CMP_H A, RAM            <- CMP_H <- is acc higher than REG
    // 011110 - CMP_H REG, INST         <- CMP_H <- is REG higher than instant nmbr
    // 011111 - CMP_H REG, A            <- CMP_H <- is REG higher than acc
    // 100000 - CMP_H RAM, INST         <- CMP_H <- is RAM higher than instant nmbr
    // 100001 - CMP_H RAM, A            <- CMP_H <- is RAM higher than acc
    integer CMP_H_INST_REG   = 6'b011010;
    integer CMP_H_INST_RAM   = 6'b011011;
    integer CMP_H_A_REG      = 6'b011100;
    integer CMP_H_A_RAM      = 6'b011101;
    integer CMP_H_REG_INST   = 6'b011110;
    integer CMP_H_REG_A      = 6'b011111;
    integer CMP_H_RAM_INST   = 6'b100000;
    integer CMP_H_RAM_A      = 6'b100001;
              
    // 100010 - CMP_E INST, REG         <- CMP_E <- is instant nmbr equal REG
    // 100011 - CMP_E INST, RAM         <- CMP_E <- is instant nmbr equal RAM
    // 100100 - CMP_E A, REG            <- CPM_E <- is acc equal REG
    // 100101 - CMP_E A, RAM            <- CPM_E <- is acc equal REG
    integer CMP_E_INST_REG   = 6'b100010;
    integer CMP_E_INST_RAM   = 6'b100011;
    integer CMP_E_A_REG      = 6'b100100;
    integer CMP_E_A_RAM      = 6'b100101;
                  
    // 100110 - CMP_L INST, REG         <- CMP_L <- is instant nmbr lower than REG
    // 100111 - CMP_L INST, RAM         <- CMP_L <- is instant nmbr lower than RAM
    // 101000 - CMP_L A, REG            <- CMP_L <- is acc lower than REG
    // 101001 - CMP_L A, RAM            <- CMP_L <- is acc lower than REG
    // 101010 - CMP_L REG, INST         <- CMP_L <- is REG lower than instant nmbr
    // 101011 - CMP_L REG, A            <- CMP_L <- is REG lower than acc
    // 101100 - CMP_L RAM, INST         <- CMP_L <- is RAM lower than instant nmbr
    // 101101 - CMP_L RAM, A            <- CMP_L <- is RAM lower than acc
    integer CMP_L_INST_REG   = 6'b100110;
    integer CMP_L_INST_RAM   = 6'b100111;
    integer CMP_L_A_REG      = 6'b101000;
    integer CMP_L_A_RAM      = 6'b101001;
    integer CMP_L_REG_INST   = 6'b101010;
    integer CMP_L_REG_A      = 6'b101011;
    integer CMP_L_RAM_INST   = 6'b101100;
    integer CMP_L_RAM_A      = 6'b101101;
    
    // 101110 - NOT INST                <- NOT <- negated instant nmbr
    // 101111 - NOT A                   <- NOT <- negated acc
    // 110000 - NOT RAM                 <- NOT <- negated RAM
    // 110001 - NOT REG                 <- NOT <- negated REG
    integer NOT_INST         = 6'b101110;
    integer NOT_A            = 6'b101111;
    integer NOT_RAM          = 6'b110000;
    integer NOT_REG          = 6'b110001;
    
    // 110010 - R_SHIFT INST            <- R_SHIFT <- right shifted instant nmbr
    // 110011 - R_SHIFT A               <- R_SHIFT <- right shifted acc
    // 110100 - R_SHIFT RAM             <- R_SHIFT <- right shifted RAM
    // 110101 - R_SHIFT REG             <- R_SHIFT <- right shifted REG
    integer R_SHIFT_INST     = 6'b110010;
    integer R_SHIFT_A        = 6'b110011;
    integer R_SHIFT_RAM      = 6'b110100;
    integer R_SHIFT_REG      = 6'b110101;
    
    // 110110 - L_SHIFT INST            <- L_SHIFT <- left shifted instant nmbr 
    // 110111 - L_SHIFT A               <- L_SHIFT <- left shifted acc          
    // 111000 - L_SHIFT RAM             <- L_SHIFT <- left shifted RAM          
    // 111001 - L_SHIFT REG             <- L_SHIFT <- left shifted REG
    integer L_SHIFT_INST     = 6'b110110;
    integer L_SHIFT_A        = 6'b110111;
    integer L_SHIFT_RAM      = 6'b111000;
    integer L_SHIFT_REG      = 6'b111001;        
    
    // 000000 - NOOP                    <- NOOP <- No operation
    integer NOOP             = 6'b000000;
    
    // 111010 - JMP rA                  <- JMP <- jump to 'rA' address in PC_Counter
    integer JMP_rA           = 6'b111010;
    // {JMP_rA, 16'd0, 16'd<address to jump>}
    
    // 111011 - JMP_pathed rA, ra       <- JMP_pathed <- jump to 'rA' address in PC_Counter with return 'ra' address
    integer JMP_rA_ra        = 6'b111011;
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
    