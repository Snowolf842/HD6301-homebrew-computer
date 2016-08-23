; This program flips Port 2 I/O 3 state at 250Hz
;  +--2ms--+       +--2ms--+       +--
;  |       |       |       |       |
;  |       |       |       |       |
;          +--2ms--+       +--2ms--+
; T = 0.004s => f = 1/T = 250Hz


    CPU 6301
    ORG $FF00               ;I use a virtually 256 bytes eeprom for testing

    lds #$FF                ;init stack to top RAM
    ldaa #$FF               
    staa $01                ;init data direction reg: bit3 = 1
    
LOOP:
    ldab #%00001000
    stab $03                ;Store %00001000 in data register (Pin 2.3 is HIGH)
    jsr WAIT
    ldab #%00000000         ;Store %00000000 in data register (Pin 2.3 is LOW)
    stab $03
    jsr WAIT
    jmp LOOP

; Waits 0.002s
WAIT:
    ldaa #$FF
-:
    cmpa #$0
    beq +
    deca
    jmp -
+:
    rts
 
    END
