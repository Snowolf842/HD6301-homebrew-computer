;;;     LOW LEVEL SUBROUTINES   ;;;

;BYTE_TX:
; arguments: a (byte to send)
; returns: none
; destroys: none
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
; note: can be stuck if no data arrives
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
STR_TX:
    psha
    ldaa ,x
    jsr BYTE_TX
    inx
    cmpa #"\n"
    bne STR_TX               ;if not last character, send next character
    pula
    rts


;STR_RX
; arguments: x (pointer to first address of mem location to store str)
; returns: none
; destroys: x
STR_RX:
    psha
    jsr BYTE_RX
    staa ,x
    cmpa #"\n"
    bne STR_RX
    pula
    rts
    

    
;BLK_TX:
; arguments: x (first address), b (block length)
; returns: none
; destroys: b, x
BLK_TX:
    psha
-:
    ldaa ,x
    jsr BYTE_TX
    inx                 ;next byte location 
    decb
    bne -               ;end of block
    pula
    rts

;BLK_RX:
; arguments: x (first store address), b (block length)
; returns: none
; destroys: x, b
BLK_RX:
    psha
-:
    jsr BYTE_RX
    staa ,x          
    inx
    decb
    bne -               ;if length != 0 -> continue
    pula
    rts
