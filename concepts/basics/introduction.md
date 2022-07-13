# Introduction

**_COBOL_** is a statically typed, imperative, procedural programming language with support for object oriented programming. Despite its age, it's still used today in many banking and financial companies due to its default support for fixed-decimal arithmetic and file-processing ability, making it well suited for financial calculations and other business applications. If you want to skip the exposition and get to the actual language, just go to [COBOL Formatting][start learning].

First released in 1959, it was developed by the **Committee on Data Systems Languages**(CODASYL) based on the FLOW-MATIC language developed by Remington Rand under the leadership of Real Admiral Grace Hopper. As part of an effort by the United States Department of Defense to create a portable language for processing data, it was adopted by computer manufacturers and then standardized in 1968, with the current standard being ISO 2014. 

COBOL was created so that normal businessmen and managers could read and discuss code with programmers, leading to a syntax very close to the english language that prioritizes readability and maintainability. While this mean programs can have a lot of filler words with no semantic meaning and that there are many keywords, properly-written COBOL programs are easily understood, even decades after being written.

**Heads Up:** COBOL is known to have a relatively steep learning curve due to its unique syntax and its multitude of keywords. Don't be surprised if something doesn't make sense immediately, and feel free to take breaks. There are also a variety of available resources. Keep in mind there may be some dialect differences between sources:

[IBM COBOL for z/OS][IBM Docs]  
[TutorialsPoint][Tutorials Point Docs]


## COBOL Formatting
 While COBOL compilers are usually case insensitive, keywords, division headers, and anything else that is required to run the current program as specified by the language are generally capitalized as part of best practices. Anything else such as paragraph names, variable names, or other aspects created directly by the programmer use CamelCase.

 As the language was originally designed to be written on punchcards, the first six columns of a cobol program were traditionally reserved for line numbering; however, on modern compilers this is usually no longer a requirement. However, this traditional **Fixed Format** still has a few hard specifications: namely, comments are indicated by a star(*) on the seventh column. <abbr title="Keep reading for an explanation!">Division, section, and paragraph</abbr> headers start on the 8th column and run to the 11th, and the 12th to 72nd columns are for anything else.

```COBOL
      *This is a comment!
       PROCEDURE DIVISION.
       SaySomething.
          DISPLAY "This is a statement".
```
 However, later versions of COBOL introduced the **Free Format** where line column requirements are less strict. Comments are instead denoted by *>, and lines can be up to 255 columns.

 COBOL differs from later programming languages as the overall structure of any program is determined by a specific hierarchy of components, where the program is split into _divisions_, which are split into _sections_, and so on into _paragraphs_ and _sentences_. There are many divisions and sections a program could have, but the most important ones are the **Identification Division**, the **Data Division**, and the **Procedure Division**.

### Identification Division

### Data Division

### Procedure Division

[start learning]: ##cobol-formatting
[IBM Docs]: https://www.ibm.com/docs/en/cobol-zos/6.4
[Tutorials Point Docs]: https://www.tutorialspoint.com/cobol/index.htm