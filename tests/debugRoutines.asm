;BEEP: flips P2.0 at 1000Hz during 0.2s
; arguments: none
; return: none
; destroy: none
BEEP:
    psha
    pshb
    ldaa #$01               
    staa DDR2               ;init data direction reg: bit0 = 1
    ldaa #$FF
.LOOP:
    ldab #$01
    stab PORT2              ;ON
    jsr .WAIT
    ldab #$00               ;OFF
    stab PORT2
    jsr .WAIT
    deca
    beq .QUIT
    jmp .LOOP               ;/!\ boucle infinie!
.QUIT:
    pulb
    pula
    rts
    
.WAIT:                    ; Waits 0.512ms
    psha
    ldaa #$40
-:
    cmpa #$0
    beq +
    deca
    jmp -
+:
    pula
    rts

;STR_TX
; arguments: x (first character of LF-terminated (\n) string
; return: none
; destroy: a
STR_TX:
    ldaa ,x
-:
    ldab TRCSR
    bitb #$20
    beq -                    ;is transmit data register empty?
    staa TDR
    cmpa #"\n"
    beq +                    ;if last character, exit
    inx
    bra STR_TX               ;send next character
+:
    rts
