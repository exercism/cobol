       IDENTIFICATION DIVISION.
       PROGRAM-ID. LARGEST-SERIES-PRODUCT.
       AUTHOR. kapitaali.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-INPUTVARS.
           05 WS-SPAN              PIC S999.
           05 WS-DIGITS            PIC X(60).
       01 WS-OUTPUTVARS.
           05 WS-RESULT            PIC 9(9).
           05 WS-ERROR             PIC X(40).

       01 MY-WORKVARS.
           05 X                    PIC 9.
           05 A                    PIC 9999.
           05 B                    PIC 9(9).
           05 D                    PIC 9999.
           05 C-LEN                PIC 9999.
           05 STR                  PIC 9(9).

       PROCEDURE DIVISION.


       CHECK-FOR-CHARS.
           IF WS-DIGITS IS NOT NUMERIC 
              MOVE "digits input must only contain digits" TO WS-ERROR
              EXIT PROGRAM 
           END-IF.


       COUNT-PRODUCT.
           MOVE 0 TO WS-RESULT. 
           COMPUTE C-LEN = C-LEN - WS-SPAN + 1.
           PERFORM VARYING A FROM 1 BY 1 UNTIL A > C-LEN
              MOVE FUNCTION NUMVAL(WS-DIGITS(A:WS-SPAN)) TO STR
              MOVE FUNCTION REVERSE(STR) TO STR
              MOVE 1 TO B
              PERFORM VARYING D FROM 1 BY 1 UNTIL D > WS-SPAN
                 MOVE STR(D:1) TO X
                 COMPUTE B = B * X
              END-PERFORM
              IF B > WS-RESULT 
                 MOVE B TO WS-RESULT 
              END-IF
           END-PERFORM.


       LARGEST-PRODUCT.
           PERFORM CHECK-FOR-CHARS.
           MOVE FUNCTION LENGTH(FUNCTION TRIM(WS-DIGITS TRAILING)) 
              TO C-LEN.
           MOVE 1 TO WS-RESULT. 
           EVALUATE WS-SPAN   
              WHEN > C-LEN
                 MOVE "span must be smaller than string length" 
                    TO WS-ERROR
              WHEN < 0
                 MOVE "span must not be negative" TO WS-ERROR
              WHEN 0 
                 MOVE 1 TO WS-RESULT
              WHEN = C-LEN
                 MOVE 1 TO B
                 MOVE FUNCTION NUMVAL(WS-DIGITS) TO STR
                 MOVE FUNCTION REVERSE(STR) TO STR
                 PERFORM VARYING D FROM 1 BY 1 UNTIL D > WS-SPAN
                    MOVE STR(D:1) TO X
                    COMPUTE B = B * X
                 END-PERFORM
                 MOVE B TO WS-RESULT 
              WHEN OTHER
                 PERFORM COUNT-PRODUCT
           END-EVALUATE.
