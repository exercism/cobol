       IDENTIFICATION DIVISION.
       PROGRAM-ID. MEETUP.
       AUTHOR. kapitaali.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-YEAR                  PIC 9999.
       01 WS-MONTH                 PIC 99.
       01 WS-WEEK                  PIC X(10).
       01 WS-DAYOFWEEK             PIC X(10).
       01 WS-RESULT                PIC X(40).
       01 WEEKDAY                  PIC X(10).           
       01 MY-DATE                  PIC 9(8).
       01 SOME-FLD                 PIC 9999.
       01 MY-REM                   PIC 9999.
       01 ITER                     PIC 99.
       01 NO-OF-WDS                PIC 9.
       01 LEAP-YEAR                PIC 9.

       01 Weekdaytable.
           02 WEEKDAYS-T           PIC 99 OCCURS 6 TIMES. 
 

       PROCEDURE DIVISION.


       GET-WEEKDAY.
           DIVIDE FUNCTION INTEGER-OF-DATE(MY-DATE) BY 7
              GIVING SOME-FLD REMAINDER MY-REM.
           EVALUATE MY-REM
              WHEN 0 MOVE 'Sunday' TO WEEKDAY 
              WHEN 1 MOVE 'Monday' TO WEEKDAY
              WHEN 2 MOVE 'Tuesday' TO WEEKDAY
              WHEN 3 MOVE 'Wednesday' TO WEEKDAY
              WHEN 4 MOVE 'Thursday' TO WEEKDAY
              WHEN 5 MOVE 'Friday' TO WEEKDAY
              WHEN 6 MOVE 'Saturday' TO WEEKDAY
           END-EVALUATE.


       MEETUP.
           INITIALIZE Weekdaytable.
           MOVE ZEROES TO Weekdaytable.
           PERFORM FIND-WEEKDAYS.
           MOVE MY-DATE(1:4) TO WS-RESULT(1:4) 
           MOVE '-' TO WS-RESULT(5:1)
           MOVE MY-DATE(5:2) TO WS-RESULT(6:2) 
           MOVE '-' TO WS-RESULT(8:1)
           EVALUATE WS-WEEK 
              WHEN "first" 
                 MOVE WEEKDAYS-T(1) TO WS-RESULT(9:2)      
              WHEN "second" 
                 MOVE WEEKDAYS-T(2) TO WS-RESULT(9:2)
              WHEN "third"
                 MOVE WEEKDAYS-T(3) TO WS-RESULT(9:2)               
              WHEN "fourth" 
                 MOVE WEEKDAYS-T(4) TO WS-RESULT(9:2)              
              WHEN "teenth" 
                 MOVE WEEKDAYS-T(6) TO WS-RESULT(9:2)              
              WHEN "last" 
                 MOVE 0 TO LEAP-YEAR
                 PERFORM IS-IT-LEAP-YEAR    
                 MOVE WEEKDAYS-T(5) TO ITER
                 MOVE ITER TO WS-RESULT(9:2)
                 IF ITER = 0 OR ITER > 31
                    MOVE WEEKDAYS-T(4) TO WS-RESULT(9:2)
                 END-IF
                 IF WS-MONTH = 2 AND LEAP-YEAR = 1 AND ITER > 29
                    MOVE WEEKDAYS-T(4) TO WS-RESULT(9:2)
                 END-IF
                 IF WS-MONTH = 2 AND LEAP-YEAR = 0 AND ITER > 28
                    MOVE WEEKDAYS-T(4) TO WS-RESULT(9:2)
                 END-IF
                 IF WS-MONTH = 4 AND LEAP-YEAR = 0 AND ITER > 30
                       MOVE WEEKDAYS-T(4) TO WS-RESULT(9:2)
                 END-IF
           END-EVALUATE.


       IS-IT-LEAP-YEAR.
      * on every year that is evenly divisible by 4
           IF FUNCTION MOD(WS-YEAR, 4) = 0
      * except every year that is evenly divisible by 100
              IF FUNCTION MOD(WS-YEAR, 100) = 0
      * unless the year is also evenly divisible by 400
                 IF FUNCTION MOD(WS-YEAR, 400) = 0
                    MOVE 1 TO LEAP-YEAR 
                    EXIT PARAGRAPH
                 ELSE
                    MOVE 0 TO LEAP-YEAR 
                    EXIT PARAGRAPH
                 END-IF
                 MOVE 0 TO LEAP-YEAR 
                 EXIT PARAGRAPH 
              ELSE
                 MOVE 1 TO LEAP-YEAR 
                 EXIT PARAGRAPH 
           END-IF.           

           
       FIND-WEEKDAYS.
      * moves date that matches day of week to table
           MOVE 1 TO NO-OF-WDS.
           PERFORM VARYING ITER FROM 1 BY 1 UNTIL ITER > 31
              MOVE WS-YEAR TO MY-DATE(1:4)
              MOVE WS-MONTH TO MY-DATE(5:2)
              MOVE ITER TO MY-DATE(7:2)
              PERFORM GET-WEEKDAY
              IF WS-DAYOFWEEK IS EQUAL TO WEEKDAY 
                 MOVE ITER TO WEEKDAYS-T(NO-OF-WDS)
                 ADD 1 TO NO-OF-WDS 
              END-IF
           END-PERFORM.
      * find teenth
           PERFORM VARYING ITER FROM 13 BY 1 UNTIL ITER = 20
              MOVE WS-YEAR TO MY-DATE(1:4)
              MOVE WS-MONTH TO MY-DATE(5:2)
              MOVE ITER TO MY-DATE(7:2)
              PERFORM GET-WEEKDAY
              IF WS-DAYOFWEEK IS EQUAL TO WEEKDAY 
                 MOVE ITER TO WEEKDAYS-T(6)
              END-IF              
           END-PERFORM.
