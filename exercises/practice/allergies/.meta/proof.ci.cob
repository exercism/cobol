       IDENTIFICATION DIVISION.
       PROGRAM-ID. allergies.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-SCORE       PIC 999.
       01 WS-ITEM        PIC X(12).
       01 WS-RESULT      PIC A.
       01 WS-RESULT-LIST PIC X(108).

       01 ALLERGENS.
           02 ALLERGEN-NAMES.
               03 FILLER    PIC X(24) VALUE "eggs        peanuts".
               03 FILLER    PIC X(24) VALUE "shellfish   strawberries".
               03 FILLER    PIC X(24) VALUE "tomatoes    chocolate".
               03 FILLER    PIC X(24) VALUE "pollen      cats".
           02 FILLER REDEFINES ALLERGEN-NAMES.
               03 ALLERGEN  PIC X(12) OCCURS 8 TIMES
                            INDEXED BY INDEX-1 INDEX-2.

       01 ALLERGEN-VALUE PIC 999.
       01 SHIFTED        PIC 999.
       01 LIST-SEPARATOR PIC X.

       PROCEDURE DIVISION.
       ALLERGIC-TO.
           MOVE "N" TO WS-RESULT
           PERFORM VARYING INDEX-1 FROM 1 BY 1 UNTIL index-1 > 8
               IF ALLERGEN(INDEX-1) EQUAL TO WS-ITEM THEN
                   COMPUTE ALLERGEN-VALUE = 2 ** (INDEX-1 - 1)
                   DIVIDE WS-SCORE BY ALLERGEN-VALUE GIVING SHIFTED
                   IF FUNCTION REM(SHIFTED; 2) EQUAL TO 1 THEN
                       MOVE "Y" TO WS-RESULT
                       EXIT PERFORM
                   END-IF
               END-IF
           END-PERFORM.

       LIST-ALLERGENS.
           MOVE SPACES TO WS-RESULT-LIST
           MOVE SPACE TO LIST-SEPARATOR
           PERFORM VARYING INDEX-2 FROM 1 BY 1 UNTIL index-2 > 8
               MOVE ALLERGEN(INDEX-2) TO WS-ITEM
               PERFORM ALLERGIC-TO
               IF WS-RESULT EQUAL TO "Y" THEN
                   STRING
                       WS-RESULT-LIST DELIMITED BY SPACE
                       LIST-SEPARATOR DELIMITED BY SPACE
                       ALLERGEN(INDEX-2) DELIMITED BY SPACE
                       INTO WS-RESULT-LIST
                   END-STRING
                   MOVE "," TO LIST-SEPARATOR
               END-IF
           END-PERFORM.
