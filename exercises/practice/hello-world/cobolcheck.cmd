@echo off
java -jar bin\cobol-check-0.1.0.jar %*
type output\testResults.txt
