       IDENTIFICATION DIVISION.
       PROGRAM-ID. luhn.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       REPOSITORY. FUNCTION ALL INTRINSIC.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-CARD-NUMBER PIC X(32).
       01 WS-CARD-DIGITS PIC 9(32).
       01 WS-CHECKSUM PIC 9(2).
       01 WS-VALID PIC X(5).
       
       PROCEDURE DIVISION.
       LUHN.

