       IDENTIFICATION DIVISION.
       PROGRAM-ID. SECRET-HANDSHAKE.
       AUTHOR. kapitaali.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-INPUT                 PIC 999.
       01 WS-RESULT                PIC X(60).
       01 STR                      PIC X(5) VALUE '00000'.
       01 CC                       PIC 99.

       PROCEDURE DIVISION.

       COMMANDS. 
           MOVE '00000' TO STR.
           MOVE SPACES TO WS-RESULT. 
           IF WS-INPUT = 0
              MOVE SPACES TO WS-RESULT 
              EXIT PARAGRAPH 
           END-IF.
           IF WS-INPUT >= 16
              SUBTRACT 16 FROM WS-INPUT 
              MOVE '1' TO STR(1:1)
           END-IF.
           IF WS-INPUT >= 8
              SUBTRACT 8 FROM WS-INPUT 
              MOVE '1' TO STR(2:1) 
           END-IF.
           IF WS-INPUT >= 4
              SUBTRACT 4 FROM WS-INPUT 
              MOVE '1' TO STR(3:1) 
           END-IF.
           IF WS-INPUT >= 2
              SUBTRACT 2 FROM WS-INPUT 
              MOVE '1' TO STR(4:1) 
           END-IF.
           IF WS-INPUT = 1
              SUBTRACT 1 FROM WS-INPUT 
              MOVE '1' TO STR(5:1)              
           END-IF.
           IF STR(1:1) IS EQUAL TO "0"
              PERFORM NORMAL-ORDER 
           ELSE 
              PERFORM REVERSE-ORDER 
           END-IF.


       NORMAL-ORDER.
           MOVE 1 TO CC.
           IF STR(5:1) = '1'
              MOVE "wink," TO WS-RESULT(CC:5)
              ADD 5 TO CC
           END-IF.
           IF STR(4:1) = '1'
              MOVE "double blink," TO WS-RESULT(CC:13)
              ADD 13 TO CC
           END-IF.
           IF STR(3:1) = '1'
              MOVE "close your eyes," TO WS-RESULT(CC:16)
              ADD 16 TO CC
           END-IF.
           IF STR(2:1) = '1'
              MOVE "jump," TO WS-RESULT(CC:5)
              ADD 5 TO CC
           END-IF.
           SUBTRACT 1 FROM CC.
           MOVE SPACE TO WS-RESULT(CC:1).


       REVERSE-ORDER.
           MOVE 1 TO CC.
           IF STR(2:1) = '1'
              MOVE "jump," TO WS-RESULT(CC:5)
              ADD 5 TO CC
           END-IF.
           IF STR(3:1) = '1'
              MOVE "close your eyes," TO WS-RESULT(CC:16)
              ADD 16 TO CC
           END-IF. 
           IF STR(4:1) = '1'
              MOVE "double blink," TO WS-RESULT(CC:13)
              ADD 13 TO CC
           END-IF.
           IF STR(5:1) = '1'
              MOVE "wink," TO WS-RESULT(CC:5)
              ADD 5 TO CC
           END-IF.
           SUBTRACT 1 FROM CC.
           MOVE SPACE TO WS-RESULT(CC:1).

