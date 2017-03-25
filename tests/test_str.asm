;tests str subroutines
; prints "7D" over serial

    CPU 6301
    INCLUDE "hardware.inc"
    
    ORG $FF00
    INCLUDE "debugRoutines.asm"
    INCLUDE "str.asm"
    INCLUDE "serial.asm"
    
INIT:
    lds #$FF
    ldaa #%00000101
    staa RMCR               ;port config : 9600 bauds
    ldaa #%00001010
    staa TRCSR              ;Transmit enable, receive enable
    jsr BEEP

MAIN:
    ldaa #$7D
    jsr BINTOHEX
    jsr BEEP
    jsr BYTE_TX
    tba
    jsr BYTE_TX
    jmp MAIN

    ORG RESETVEC
    ADR INIT
    
    END
