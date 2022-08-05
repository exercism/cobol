       IDENTIFICATION DIVISION.
       PROGRAM-ID. QUEEN-ATTACK.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *Inputs
       01 WS-QUEEN PIC X(9).
       01 WS-WHITE_QUEEN PIC X(9).
       01 WS-BLACK_QUEEN PIC X(9).
       01 WS-PROPERTY PIC X(11).
      *Outputs
       01 WS-RESULT PIC 9.
      *Workings
       01 WS-ROW   PIC S99.
       01 WS-COL   PIC S99.
       01 WS-WHITE_ROW   PIC S99.
       01 WS-WHITE_COL   PIC S99.
       01 WS-BLACK_ROW   PIC S99.
       01 WS-BLACK_COL   PIC S99.
       01 WS-SLOPE       PIC S99V9.
        88 ON-DIAGONAL VALUE -1, 1.

       PROCEDURE DIVISION.
       QUEEN-ATTACK.
        MOVE 0 TO WS-RESULT.
        
        EVALUATE WS-PROPERTY
         WHEN "create"
           PERFORM CREATE
          WHEN "canAttack"
           PERFORM CAN-ATTACK.

        CREATE.
         UNSTRING WS-QUEEN DELIMITED BY ','
         INTO WS-ROW
              WS-COL.
         IF WS-ROW >= 0 AND WS-ROW < 8
          AND WS-COL >= 0 AND WS-COL < 8
           MOVE 1 TO WS-RESULT
         END-IF.

        CAN-ATTACK.
         UNSTRING WS-WHITE_QUEEN DELIMITED BY ','
          INTO WS-WHITE_ROW
               WS-WHITE_COL.
         UNSTRING WS-BLACK_QUEEN DELIMITED BY ','
          INTO WS-BLACK_ROW
               WS-BLACK_COL.

         COMPUTE WS-SLOPE = (WS-BLACK_ROW - WS-WHITE_ROW) /
          (WS-BLACK_COL - WS-WHITE_COL).

         IF (WS-BLACK_ROW = WS-WHITE_ROW)
          OR (WS-BLACK_COL = WS-WHITE_COL)
          OR ON-DIAGONAL
           MOVE 1 TO WS-RESULT.
