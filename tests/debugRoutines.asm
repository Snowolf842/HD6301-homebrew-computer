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
    jmp .LOOP
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
