;BINTOHEX:
; arguments: a (hex)
; return: a, b (ASCII)
; destroy: a, b
BINTOHEX:
    tab                     ;a->b, save arg
    anda #$0F                ;first quartet, keep LSQ
    jsr .CONVERT
    psha                    ;save a, now in ASCII
    tba                     ;seconde quartet, keep MSQ
    anda #$F0
    lsra                    ;4-bit shift
    lsra
    lsra
    lsra
    jsr .CONVERT
    tab                     ;final MSQ in ASCII in b
    pula                    ;final LSQ in ASCII in a
    rts
;bin to ASCII
.CONVERT
    cmpa #$09
    bmi +                   ;branch if minus
    adda #$37
    rts
+:  
    adda #$30
    rts
