@echo off
rem Windows - compile and execute a test Cobol program
rem
rem  Assumptions:
rem
rem GnuCOBOL 3.+ is installed and on the path. Its executable or alias or symlink is named "cobc".

Set filename=%1
For %%A in ("%filename%") do (
    Set Folder=%%~dpA
    Set Name=%%~nxA
)
cd %Folder%
cobc -x %Name%
%~dpn1