       IDENTIFICATION DIVISION.
       PROGRAM-ID. PIG-LATIN.
       AUTHOR. kapitaali.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 VOWELS                   PIC X(6) VALUE 'aeiouy'.
       01 WS-INPUT                 PIC X(60).
       01 WS-RESULT                PIC X(60).
       01 STR                      PIC X(60).
       01 TEMP                     PIC X(60).
       01 TEMP2                    PIC X(60).       
       01 BOOL                     PIC 9.
       01 A                        PIC 99.
       01 B                        PIC 99 VALUE 1.
       01 C                        PIC 99.
       01 X                        PIC X.
       01 I                        PIC 99.
       01 LEN                      PIC 99.
       01 LEN2                     PIC 99.
       01 INPUTLEN                 PIC 99.
       
       01 Wordstable.
           02 WORDSLIST            PIC X(60) OCCURS 10 TIMES.
       

       PROCEDURE DIVISION.

       STR-LENGTH.
           MOVE 0 TO LEN.
           PERFORM VARYING A FROM FUNCTION LENGTH(STR)
                   BY -1 UNTIL STR(A:1) IS NOT EQUAL TO " "
               ADD 1 TO LEN
           END-PERFORM.
           COMPUTE LEN = FUNCTION LENGTH(STR) - LEN.


       BEGINS-WITH-VOWEL.
           MOVE FUNCTION LOWER-CASE(STR(1:1)) TO X.
           PERFORM IS-X-VOWEL.
           IF BOOL = 1
              PERFORM RULE-1   
           ELSE IF STR(1:1) = 'x'
              MOVE STR(2:1) TO X
              PERFORM IS-X-VOWEL
              IF BOOL = 0
                 PERFORM RULE-1
              ELSE
                 PERFORM RULE-2
              END-IF
           ELSE IF STR(2:2) = 'qu'
              PERFORM RULE-3           
           ELSE
              PERFORM FIND-FIRST-VOWEL
              IF X = 'y'
                 PERFORM RULE-4
              ELSE              
                 PERFORM RULE-2
              END-IF
           END-IF.
           
 
       IS-X-VOWEL.
           MOVE 0 TO BOOL.
           MOVE FUNCTION LOWER-CASE(X) TO X.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 6
              IF VOWELS(I:1) = X
                 MOVE 1 TO BOOL
              END-IF
           END-PERFORM.  


       FIND-FIRST-VOWEL.
           MOVE 1 TO I.
           MOVE 1 TO A.
           MOVE 0 TO BOOL
           PERFORM STR-LENGTH.
           PERFORM VARYING A FROM 1 BY 1 UNTIL A = LEN
              MOVE STR(A:1) TO X
              PERFORM IS-X-VOWEL
              IF BOOL = 1
                 EXIT PARAGRAPH 
              END-IF
           END-PERFORM.


       CHECK-IF-MULTIPLE-WORDS.
           MOVE WS-INPUT TO STR.
           PERFORM STR-LENGTH.
           MOVE 1 TO A.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I = LEN
              IF STR(I:1) IS NOT EQUAL TO " "
                 ADD 1 TO A
              ELSE 
                 ADD 1 TO A
                 EXIT PERFORM 
              END-IF
           END-PERFORM.
      * spaces before end of string -> multiple words
           IF A < LEN 
              MOVE 1 TO BOOL 
           ELSE 
              MOVE 0 TO BOOL
           END-IF.


       PROCESS-MULTIPLE-WORDS.
           INITIALIZE Wordstable.
           MOVE SPACES TO TEMP2.
           MOVE 1 TO INPUTLEN.
           UNSTRING WS-INPUT DELIMITED BY ' ' 
            INTO WORDSLIST(1), WORDSLIST(2), WORDSLIST(3), WORDSLIST(4),
             WORDSLIST(5), WORDSLIST(6), WORDSLIST(7), WORDSLIST(8),
             WORDSLIST(9), WORDSLIST(10).
           PERFORM VARYING C FROM 1 BY 1 UNTIL C > 10
              MOVE WORDSLIST(C) TO STR
              PERFORM BEGINS-WITH-VOWEL 
              MOVE WS-RESULT TO STR
              PERFORM STR-LENGTH
              IF C > 1
                 ADD 1 TO INPUTLEN
                 MOVE STR TO TEMP2(INPUTLEN:LEN)
                 ADD LEN TO INPUTLEN 
              ELSE
                 MOVE STR TO TEMP2
                 ADD LEN TO INPUTLEN
              END-IF
              MOVE WS-RESULT TO WORDSLIST(C)
           END-PERFORM.
           MOVE TEMP2 TO WS-RESULT. 


       TRANSLATE.
           MOVE 1 TO LEN2.
           MOVE WS-INPUT TO STR.
           PERFORM STR-LENGTH.
           IF WS-INPUT = " "
              MOVE TEMP TO WS-RESULT
              EXIT PARAGRAPH             
           END-IF.
           PERFORM CHECK-IF-MULTIPLE-WORDS.
           IF BOOL = 1
              PERFORM PROCESS-MULTIPLE-WORDS 
           ELSE
              MOVE WS-INPUT TO STR
              PERFORM BEGINS-WITH-VOWEL
           END-IF.


      * Rule 1: If a word begins with a vowel sound, add an "ay" 
      *    sound to the end of the word. Please note that "xr" 
      *    and "yt" at the beginning of a word make vowel sounds 
      *    (e.g. "xray" -> "xrayay", "yttria" -> "yttriaay").
       RULE-1.
           PERFORM STR-LENGTH.
           IF STR(1:1) = "y"
              IF STR(2:1) = "t"
                 ADD 1 TO LEN
                 MOVE STR TO WS-RESULT
                 MOVE "ay" TO WS-RESULT(LEN:2)
              ELSE
                 MOVE STR(2:55) TO STR(1:55)
                 MOVE "yay" TO STR(LEN:3)
                 MOVE STR TO WS-RESULT 
              END-IF
           ELSE
              ADD 1 TO LEN
              MOVE STR TO WS-RESULT
              MOVE "ay" TO WS-RESULT(LEN:2)
           END-IF.           

      * Rule 2: If a word begins with a consonant sound, move it 
      *    to the end of the word and then add an "ay" sound to 
      *    the end of the word. Consonant sounds can be made up 
      *    of multiple consonants, such as the "ch" in "chair" or 
      *    "st" in "stand" (e.g. "chair" -> "airchay").
       RULE-2.
           MOVE 0 TO BOOL.
           PERFORM STR-LENGTH.
           IF LEN = 0
              MOVE " " TO WS-RESULT  
           ELSE IF STR(1:2) = "qu"
              MOVE STR(3:55) TO STR(1:55)
              PERFORM STR-LENGTH 
              ADD 1 TO LEN GIVING A
              MOVE "quay" TO STR(A:4)
              MOVE STR TO WS-RESULT 
           ELSE
              MOVE 1 TO A
              PERFORM VARYING I FROM 1 BY 1 UNTIL BOOL = 1
                 MOVE STR(A:1) TO X
                 PERFORM IS-X-VOWEL
                 ADD 1 TO A
              END-PERFORM
              SUBTRACT 2 FROM A GIVING I
              MOVE STR(1:I) TO TEMP
              SUBTRACT 1 FROM A
              MOVE STR(A:55) TO STR(1:55)
              PERFORM STR-LENGTH
              ADD 1 TO LEN GIVING A
              MOVE TEMP TO STR(A:I)
              MOVE STR TO WS-RESULT
              PERFORM STR-LENGTH
              ADD 1 TO LEN
              MOVE "ay" TO WS-RESULT(LEN:2)                  
           END-IF.

      * Rule 3: If a word starts with a consonant sound followed by 
      *    "qu", move it to the end of the word, and then add an "ay" 
      *    sound to the end of the word (e.g. "square" -> "aresquay").
       RULE-3.
           MOVE STR(1:3) TO TEMP.
           MOVE STR(4:55) TO STR(1:55).
           PERFORM STR-LENGTH.
           ADD 1 TO LEN GIVING A.
           MOVE TEMP TO STR(A:3).
           ADD 3 TO A.
           MOVE "ay" TO STR(A:2).
           MOVE STR TO WS-RESULT. 

      * Rule 4: If a word contains a "y" after a consonant cluster or 
      *    as the second letter in a two letter word it makes a vowel 
      *    sound (e.g. "rhythm" -> "ythmrhay", "my" -> "ymay").
       RULE-4.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I = 60
              IF STR(I:1) = 'y'
                 EXIT PERFORM 
              END-IF
           END-PERFORM.
      * y is at index I, so everything before y is B characters
           SUBTRACT 1 FROM I GIVING B.
           MOVE STR(1:B) TO TEMP.
      * move everything starting from y to the beginning
           MOVE STR(I:55) TO STR(1:55).
           PERFORM STR-LENGTH.
      * move stuff before y to the end
           COMPUTE A = LEN + 1.
           MOVE TEMP TO STR(A:B).
      * add ay to the end 
           ADD B TO A.
           MOVE "ay" TO STR(A:2).
           MOVE STR TO WS-RESULT.
