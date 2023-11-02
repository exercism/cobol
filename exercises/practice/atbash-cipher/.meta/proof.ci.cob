       IDENTIFICATION DIVISION.
       PROGRAM-ID. ATBASH-CIPHER.
       AUTHOR. kapitaali.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-PHRASE                PIC X(60).
       01 WS-RESULT                PIC X(60).
       01 ABC PIC X(36) VALUES "abcdefghijklmnopqrstuvwxyz0123456789".
       01 ZYX PIC X(36) VALUES "zyxwvutsrqponmlkjihgfedcba0123456789".
       01 COUNTER                  PIC 999.
       01 LEN                      PIC 999.
       01 IDX                      PIC 999.
       01 CHAR                     PIC X.
       01 PICKNEXT                 PIC 9.

       PROCEDURE DIVISION.

       ENCODE.
           PERFORM STR-LENGTH.
           MOVE FUNCTION LOWER-CASE(WS-PHRASE) TO WS-PHRASE.
           MOVE 0 TO PICKNEXT.
           MOVE 1 TO IDX.
           MOVE SPACES TO WS-RESULT.
           PERFORM VARYING COUNTER FROM 1 BY 1 UNTIL COUNTER = LEN
               MOVE WS-PHRASE(COUNTER:1) TO CHAR
               EVALUATE CHAR
                   WHEN ","
                     CONTINUE
                   WHEN " "
                     CONTINUE
                   WHEN "."
                     CONTINUE
                   WHEN OTHER
                     IF PICKNEXT = 5
                       MOVE " " TO WS-RESULT(IDX:1)
                       ADD 1 TO IDX
                       MOVE 1 TO PICKNEXT
                       MOVE CHAR TO WS-RESULT(IDX:1)
                       ADD 1 TO IDX
                     ELSE 
                       ADD 1 TO PICKNEXT
                       MOVE CHAR TO WS-RESULT(IDX:1)
                       ADD 1 TO IDX
                     END-IF
               END-EVALUATE
           END-PERFORM.
           INSPECT WS-RESULT CONVERTING ABC TO ZYX.

 
       DECODE. 
           PERFORM STR-LENGTH.
           MOVE FUNCTION LOWER-CASE(WS-PHRASE) TO WS-PHRASE.
           MOVE 1 TO IDX.
           MOVE SPACES TO WS-RESULT.
           PERFORM VARYING COUNTER FROM 1 BY 1 UNTIL COUNTER = LEN
               MOVE WS-PHRASE(COUNTER:1) TO CHAR
               EVALUATE CHAR
                   WHEN ","
                     CONTINUE
                   WHEN " "
                     CONTINUE
                   WHEN "."
                     CONTINUE
                   WHEN OTHER
                       MOVE CHAR TO WS-RESULT(IDX:1)
                       ADD 1 TO IDX
               END-EVALUATE
           END-PERFORM.
           INSPECT WS-RESULT CONVERTING ZYX TO ABC.


       STR-LENGTH.
           MOVE 0 TO LEN.
           PERFORM VARYING COUNTER FROM FUNCTION LENGTH(WS-PHRASE)
                   BY -1 UNTIL WS-PHRASE(COUNTER:1) <> " "
               ADD 1 TO LEN
           END-PERFORM.
           COMPUTE LEN = FUNCTION LENGTH(WS-PHRASE) - LEN + 1.
