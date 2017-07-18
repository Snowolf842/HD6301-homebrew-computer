
    CPU 6301
    
    INCLUDE "hardware.inc"
    
    ORG RAM
    
MAIN:
    tsx             ;stack -> x
    xgdx            ;x -> d
    jsr $FF2C       ;send first byte of stack address
    tba
    jsr $FF2C       ;send the second one
    bra MAIN
