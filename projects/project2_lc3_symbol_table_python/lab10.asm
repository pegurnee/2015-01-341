; Lab 10 - Assembly Language Rotation with Input/Output and number validation
; @author Eddie Gurnee
; @version 11/26/2013

.orig x3000
  ;R0 = used to read in characters from the CONSOLE with GETC and to print from the address with PUTS
  ;R7 = used with the RET aspect of subroutines
START LD R3, ORIGINAL ;load data at ORIGINAL to R3 (data edit)

LEA R0, PROMPT  ;
PUTS      ;

GETC      ;
JSR VALIDATE_DIGIT  ;
ADD R1, R1, 0 ;
BRz CHECK1

AND R0, R0, 0   ;clears R0
ADD R0, R0, xA    ;adds 10 to R7 (the decimal value for new line)
OUT         ;prints a new line
LEA R0, OUT_nan   ;
PUTS        ;
BR RESTART

CHECK1 OUT       ;
ADD R1, R0, 0 ;
JSR TIMES_TEN ;

GETC      ;
JSR VALIDATE_DIGIT  ;
ADD R1, R1, 0 ;
BRz CHECK2

AND R0, R0, 0   ;clears R0
ADD R0, R0, xA    ;adds 10 to R7 (the decimal value for new line)
OUT         ;prints a new line
LEA R0, OUT_nan   ;
PUTS        ;
BR RESTART


CHECK2 OUT       ;
ADD R1, R0, 0 ;
AND R1, R1, xF  ;
ADD R2, R2, R1  ;

JSR VALIDATE    ;

AND R0, R0, 0   ;clears R0
ADD R0, R0, xA    ;adds 10 to R7 (the decimal value for new line)
OUT         ;prints a new line

ADD R2, R2, 0   ;
BRzp VALID      ;
LEA R0, OUT_invalid ;
PUTS        ;

RESTART AND R0, R0, 0   ;clears R0
ADD R0, R0, xA    ;adds 10 to R7 (the decimal value for new line)
OUT         ;prints a new line

AND R0, R0, 0   ;clears R0
AND R1, R0, 0   ;clears R1
AND R2, R0, 0   ;clears R2
AND R3, R0, 0   ;clears R3
AND R4, R0, 0   ;clears R4
AND R5, R0, 0   ;clears R5
AND R6, R0, 0   ;clears R6
AND R7, R0, 0   ;clears R7
BR START      ;

VALID JSR ROTATELEFT    ;

LEA R0, OUT_orig  ;
PUTS        ;
LD R1, ORIGINAL   ;
LEA R2, BITPATTERN  ;
JSR STORE_BITS    ;
LEA R0, BITPATTERN  ;
PUTS        ;

AND R0, R0, 0   ;clears R0
ADD R0, R0, xA    ;adds 10 to R7 (the decimal value for new line)
OUT         ;prints a new line

JSR STORE_BITS    ;

LEA R0, OUT_rotated ;
PUTS        ;
LD R1, ROTATED    ;
LEA R2, BITPATTERN  ;
JSR STORE_BITS    ;

LEA R0, BITPATTERN  ;
PUTS        ;

HALT

ORIGINAL .fill xD10B          ;the initial 16-bit pattern to rotate
PROMPT .stringz "AMOUNT [00 - 16]: "  ;prints the prompt to enter a rotate number
OUT_orig .stringz "ORIGINAL: "      ;
OUT_rotated .stringz "ROTATED:  "   ;
ROTATED .blkw 1     ;space set aside to hold the rotated 16 bit pattern
BITPATTERN .blkw 17   ;space set aside in memory to print the original and rotated number
OUT_invalid .stringz "Number out of bounds, try again."
OUT_nan .stringz "That's not a number, try again."

; Subroutine ROTATELEFT
; Used to rotate the bits of a 16 bit pattern to the left a certain number of times
; Pre-condition: R2 contains the number of times the bits will be rotated
;          R3 contains the 16-bit pattern to rotate
; Post-condition: address ROTATED contains the rotated 16-bit pattern, registers remain unchanged
ROTATELEFT ST R7, ROT_saveR7 ;
  ; R1 = holds the rotated 16-bit pattern
  ; R2 = count
  ; R3 = temp rotated amount
  ; R4 = MSB holder
  ; R5 = leading one to AND with the 16-bit pattern
      ST R1, ROT_saveR1 ;
      ST R2, ROT_saveR2 ;
      ST R3, ROT_saveR3 ;
      ST R4, ROT_saveR4 ;
      ST R5, ROT_saveR5 ;

      LD R5, ROT_msb1   ;
      AND R1, R1, 0   ;

  ROT_Start ADD R1, R3, R3  ;
        AND R4, R3, R5  ;
        BRz ROT_Zero  ;
        ADD R1, R1, 1 ;

  ROT_Zero  ADD R3, R3, R3  ;
        ADD R3, R1, 0 ;

        ADD R2, R2, -1  ;
        BRp ROT_Start ;

      ST R1, ROTATED    ;

      LD R1, ROT_saveR1 ;
      LD R2, ROT_saveR2 ;
      LD R3, ROT_saveR3 ;
      LD R4, ROT_saveR4 ;
      LD R5, ROT_saveR5 ;
      LD R7, ROT_saveR7 ;

        RET       ;

  ROT_msb1 .fill x8000  ;

  ROT_saveR7 .blkw 1  ;
  ROT_saveR1 .blkw 1  ;
  ROT_saveR2 .blkw 1  ;
  ROT_saveR3 .blkw 1  ;
  ROT_saveR4 .blkw 1  ;
  ROT_saveR5 .blkw 1  ;

; Subroutine STORE_BITS
; Used to store the individual bits of a 16-bit pattern at addresses in memory
; Pre-condition: R1 contains the 16-bit pattern to store in memory
;        R2 contains the first address of where the pattern is to be stored
; Post-condition: The address (and the 15 sequential addresses) will contain the ASCII values for each bit
STORE_BITS ST R7, BTST_saveR7  ;
  ; R1 = the changing 16-bit pattern
  ; R2 = the target address for each bit
  ; R3 = holds the ASCII value for the number 0 or 1
  ; R4 = msb holder
  ; R5 = the leading 1
  ; R6 = count


    ST R1, BTST_saveR1  ;
    ST R2, BTST_saveR2  ;
    ST R3, BTST_saveR3  ;
    ST R4, BTST_saveR4  ;
    ST R5, BTST_saveR5  ;
    ST R6, BTST_saveR6  ;

    LD R5, BTST_msb1  ;

    AND R6, R6, 0   ; clear R6
    ADD R6, R6, 15    ; sets the count to 16

    BTST_Start AND R4, R5, R1      ;
        BRn BTST_Lead1      ;
          LD R3, BTST_zero  ;
        BR BTST_Print     ;

      BTST_Lead1 LD R3, BTST_one   ;

      BTST_Print STR R3, R2, 0   ;
          ADD R2, R2, 1   ;
          ADD R1, R1, R1    ;
          ADD R6, R6, -1    ;
        BRzp BTST_Start     ;

    LD R1, BTST_saveR1  ;
    LD R2, BTST_saveR2  ;
    LD R3, BTST_saveR3  ;
    LD R4, BTST_saveR4  ;
    LD R5, BTST_saveR5  ;
    LD R6, BTST_saveR6  ;
    LD R7, BTST_saveR7  ;

          RET         ;

  BTST_zero .fill x30   ;
  BTST_one .fill x31    ;
  BTST_msb1 .fill x8000 ;

  BTST_saveR7 .blkw 1 ;
  BTST_saveR1 .blkw 1 ;
  BTST_saveR2 .blkw 1 ;
  BTST_saveR3 .blkw 1 ;
  BTST_saveR4 .blkw 1 ;
  BTST_saveR5 .blkw 1 ;
  BTST_saveR6 .blkw 1 ;

; Subroutine TIMES_TEN
; Used to multiply a decimal number by ten
; Pre-condition: R1 contains the ASCII value of the number to multiply by ten
; Post-condition: R2 will contain the number times ten in base two
TIMES_TEN ST R7, TIM_saveR7 ;
  ; R1 = the ASCII number to multiply
  ; R2 = the multiplied number
  ; R3 = count
    ST R1, TIM_saveR1 ;
    ST R3, TIM_saveR3 ;

    AND R1, R1, xF    ;
    AND R2, R2, 0   ;
    AND R3, R3, 0   ;
    ADD R3, R3, 10    ;

    TIM_Start ADD R2, R1, R2  ;
      ADD R3, R3, -1  ;
      BRp TIM_Start ;

    LD R1, TIM_saveR1 ;
    LD R3, TIM_saveR3 ;
    LD R7, TIM_saveR7 ;

      RET       ;

  TIM_saveR7 .blkw 1  ;
  TIM_saveR1 .blkw 1  ;
  TIM_saveR3 .blkw 1  ;

; Subroutine VALIDATE
; Used to validate a two digit number is between 0 - 16
; Pre-condition: R2 contains the twos-complement number to check
; Post-condition: R2 will contain -1 if the number is invalid
VALIDATE ST R7, VAL_saveR7 ;
  ; R2 = the twos-complement number to validate
    ST R2, VAL_saveR2 ;

    ADD R2, R2, 0   ; if CC negative it is a negative number
    BRn VAL_Bad     ;

    ADD R2, R2, -15   ;
    ADD R2, R2, -2    ; if CC is negative it is between 0 and 16
    BRn VAL_Good    ;

    VAL_Bad AND R2, R2, 0   ;
      ADD R2, R2, -1    ;
      ST R2, VAL_saveR2 ; overwrites the data in R2 to -1

    VAL_Good LD R2, VAL_saveR2 ;
    LD R7, VAL_saveR7 ;
      RET     ;

  VAL_saveR2 .blkw 1  ;
  VAL_saveR7 .blkw 1  ;

; Subroutine VALIDATE_DIGIT
; Used to validate that a number entered
; Pre-condition: R0 contains the ASCII character to check
; Post-condition: R1 will contain 1 if the character is not a number, otherwise it will contain a 0
VALIDATE_DIGIT ST R7, VALD_saveR7  ; stores the PC+1 address (that is in R7) to VAL_saveR7
  ; R0 = the ASCII character to check
  ; R1 = the Post-condition notifier

    ST R0, VALD_saveR0  ;

      AND R1, R1, 0   ; clears R2 to be used for the Post-condition

      ADD R0, R0, -15   ;
      ADD R0, R0, -15   ;
      ADD R0, R0, -15   ;
      ADD R0, R0, -3    ; subtracts 48 to check the first set of characters
      BRn VALD_Invalid  ; if it's negative, jump to invalid

      ADD R0, R0, -10   ; subtracts 10 from the value to set CC
      BRn VALD_End    ; if CC is negative, R0 was a digit from 1-9

    VALD_Invalid ADD R1, R1, 1   ; adds 1 to R5 to set invalid condition

    VALD_End LD R0, VALD_saveR0  ; reloads whatever was in R1
      LD R7, VALD_saveR7  ; reloads the PC+1 address that was in R7

      RET

    VALD_saveR0 .blkw 1   ; sets aside space to save whatever was in R0
    VALD_saveR7 .blkw 1   ; sets aside space to save PC+1 address

.end
