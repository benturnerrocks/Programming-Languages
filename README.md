# Programming-Languages
The code for my Scheme interpreter project with Riaz Kelly in CS253 (Programming Languages) at Carleton College.

Assignments **2 - 6** are focused on learning the functional programming language Scheme. Functional programming is an approach to software development that uses pure functions to create software.

Assignments **7 - 9** focus on learning about C using pointers, structs, and the Clang compiler program.

Assignment **18** is the culmination of our Scheme interpreter project written in C. It includes:
- the fundamental aspects of an interpreter (a tokenizer/lexer in *tokenizer.c*, a parser in *parser.c*, and an interpreter in *interpreter.c*)
- programming code for the creation of main Scheme functions such as *and, begin, car, cdr, cond, cons, define, divide, each, equals, greaterthan, if, lambda, lessthan, let (and variations), modulo, mult, null, or, plus, quote, set, and subtract*.
- a function *talloc.c* for allocating memory in a linked list
- a file *value.h* defining *Value* as a universal structure that can represent ints, doubles, cons cell struct, characters, and closure struct. These values can be extended by using a linked list of values. The struct *Frame* is also defined to represent the concepts of frames.
- a file *look_up_symbol.c* to look up a symbol to see if it is defined in the current frame or any previous frames
- a *main.c* file that runs the tokenizer, parser, and interpreter to read the resulting tree. This runs all the separate parts of the Scheme interpreter in one file.
- testing files utilizing Valgrind

This was an amazing project learning the workings of a programming language interpreter. It was a sharp learning curve understanding C and memory allocation, but very fulfilling.

*Note:* Assignments 10-17 are not included because they are all just prior iterations of assignment 18.
