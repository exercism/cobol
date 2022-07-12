# Introduction

COBOL is a statically typed, imperative, procedural programming language with support for object oriented programming. It is widely used in critical systems all over the world from airplane ticketing systems to financial transactions.

First released in 1959, it was developed by the **Committee on Data Systems Languages**(CODASYL) based on the FLOW-MATIC language developed by Remington Rand under the leadership of Real Admiral Grace Hopper. As part of an effort by the United States Departmenmt of Defense to create a portable language to process data, it was adopted by computer manufacturers and then standardized in 1968, with the current standard being ISO 2014. 

Despite its age, it's still used today in many banking and financial companies due to its default support for fixed-decimal arithmetic and file-processing ability, making it well suited for financial calculations and other business applications.

COBOL was created around the idea that normal buisinessmen and managers could read and discuss code with programmers, leading a syntax very close to the english language that prioritizes readability and maintainability. While this may mean programs can have a lot of filler words with no semantic meaning and that there are many keywords, properly-written COBOL programs are easily understood, even decades after being written.


# COBOL Formatting
 While COBOL compilers are usually case insensitive, keywords, division headers, and anything else that is required to run the current program as specified by the langauge are generally capitalized as part of best practices. Anything else such as paragraph names, variable names, or other aspects created directly by the programmer use **CamelCase**

 As the language was originally designed to be written on punchcards, the first six columns of a cobol program were traditionally reserved for line numbering; however, on modern compilers this is usually no longer a requirement. However, this traditional **Fixed Format** still has a few hard specifications: namely, comments are indicated by a star(*) on the seventh column. <abbr title="Keep reading for an explanation!">Division, section, and paragraph</abbr> headers start on the 8th column and run to the 11th, and the 12th to 72nd comluns are for anything else.

```COBOL
      *This is a comment!
        SaySomething.
           DISPLAY "This is a statement".
```


 COBOL differs from later programming languages as the overall structure of any program is determined by a specific hierarchy of components, where the program is split into divisions, the divisions are split into sections, and so on into paragraphs and sentences. There are many divisions and sections a program could have, but the most important ones are the **Identification Division**, the **Data Division**, and the **Procedure Division**.

## Identification Division

## Data Division

## Procedure Division

