          .ORIG x1000
          LD   R2, A
          LD   R3, B
          ADD  R4, R2, R3
          ST   R4, ANS
          HALT
ANS      .FILL X0000
A        .FILL X0001
B        .FILL X0002
C        .STRINGZ "answer"
D        .BLKW  5
E        .FILL X0003
         .END
