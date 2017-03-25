;;;     LOW LEVEL SUBROUTINES   ;;;

;BYTE_TX:
; arguments: a (byte to send)
; returns: none
; destroys: a
BYTE_TX:
    pshb
-:
    ldab TRCSR
    bitb #$20
    beq -                   ;is transmit data register empty?
    staa TDR                ;send
+:
    pulb
    rts


;BYTE_RX:
; arguments: none
; returns: a (byte received)
; destroys: a
; note: can be stu  ck if no data arrives
BYTE_RX:
    ldaa TRCSR
    bita #$80
    beq BYTE_RX
    ldaa RDR
    rts


;;;     HIGHER LEVEL SUBROUTINES   ;;;
;STR_TX
; arguments: x (first character of LF-terminated (\n) string
; returns: none
; destroys: x
;~ STR_TX:
    ;~ psha
    ;~ ldaa ,x
    ;~ jsr BYTE_TX
    ;~ cmpa #"\n"
    ;~ beq +                    ;if last character, exit
    ;~ inx
    ;~ bra STR_TX               ;send next character
;~ +:
    ;~ pula
    ;~ rts


;~ ;STR_RX
;~ ; arguments: x (pointer to first address of mem location to store str)
;~ ; returns: none
;~ ; destroys: x
;~ STR_RX:
    ;~ psha
    ;~ jsr BYTE_RX
    ;~ staa ,x
    ;~ cmpa #"\n"
    ;~ bne STR_RX
    ;~ pula
    ;~ rts
    
    
;BLK_TX:
; arguments: x (first address), a (block length)
; returns: none
; destroys: a, x
;~ BLK_TX:
    ;~ pshb
    ;~ ldab ,x
    ;~ jsr BYTE_TX
    ;~ deca
    ;~ beq +               ;if length=0 -> leave
    ;~ dex                 ;else -> continue
    ;~ bra BLK_TX
;~ +:
    ;~ pulb
    ;~ rts

;~ ;BLK_RX:
;~ ; arguments: x (first store address), b (block length)
;~ ; returns: none
;~ ; destroys: x, b
;~ BLK_RX:
    ;~ psha
    ;~ jsr BYTE_RX
    ;~ staa ,x
    ;~ decb
    ;~ beq +               ;if length=0 -> leave
    ;~ dex                 ;else -> continue
    ;~ bra BLK_RX
;~ +:
    ;~ pula
    ;~ rts
