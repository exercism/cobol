       IDENTIFICATION DIVISION.
       PROGRAM-ID. ANAGRAM.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       REPOSITORY.
        FUNCTION ALL INTRINSIC.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-SUBJECT PIC X(20).
       01 WS-CANDIDATES-COUNT PIC 9.
       01 WS-CANDIDATES-TABLE.
           02 WS-CANDIDATES OCCURS 1 TO 20
                            DEPENDING ON WS-CANDIDATES-COUNT.
              05 WS-CANDIDATE PIC X(20).
       01 WS-RESULT-LIST PIC X(48).

       01 WS-INDEX PIC 9(3).
       01 WS-CANDIDATE-INDEX PIC 9.
       01 WS-MULT BINARY-LONG.
       01 WS-WORD-CODE BINARY-LONG.
       01 WS-STRING PIC X(20).
       01 WS-STRING-LENGTH PIC 9(2).
       01 WS-SEPARATOR PIC X.
       01 WS-IS-ANAGRAM PIC X.
       01 WS-SUBJECT-CODE BINARY-LONG.
       01 WS-LOWERED-SUBJECT PIC X(20).
       01 WS-LOWERED-CANDIDATE PIC X(20).

       PROCEDURE DIVISION.

       FIND-ANAGRAMS.
        MOVE SPACE TO WS-RESULT-LIST
        MOVE SPACE TO WS-SEPARATOR
        MOVE LOWER-CASE(TRIM(WS-SUBJECT)) TO WS-LOWERED-SUBJECT
        MOVE WS-LOWERED-SUBJECT TO WS-STRING
        PERFORM WORD-PRIMERIZATION
        MOVE WS-WORD-CODE TO WS-SUBJECT-CODE

        PERFORM VARYING WS-CANDIDATE-INDEX FROM 1 BY 1
                UNTIL WS-CANDIDATE-INDEX > WS-CANDIDATES-COUNT
          MOVE LOWER-CASE(TRIM(WS-CANDIDATES(WS-CANDIDATE-INDEX)))
           TO WS-STRING

          PERFORM IS-ANAGRAMS

          IF WS-IS-ANAGRAM = "T"
             STRING
               WS-RESULT-LIST DELIMITED BY SPACE
               WS-SEPARATOR DELIMITED BY SPACE
               WS-CANDIDATES(WS-CANDIDATE-INDEX) DELIMITED BY SPACE
               INTO WS-RESULT-LIST
             END-STRING
             MOVE "," TO WS-SEPARATOR
          END-IF

        END-PERFORM.

       IS-ANAGRAMS.
        MOVE "F" TO WS-IS-ANAGRAM
        PERFORM WORD-PRIMERIZATION
        IF WS-LOWERED-SUBJECT <> WS-STRING
           AND WS-SUBJECT-CODE = WS-WORD-CODE
           MOVE "T" TO WS-IS-ANAGRAM
        END-IF.

       WORD-PRIMERIZATION.
        MOVE 1 TO WS-WORD-CODE
        MOVE 1 TO WS-INDEX
        MOVE LENGTH(WS-STRING) TO WS-STRING-LENGTH

        PERFORM VARYING WS-INDEX FROM 1 BY 1
           UNTIL WS-INDEX > WS-STRING-LENGTH
           EVALUATE WS-STRING(WS-INDEX:1)
           WHEN 'a'
               MOVE 2 TO WS-MULT
               MULTIPLY WS-WORD-CODE BY WS-MULT
               GIVING WS-WORD-CODE
           WHEN 'b'
               MOVE 3 TO WS-MULT
               MULTIPLY WS-WORD-CODE BY WS-MULT
               GIVING WS-WORD-CODE
           WHEN 'c'
               MOVE 5 TO WS-MULT
               MULTIPLY WS-WORD-CODE BY WS-MULT
               GIVING WS-WORD-CODE
           WHEN 'd'
               MOVE 7 TO WS-MULT
               MULTIPLY WS-WORD-CODE BY WS-MULT
               GIVING WS-WORD-CODE
           WHEN 'e'
               MOVE 11 TO WS-MULT
               MULTIPLY WS-WORD-CODE BY WS-MULT
               GIVING WS-WORD-CODE
           WHEN 'f'
               MOVE 13 TO WS-MULT
               MULTIPLY WS-WORD-CODE BY WS-MULT
               GIVING WS-WORD-CODE
           WHEN 'g'
               MOVE 17 TO WS-MULT
               MULTIPLY WS-WORD-CODE BY WS-MULT
               GIVING WS-WORD-CODE
           WHEN 'h'
               MOVE 19 TO WS-MULT
               MULTIPLY WS-WORD-CODE BY WS-MULT
               GIVING WS-WORD-CODE
           WHEN 'i'
               MOVE 23 TO WS-MULT
               MULTIPLY WS-WORD-CODE BY WS-MULT
               GIVING WS-WORD-CODE
           WHEN 'j'
               MOVE 29 TO WS-MULT
               MULTIPLY WS-WORD-CODE BY WS-MULT
               GIVING WS-WORD-CODE
           WHEN 'k'
               MOVE 31 TO WS-MULT
               MULTIPLY WS-WORD-CODE BY WS-MULT
               GIVING WS-WORD-CODE
           WHEN 'l'
               MOVE 37 TO WS-MULT
               MULTIPLY WS-WORD-CODE BY WS-MULT
               GIVING WS-WORD-CODE
           WHEN 'm'
               MOVE 41 TO WS-MULT
               MULTIPLY WS-WORD-CODE BY WS-MULT
               GIVING WS-WORD-CODE
           WHEN 'n'
               MOVE 43 TO WS-MULT
               MULTIPLY WS-WORD-CODE BY WS-MULT
               GIVING WS-WORD-CODE
           WHEN 'o'
               MOVE 47 TO WS-MULT
               MULTIPLY WS-WORD-CODE BY WS-MULT
               GIVING WS-WORD-CODE
           WHEN 'p'
               MOVE 53 TO WS-MULT
               MULTIPLY WS-WORD-CODE BY WS-MULT
               GIVING WS-WORD-CODE
           WHEN 'q'
               MOVE 59 TO WS-MULT
               MULTIPLY WS-WORD-CODE BY WS-MULT
               GIVING WS-WORD-CODE
           WHEN 'r'
               MOVE 61 TO WS-MULT
               MULTIPLY WS-WORD-CODE BY WS-MULT
               GIVING WS-WORD-CODE
           WHEN 's'
               MOVE 67 TO WS-MULT
               MULTIPLY WS-WORD-CODE BY WS-MULT
               GIVING WS-WORD-CODE
           WHEN 't'
               MOVE 71 TO WS-MULT
               MULTIPLY WS-WORD-CODE BY WS-MULT
               GIVING WS-WORD-CODE
           WHEN 'u'
               MOVE 73 TO WS-MULT
               MULTIPLY WS-WORD-CODE BY WS-MULT
               GIVING WS-WORD-CODE
           WHEN 'v'
               MOVE 79 TO WS-MULT
               MULTIPLY WS-WORD-CODE BY WS-MULT
               GIVING WS-WORD-CODE
           WHEN 'w'
               MOVE 83 TO WS-MULT
               MULTIPLY WS-WORD-CODE BY WS-MULT
               GIVING WS-WORD-CODE
           WHEN 'x'
               MOVE 89 TO WS-MULT
               MULTIPLY WS-WORD-CODE BY WS-MULT
               GIVING WS-WORD-CODE
           WHEN 'y'
               MOVE 97 TO WS-MULT
               MULTIPLY WS-WORD-CODE BY WS-MULT
               GIVING WS-WORD-CODE
           WHEN 'z'
               MOVE 101 TO WS-MULT
               MULTIPLY WS-WORD-CODE BY WS-MULT
               GIVING WS-WORD-CODE
        END-PERFORM.
