* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  k07.c-
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
 46:    LDC  3,2(6)	Load integer constant 
 47:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
 48:     LD  3,-2(1)	Load variable a
* TOFF inc: -8
 49:     LD  4,-8(1)	Pop left into ac1 
 50:    MUL  3,4,3	Op * 
 51:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
 52:    LDC  3,100(6)	Load integer constant 
* TOFF inc: -8
 53:     LD  4,-8(1)	Pop left into ac1 
 54:    ADD  3,4,3	Op + 
 55:     ST  3,-5(1)	save starting value in index variable 
 56:    LDC  3,3(6)	Load integer constant 
 57:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
 58:     LD  3,-3(1)	Load variable b
 59:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
 60:    LDC  3,10(6)	Load integer constant 
* TOFF inc: -9
 61:     LD  4,-9(1)	Pop left into ac1 
 62:    ADD  3,4,3	Op + 
* TOFF inc: -8
 63:     LD  4,-8(1)	Pop left into ac1 
 64:    MUL  3,4,3	Op * 
 65:     ST  3,-6(1)	save stop value 
 66:    LDC  3,2(6)	Load integer constant 
 67:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
 68:     LD  3,-4(1)	Load variable c
* TOFF inc: -8
 69:     LD  4,-8(1)	Pop left into ac1 
 70:    MUL  3,4,3	Op * 
 71:     ST  3,-7(1)	save step value 
 72:     LD  4,-5(1)	loop index 
 73:     LD  5,-6(1)	stop value 
 74:     LD  3,-7(1)	step value 
 75:    SLT  3,4,5	Op < 
 76:    JNZ  3,1(7)	Jump to loop body 
* COMPOUND
* TOFF set: -8
* Compound Body
* EXPRESSION
 78:    LDC  3,300(6)	Load integer constant 
 79:     ST  3,-2(1)	Store variable a
* EXPRESSION
 80:    LDC  3,200(6)	Load integer constant 
 81:     ST  3,-3(1)	Store variable b
* EXPRESSION
 82:    LDC  3,100(6)	Load integer constant 
 83:     ST  3,-4(1)	Store variable c
* EXPRESSION
* CALL output
 84:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
 85:     LD  3,-5(1)	Load variable i
 86:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
 87:    LDA  1,-8(1)	Ghost frame becomes new active frame 
 88:    LDA  3,1(7)	Return address in ac 
 89:    JMP  7,-84(7)	CALL output
 90:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL outnl
 91:     ST  1,-8(1)	Store fp in ghost frame for outnl
* TOFF dec: -9
* TOFF dec: -10
* Param end outnl
 92:    LDA  1,-8(1)	Ghost frame becomes new active frame 
 93:    LDA  3,1(7)	Return address in ac 
 94:    JMP  7,-61(7)	CALL outnl
 95:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -8
* TOFF set: -8
* END COMPOUND
* Bottom of loop increment and jump
 96:     LD  3,-5(1)	Load index 
 97:     LD  5,-7(1)	Load step 
 98:    ADD  3,3,5	increment 
 99:     ST  3,-5(1)	store back to index 
100:    JMP  7,-29(7)	go to beginning of loop 
 77:    JMP  7,23(7)	Jump past loop [backpatch] 
* END LOOP
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
101:    LDC  2,0(6)	Set return value to 0 
102:     LD  3,-1(1)	Load return address 
103:     LD  1,0(1)	Adjust fp 
104:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,104(7)	Jump to init [backpatch] 
* INIT
105:    LDA  1,0(0)	set first frame at end of globals 
106:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
107:    LDA  3,1(7)	Return address in ac 
108:    JMP  7,-70(7)	Jump to main 
109:   HALT  0,0,0	DONE! 
* END INIT
