;
; Third sample source program
;  Count the occurrences of a character in a file (in public domain)
;
;  Initialization
        .ORIG  x1000
         AND    R2, R2, #0
         LD     R3, PTR
         GETC
         LDR    R1, R3, #0
    
;  Test character for end of file
TEST     ADD    R4, R1, #-4     ; EOT is x04
         BRz    OUTPUT
        
; Test character for match. If match, increment count
         NOT    R1, R1
         ADD    R1, R1, R0
         NOT    R1, R1
         BRnp   GETCHAR
         ADD    R2, R2, #1
        
; Get next character
GETCHAR	 ADD    R3, R3, #1
         LDR    R1, R3, #0
         BRnzp  TEST
         
;  output the count
    
OUTPUT   LD R0, ASCII
         ADD  R0, R0, R2
         OUT
         HALT
        
;  Data Area
ASCII   .FILL x0030
PTR     .FILL x4000
        .END   