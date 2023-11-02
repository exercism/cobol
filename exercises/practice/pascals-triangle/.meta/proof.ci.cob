      * this code is totally write only, contains code from the
      * all your base exercise so variable names are the same and
      * pretty much non-descriptive
      *
      * it uses 2 tables to process the values, and there is a 
      * procedure to read numbers from a string to input them to table
      * and another procedure to create the string from tabled values
      *
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PASCALS-TRIANGLE.
       AUTHOR. kapitaali.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-COUNT               PIC 99.       
       01 WS-RESULT. 
         02 WS-ROW               OCCURS 1 TO 99 DEPENDING ON WS-COUNT.
            05 ROWELEM           PIC X(60).

       01 WS-INPUTBASE             PIC S999.
       01 WS-OUTPUTBASE            PIC S999.
       01 WS-DIGITS                PIC X(60).
       01 WS-RESULT2               PIC X(60).
       01 WS-ERROR                 PIC X(60).
       01 N                        PIC 9(12) VALUE ZEROES.
       01 NUM                      PIC 9(12) VALUE ZEROES.
       01 NUM3                     PIC 9(12) VALUE ZEROES.
       01 NUM2                     PIC ZZ9 VALUE ZEROES.
       01 EXP                      PIC 999 VALUE ZEROES.
       01 IDX                      PIC 999.
       01 IDX2                     PIC 999.                                     
       01 LEN                      PIC 999.
       01 COUNTER                  PIC 999.

       01 Teibel. 
         02 Taulukko PIC 999 OCCURS 1 TO 20
            DEPENDING ON IDX.        

       01 Teibel2. 
         02 Taulukko2 PIC 999 OCCURS 1 TO 20
            DEPENDING ON IDX2.        

       PROCEDURE DIVISION.

       ROWS.
           MOVE WS-COUNT TO IDX. 
           INITIALIZE WS-RESULT.
           INITIALIZE Teibel.
           IF WS-COUNT = 0
               MOVE SPACES TO WS-ROW(1)
           ELSE IF WS-COUNT = 1
               MOVE "1" TO WS-ROW(1)
           ELSE IF WS-COUNT = 2
               MOVE "1" TO WS-ROW(1)
               MOVE "1,1" TO WS-ROW(2)               
           ELSE 
               MOVE "1" TO WS-ROW(1)
               MOVE "1,1" TO WS-ROW(2)
               PERFORM VARYING N FROM 3 BY 1 UNTIL N > WS-COUNT
                   SUBTRACT 1 FROM N GIVING COUNTER
                   MOVE WS-ROW(COUNTER) TO WS-DIGITS
                   PERFORM MOVE-TO-TABLE
                   PERFORM COMPUTE-NEW-ROW
                   PERFORM MOVE-TO-RESULT-STRING
                   MOVE WS-RESULT2 TO WS-ROW(N)
                   ADD 1 TO IDX
               END-PERFORM
           END-IF.

      * Teibel is previous row, 
      * Teibel2 is the new row to be computed from Teibel
       COMPUTE-NEW-ROW.
           SUBTRACT 1 FROM IDX GIVING NUM3.
           ADD 1 TO IDX GIVING IDX2.
           INITIALIZE Teibel2.
           MOVE 1 TO Taulukko2(1).
           PERFORM VARYING EXP FROM 2 BY 1 UNTIL EXP = IDX
               SUBTRACT 1 FROM EXP GIVING NUM
               COMPUTE NUM2 = Taulukko(EXP) + Taulukko(NUM)
               MOVE NUM2 TO Taulukko2(EXP)
           END-PERFORM.
           MOVE 1 TO Taulukko2(IDX).

      
      * moves from WS-DIGITS to Teibel 
       MOVE-TO-TABLE.
           PERFORM STR-LENGTH.
           INITIALIZE Teibel.
           MOVE 3 TO EXP. 
           MOVE 1 TO IDX
           MOVE ZEROES TO NUM2.
           PERFORM VARYING COUNTER FROM LEN BY -1 UNTIL COUNTER = 0
               IF WS-DIGITS(COUNTER:1) = ','
                   MOVE 3 TO EXP
                   MOVE NUM2 TO Taulukko(IDX)
                   MOVE ZEROES TO NUM2
                   ADD 1 TO IDX
               ELSE IF COUNTER = 1
                   MOVE WS-DIGITS(COUNTER:1) TO NUM2(EXP:1)
                   MOVE NUM2 TO Taulukko(IDX)
                   ADD 1 TO IDX
               ELSE 
                   MOVE WS-DIGITS(COUNTER:1) TO NUM2(EXP:1)
                   SUBTRACT 1 FROM EXP
               END-IF
           END-PERFORM.


      * compute string length starting from end by ignoring spaces
       STR-LENGTH.
           MOVE 0 TO LEN.
           PERFORM VARYING IDX FROM FUNCTION LENGTH(WS-DIGITS)
                   BY -1 UNTIL WS-DIGITS(IDX:1) <> " "
               ADD 1 TO LEN
           END-PERFORM.
           COMPUTE LEN = FUNCTION LENGTH(WS-DIGITS) - LEN.


      * create a string from Teibel elements to WS-RESULT2
       MOVE-TO-RESULT-STRING.
           MOVE SPACES TO WS-RESULT2.
           MOVE 1 TO COUNTER.
           SUBTRACT 1 FROM IDX
           PERFORM VARYING EXP FROM IDX BY -1 UNTIL EXP = 0
                 MOVE Taulukko2(EXP) TO NUM2
                 MOVE NUM2 TO NUM3
                 IF NUM3 IS GREATER THAN OR EQUAL TO 100 
                      MOVE NUM2(1:3) TO WS-RESULT2(COUNTER:3)
                      ADD 3 TO COUNTER
                      MOVE "," TO WS-RESULT2(COUNTER:1)
                      ADD 1 TO COUNTER
                 ELSE IF NUM3 IS GREATER THAN OR EQUAL TO 10
                      MOVE NUM2(2:2) TO WS-RESULT2(COUNTER:2)
                      ADD 2 TO COUNTER
                      MOVE "," TO WS-RESULT2(COUNTER:1)
                      ADD 1 TO COUNTER
                 ELSE IF NUM3 = 0                     
                      MOVE '0' TO WS-RESULT2(COUNTER:1)
                      ADD 1 TO COUNTER
                      MOVE "," TO WS-RESULT2(COUNTER:1)
                      ADD 1 TO COUNTER
                 ELSE 
                      MOVE NUM2(3:1) TO WS-RESULT2(COUNTER:1)
                      ADD 1 TO COUNTER
                      MOVE "," TO WS-RESULT2(COUNTER:1)
                      ADD 1 TO COUNTER
                 END-IF
           END-PERFORM.
           MOVE WS-RESULT2(1:30) TO WS-RESULT2(3:30).           
           MOVE "1," TO WS-RESULT2(1:2).
           MOVE WS-RESULT2 TO WS-DIGITS.
           PERFORM STR-LENGTH.
           MOVE SPACE TO WS-RESULT2(LEN:1).
