// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// See NOTES.md for details on how this works

(PROGRAM_START)
@SCREEN
D=A
@R0
M=D

(KEYBOARD_LOOP)
@color
M=0
@KBD
D=M
@ENDKBDIF
D;JEQ

@0
D=A
D=D-1
@color
M=D
(ENDKBDIF)


@color
D=M

@R0
A=M
M=D
A=A+1
M=D
A=A+1
M=D
A=A+1
M=D
A=A+1
M=D
A=A+1
M=D
A=A+1
M=D
A=A+1
M=D
A=A+1
M=D
A=A+1
M=D
A=A+1
M=D
A=A+1
M=D
A=A+1
M=D
A=A+1
M=D
A=A+1
M=D
A=A+1
M=D
A=A+1
M=D
A=A+1
M=D
A=A+1
M=D
A=A+1
M=D
A=A+1
M=D
A=A+1
M=D
A=A+1
M=D
A=A+1
M=D
A=A+1
M=D
A=A+1
M=D
A=A+1
M=D
A=A+1
M=D
A=A+1
M=D
A=A+1
M=D
A=A+1
M=D
A=A+1
M=D


A=A+1
D=A
@R0
M=D

@24575
D=A
@R0
D=M-D // (D=R0-24575)
@ENDIF
D;JLE

@SCREEN
D=A
@R0
M=D


(ENDIF)


@KEYBOARD_LOOP
0;JMP
