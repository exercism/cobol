       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROTEIN-TRANSLATION.
       AUTHOR. kapitaali.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-INPUT                  PIC X(60).
       01 WS-PROTEIN                PIC X(120) VALUE SPACES.
       01 TEMP                      PIC X(120) VALUE SPACES.
       01 WS-ERROR                  PIC X(60).
       01 PROT                      PIC X(3) VALUE SPACES.
       01 CHECKED                   PIC X(14) VALUE SPACES.
       01 INDX                      PIC 99 VALUE 1.
       01 LEN                       PIC 99.
       01 A                         PIC 99.

       PROCEDURE DIVISION.

       TRANSLATE-CODON.
           MOVE SPACES TO WS-PROTEIN. 
           MOVE WS-INPUT TO PROT.
           PERFORM CHECK-CODON.
           EVALUATE CHECKED
              WHEN "ERROR" MOVE "Invalid codon" TO WS-ERROR
              WHEN "STOP" MOVE " " TO WS-PROTEIN
              WHEN OTHER MOVE CHECKED TO WS-PROTEIN
           END-EVALUATE.


       CHECK-CODON.
           MOVE SPACES TO WS-PROTEIN. 
           MOVE SPACES TO CHECKED.
           EVALUATE PROT 
              WHEN " " MOVE " " TO CHECKED
              WHEN "AUG" MOVE "Methionine" TO CHECKED
              WHEN "UUU" MOVE "Phenylalanine" TO CHECKED
              WHEN "UUC" MOVE "Phenylalanine" TO CHECKED
              WHEN "UUA" MOVE "Leucine" TO CHECKED
              WHEN "UUG" MOVE "Leucine" TO CHECKED
              WHEN "UCU" MOVE "Serine" TO CHECKED
              WHEN "UCC" MOVE "Serine" TO CHECKED
              WHEN "UCA" MOVE "Serine" TO CHECKED
              WHEN "UCG" MOVE "Serine" TO CHECKED
              WHEN "UAU" MOVE "Tyrosine" TO CHECKED
              WHEN "UAC" MOVE "Tyrosine" TO CHECKED
              WHEN "UGU" MOVE "Cysteine" TO CHECKED
              WHEN "UGC" MOVE "Cysteine" TO CHECKED
              WHEN "UGG" MOVE "Tryptophan" TO CHECKED
              WHEN "UAA" MOVE "STOP" TO CHECKED
              WHEN "UAG" MOVE "STOP" TO CHECKED
              WHEN "UGA" MOVE "STOP" TO CHECKED
              WHEN OTHER MOVE "ERROR" TO CHECKED
           END-EVALUATE.


       STR-LENGTH.
           MOVE 0 TO LEN.
           PERFORM VARYING A FROM FUNCTION LENGTH(CHECKED)
                   BY -1 UNTIL CHECKED(A:1) <> " "
               ADD 1 TO LEN
           END-PERFORM.
           COMPUTE LEN = FUNCTION LENGTH(CHECKED) - LEN.

 
       TRANSLATE-RNA.           
           PERFORM UNTIL WS-INPUT = " "
              MOVE WS-INPUT(1:3) TO PROT
              PERFORM CHECK-CODON
              PERFORM STR-LENGTH
              EVALUATE CHECKED 
                 WHEN "ERROR" 
                    MOVE "Invalid codon" TO WS-ERROR
                    MOVE SPACES TO TEMP
                    MOVE SPACES TO WS-PROTEIN 
                    GOBACK
                 WHEN " "
                    MOVE TEMP TO WS-PROTEIN  
                    MOVE SPACES TO TEMP
                    GOBACK
                 WHEN "STOP"
                    MOVE TEMP TO WS-PROTEIN 
                    MOVE SPACES TO TEMP
                    GOBACK
                 WHEN OTHER 
                    IF INDX > 1
                       MOVE "," TO TEMP(INDX:1)
                       ADD 1 TO INDX
                    END-IF
                    MOVE CHECKED TO TEMP(INDX:LEN)
                    ADD LEN TO INDX
              END-EVALUATE
              MOVE WS-INPUT(4:56) TO WS-INPUT(1:56) 
           END-PERFORM.
           MOVE TEMP TO WS-PROTEIN.
           MOVE SPACES TO TEMP.
           MOVE 1 TO INDX.
