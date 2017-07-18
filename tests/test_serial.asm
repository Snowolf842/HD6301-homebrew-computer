;tests str subroutines
; echo over serial

    CPU 6301
    INCLUDE "hardware.inc"
    
    ORG RAM
    
BUFFER:     DFS 8
    
    ORG $FF00
    INCLUDE "debugRoutines.asm"
    INCLUDE "serial.asm"

INIT:
    lds #$FF
    ldaa #%00000101
    staa RMCR               ;port config : 9600 bauds
    ldaa #%00001010
    staa TRCSR              ;Transmit enable, receive enable
    jsr BEEP
    
MAIN:
    ;echo
    ;~ jsr BYTE_RX
    ;~ jsr BYTE_TX
    ;block
    ;~ ldab #$08
    ;~ ldx #BUFFER
    ;~ jsr BLK_RX
    ;~ ldab #$08
    ;~ ldx #BUFFER
    ;~ jsr BLK_TX
    ;str rx/tx
    ldx #BUFFER
    jsr STR_RX
    ldx #BUFFER
    jsr STR_TX
    
    jmp MAIN
    
    ORG RESETVEC
    ADR INIT
    
    END
