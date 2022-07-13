# About

**_COBOL_** is a statically typed, imperative, and procedural programming language with support for object oriented programming. Despite its age, it's still used today in many banking and financial companies due to its default support for fixed-decimal arithmetic and file-processing ability, making it well suited for financial calculations and other business applications. If you want to skip the exposition and get to the actual language, just go to [COBOL Formatting][start learning].

First released in 1959, it was developed by the **Committee on Data Systems Languages**(CODASYL) based on the FLOW-MATIC language developed by Remington Rand under the leadership of Real Admiral Grace Hopper. As part of an effort by the United States Department of Defense to create a portable language for processing data, it was adopted by computer manufacturers and then standardized in 1968, with the current standard being ISO 2014. 

COBOL was created so that normal businessmen and managers could read and discuss code with programmers, leading to a syntax very close to the english language that prioritizes readability and maintainability. While this mean programs can have a lot of filler words with no semantic meaning and that there are many keywords, properly-written COBOL programs are easily understood, even decades after being written.

**Heads Up:** COBOL is known to be a little intimidating due to its unique syntax and its multitude of keywords. Don't be surprised if something doesn't make sense immediately, and feel free to take breaks. There are also a variety of available resources. Keep in mind there may be some dialect differences between sources:

[IBM COBOL for z/OS][IBM Docs]  
[TutorialsPoint][Tutorials Point Docs]


## COBOL Formatting
 The building blocks of COBOL programs are **sentences**, which are sections of code that do a certain action. The scope of a statement usually begins with a keyword and ends with an associated keyword or a period(.). 

```
         MOVE "Obi-Wan" TO Utapau.
 ```
 
 While COBOL compilers are usually case insensitive, keywords, division headers, and anything else that is required to run the current program as specified by the language are generally capitalized as part of best practices. Anything else such as paragraph names, variable names, or other aspects created directly by the programmer use CamelCase.

 As the language was originally designed to be written on punchcards, the first six columns of a cobol program were traditionally reserved for line numbering; however, on modern compilers this is usually no longer a requirement. However, this traditional **Fixed Format** still has a few hard specifications: namely, comments are indicated by a star(*) on the seventh column. <abbr title="Keep reading for an explanation!">Division, section, and paragraph</abbr> headers start anywhere from the 8th to the 11th column, and the 12th to 72nd columns are for anything else.

```COBOL
      *This is a comment!
       PROCEDURE DIVISION.
       SaySomething.
          DISPLAY "This is a statement".
```
 However, later versions of COBOL introduced the **Free Format** where line/column requirements are less strict. Comments are instead denoted by *>, and lines can be up to 256 characters long. Unless stated otherwise, assume programs are to be written in the Free Format. 

 COBOL differs from later programming languages as the overall structure of any program is determined by a specific hierarchy of components, where the program is split into _divisions_, which are split into _sections_, and so on into _paragraphs_ and _sentences_. There are many divisions and sections a program could have, but the most important ones are the **Identification Division**, the **Data Division**, and the **Procedure Division**.

### Identification Division

This division is where you give the program a name. It used to be required to also add an author and date, but not that's optional.

```COBOL
        IDENTIFICATION DIVISION.
        PROGRAM-ID HelloThere.
      * This next part is optional.
        AUTHOR. Obi-Wan Kenobi.
        DATE-WRITTEN. 19th May 2005.
```

### Data Division

The data division contains declarations for all information the program as a whole will be working with, like data from a file. An especially important part is the **Working-Storage Section**, where you declare all global variables. Variables are declared using a data hierarchy number(just stick with `01` to start with), a picture of the variable's size and type, and optionally and initial value.

```COBOL
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 Name PIC A(14) VALUE "General Kenobi".
```

### Procedure Division

Lastly, the procedure division is where the program starts performing actions, and where all of those paragraphs and sentences are. COBOL has many keywords and built-in functions, but this course will try to teach the basics.

```COBOL
       PROCEDURE DIVISION.
       DISPLAY Name ", you are a bold one.".
```
Lastly, it's good practice to stop the program and return control to the OS. This also provides space later on for open subprocesses. 

```COBOL
       STOP RUN. 
```

And that's a COBOL program in a nutshell! Now, it's time for exercises. 

[start learning]: ##cobol-formatting
[IBM Docs]: https://www.ibm.com/docs/en/cobol-zos/6.4
[Tutorials Point Docs]: https://www.tutorialspoint.com/cobol/index.htm