       IDENTIFICATION DIVISION.
       PROGRAM-ID. ALL-YOUR-BASE.
       AUTHOR. kapitaali.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * these variable names are somewhat non-descriptive, sry 
       01 WS-INPUTBASE             PIC S999.
       01 WS-OUTPUTBASE            PIC S999.
       01 WS-DIGITS                PIC X(60).
       01 WS-RESULT                PIC X(60).
       01 WS-ERROR                 PIC X(60).
       01 NUM                      PIC 9(12) VALUE ZEROES.
       01 NUM3                     PIC 9(12) VALUE ZEROES.
       01 NUM2                     PIC ZZ9 VALUE ZEROES.
       01 EXP                      PIC 999 VALUE ZEROES.
       01 IDX                      PIC 999.
       01 LEN                      PIC 999.
       01 COUNTER                  PIC 999.

       01 Teibel. 
         02 Taulukko PIC 999 OCCURS 1 TO 10
            DEPENDING ON IDX.        

 
       PROCEDURE DIVISION.
      * the main procedure 
       REBASE.
      * first move numbers from input string to table
           PERFORM MOVE-TO-TABLE.
      * compute number in base 10
           PERFORM BASE10.
           MOVE 0 TO NUM3.
      * check for errors
           IF WS-INPUTBASE < 2
               MOVE "input base must be >= 2" TO WS-ERROR
               GOBACK
           ELSE IF WS-OUTPUTBASE < 2 
               MOVE "output base must be >= 2" TO WS-ERROR
               GOBACK               
           END-IF.
           PERFORM VARYING COUNTER FROM 1 BY 1 UNTIL COUNTER = IDX
               IF Taulukko(COUNTER) IS GREATER 
                 THAN OR EQUAL TO WS-INPUTBASE
                   MOVE "all digits must satisfy 0 <= d < input base"
                    TO WS-ERROR
                   GOBACK
               ELSE IF Taulukko(COUNTER) < 0
                   MOVE "all digits must satisfy 0 <= d < input base"
                    TO WS-ERROR
                   GOBACK
               END-IF
               COMPUTE NUM3 = NUM3 + Taulukko(COUNTER)
           END-PERFORM.
           IF NUM3 = 0
               MOVE 0 TO WS-RESULT
               GOBACK
           END-IF.   
           MOVE SPACES TO WS-DIGITS.
           MOVE 1 TO IDX.
      * compute the number in new base to table
           PERFORM UNTIL NUM = 0
                 COMPUTE EXP = NUM / WS-OUTPUTBASE
                 COMPUTE NUM2 = FUNCTION MOD(NUM, WS-OUTPUTBASE)
                 MOVE NUM2 TO Taulukko(IDX)
                 ADD 1 TO IDX  
                 MOVE EXP TO NUM
           END-PERFORM.
      * format answer string from table to string
           PERFORM RESULT-STRING.
      

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


       BASE10.
           MOVE ZEROES TO NUM.
           PERFORM VARYING COUNTER FROM 1 BY 1 UNTIL COUNTER = IDX
               COMPUTE NUM = NUM + 
                   Taulukko(COUNTER) * WS-INPUTBASE ** (COUNTER - 1)
           END-PERFORM.           


       RESULT-STRING.
           MOVE SPACES TO WS-RESULT.
           MOVE 1 TO COUNTER.
           SUBTRACT 1 FROM IDX
           PERFORM VARYING EXP FROM IDX BY -1 UNTIL EXP = 0
                 MOVE Taulukko(EXP) TO NUM2
                 MOVE NUM2 TO NUM3
                 IF NUM3 IS GREATER THAN OR EQUAL TO 100 
                      MOVE NUM2(1:3) TO WS-RESULT(COUNTER:3)
                      ADD 3 TO COUNTER
                      MOVE "," TO WS-RESULT(COUNTER:1)
                      ADD 1 TO COUNTER
                 ELSE IF NUM3 IS GREATER THAN OR EQUAL TO 10
                      MOVE NUM2(2:2) TO WS-RESULT(COUNTER:2)
                      ADD 2 TO COUNTER
                      MOVE "," TO WS-RESULT(COUNTER:1)
                      ADD 1 TO COUNTER
                 ELSE IF NUM3 = 0                     
                      MOVE '0' TO WS-RESULT(COUNTER:1)
                      ADD 1 TO COUNTER
                      MOVE "," TO WS-RESULT(COUNTER:1)
                      ADD 1 TO COUNTER
                 ELSE 
                      MOVE NUM2(3:1) TO WS-RESULT(COUNTER:1)
                      ADD 1 TO COUNTER
                      MOVE "," TO WS-RESULT(COUNTER:1)
                      ADD 1 TO COUNTER
                 END-IF
           END-PERFORM.
           MOVE WS-RESULT TO WS-DIGITS.
           PERFORM STR-LENGTH.
           MOVE SPACES TO WS-RESULT(LEN:1).           

