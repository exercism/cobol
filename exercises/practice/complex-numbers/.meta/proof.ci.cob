       IDENTIFICATION DIVISION.
       PROGRAM-ID. COMPLEX-NUMBERS.
       AUTHOR. kapitaali.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 Z1-RE          PIC S99999.
       01 Z1-IM          PIC S99999.
       01 Z2-RE          PIC S99999.
       01 Z2-IM          PIC S99999. 
       01 RESULT-RE      PIC S99999V9999.
       01 RESULT-IM      PIC S99999V9999.
       01 TEMP           PIC S99999.       

       PROCEDURE DIVISION.

       C-REAL.
           MOVE Z1-RE TO RESULT-RE.
           MOVE 0 TO RESULT-IM.

 
       C-IMAGINARY.
           MOVE Z1-IM TO RESULT-IM.
           MOVE 0 TO RESULT-RE.


       C-ADD.
           ADD Z1-RE TO Z2-RE GIVING RESULT-RE.
           ADD Z1-IM TO Z2-IM GIVING RESULT-IM.


       C-SUB.
           SUBTRACT Z2-RE FROM Z1-RE GIVING RESULT-RE.
           SUBTRACT Z2-IM FROM Z1-IM GIVING RESULT-IM.           


       C-MUL.
           COMPUTE RESULT-RE = Z1-RE * Z2-RE - Z1-IM * Z2-IM. 
           COMPUTE RESULT-IM = Z1-IM * Z2-RE + Z1-RE * Z2-IM.

       C-DIV.
           DISPLAY "Z1 (" Z1-RE "," Z1-IM ") Z2 (" Z2-RE "," Z2-IM ")".
           COMPUTE TEMP = Z2-RE * Z2-RE + Z2-IM * Z2-IM. 
           DISPLAY "TEMP " TEMP.
           COMPUTE RESULT-RE = Z1-RE * Z2-RE + Z1-IM * Z2-IM. 
           COMPUTE RESULT-RE = RESULT-RE / TEMP. 
           DISPLAY "RESULT-RE " RESULT-RE.
           COMPUTE RESULT-IM = Z1-IM * Z2-RE - Z1-RE * Z2-IM.
           DISPLAY Z1-IM "*" Z2-RE "-" Z1-RE "*" Z2-IM.
           DISPLAY "= " RESULT-IM " / TEMP=" TEMP.
           COMPUTE RESULT-IM = RESULT-IM / TEMP.
           DISPLAY "RESULT-IM " RESULT-IM.

       C-ABS.
           MOVE 0 TO RESULT-IM.
           COMPUTE TEMP = Z1-RE * Z1-RE + Z1-IM * Z1-IM.
           MOVE FUNCTION SQRT(TEMP) TO RESULT-RE.

       C-CONJUGATE.
           MOVE Z1-RE TO RESULT-RE.
           COMPUTE RESULT-IM = 0 - Z1-IM.
