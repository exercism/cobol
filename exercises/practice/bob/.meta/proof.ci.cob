       IDENTIFICATION DIVISION.
       PROGRAM-ID. BOB.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-HEYBOB                PIC X(60).
       01 WS-HEYBOB-ARRAY REDEFINES WS-HEYBOB.
          02 WS-HEYBOB-CHAR        PIC X OCCURS 60 TIMES
                INDEXED BY BOB-INDEX.
             88 UPPERCASE-LETTERS
                  VALUES 'A' THRU 'I'
                         'J' THRU 'R'
                         'S' THRU 'Z'.
             88 LOWERCASE-LETTERS
                  VALUES 'a' THRU 'i'
                         'j' THRU 'r'
                         's' THRU 'z'.
       01 WS-RESULT                PIC X(40).
       01 WS-COUNTERS.
          02 WS-SPACE-COUNTER      PIC 99.
          02 WS-UPPER-COUNTER      PIC 99.
          02 WS-LOWER-COUNTER      PIC 99.
       01 QUESTIONING              PIC X.
          88 IS-QUESTION VALUE "?".
       01 WS-UPPER PIC X(26)
            VALUE 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.
       01 WS-LOWER PIC X(26)
            VALUE 'abcdefghijklmnopqrstuvwxyz'.
       
       PROCEDURE DIVISION.
       BOB.
           MOVE ZEROES TO WS-COUNTERS.
           INSPECT WS-HEYBOB TALLYING WS-SPACE-COUNTER FOR ALL SPACE.
         
           PERFORM VARYING BOB-INDEX
              FROM LENGTH OF WS-HEYBOB
              BY -1
              UNTIL WS-HEYBOB-CHAR(BOB-INDEX) = "?"
              OR WS-HEYBOB-CHAR(BOB-INDEX) NOT = SPACE
                   CONTINUE
           END-PERFORM.
           MOVE WS-HEYBOB-CHAR(BOB-INDEX) TO QUESTIONING.
         
           PERFORM VARYING BOB-INDEX
              FROM 1
              BY 1
              UNTIL BOB-INDEX > LENGTH OF WS-HEYBOB
                   IF UPPERCASE-LETTERS(BOB-INDEX)   
                      ADD 1 TO WS-UPPER-COUNTER
                   END-IF
                   IF LOWERCASE-LETTERS(BOB-INDEX)   
                      ADD 1 TO WS-LOWER-COUNTER
                   END-IF
           END-PERFORM.
      * use evaluate and include where lower and upper counts are zero 

           IF WS-SPACE-COUNTER = LENGTH OF WS-HEYBOB
              MOVE "Fine. Be that way!" TO WS-RESULT
           ELSE
              EVALUATE TRUE ALSO TRUE 
              WHEN WS-UPPER-COUNTER = 0 ALSO WS-LOWER-COUNTER > 0
                   IF IS-QUESTION
                      MOVE "Sure." TO WS-RESULT
                   ELSE
                      MOVE "Whatever." TO WS-RESULT
                   END-IF
              WHEN WS-UPPER-COUNTER = 0 ALSO WS-LOWER-COUNTER = 0
                   IF IS-QUESTION
                      MOVE "Sure." TO WS-RESULT
                   ELSE
                      MOVE "Whatever." TO WS-RESULT
                   END-IF
              WHEN WS-UPPER-COUNTER > 0 ALSO WS-LOWER-COUNTER = 0
                   IF IS-QUESTION 
                      MOVE "Calm down, I know what I'm doing!" TO
                         WS-RESULT
                   ELSE
                      MOVE "Whoa, chill out!" TO WS-RESULT
                   END-IF 
              WHEN WS-UPPER-COUNTER > 0 ALSO WS-LOWER-COUNTER > 0
                   IF IS-QUESTION
                      MOVE "Sure." TO WS-RESULT
                   ELSE
                      MOVE "Whatever." TO WS-RESULT
                   END-IF
              END-EVALUATE
           END-IF.