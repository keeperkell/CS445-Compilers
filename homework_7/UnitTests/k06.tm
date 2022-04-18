* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  k06.c-
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION input
  1:     ST  3,-1(1)	Store return address 
  2:     IN  2,2,2	Grab int input 
  3:     LD  3,-1(1)	Load return address 
  4:     LD  1,0(1)	Adjust fp 
  5:    JMP  7,0(3)	Return 
* END FUNCTION input
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION output
  6:     ST  3,-1(1)	Store return address 
  7:     LD  3,-2(1)	Load parameter 
  8:    OUT  3,3,3	Output integer 
  9:     LD  3,-1(1)	Load return address 
 10:     LD  1,0(1)	Adjust fp 
 11:    JMP  7,0(3)	Return 
* END FUNCTION output
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION inputb
 12:     ST  3,-1(1)	Store return address 
 13:    INB  2,2,2	Grab bool input 
 14:     LD  3,-1(1)	Load return address 
 15:     LD  1,0(1)	Adjust fp 
 16:    JMP  7,0(3)	Return 
* END FUNCTION inputb
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION outputb
 17:     ST  3,-1(1)	Store return address 
 18:     LD  3,-2(1)	Load parameter 
 19:   OUTB  3,3,3	Output bool 
 20:     LD  3,-1(1)	Load return address 
 21:     LD  1,0(1)	Adjust fp 
 22:    JMP  7,0(3)	Return 
* END FUNCTION outputb
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION inputc
 23:     ST  3,-1(1)	Store return address 
 24:    INC  2,2,2	Grab char input 
 25:     LD  3,-1(1)	Load return address 
 26:     LD  1,0(1)	Adjust fp 
 27:    JMP  7,0(3)	Return 
* END FUNCTION inputc
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION outputc
 28:     ST  3,-1(1)	Store return address 
 29:     LD  3,-2(1)	Load parameter 
 30:   OUTC  3,3,3	Output char 
 31:     LD  3,-1(1)	Load return address 
 32:     LD  1,0(1)	Adjust fp 
 33:    JMP  7,0(3)	Return 
* END FUNCTION outputc
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION outnl
 34:     ST  3,-1(1)	Store return address 
 35:  OUTNL  3,3,3	Output a newline 
 36:     LD  3,-1(1)	Load return address 
 37:     LD  1,0(1)	Adjust fp 
 38:    JMP  7,0(3)	Return 
* END FUNCTION outnl
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -5
* Compound Body
* EXPRESSION
 40:    LDC  3,100(6)	Load integer constant 
 41:     ST  3,-2(1)	Store variable a
* EXPRESSION
 42:    LDC  3,110(6)	Load integer constant 
 43:     ST  3,-3(1)	Store variable b
* EXPRESSION
 44:    LDC  3,3(6)	Load integer constant 
 45:     ST  3,-4(1)	Store variable c
* TOFF set: -8
* FOR
 46:     LD  3,-2(1)	Load variable a
 47:     ST  3,-5(1)	save starting value in index variable 
 48:     LD  3,-3(1)	Load variable b
 49:     ST  3,-6(1)	save stop value 
 50:     LD  3,-4(1)	Load variable c
 51:     ST  3,-7(1)	save step value 
 52:     LD  4,-5(1)	loop index 
 53:     LD  5,-6(1)	stop value 
 54:     LD  3,-7(1)	step value 
 55:    SLT  3,4,5	Op < 
 56:    JNZ  3,1(7)	Jump to loop body 
* COMPOUND
* TOFF set: -8
* Compound Body
* EXPRESSION
 58:    LDC  3,1000(6)	Load integer constant 
 59:     ST  3,-5(1)	Store variable i
* EXPRESSION
 60:    LDC  3,300(6)	Load integer constant 
 61:     ST  3,-2(1)	Store variable a
* EXPRESSION
 62:    LDC  3,200(6)	Load integer constant 
 63:     ST  3,-3(1)	Store variable b
* EXPRESSION
 64:    LDC  3,100(6)	Load integer constant 
 65:     ST  3,-4(1)	Store variable c
* EXPRESSION
* CALL output
 66:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
 67:     LD  3,-5(1)	Load variable i
 68:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
 69:    LDA  1,-8(1)	Ghost frame becomes new active frame 
 70:    LDA  3,1(7)	Return address in ac 
 71:    JMP  7,-66(7)	CALL output
 72:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL outnl
 73:     ST  1,-8(1)	Store fp in ghost frame for outnl
* TOFF dec: -9
* TOFF dec: -10
* Param end outnl
 74:    LDA  1,-8(1)	Ghost frame becomes new active frame 
 75:    LDA  3,1(7)	Return address in ac 
 76:    JMP  7,-43(7)	CALL outnl
 77:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -8
* TOFF set: -8
* END COMPOUND
* Bottom of loop increment and jump
 78:     LD  3,-5(1)	Load index 
 79:     LD  5,-7(1)	Load step 
 80:    ADD  3,3,5	increment 
 81:     ST  3,-5(1)	store back to index 
 82:    JMP  7,-31(7)	go to beginning of loop 
 57:    JMP  7,25(7)	Jump past loop [backpatch] 
* END LOOP
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
 83:    LDC  2,0(6)	Set return value to 0 
 84:     LD  3,-1(1)	Load return address 
 85:     LD  1,0(1)	Adjust fp 
 86:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,86(7)	Jump to init [backpatch] 
* INIT
 87:    LDA  1,0(0)	set first frame at end of globals 
 88:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 89:    LDA  3,1(7)	Return address in ac 
 90:    JMP  7,-52(7)	Jump to main 
 91:   HALT  0,0,0	DONE! 
* END INIT
