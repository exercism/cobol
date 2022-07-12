      * Sample COBOL program
        IDENTIFICATION DIVISION.
        PROGRAM-ID. hello.
        DATA DIVISION.
        WORKING-STORAGE SECTION.
        01 WS-RESULT PIC X(13).
        PROCEDURE DIVISION.
            GOBACK.
        HELLO-WORLD.
            MOVE "Hello, World!" TO WS-RESULT.

            