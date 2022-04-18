* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  k03.c-
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
* TOFF set: -2
* Compound Body
* TOFF set: -5
* FOR
 40:    LDC  3,0(6)	Load integer constant 
 41:     ST  3,-2(1)	save starting value in index variable 
 42:    LDC  3,3(6)	Load integer constant 
 43:     ST  3,-3(1)	save stop value 
 44:    LDC  3,1(6)	default increment by 1 
 45:     ST  3,-4(1)	save step value 
 46:     LD  4,-2(1)	loop index 
 47:     LD  5,-3(1)	stop value 
 48:     LD  3,-4(1)	step value 
 49:    SLT  3,4,5	Op < 
 50:    JNZ  3,1(7)	Jump to loop body 
* COMPOUND
* TOFF set: -5
* Compound Body
* TOFF set: -8
* FOR
 52:    LDC  3,0(6)	Load integer constant 
 53:     ST  3,-5(1)	save starting value in index variable 
 54:    LDC  3,3(6)	Load integer constant 
 55:     ST  3,-6(1)	save stop value 
 56:    LDC  3,1(6)	default increment by 1 
 57:     ST  3,-7(1)	save step value 
 58:     LD  4,-5(1)	loop index 
 59:     LD  5,-6(1)	stop value 
 60:     LD  3,-7(1)	step value 
 61:    SLT  3,4,5	Op < 
 62:    JNZ  3,1(7)	Jump to loop body 
* COMPOUND
* TOFF set: -8
* Compound Body
* EXPRESSION
* CALL output
 64:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
 65:     LD  3,-2(1)	Load variable i
 66:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
 67:    LDA  1,-8(1)	Ghost frame becomes new active frame 
 68:    LDA  3,1(7)	Return address in ac 
 69:    JMP  7,-64(7)	CALL output
 70:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
 71:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
 72:     LD  3,-5(1)	Load variable j
 73:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
 74:    LDA  1,-8(1)	Ghost frame becomes new active frame 
 75:    LDA  3,1(7)	Return address in ac 
 76:    JMP  7,-71(7)	CALL output
 77:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL outnl
 78:     ST  1,-8(1)	Store fp in ghost frame for outnl
* TOFF dec: -9
* TOFF dec: -10
* Param end outnl
 79:    LDA  1,-8(1)	Ghost frame becomes new active frame 
 80:    LDA  3,1(7)	Return address in ac 
 81:    JMP  7,-48(7)	CALL outnl
 82:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -8
* TOFF set: -8
* END COMPOUND
* Bottom of loop increment and jump
 83:     LD  3,-5(1)	Load index 
 84:     LD  5,-7(1)	Load step 
 85:    ADD  3,3,5	increment 
 86:     ST  3,-5(1)	store back to index 
 87:    JMP  7,-30(7)	go to beginning of loop 
 63:    JMP  7,24(7)	Jump past loop [backpatch] 
* END LOOP
* TOFF set: -5
* END COMPOUND
* Bottom of loop increment and jump
 88:     LD  3,-2(1)	Load index 
 89:     LD  5,-4(1)	Load step 
 90:    ADD  3,3,5	increment 
 91:     ST  3,-2(1)	store back to index 
 92:    JMP  7,-47(7)	go to beginning of loop 
 51:    JMP  7,41(7)	Jump past loop [backpatch] 
* END LOOP
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
 93:    LDC  2,0(6)	Set return value to 0 
 94:     LD  3,-1(1)	Load return address 
 95:     LD  1,0(1)	Adjust fp 
 96:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,96(7)	Jump to init [backpatch] 
* INIT
 97:    LDA  1,0(0)	set first frame at end of globals 
 98:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 99:    LDA  3,1(7)	Return address in ac 
100:    JMP  7,-62(7)	Jump to main 
101:   HALT  0,0,0	DONE! 
* END INIT
