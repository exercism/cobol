       IDENTIFICATION DIVISION.
       PROGRAM-ID. MATCHING-BRACKETS.
       AUTHOR. kapitaali.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-INPUT                 PIC X(100).
       01 BUFFER                   PIC X(100) VALUE SPACES.
       01 WS-RESULT                PIC 9.
       01 COUNTER                  PIC 999.
       01 CHAR                     PIC X.
       01 LEN                      PIC 999.
       01 IDX                      PIC 999.
       01 J                        PIC 999.
       01 CHAR-TO-CHECK            PIC X.

       PROCEDURE DIVISION.

       ISPAIRED.
           MOVE 0 TO COUNTER.
           PERFORM STR-LENGTH.
           PERFORM VARYING IDX FROM 1 BY 1 UNTIL IDX = LEN
               MOVE WS-INPUT(IDX:1) TO CHAR
               EVALUATE CHAR
               WHEN '{'
                   ADD 1 TO COUNTER
                   MOVE CHAR TO BUFFER(COUNTER:1)
               WHEN '('
                   ADD 1 TO COUNTER
                   MOVE CHAR TO BUFFER(COUNTER:1)
               WHEN '['
                   ADD 1 TO COUNTER
                   MOVE CHAR TO BUFFER(COUNTER:1)
               WHEN ')'
                   IF COUNTER > 0
                        MOVE '(' TO CHAR-TO-CHECK
                        PERFORM CHECK-AND-REMOVE-CHAR
                   ELSE
                        ADD 1 TO COUNTER
                        MOVE CHAR TO BUFFER(COUNTER:1)         
                   END-IF
               WHEN '}'
                   IF COUNTER > 0
                        MOVE '{' TO CHAR-TO-CHECK
                        PERFORM CHECK-AND-REMOVE-CHAR
                   ELSE
                        ADD 1 TO COUNTER
                        MOVE CHAR TO BUFFER(COUNTER:1)         
                   END-IF
               WHEN ']'
                   IF COUNTER > 0
                        MOVE '[' TO CHAR-TO-CHECK
                        PERFORM CHECK-AND-REMOVE-CHAR
                   ELSE
                        ADD 1 TO COUNTER
                        MOVE CHAR TO BUFFER(COUNTER:1)         
                   END-IF
               WHEN OTHER
                   CONTINUE
               END-EVALUATE
           END-PERFORM.
           IF COUNTER = 0
               MOVE 1 TO WS-RESULT
           ELSE
               MOVE 0 TO WS-RESULT
           END-IF.


        CHECK-AND-REMOVE-CHAR.   
           ADD 1 TO COUNTER GIVING J.                                           
           IF BUFFER(COUNTER:1) = CHAR-TO-CHECK
              MOVE BUFFER(J:50) TO BUFFER(COUNTER:50)
              SUBTRACT 1 FROM COUNTER
           ELSE
              ADD 1 TO COUNTER
              MOVE CHAR TO BUFFER(COUNTER:1)                       
           END-IF.


       STR-LENGTH.
           MOVE 0 TO LEN.
           PERFORM VARYING IDX FROM FUNCTION LENGTH(WS-INPUT)
                   BY -1 UNTIL WS-INPUT(IDX:1) <> " "
               ADD 1 TO LEN
           END-PERFORM.
           COMPUTE LEN = FUNCTION LENGTH(WS-INPUT) - LEN + 1.

