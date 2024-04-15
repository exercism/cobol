       IDENTIFICATION DIVISION.
       PROGRAM-ID. BINARY-SEARCH.
       AUTHOR. kapitaali.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-ITEM                  PIC 9999.
       01 WS-RESULT                PIC 9999.
       01 WS-ERROR                 PIC X(40) VALUE SPACES.
       01 WS-ARRAY                 PIC X(60).
       01 L                        PIC 99 VALUE 0.
       01 R                        PIC 99.
       01 M                        PIC 99.
       01 STR                      PIC X(60).
       01 EXP                      PIC 999 VALUE ZEROES.
       01 IDX                      PIC 999.
       01 NUM2                     PIC ZZ9 VALUE ZEROES.
       01 COUNTER                  PIC 999.
       01 LEN                      PIC 999.       

       01 Teibel. 
         02 Taulukko               PIC 999 OCCURS 1 TO 20
                                   DEPENDING ON IDX.        

       PROCEDURE DIVISION.

       STR-LENGTH.
           MOVE 0 TO LEN.
           PERFORM VARYING COUNTER FROM FUNCTION LENGTH(STR)
                   BY -1 UNTIL STR(COUNTER:1) <> " "
               ADD 1 TO LEN
           END-PERFORM.
           COMPUTE LEN = FUNCTION LENGTH(STR) - LEN. 


       REVERSE-TABLE.
           COMPUTE R = FUNCTION INTEGER-PART(IDX / 2).
           PERFORM VARYING COUNTER FROM 1 BY 1 UNTIL COUNTER = R
              COMPUTE L = IDX - COUNTER
              MOVE Taulukko(L) TO NUM2
              MOVE Taulukko(COUNTER) TO Taulukko(L)
              MOVE NUM2 TO Taulukko(COUNTER)
           END-PERFORM.


      * populates the table from input string
       MOVE-TO-TABLE.
           MOVE WS-ARRAY TO STR.
           PERFORM STR-LENGTH.
           MOVE 20 TO IDX.
           INITIALIZE Teibel.
           MOVE 3 TO EXP. 
           MOVE 1 TO IDX
           MOVE ZEROES TO NUM2.
           PERFORM VARYING COUNTER FROM LEN BY -1 UNTIL COUNTER = 0
               IF WS-ARRAY(COUNTER:1) = ','
                   MOVE 3 TO EXP
                   MOVE NUM2 TO Taulukko(IDX)
                   MOVE ZEROES TO NUM2
                   ADD 1 TO IDX
               ELSE IF COUNTER = 1
                   MOVE WS-ARRAY(COUNTER:1) TO NUM2(EXP:1)
                   MOVE NUM2 TO Taulukko(IDX)
                   ADD 1 TO IDX
               ELSE 
                   MOVE WS-ARRAY(COUNTER:1) TO NUM2(EXP:1)
                   SUBTRACT 1 FROM EXP
               END-IF
           END-PERFORM.

      * the actual algorithm
       BINARY-SEARCH. 
           PERFORM MOVE-TO-TABLE.
           IF IDX > 2
              PERFORM REVERSE-TABLE
           END-IF.
           IF L IS LESS THAN 1 OR R IS GREATER THAN IDX 
              MOVE "value not in array" TO WS-ERROR 
              EXIT PARAGRAPH 
           END-IF.
           MOVE 1 TO L. 
           COMPUTE R = IDX - 1.
           PERFORM UNTIL L IS GREATER THAN R
              COMPUTE M = L + R
              COMPUTE M = FUNCTION INTEGER-PART(M / 2)
              IF Taulukko(M) IS LESS THAN WS-ITEM 
                 COMPUTE L = M + 1
              ELSE IF Taulukko(M) IS GREATER THAN WS-ITEM 
                 COMPUTE R = M - 1
              ELSE
                 COMPUTE WS-RESULT = M - 1
                 IF Taulukko(WS-RESULT) = WS-ITEM 
                    EXIT PARAGRAPH
                 ELSE
                    MOVE "value not in array" TO WS-ERROR 
                    EXIT PARAGRAPH 
                 END-IF
              END-IF
           END-PERFORM.
