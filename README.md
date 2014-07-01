XYZ expressions
===============

This is a simple example of how ocamllex and menhir can be used to
scan and parse a language. 

It was developed as part of (a previous version of) the undergraduate
compiler course at Aarhus University.


Supported syntax:

  exp ::=  x  |  y  |  z
       |  exp + exp
       |  exp - exp
       |  exp * exp
       |  exp / exp
       |  ( exp )


To build:
---------

 $ make


To run:
-------

Example 1:

 $ ./a.out 
 x + y - z      (then press return and Ctrl-D on Linux or MacOSX)
 $

(hence the string 'x + y - z' is accepted)


Example 2:

 $ ./a.out 
 x + y--
 Fatal error: exception Parser.Error
 $

(hence the string 'x + y--' is rejected by the parser)


Example 3:

 $ ./a.out 
 2 + 2
 Failure --- lexing: empty token
 $

(hence the string '2 + 2' is rejected by the scanner)
