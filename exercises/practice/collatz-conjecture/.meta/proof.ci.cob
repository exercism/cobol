       IDENTIFICATION DIVISION.
       PROGRAM-ID. collatz-conjecture.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-NUMBER PIC S9(8).
       01 WS-STEPS PIC 9(4).
       01 WS-ERROR PIC X(35).

       PROCEDURE DIVISION.
       COLLATZ-CONJECTURE.
       
       PERFORM UNTIL WS-NUMBER EQUAL 1

           IF WS-NUMBER IS LESS THAN 1
              MOVE "Only positive integers are allowed"
              TO WS-ERROR
              EXIT PERFORM
           END-IF

           IF FUNCTION MOD(WS-NUMBER, 2) EQUAL 1
              COMPUTE WS-NUMBER = WS-NUMBER * 3 + 1
           ELSE
              COMPUTE WS-NUMBER = WS-NUMBER / 2
           END-IF
           
           ADD 1 TO WS-STEPS
       END-PERFORM.
       
       DISPLAY WS-STEPS.
       DISPLAY WS-ERROR.
