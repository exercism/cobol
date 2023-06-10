       IDENTIFICATION DIVISION.
       PROGRAM-ID. allergies.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-SCORE       PIC 999.
       01 WS-ITEM        PIC X(12).
       01 WS-RESULT      PIC A.
       01 WS-RESULT-LIST PIC X(108).

       01 Allergens      VALUE "eggs        peanuts     shellfish   strawberriestomatoes    chocolate   pollen      cats        ".
           02 Allergen   PIC X(12) OCCURS 8 TIMES.

       01 idx            PIC 9.
       01 idx2           PIC 9.
       01 allergen-value PIC 999.
       01 shifted        PIC 999.
       01 list-separator PIC X.

       PROCEDURE DIVISION.
       ALLERGIC-TO.
           MOVE "N" TO WS-RESULT
           PERFORM VARYING idx FROM 1 BY 1 UNTIL idx > 8
               IF Allergen(idx) EQUAL TO WS-ITEM THEN
                   COMPUTE allergen-value = 2 ** (idx - 1)
                   DIVIDE WS-SCORE BY allergen-value GIVING shifted
                   IF FUNCTION REM(shifted; 2) EQUAL TO 1 THEN
                       MOVE "Y" TO WS-RESULT
                       EXIT PERFORM
                   END-IF
               END-IF
           END-PERFORM.

       LIST-ALLERGENS.
           MOVE SPACES TO WS-RESULT-LIST
           MOVE SPACE TO list-separator
           PERFORM VARYING idx2 FROM 1 BY 1 UNTIL idx2 > 8
               MOVE Allergen(idx2) TO WS-ITEM
               PERFORM ALLERGIC-TO
               IF WS-RESULT EQUAL TO "Y" THEN
                   STRING
                       WS-RESULT-LIST DELIMITED BY SPACE
                       list-separator DELIMITED BY SPACE
                       Allergen(idx2) DELIMITED BY SPACE
                       INTO WS-RESULT-LIST
                   END-STRING
                   MOVE "," TO list-separator
               END-IF
           END-PERFORM.
