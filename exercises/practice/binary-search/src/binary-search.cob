       IDENTIFICATION DIVISION.
       PROGRAM-ID. BINARY-SEARCH.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-ITEM                  PIC 9999.
       01 WS-RESULT                PIC 99.
       01 WS-ERROR                 PIC X(40).
       01 WS-COUNT                 PIC 99.       
       01 WS-ARRAY-TABLE. 
         02 WS-ARRAY               OCCURS 1 TO 20 DEPENDING ON WS-COUNT.
            05 ROWELEM             PIC 9(4).       

       PROCEDURE DIVISION.
       
       BINARY-SEARCH. 
