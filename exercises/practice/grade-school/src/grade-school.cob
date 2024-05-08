       IDENTIFICATION DIVISION.
       PROGRAM-ID. GRADE-SCHOOL.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-STUDENTNAME           PIC X(60).
       01 WS-STUDENTGRADE          PIC 9.
       01 WS-DESIREDGRADE          PIC 9.
       01 WS-RESULT                PIC X(5).
       
       01 STUDENTROSTER.
           02 ROSTER               OCCURS 10 TIMES.
              05 ST-NAME           PIC X(60).
              05 ST-GRADE          PIC 9.   
       
       PROCEDURE DIVISION.
        
       INIT-ROSTER.


       ADD-STUDENT.


       GET-GRADE.
       
