* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  a07.c-
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
* TOFF set: -3
* Compound Body
* EXPRESSION
 40:    LDC  3,341(6)	Load integer constant 
 41:     ST  3,0(0)	Store variable x
* EXPRESSION
 42:    LDC  3,273(6)	Load integer constant 
 43:     ST  3,-2(1)	Store variable y
* EXPRESSION
* CALL output
 44:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 45:     LD  3,0(0)	Load variable x
 46:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 47:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 48:    LDA  3,1(7)	Return address in ac 
 49:    JMP  7,-44(7)	CALL output
 50:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL outnl
 51:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
 52:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 53:    LDA  3,1(7)	Return address in ac 
 54:    JMP  7,-21(7)	CALL outnl
 55:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* EXPRESSION
* CALL output
 56:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 57:     LD  3,-2(1)	Load variable y
 58:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 59:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 60:    LDA  3,1(7)	Return address in ac 
 61:    JMP  7,-56(7)	CALL output
 62:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL outnl
 63:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
 64:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 65:    LDA  3,1(7)	Return address in ac 
 66:    JMP  7,-33(7)	CALL outnl
 67:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
 68:    LDC  2,0(6)	Set return value to 0 
 69:     LD  3,-1(1)	Load return address 
 70:     LD  1,0(1)	Adjust fp 
 71:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,71(7)	Jump to init [backpatch] 
* INIT
 72:    LDA  1,-1(0)	set first frame at end of globals 
 73:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 74:    LDA  3,1(7)	Return address in ac 
 75:    JMP  7,-37(7)	Jump to main 
 76:   HALT  0,0,0	DONE! 
* END INIT
