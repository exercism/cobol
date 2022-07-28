       IDENTIFICATION DIVISION.
       PROGRAM-ID. nucleotide-count.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       REPOSITORY. FUNCTION ALL INTRINSIC.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-DNA PIC X(128).
       01 WS-INDEX PIC 9(8).
       01 WS-ERROR PIC X(32).
       01 WS-A PIC 9(4).
       01 WS-C PIC 9(4).
       01 WS-G PIC 9(4).
       01 WS-T PIC 9(4).

       PROCEDURE DIVISION.
       NUCLEOTIDE-COUNT.

       PERFORM VARYING WS-INDEX FROM 1 BY 1 
           UNTIL WS-INDEX > LENGTH(TRIM(WS-DNA))
           
           EVALUATE WS-DNA (WS-INDEX:1)
           WHEN "A"
               ADD 1 TO WS-A
           WHEN "C"
               ADD 1 TO WS-C
           WHEN "G"
               ADD 1 TO WS-G
           WHEN "T"
               ADD 1 TO WS-T
           WHEN OTHER
               MOVE "ERROR: Invalid nucleotide in strand" 
               TO WS-ERROR
           END-EVALUATE
       END-PERFORM.

       DISPLAY "A: " WS-A.
       DISPLAY "C: " WS-C.
       DISPLAY "G: " WS-G.
       DISPLAY "T: " WS-T.
       DISPLAY WS-ERROR.
