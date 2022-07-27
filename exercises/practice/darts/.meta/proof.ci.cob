        IDENTIFICATION DIVISION.
        PROGRAM-ID. DARTS.
        ENVIRONMENT DIVISION.
        DATA DIVISION.
        WORKING-STORAGE SECTION.
        01 WS-POINT.
          03 WS-X  usage float-short.
          03 WS-Y  usage float-short.
        01 WS-RADIUS  usage float-short.
        01 WS-RESULT PIC 99.
        PROCEDURE DIVISION.
        DARTS.
          COMPUTE WS-RADIUS = FUNCTION SQRT(WS-X * WS-X + WS-Y * WS-Y).
          IF WS-RADIUS > 10
            MOVE 0 TO WS-RESULT
          ELSE IF WS-RADIUS > 5 
            MOVE 1 TO WS-RESULT
          ELSE IF WS-RADIUS > 1
            MOVE 5 TO WS-RESULT
          ELSE
            MOVE 10 TO WS-RESULT.
