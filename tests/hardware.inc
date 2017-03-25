;register addresses

;I/Os
DDR1:       EQU $00
DDR2:       EQU $01
DDR3:       EQU $04
DDR4:       EQU $05

PORT1:      EQU $02
PORT2:      EQU $03
PORT3:      EQU $06
PORT4:      EQU $07


;timer registers
;   Control and status
TCSR:       EQU $08
;   Counter High and Low
CNTH:       EQU $09
CNTL:       EQU $0A
;   Output compare reg High and Low
OCRH:       EQU $0B
OCRL:       EQU $0C
;   Input capture reg
ICRH:       EQU $0D
ICRL:       EQU $0E


;serial port registers
;RMCR = Transfer rate/Mode control Register
;TRCSR = Transmit/Receive Control Status Register
;|  7  |  6    |  5    |  4  |  3  |  2  |  1  |  0  |
;Rxfull|Overrun|Txempty|Rxint|RxEn |Txint|TxEn |Wakeup
;
;RDR = Receive Data Register
;TDR = Transmit Data Register
RMCR:       EQU $10
TRCSR:      EQU $11
RDR:        EQU $12
TDR:        EQU $13

RAM:        EQU $80

;interrupt vectors
RESETVEC:   EQU $FFFE
TRAPVEC:    EQU $FFEE
NMIVEC:     EQU $FFFC
SWIVEC:     EQU $FFFA
IRQVEC:     EQU $FFF8
ICFVEC:     EQU $FFF6
OCFVEC:     EQU $FFF4
TOFVEC:     EQU $FFF2
SCIVEC:     EQU $FFF0
