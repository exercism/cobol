       IDENTIFICATION DIVISION.
       PROGRAM-ID. acronym.
       AUTHOR. kapitaali.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       FILE SECTION.

       WORKING-STORAGE SECTION.
       01 WS-ACRONYM               PIC X(80).
       01 WS-RESULT                PIC X(20).
       01 LEN                      PIC 99.
       01 PICKNEXT                 PIC 9.
       01 COUNTER                  PIC 99.
       01 IDX                      PIC 99.
       01 CHAR                     PIC X.

       PROCEDURE DIVISION.
       ABBREVIATE.
           PERFORM STR-LENGTH.    
           MOVE 1 TO IDX.
           MOVE SPACES TO WS-RESULT.
           MOVE 1 TO PICKNEXT.      
           PERFORM VARYING COUNTER FROM 1 BY 1 UNTIL COUNTER = LEN 
               MOVE WS-ACRONYM(COUNTER:1) TO CHAR
               EVALUATE CHAR
               WHEN "_"
                   CONTINUE
               WHEN SPACE
                   MOVE 1 TO PICKNEXT
                   CONTINUE
               WHEN "-"
                   MOVE 1 TO PICKNEXT
                   CONTINUE
               WHEN OTHER
                   IF PICKNEXT = 1
                       MOVE FUNCTION UPPER-CASE(CHAR) 
                            TO WS-RESULT(IDX:1)
                       ADD 1 TO IDX
                   END-IF
                   MOVE 0 TO PICKNEXT
           END-PERFORM.
           
       STR-LENGTH.
           MOVE 0 TO LEN.
           MOVE FUNCTION LENGTH(WS-ACRONYM) TO IDX.
           PERFORM VARYING IDX FROM FUNCTION LENGTH(WS-ACRONYM)
                   BY -1 UNTIL WS-ACRONYM(IDX:1) <> " "
               ADD 1 TO LEN
           END-PERFORM.
           COMPUTE LEN = 80 - LEN.
