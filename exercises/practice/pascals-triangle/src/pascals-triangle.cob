       IDENTIFICATION DIVISION.
       PROGRAM-ID. PASCALS-TRIANGLE.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-COUNT               PIC 99.
       
       01 WS-RESULT. 
         02 WS-ROW               OCCURS 1 TO 99 DEPENDING ON WS-COUNT.
            05 ROWELEM           PIC X(60).
       
       PROCEDURE DIVISION.
       
       ROWS.
        
