       IDENTIFICATION DIVISION.
       PROGRAM-ID. KNAPSACK.
       AUTHOR. kapitaali.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       REPOSITORY.
           FUNCTION ALL INTRINSIC.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-INPUTS.
           05 MAXIMUM-WEIGHT    PIC 999.
           05 NO-OF-ITEMS       PIC 99.
       
       01 KNAPSACKTABLE.
           05 TABLEROW          OCCURS 1 TO 20 DEPENDING ON NO-OF-ITEMS
                                   INDEXED BY INDX.
              10 WS-WEIGHT      PIC 9999.
              10 WS-VALUE       PIC 9999.
       
       01 WS-OUTPUTS.
           05 WS-RESULT         PIC 9999.

       01 MY-VARS.
           05 A                 PIC 9999.
           05 B                 PIC 9999.
           05 C                 PIC 9999.
           05 I                 PIC 9999.
           05 J                 PIC 9999.
           05 ITEMS-PLUS1       PIC 9999.
           05 WEIGHT-PLUS1      PIC 9999.

       01 MY-TABLE.
           05 W           OCCURS 1 TO 9999 DEPENDING ON MAXIMUM-WEIGHT.
              10 ITEMS    OCCURS 20 TIMES.
                 15 M     PIC 9999.
 

       PROCEDURE DIVISION.

       
       INIT-MY-TABLE.
           IF MAXIMUM-WEIGHT = 0
              MOVE 1 TO MAXIMUM-WEIGHT 
              INITIALIZE MY-TABLE
              MOVE 0 TO MAXIMUM-WEIGHT 
           ELSE
              INITIALIZE MY-TABLE
           END-IF.


       MAXIMUM-VALUE.  
           PERFORM INIT-MY-TABLE.
           MOVE ZEROES TO MY-TABLE.
           MOVE ZEROES TO MY-VARS.
           INITIALIZE WS-RESULT.
           SET INDX TO NO-OF-ITEMS.
           IF NO-OF-ITEMS = 1
              IF WS-WEIGHT(1) > MAXIMUM-WEIGHT 
                 EXIT PROGRAM 
              END-IF
           END-IF.
           SORT TABLEROW DESCENDING WS-VALUE WS-WEIGHT.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > NO-OF-ITEMS 
              PERFORM VARYING J FROM 1 BY 1 UNTIL J > MAXIMUM-WEIGHT    
                 IF WS-WEIGHT(I) > J THEN
                    COMPUTE C = I - 1
                    IF C = 0
                       MOVE 0 TO M(J,I)
                    ELSE
                       MOVE M(J, C) TO M(J,I) 
                    END-IF
                 ELSE
                    COMPUTE B = J - WS-WEIGHT(I)
                    IF C > 0 AND B > 0
                       COMPUTE A = WS-VALUE(I) + M(B, C)
                       COMPUTE M(J,I) = MAX(M(J, C), A)
                    ELSE
                       COMPUTE A = WS-VALUE(I) 
                       COMPUTE M(J,I) = MAX(0, A)
                    END-IF 
                 END-IF
              END-PERFORM
           END-PERFORM.
           MOVE M(MAXIMUM-WEIGHT, NO-OF-ITEMS) TO WS-RESULT.
