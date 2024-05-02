       IDENTIFICATION DIVISION.
       PROGRAM-ID. GRADE-SCHOOL.
       AUTHOR. kapitaali.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-STUDENTNAME           PIC X(60).
       01 WS-STUDENTGRADE          PIC 9.
       01 WS-DESIREDGRADE          PIC 9.
       01 ENTRIES                  PIC 99 COMP.
       01 I                        PIC 99 COMP.
       01 J                        PIC 99 COMP.
       01 K                        PIC 99 COMP.
       01 TEMPNAME                 PIC X(60).
       01 TEMPGRADE                PIC 9.

       01 STUDENTROSTER.
           02 ROSTER               OCCURS 10 INDEXED BY INDX.
              05 ST-NAME           PIC X(60).
              05 ST-GRADE          PIC 9.   


       PROCEDURE DIVISION.


       INIT-ROSTER.
           INITIALIZE STUDENTROSTER.
           MOVE 0 TO ENTRIES.
           SET INDX TO 0.


       ADD-STUDENT.       
           SET INDX TO ENTRIES.
           SEARCH ROSTER VARYING INDX
               AT END PERFORM ADD-ENTRY
             WHEN ST-NAME(INDX) = WS-STUDENTNAME 
                   CONTINUE
           END-SEARCH.          
           SORT ROSTER ASCENDING ST-GRADE ST-NAME.
           PERFORM MOVE-ENTRIES.


       MOVE-ENTRIES.
           COMPUTE J = 10 - ENTRIES.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > ENTRIES
              COMPUTE K = I + J
              MOVE ST-NAME(K) TO TEMPNAME
              MOVE ST-GRADE(K) TO TEMPGRADE
              MOVE SPACES TO ST-NAME(K)
              MOVE 0 TO ST-GRADE(K)
              MOVE TEMPNAME TO ST-NAME(I)
              MOVE TEMPGRADE TO ST-GRADE(I)
           END-PERFORM.


       ADD-ENTRY.
           ADD 1 TO ENTRIES.
           MOVE WS-STUDENTGRADE TO ST-GRADE(ENTRIES).
           MOVE WS-STUDENTNAME TO ST-NAME(ENTRIES).


       GET-GRADE.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 10
              IF WS-DESIREDGRADE IS NOT EQUAL TO ST-GRADE(I)
                 MOVE SPACES TO ST-NAME(I)
                 MOVE 0 TO ST-GRADE(I)
              END-IF
           END-PERFORM.
           SORT ROSTER ASCENDING ST-GRADE ST-NAME.
           MOVE 0 TO ENTRIES
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 10
              IF ST-NAME(I) <> SPACES
                 ADD 1 TO ENTRIES
              END-IF
           END-PERFORM.
           PERFORM MOVE-ENTRIES.           
