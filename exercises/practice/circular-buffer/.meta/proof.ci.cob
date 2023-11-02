       IDENTIFICATION DIVISION.
       PROGRAM-ID. CIRCULAR-BUFFER.
       AUTHOR. kapitaali.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-CAPACITY              PIC 999.
       01 WS-ITEM                  PIC 9.
       01 WS-RESULT                PIC 9.
       01 WS-SUCCESS               PIC 9.
       01 BUF-END                  PIC 999.
       01 OCCUPIED                 PIC 999.
       01 BUFFER                   PIC X(60).

       PROCEDURE DIVISION.

       CREATE-BUFFER.
           MOVE 0 TO OCCUPIED.
           MOVE SPACES TO BUFFER.
           MOVE 1 TO WS-SUCCESS.
           MOVE 1 TO BUF-END.


       READ-BUFFER.
           IF OCCUPIED > 0
                 MOVE BUFFER(1:1) TO WS-RESULT
                 MOVE BUFFER(2:OCCUPIED) TO BUFFER
                 MOVE SPACE TO BUFFER(BUF-END:1)
                 SUBTRACT 1 FROM OCCUPIED
                 SUBTRACT 1 FROM BUF-END
                 MOVE 1 TO WS-SUCCESS
           ELSE
                 MOVE 0 TO WS-SUCCESS
           END-IF.


       WRITE-BUFFER.
           IF OCCUPIED < WS-CAPACITY
               MOVE WS-ITEM TO BUFFER(BUF-END:1)
               MOVE 1 TO WS-SUCCESS
               ADD 1 TO BUF-END                   
               ADD 1 TO OCCUPIED
           ELSE
               MOVE 0 TO WS-SUCCESS
           END-IF.


       OVERWRITE-BUFFER.
           IF OCCUPIED = WS-CAPACITY
               MOVE BUFFER(2:OCCUPIED) TO BUFFER
               MOVE WS-ITEM TO BUFFER(WS-CAPACITY:1)
               MOVE 1 TO WS-SUCCESS
           ELSE
               MOVE WS-ITEM TO BUFFER(BUF-END:1)
               ADD 1 TO OCCUPIED 
               ADD 1 TO BUF-END
               MOVE 1 TO WS-SUCCESS           
           END-IF.


       CLEAR-BUFFER.
           PERFORM CREATE-BUFFER.
