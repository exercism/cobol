       IDENTIFICATION DIVISION.
       PROGRAM-ID. ELIUDS-EGGS.
       AUTHOR. kapitaali.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-INPUTVARS.
           05 WS-INPUT             PIC 9(10).
       01 WS-OUTPUTVARS.
           05 WS-RESULT            PIC 9999.
       
       01 MY-WORKVARS.
           05 REMAIN               PIC 9.

       PROCEDURE DIVISION.

       EGG-COUNT.
           MOVE ZERO TO WS-RESULT.
           PERFORM UNTIL WS-INPUT = 0
              DIVIDE WS-INPUT BY 2 GIVING WS-INPUT REMAINDER REMAIN
              IF REMAIN = 1
                 ADD 1 TO WS-RESULT
              END-IF
           END-PERFORM.
