    CPU 6301
    
    INCLUDE "hardware.inc"
    
    ORG $FF00
    INCLUDE "debugRoutines.asm"
    INCLUDE "serial.asm"
    
    
    ORG RAM
MAIN:
    ldx #$FF00
    ldab #$FF
    jsr BLK_TX
    rts

