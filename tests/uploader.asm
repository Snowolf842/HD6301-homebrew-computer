;receive from serial and runs a program from RAM 
; /!\ Entry point of the sended program must be the first byte !
; no INCLUDE before the start of the program
; programs must not exceed ~100 bytes !

    CPU 6301
    
    INCLUDE "hardware.inc"
    
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
    jsr BYTE_RX             ;block length
    tab
    ldx #RAM                ;where to upload
    jsr BLK_RX              ;receive code
    jsr RAM                 ;execute code (RTS to terminate)
    jmp MAIN
    
    ORG RESETVEC
    ADR INIT
    
    END
