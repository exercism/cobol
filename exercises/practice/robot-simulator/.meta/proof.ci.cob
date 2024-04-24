       IDENTIFICATION DIVISION.
       PROGRAM-ID. ROBOT-SIMULATOR.
       AUTHOR. kapitaali.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-X-COORD               PIC S999.
       01 WS-Y-COORD               PIC S999.
       01 WS-DIRECTION             PIC X(20).
       01 WS-INSTRUCTIONS          PIC X(60).
       01 INSTRU                   PIC X.
       01 LEN                      PIC 99.
       01 CC                       PIC 99.


       PROCEDURE DIVISION.
       
       CREATE-ROBOT.
           CONTINUE.
 

       MOVE-ROBOT.
           PERFORM VARYING LEN FROM 60 BY -1 
              UNTIL WS-INSTRUCTIONS(LEN:1) IS NOT EQUAL TO " "
              CONTINUE
           END-PERFORM.
           PERFORM VARYING CC FROM 1 BY 1 UNTIL CC > LEN
              MOVE WS-INSTRUCTIONS(CC:1) TO INSTRU
              PERFORM PROCESS-INSTRUCTION 
           END-PERFORM.


       PROCESS-INSTRUCTION.    
           EVALUATE INSTRU 
              WHEN 'L'
                 EVALUATE WS-DIRECTION
                    WHEN 'north'
                       MOVE 'west' TO WS-DIRECTION 
                    WHEN 'west'
                       MOVE 'south' TO WS-DIRECTION 
                    WHEN 'south'
                       MOVE 'east' TO WS-DIRECTION
                    WHEN 'east'
                       MOVE 'north' TO WS-DIRECTION
                 END-EVALUATE 
              WHEN 'R'
                 EVALUATE WS-DIRECTION
                    WHEN 'north'
                       MOVE 'east' TO WS-DIRECTION 
                    WHEN 'west'
                       MOVE 'north' TO WS-DIRECTION 
                    WHEN 'south'
                       MOVE 'west' TO WS-DIRECTION
                    WHEN 'east'
                       MOVE 'south' TO WS-DIRECTION
                 END-EVALUATE 
              WHEN 'A'
                 EVALUATE WS-DIRECTION 
                    WHEN 'north'
                       ADD 1 TO WS-Y-COORD 
                    WHEN 'east'
                       ADD 1 TO WS-X-COORD 
                    WHEN 'south'
                       SUBTRACT 1 FROM WS-Y-COORD 
                    WHEN 'west'
                       SUBTRACT 1 FROM WS-X-COORD
                 END-EVALUATE
           END-EVALUATE.
