       IDENTIFICATION DIVISION.
       PROGRAM-ID. SPACE-AGE.
       AUTHOR. kapitaali.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-INPUT                 PIC 9(30).
       01 WS-WHICH-PLANET          PIC X(30).
       01 WS-RESULT                PIC 9(4)V99.
       01 WS-ERROR                 PIC X(30).
       01 TEMP                     PIC 9(4)V99.

       PROCEDURE DIVISION.
        
       ROUNDS-TO.
           COMPUTE TEMP ROUNDED = WS-INPUT / 31557600.
           EVALUATE WS-WHICH-PLANET 
              WHEN "Mercury"
                 COMPUTE TEMP ROUNDED = TEMP / 0.2408467
              WHEN "Venus"
                 COMPUTE TEMP = TEMP / 0.61519726
              WHEN "Earth"
                 COMPUTE TEMP ROUNDED = TEMP
              WHEN "Mars"
                 COMPUTE TEMP ROUNDED = TEMP / 1.8808158
              WHEN "Jupiter"
                 COMPUTE TEMP ROUNDED = TEMP / 11.862615
              WHEN "Saturn"
                 COMPUTE TEMP ROUNDED = TEMP / 29.447498
              WHEN "Uranus"
                 COMPUTE TEMP ROUNDED = TEMP / 84.016846
              WHEN "Neptune"
                 COMPUTE TEMP ROUNDED = TEMP / 164.79132
              WHEN OTHER
                 MOVE "not a planet" TO WS-ERROR 
           END-EVALUATE.
           MOVE TEMP TO WS-RESULT.
