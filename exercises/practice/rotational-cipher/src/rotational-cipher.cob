       IDENTIFICATION DIVISION.
       PROGRAM-ID. rotational-cipher.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-KEY PIC 9(2).
       01 WS-TEXT PIC X(128).
       01 WS-CIPHER PIC X(128).

       PROCEDURE DIVISION.
       ROTATIONAL-CIPHER.

       GOBACK.
       