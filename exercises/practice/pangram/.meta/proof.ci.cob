        IDENTIFICATION DIVISION.
        PROGRAM-ID. PANGRAM.
        ENVIRONMENT DIVISION.
        DATA DIVISION.
        WORKING-STORAGE SECTION.
        01 WS-SENTENCE PIC X(60).
        01 WS-SENTENCE-CHARS REDEFINES WS-SENTENCE.
          02 WS-CHARS PIC X OCCURS 60 TIMES INDEXED 
            BY CHAR-INDEX.
        01 WS-UPPER-CASE PIC X(26) VALUE 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.
        01 WS-LOWER-CASE PIC X(26) VALUE 'abcdefghijklmnopqrstuvwxyz'.
        01 WS-UPPER-ALPHABET PIC X(26).
        01 WS-RESULT PIC 9.
        01 WS-LEN PIC 99 USAGE BINARY.
        01 WS-SENTENCE-LEN PIC 99 USAGE BINARY.
        PROCEDURE DIVISION.
        PANGRAM.
      * Uppercase the sentence
          INSPECT WS-SENTENCE
            CONVERTING WS-LOWER-CASE to WS-UPPER-CASE.

      * Get length of sentence
          MOVE ZEROES TO WS-LEN.
          INSPECT WS-SENTENCE TALLYING WS-LEN
            FOR TRAILING SPACE.
          SUBTRACT WS-LEN 
            FROM LENGTH OF WS-SENTENCE 
            GIVING WS-SENTENCE-LEN.

      * Remove every character in sentence from alphabet       
          MOVE WS-UPPER-CASE TO WS-UPPER-ALPHABET.
          SET CHAR-INDEX TO 0.
          PERFORM VARYING CHAR-INDEX
            FROM 1
            BY 1
            UNTIL CHAR-INDEX > WS-SENTENCE-LEN
                INSPECT WS-UPPER-ALPHABET 
                    REPLACING ALL WS-CHARS(CHAR-INDEX) BY SPACE
          END-PERFORM.
        
      * an empty alphabet means every letter matched
          IF WS-UPPER-ALPHABET = SPACES
            MOVE 1 TO WS-RESULT
          ELSE
            MOVE 0 TO WS-RESULT.
