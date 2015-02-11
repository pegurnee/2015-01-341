;  this is the second sample source
; 
         .ORIG x2000
         LD     R1, A
ENTER    BRz    TARGET    ; this is a comment
         ADD R1, R1, 6
         BR   ENTER
;  
TARGET   ST R1, X
         PUTS 
         HALT
X        .FILL 0xFFFF
Y        .BLKW 3
A        .FILL 0x0001
         .END
