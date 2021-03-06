# MASM-Composite-CS-271-Program-3

Problem Definition:

  Write a program to calculate composite numbers. First, the user is instructed to enter the number of
  composites to be displayed, and is prompted to enter an integer in the range [1 .. 400]. The user
  enters a number, n, and the program verifies that 1 ≤ n ≤ 400. If n is out of range, the user is reprompted until s/he enters a       value in the specified range. The program then calculates and displays
  all of the composite numbers up to and including the nth composite. The results should be displayed
  10 composites per line with at least 3 spaces between the numbers.

Requirements:

  1) The programmer’s name must appear in the output.
  2) The counting loop (1 to n) must be implemented using the MASM loop instruction.
  3) The main procedure must consist (mostly) of procedure calls. It should be a readable “list” of
  what the program will do.
  4) Each procedure will implement a section of the program logic, i.e., each procedure will specify
  how the logic of its section is implemented. The program must be modularized into at least the
  following procedures and sub-procedures :
    • introduction
    • getUserData
    • validate
    • showComposites
    • isComposite
    • farewell
  5) The upper limit should be defined and used as a constant.
  6) Data validation is required. If the user enters a number outside the range [1 .. 400] an error
  message should be displayed and the user should be prompted to re-enter the number of
  composites.
  7) The usual requirements regarding documentation, readability, user-friendliness, etc., apply.
  8) Submit your text code file (.asm) to Canvas by the due date. 
