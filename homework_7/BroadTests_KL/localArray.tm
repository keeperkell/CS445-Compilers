* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  localArray.c-
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
* TOFF set: -11
 40:    LDC  3,3(6)	load size of array x
 41:     ST  3,-2(1)	save size of array x
 42:    LDC  3,4(6)	load size of array b
 43:     ST  3,-6(1)	save size of array b
* Compound Body
* EXPRESSION
 44:    LDC  3,2(6)	Load integer constant 
 45:     ST  3,-11(1)	Push index 
* TOFF dec: -12
 46:    LDC  3,666(6)	Load integer constant 
* TOFF inc: -11
 47:     LD  4,-11(1)	Pop index 
 48:    LDA  5,-3(1)	Load address of base of array x
 49:    SUB  5,5,4	Compute offset of value 
 50:     ST  3,0(5)	Store variable x
* EXPRESSION
 51:    LDC  3,3(6)	Load integer constant 
 52:     ST  3,-11(1)	Push index 
* TOFF dec: -12
 53:    LDC  3,1(6)	Load Boolean constant 
* TOFF inc: -11
 54:     LD  4,-11(1)	Pop index 
 55:    LDA  5,-7(1)	Load address of base of array b
 56:    SUB  5,5,4	Compute offset of value 
 57:     ST  3,0(5)	Store variable b
* EXPRESSION
* CALL output
 58:     ST  1,-11(1)	Store fp in ghost frame for output
* TOFF dec: -12
* TOFF dec: -13
* Param 1
 59:    LDA  3,-3(1)	Load address of base of array x
 60:     ST  3,-13(1)	Push left side 
* TOFF dec: -14
 61:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -13
 62:     LD  4,-13(1)	Pop left into ac1 
 63:    SUB  3,4,3	compute location from index 
 64:     LD  3,0(3)	Load array element 
 65:     ST  3,-13(1)	Push parameter 
* TOFF dec: -14
* Param end output
 66:    LDA  1,-11(1)	Ghost frame becomes new active frame 
 67:    LDA  3,1(7)	Return address in ac 
 68:    JMP  7,-63(7)	CALL output
 69:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -11
* EXPRESSION
* CALL outputb
 70:     ST  1,-11(1)	Store fp in ghost frame for outputb
* TOFF dec: -12
* TOFF dec: -13
* Param 1
 71:    LDA  3,-7(1)	Load address of base of array b
 72:     ST  3,-13(1)	Push left side 
* TOFF dec: -14
 73:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -13
 74:     LD  4,-13(1)	Pop left into ac1 
 75:    SUB  3,4,3	compute location from index 
 76:     LD  3,0(3)	Load array element 
 77:     ST  3,-13(1)	Push parameter 
* TOFF dec: -14
* Param end outputb
 78:    LDA  1,-11(1)	Ghost frame becomes new active frame 
 79:    LDA  3,1(7)	Return address in ac 
 80:    JMP  7,-64(7)	CALL outputb
 81:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -11
* RETURN
 82:     LD  3,-1(1)	Load return address 
 83:     LD  1,0(1)	Adjust fp 
 84:    JMP  7,0(3)	Return 
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
 85:    LDC  2,0(6)	Set return value to 0 
 86:     LD  3,-1(1)	Load return address 
 87:     LD  1,0(1)	Adjust fp 
 88:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,88(7)	Jump to init [backpatch] 
* INIT
 89:    LDA  1,0(0)	set first frame at end of globals 
 90:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 91:    LDA  3,1(7)	Return address in ac 
 92:    JMP  7,-54(7)	Jump to main 
 93:   HALT  0,0,0	DONE! 
* END INIT
