* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  examplearray3.c-
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
* FUNCTION cat
* TOFF set: -3
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -4
 40:    LDC  3,9999(6)	Load integer constant 
 41:     ST  3,-3(1)	Store variable q
* Compound Body
* EXPRESSION
* CALL output
 42:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 43:     LD  3,-2(1)	Load address of base of array x
 44:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
 45:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -6
 46:     LD  4,-6(1)	Pop left into ac1 
 47:    SUB  3,4,3	compute location from index 
 48:     LD  3,0(3)	Load array element 
 49:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
 50:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 51:    LDA  3,1(7)	Return address in ac 
 52:    JMP  7,-47(7)	CALL output
 53:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
 54:    LDC  2,0(6)	Set return value to 0 
 55:     LD  3,-1(1)	Load return address 
 56:     LD  1,0(1)	Adjust fp 
 57:    JMP  7,0(3)	Return 
* END FUNCTION cat
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION dog
* TOFF set: -3
 58:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -4
 59:    LDC  3,9999(6)	Load integer constant 
 60:     ST  3,-3(1)	Store variable q
* Compound Body
* EXPRESSION
* CALL cat
 61:     ST  1,-4(1)	Store fp in ghost frame for cat
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 62:     LD  3,-2(1)	Load address of base of array y
 63:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end cat
 64:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 65:    LDA  3,1(7)	Return address in ac 
 66:    JMP  7,-28(7)	CALL cat
 67:    LDA  3,0(2)	Save the result in ac 
* Call end cat
* TOFF set: -4
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
 68:    LDC  2,0(6)	Set return value to 0 
 69:     LD  3,-1(1)	Load return address 
 70:     LD  1,0(1)	Adjust fp 
 71:    JMP  7,0(3)	Return 
* END FUNCTION dog
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
 72:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -14
 73:    LDC  3,9999(6)	Load integer constant 
 74:     ST  3,-2(1)	Store variable q
 75:    LDC  3,10(6)	load size of array z
 76:     ST  3,-3(1)	save size of array z
* Compound Body
* EXPRESSION
 77:    LDC  3,1(6)	Load integer constant 
 78:     ST  3,-14(1)	Push index 
* TOFF dec: -15
 79:    LDC  3,777(6)	Load integer constant 
* TOFF inc: -14
 80:     LD  4,-14(1)	Pop index 
 81:    LDA  5,-4(1)	Load address of base of array z
 82:    SUB  5,5,4	Compute offset of value 
 83:     ST  3,0(5)	Store variable z
* EXPRESSION
* CALL dog
 84:     ST  1,-14(1)	Store fp in ghost frame for dog
* TOFF dec: -15
* TOFF dec: -16
* Param 1
 85:    LDA  3,-4(1)	Load address of base of array z
 86:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param end dog
 87:    LDA  1,-14(1)	Ghost frame becomes new active frame 
 88:    LDA  3,1(7)	Return address in ac 
 89:    JMP  7,-32(7)	CALL dog
 90:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -14
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
 91:    LDC  2,0(6)	Set return value to 0 
 92:     LD  3,-1(1)	Load return address 
 93:     LD  1,0(1)	Adjust fp 
 94:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,94(7)	Jump to init [backpatch] 
* INIT
 95:    LDA  1,0(0)	set first frame at end of globals 
 96:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 97:    LDA  3,1(7)	Return address in ac 
 98:    JMP  7,-27(7)	Jump to main 
 99:   HALT  0,0,0	DONE! 
* END INIT
