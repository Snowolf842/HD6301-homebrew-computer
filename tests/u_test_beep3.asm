    CPU 6301
    
    INCLUDE "hardware.inc"
    
    ORG $FF00
    INCLUDE "debugRoutines.asm"
    
    
    ORG RAM
MAIN:
    jsr BEEP
    jsr BEEP.WAIT
    bra MAIN


