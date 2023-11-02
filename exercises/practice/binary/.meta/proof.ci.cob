       IDENTIFICATION DIVISION.
       PROGRAM-ID. BINARY.
       AUTHOR. kapitaali.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-BINARY                PIC X(60).
       01 WS-RESULT                PIC 9999.
       01 WS-ERROR                 PIC X(60) VALUE SPACES. 
       01 LEN                      PIC 999.
       01 COUNTER                  PIC 999.
       01 DIGIT                    PIC 9.
       01 EXP                      PIC 999.
       01 NONBIN-ERROR             PIC X(60) VALUE
           "error: a number containing non-binary digits is invalid".
       01 CHAR-ERROR               PIC X(60) VALUE
          "error: a number containing non-binary characters is invalid".

       PROCEDURE DIVISION. 
                          
       DECIMAL.
           MOVE 0 TO WS-RESULT.
           PERFORM STR-LENGTH.
           PERFORM CHECK-CHARS.
           PERFORM VARYING COUNTER FROM LEN BY -1 UNTIL COUNTER = 0
               SUBTRACT COUNTER FROM LEN GIVING EXP
               MOVE WS-BINARY(COUNTER:1) TO DIGIT
               IF DIGIT > 1    
                   MOVE NONBIN-ERROR TO WS-ERROR
                   NEXT SENTENCE
               ELSE
                   COMPUTE WS-RESULT = WS-RESULT + DIGIT * 2 ** EXP
               END-IF
           END-PERFORM.
            
       STR-LENGTH.
           MOVE 0 TO LEN.
           PERFORM VARYING COUNTER FROM FUNCTION LENGTH(WS-BINARY)
                   BY -1 UNTIL WS-BINARY(COUNTER:1) <> " "
               ADD 1 TO LEN
           END-PERFORM.
           COMPUTE LEN = FUNCTION LENGTH(WS-BINARY) - LEN.

       CHECK-CHARS.
           PERFORM VARYING COUNTER FROM 1 BY 1 UNTIL COUNTER 
               = FUNCTION LENGTH(WS-BINARY)
               IF WS-BINARY(COUNTER:1) IS NUMERIC 
                   CONTINUE
               ELSE
                   MOVE CHAR-ERROR TO WS-ERROR 
                   NEXT SENTENCE
               END-IF
           END-PERFORM.