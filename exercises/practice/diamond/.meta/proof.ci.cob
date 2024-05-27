       IDENTIFICATION DIVISION.
       PROGRAM-ID. DIAMOND.
       AUTHOR. kapitaali.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-INPUTVARS. 
           05 WS-LETTER            PIC X.
           05 WS-ROWS              PIC 99.
       01 WS-OUTPUTTABLE.
           05 WS-TABLEROW  OCCURS 1 TO 60 DEPENDING ON WS-ROWS.
              10 WS-LINE           PIC X(60).

       01 MY-WORKVARS.
           05 CHARS        PIC X(26) VALUE 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.
           05 ALINE        PIC X(60).
           05 MIDDLEPOINT  PIC 99.
           05 A            PIC 99.
           05 B            PIC 99.
           05 C            PIC 99.
           05 D            PIC 99.
           05 COUNTER      PIC 99.
           05 ADD-THIS     PIC S99.


       PROCEDURE DIVISION.

       GET-TABLE-SIZE.
           PERFORM VARYING A FROM 1 BY 1 UNTIL A = 27
              IF CHARS(A:1) = WS-LETTER 
                 EXIT PARAGRAPH 
              END-IF
           END-PERFORM.


       DIAMOND. 
           EVALUATE WS-LETTER
            WHEN 'A'
              MOVE 1 TO WS-ROWS
              INITIALIZE WS-OUTPUTTABLE 
              MOVE 'A' TO WS-TABLEROW(1)
            WHEN 'B'
              MOVE 3 TO WS-ROWS
              INITIALIZE WS-OUTPUTTABLE 
              MOVE " A " TO WS-TABLEROW(1) 
              MOVE "B B" TO WS-TABLEROW(2)
              MOVE " A " TO WS-TABLEROW(3)
            WHEN OTHER
                 PERFORM GET-TABLE-SIZE
                 COMPUTE WS-ROWS = 2 + 2*(A - 2) + 1 
                 COMPUTE MIDDLEPOINT = (WS-ROWS - 1) / 2 
                 INITIALIZE WS-OUTPUTTABLE
                 MOVE SPACES TO ALINE
                 COMPUTE D = MIDDLEPOINT + 1
                 MOVE CHARS(1:1) TO ALINE(D:1)
                 MOVE ALINE TO WS-TABLEROW(1)
                 MOVE ALINE TO WS-TABLEROW(WS-ROWS)
                 MOVE 0 TO COUNTER
                 MOVE 1 TO ADD-THIS
                 PERFORM VARYING A FROM 2 BY 1 UNTIL A = WS-ROWS 
                    MOVE SPACES TO ALINE
                    IF COUNTER = MIDDLEPOINT 
                       MOVE -1 TO ADD-THIS
                    END-IF
                    COMPUTE COUNTER = COUNTER + ADD-THIS 
                    COMPUTE B = MIDDLEPOINT - COUNTER
                    COMPUTE C = COUNTER + 1
                    COMPUTE D = B + 1
                    MOVE CHARS(C:1) TO ALINE(D:1)
                    COMPUTE B = MIDDLEPOINT + COUNTER
                    COMPUTE C = COUNTER + 1
                    COMPUTE D = B + 1
                    MOVE CHARS(C:1) TO ALINE(D:1)
                    MOVE ALINE TO WS-TABLEROW(A)
                 END-PERFORM
           END-EVALUATE.                      

