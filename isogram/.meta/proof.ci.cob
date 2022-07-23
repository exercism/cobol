        IDENTIFICATION DIVISION.
        PROGRAM-ID. ISOGRAM.
        ENVIRONMENT DIVISION.
        DATA DIVISION.
        WORKING-STORAGE SECTION.
        01 WS-PHRASE PIC X(60).
        01 WS-UPPER-CASE PIC X(26) VALUE 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.
        01 WS-UPPER-ARRAY REDEFINES WS-UPPER-CASE.
          02 WS-UPPER-CHAR PIC X OCCURS 26 TIMES INDEXED BY CHAR-INDEX. 
        01 WS-LOWER-CASE PIC X(26) VALUE 'abcdefghijklmnopqrstuvwxyz'.
        01 WS-MATCH-COUNT PIC 99.
        01 WS-RESULT PIC 99.
        PROCEDURE DIVISION.
        ISOGRAM.
      * Uppercase the sentence
          INSPECT WS-PHRASE
            CONVERTING WS-LOWER-CASE to WS-UPPER-CASE.

      * count each letter in alphabet until more than one       
          MOVE 1 TO WS-RESULT.
          SET CHAR-INDEX TO 0.
          PERFORM VARYING CHAR-INDEX
            FROM 1
            BY 1
            UNTIL CHAR-INDEX > 26
                MOVE 0 TO WS-MATCH-COUNT
                INSPECT WS-PHRASE 
                    TALLYING WS-MATCH-COUNT 
                    FOR ALL WS-UPPER-CHAR(CHAR-INDEX)
                IF WS-MATCH-COUNT > 1
                    MOVE 0 TO WS-RESULT
                    EXIT PERFORM
                END-IF
          END-PERFORM.
