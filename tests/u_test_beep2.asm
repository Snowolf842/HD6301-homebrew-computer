
    CPU 6301
    
    INCLUDE "hardware.inc"
    
    ORG RAM
    
MAIN:
    tsx
    xgdx
    jsr BYTE_TX
    tba
    jsr BYTE_TX
    bra MAIN

    ORG $FF00
    INCLUDE "debugRoutines.asm"
    INCLUDE "serial.asm"
