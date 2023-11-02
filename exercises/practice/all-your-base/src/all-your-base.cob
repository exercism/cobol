       IDENTIFICATION DIVISION.
       PROGRAM-ID. ALL-YOUR-BASE.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-INPUTBASE             PIC 999.
       01 WS-OUTPUTBASE            PIC 999.
       01 WS-DIGITS                PIC X(60).
       01 WS-RESULT                PIC X(60).
       01 WS-ERROR                 PIC X(60).
  
       PROCEDURE DIVISION.
       REBASE.
