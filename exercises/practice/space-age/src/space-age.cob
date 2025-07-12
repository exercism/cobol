       IDENTIFICATION DIVISION.
       PROGRAM-ID. SPACE-AGE.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-INPUT                 PIC 9(30).
       01 WS-WHICH-PLANET          PIC X(30)
       01 WS-RESULT                PIC 9(4)V99.
       01 WS-ERROR                 PIC X(30).
       
       PROCEDURE DIVISION.
       
       ROUNDS-TO.
