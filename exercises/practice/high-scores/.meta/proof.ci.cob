       IDENTIFICATION DIVISION.
       PROGRAM-ID. high-scores.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-PROPERTY       PIC A(20).
       01 WS-SCORES.
           02 SCORES        PIC X(3) OCCURS 20 TIMES
                            INDEXED BY IDX.

       01 WS-RESULT-STRING  PIC X(60).
       01 WS-RESULT-VALUE   PIC 999.

       01 TEMP-TABLE.
           02 TEMP-VALUES OCCURS 20 TIMES.
      *        for sorting, we need a key
               03 TEMP-VALUE PIC X(3).

       PROCEDURE DIVISION.
       HIGH-SCORES.
           EVALUATE WS-PROPERTY
               WHEN "scores"
                   MOVE WS-SCORES TO WS-RESULT-STRING
               WHEN "latest"
                   PERFORM GET-LATEST
               WHEN "personalBest"
                   PERFORM GET-BEST
               WHEN "personalTopThree"
                   PERFORM GET-TOP-THREE
           END-EVALUATE.

       GET-LATEST.
           MOVE 1 TO IDX
           PERFORM WITH TEST BEFORE UNTIL SCORES(IDX) = "   "
               ADD 1 TO IDX
           END-PERFORM
           SUBTRACT 1 FROM IDX
           MOVE SCORES(IDX) TO WS-RESULT-VALUE.

       GET-BEST.
           MOVE ZERO TO WS-RESULT-VALUE.
           PERFORM VARYING IDX FROM 1 BY 1 UNTIL SCORES(IDX) = "   "
               IF SCORES(IDX) > WS-RESULT-VALUE THEN
                   MOVE SCORES(IDX) TO WS-RESULT-VALUE
               END-IF
           END-PERFORM.

       GET-TOP-THREE.
           MOVE SPACES TO WS-RESULT-STRING
           MOVE WS-SCORES TO TEMP-TABLE
           SORT TEMP-VALUES DESCENDING KEY TEMP-VALUE
           STRING 
               TEMP-VALUES(1) TEMP-VALUES(2) TEMP-VALUES(3)
               INTO WS-RESULT-STRING
           END-STRING.
