       IDENTIFICATION DIVISION.
       PROGRAM-ID. YACHT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-CATEGORY PIC X(15).
       01 WS-DICE PIC 9(5).
        88 LITTLE-STRAIGHT VALUE 12345.
        88 BIG-STRAIGHT VALUE 23456.
       01 WS-DICE-ARRAY REDEFINES WS-DICE.
        03 WS-DICE-DIE PIC 9 OCCURS 5 TIMES INDEXED BY DICE-INDEX.
       01 WS-TEMP PIC 9 VALUE 0.
       01 WS-CHANGED-FLAG pic X.
          88 HAS_CHANGED value 'Y'.
          88 NOT_CHANGED value 'N'.
       01 WS-COUNTER PIC 9 USAGE BINARY VALUE 0.
       01 WS-RESULT PIC 99 VALUE 0.
       01 WS-DOTS PIC 9.
       01 WS-FULL-HOUSE-COUNTERS.
        88 THREE-TWO-FULL-HOUSE VALUE 32.
        88 TWO-THREE-FULL-HOUSE VALUE 23.
        03 WS-FH-FIRST-COUNTER PIC 9 VALUE 0.
        03 WS-FH-LAST-COUNTER PIC 9 VALUE 0.
       PROCEDURE DIVISION.
       
       YACHT.
         PERFORM BUBBLE-SORT.
         DISPLAY "SORTED DICE: " WS-DICE.
         EVALUATE WS-CATEGORY
           WHEN 'ones'
            PERFORM SCORE-ONES-ROLL 
                THRU SCORE-ONES-ROLL-EXIT
           WHEN 'twos'
            PERFORM SCORE-TWOS-ROLL 
                THRU SCORE-TWOS-ROLL-EXIT
           WHEN 'threes'
            PERFORM SCORE-THREES-ROLL 
                THRU SCORE-THREES-ROLL-EXIT
           WHEN 'fours'
            PERFORM SCORE-FOURS-ROLL 
                THRU SCORE-FOURS-ROLL-EXIT
           WHEN 'fives'
            PERFORM SCORE-FIVES-ROLL 
                THRU SCORE-FIVES-ROLL-EXIT
           WHEN 'sixes'
            PERFORM SCORE-SIXES-ROLL 
                THRU SCORE-SIXES-ROLL-EXIT
           WHEN 'little straight'
            PERFORM SCORE-LITTLE-STRAIGHT 
                THRU SCORE-LITTLE-STRAIGHT-EXIT
           WHEN 'big straight'
            PERFORM SCORE-BIG-STRAIGHT    
                THRU SCORE-BIG-STRAIGHT-EXIT
           WHEN 'four of a kind'
            PERFORM SCORE-FOUR-OF-A-KIND  
                THRU SCORE-FOUR-OF-A-KIND-EXIT
           WHEN 'full house'
            PERFORM SCORE-FULL-HOUSE      
                THRU SCORE-FULL-HOUSE-EXIT
           WHEN 'choice'
            PERFORM SCORE-CHOICE-ROLL 
                THRU SCORE-CHOICE-ROLL-EXIT
           WHEN 'yacht'
             PERFORM SCORE-YACHT-ROLL 
                THRU SCORE-YACHT-ROLL-EXIT
         END-EVALUATE.
       YACHT-EXIT.
         EXIT.
        
       SCORE-ONES-ROLL.
         MOVE 1 TO WS-DOTS.
         INSPECT WS-DICE 
           TALLYING WS-COUNTER FOR ALL WS-DOTS.
         MULTIPLY WS-COUNTER BY WS-DOTS GIVING WS-RESULT.
       SCORE-ONES-ROLL-EXIT.
         EXIT.
       
       SCORE-TWOS-ROLL.
         MOVE 2 TO WS-DOTS.
         INSPECT WS-DICE 
           TALLYING WS-COUNTER FOR ALL WS-DOTS.
         MULTIPLY WS-COUNTER BY WS-DOTS GIVING WS-RESULT.
       SCORE-TWOS-ROLL-EXIT.
         EXIT.
       
       SCORE-THREES-ROLL.
         MOVE 3 TO WS-DOTS.
         INSPECT WS-DICE 
           TALLYING WS-COUNTER FOR ALL WS-DOTS.
         MULTIPLY WS-COUNTER BY WS-DOTS GIVING WS-RESULT.
       SCORE-THREES-ROLL-EXIT.
         EXIT.
       
       SCORE-FOURS-ROLL.
         MOVE 4 TO WS-DOTS.
         INSPECT WS-DICE 
           TALLYING WS-COUNTER FOR ALL WS-DOTS.
         MULTIPLY WS-COUNTER BY WS-DOTS GIVING WS-RESULT.
       SCORE-FOURS-ROLL-EXIT.
         EXIT.
       
       SCORE-FIVES-ROLL.
         MOVE 5 TO WS-DOTS.
         INSPECT WS-DICE 
           TALLYING WS-COUNTER FOR ALL WS-DOTS.
         MULTIPLY WS-COUNTER BY WS-DOTS GIVING WS-RESULT.
       SCORE-FIVES-ROLL-EXIT.
         EXIT.
       
       SCORE-SIXES-ROLL.
         MOVE 6 TO WS-DOTS.
         INSPECT WS-DICE 
           TALLYING WS-COUNTER FOR ALL WS-DOTS.
         MULTIPLY WS-COUNTER BY WS-DOTS GIVING WS-RESULT.
       SCORE-SIXES-ROLL-EXIT.
         EXIT.
       
       SCORE-LITTLE-STRAIGHT.
         IF LITTLE-STRAIGHT
            MOVE 30 TO WS-RESULT
         END-IF.
       SCORE-LITTLE-STRAIGHT-EXIT.
         EXIT.
       
       SCORE-BIG-STRAIGHT.
         IF BIG-STRAIGHT
           MOVE 30 TO WS-RESULT
         END-IF.
       SCORE-BIG-STRAIGHT-EXIT.
         EXIT.
       
       SCORE-FOUR-OF-A-KIND.
         MOVE WS-DICE-DIE(1) TO WS-DOTS.
         INSPECT WS-DICE 
           TALLYING WS-COUNTER FOR ALL WS-DOTS.
         IF WS-COUNTER = 4
           MULTIPLY WS-DOTS BY 4 GIVING WS-RESULT
         ELSE 
           MOVE 0 TO WS-COUNTER
           MOVE WS-DICE-DIE(5) TO WS-DOTS
           INSPECT WS-DICE  
             TALLYING WS-COUNTER FOR ALL WS-DOTS
           IF WS-COUNTER = 4
             MULTIPLY WS-DOTS BY 4 GIVING WS-RESULT
           END-IF  
         END-IF.       
       SCORE-FOUR-OF-A-KIND-EXIT.
         EXIT.
       
       SCORE-FULL-HOUSE.
         MOVE WS-DICE-DIE(1) TO WS-DOTS.
         INSPECT WS-DICE
           TALLYING WS-FH-FIRST-COUNTER FOR ALL WS-DOTS.
         MOVE WS-DICE-DIE(5) TO WS-DOTS.
         INSPECT WS-DICE
           TALLYING WS-FH-LAST-COUNTER FOR ALL WS-DOTS.
         IF TWO-THREE-FULL-HOUSE 
            COMPUTE WS-RESULT = 2 * WS-DICE-DIE(1) + 
                                3 * WS-DICE-DIE(5) 
         ELSE IF THREE-TWO-FULL-HOUSE
            COMPUTE WS-RESULT = 3 * WS-DICE-DIE(1) + 
                                2 * WS-DICE-DIE(5).
       SCORE-FULL-HOUSE-EXIT.
         EXIT.
       
       SCORE-CHOICE-ROLL.
         PERFORM VARYING WS-DOTS
            FROM 1
            BY 1
            UNTIL WS-DOTS > 6
                ADD WS-DOTS TO WS-RESULT
         END-PERFORM.
       SCORE-CHOICE-ROLL-EXIT.
         EXIT.

       SCORE-YACHT-ROLL.
         PERFORM VARYING WS-DOTS  
          FROM 1
          BY 1
          UNTIL WS-DOTS > 6
            MOVE 0 TO WS-COUNTER
            INSPECT WS-DICE 
              TALLYING WS-COUNTER FOR ALL WS-DOTS
            IF WS-COUNTER = 5
              MOVE 50 TO WS-RESULT
              GO TO SCORE-YACHT-ROLL-EXIT
           END-IF
         END-PERFORM.
       SCORE-YACHT-ROLL-EXIT.
         EXIT.

       BUBBLE-SORT.
          MOVE 5 TO WS-COUNTER.
          PERFORM WITH TEST AFTER UNTIL NOT_CHANGED
            SET NOT_CHANGED TO TRUE
            SUBTRACT 1 FROM WS-COUNTER
            PERFORM VARYING DICE-INDEX 
              FROM 1 
              BY 1 
              UNTIL DICE-INDEX > WS-COUNTER
              IF WS-DICE-DIE (DICE-INDEX) > WS-DICE-DIE (DICE-INDEX + 1)
                MOVE WS-DICE-DIE (DICE-INDEX) TO WS-TEMP
                MOVE WS-DICE-DIE (DICE-INDEX + 1) 
                  TO WS-DICE-DIE (DICE-INDEX)
                MOVE WS-TEMP TO WS-DICE-DIE (DICE-INDEX + 1)
                SET HAS_CHANGED TO TRUE
              END-IF
            END-PERFORM
         END-PERFORM.
       BUBBLE-SORT-EXIT.
        EXIT.
        
