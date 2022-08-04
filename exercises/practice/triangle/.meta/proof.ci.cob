       IDENTIFICATION DIVISION.
       PROGRAM-ID. TRIANGLE.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *Incoming
       01 WS-SIDES PIC X(20).
       01 WS-PROPERTY PIC X(11).
      *Outgoing
       01 WS-RESULT PIC 9.
      *Working 
       01 WS-SIDE-A  PIC 99V9.
       01 WS-SIDE-B  PIC 99V9.
       01 WS-SIDE-C  PIC 99V9.
       01 WS-SIDE-AB PIC 99V9.
       01 WS-SIDE    PIC 99V9.
       PROCEDURE DIVISION.
       TRIANGLE.
        MOVE 0 TO WS-RESULT.
        UNSTRING WS-SIDES DELIMITED BY ',' 
         INTO WS-SIDE-A
              WS-SIDE-B 
              WS-SIDE-C
        END-UNSTRING.

        PERFORM SORT-SIDES.
                    
        COMPUTE WS-SIDE-AB = WS-SIDE-A + WS-SIDE-B.
       
        IF WS-SIDE-A NOT = 0
           AND WS-SIDE-B NOT = 0
           AND WS-SIDE-C NOT = 0
           AND WS-SIDE-AB > WS-SIDE-C
         EVALUATE WS-PROPERTY
          WHEN "isosceles"
           PERFORM ISOSCELES
          WHEN "equilateral"
           PERFORM EQUILATERAL
          WHEN "scalene"
           PERFORM SCALENE.

       ISOSCELES.
        IF WS-SIDE-A = WS-SIDE-B 
           OR WS-SIDE-B = WS-SIDE-C 
           OR WS-SIDE-C = WS-SIDE-A
            MOVE 1 TO WS-RESULT.
            
       EQUILATERAL.
        IF WS-SIDE-A = WS-SIDE-B 
           AND WS-SIDE-B = WS-SIDE-C 
            MOVE 1 TO WS-RESULT.
        
       SCALENE.
        IF WS-SIDE-A NOT = WS-SIDE-B 
           AND WS-SIDE-B NOT = WS-SIDE-C 
           AND WS-SIDE-C NOT = WS-SIDE-A         
            MOVE 1 TO WS-RESULT.
          
       SORT-SIDES.
        IF WS-SIDE-A > WS-SIDE-B
            MOVE WS-SIDE-A TO WS-SIDE
            MOVE WS-SIDE-B TO WS-SIDE-A
            MOVE WS-SIDE TO WS-SIDE-B
        END-IF.
        IF WS-SIDE-B > WS-SIDE-C
            MOVE WS-SIDE-B TO WS-SIDE
            MOVE WS-SIDE-C TO WS-SIDE-B
            MOVE WS-SIDE TO WS-SIDE-C
        END-IF.
        IF WS-SIDE-A > WS-SIDE-B
            MOVE WS-SIDE-A TO WS-SIDE
            MOVE WS-SIDE-B TO WS-SIDE-A
            MOVE WS-SIDE TO WS-SIDE-B
        END-IF.        

