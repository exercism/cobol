       IDENTIFICATION DIVISION.
       PROGRAM-ID. SIEVE.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 FLAGS PIC 9 OCCURS 1000 TIMES.
           88 OK VALUE 1 FALSE 0.
       01 WS-LIMIT PIC 9999.
       01 WS-COUNTER PIC 9999.
       01 WS-INNER-COUNTER PIC 9999.
       01 WS-INNER-START PIC 9999.
       01 WS-RESULT PIC 999 OCCURS 1000 TIMES. 
       01 WS-RESULT-INDEX PIC 9999.
       01 WS-SQRT-LIMIT PIC 9999.
       01 WS-COUNT PIC 9999.
       PROCEDURE DIVISION.
       SIEVE.
           MOVE ZERO TO FLAGS(1).
           PERFORM VARYING WS-COUNTER FROM 2 BY 1 
               UNTIL WS-COUNTER GREATER 1000
                   MOVE 1 TO FLAGS(WS-COUNTER)
           END-PERFORM.
           MOVE FUNCTION SQRT(WS-LIMIT) TO WS-SQRT-LIMIT.
           PERFORM VARYING WS-COUNTER FROM 2 BY 1
             UNTIL WS-COUNTER > WS-SQRT-LIMIT
               IF OK(WS-COUNTER)
                 PERFORM INNER-PART
               END-IF
           END-PERFORM.
           MOVE 1 TO WS-RESULT-INDEX.
           MOVE 0 TO WS-COUNT.
           PERFORM VARYING WS-COUNTER FROM 1 BY 1 
           UNTIL WS-COUNTER > WS-LIMIT
             IF OK(WS-COUNTER) 
               MOVE WS-COUNTER TO WS-RESULT(WS-RESULT-INDEX)
               ADD 1 TO WS-RESULT-INDEX
               ADD 1 TO WS-COUNT
             END-IF
           END-PERFORM.
           EXIT.

       INNER-PART.
           MULTIPLY WS-COUNTER BY WS-COUNTER 
               GIVING WS-INNER-START.
           PERFORM VARYING WS-INNER-COUNTER 
               FROM WS-INNER-START
               BY WS-COUNTER 
               UNTIL WS-INNER-COUNTER > WS-LIMIT
                   MOVE 0 TO FLAGS(WS-INNER-COUNTER)
           END-PERFORM.
