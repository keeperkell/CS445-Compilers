* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  c14.c-
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
* TOFF set: -13
 40:    LDC  3,3(6)	load size of array x
 41:     ST  3,-2(1)	save size of array x
 42:    LDC  3,4(6)	load size of array y
 43:     ST  3,-6(1)	save size of array y
* Compound Body
* EXPRESSION
 44:    LDC  3,1(6)	Load integer constant 
 45:     ST  3,-11(1)	Store variable z
* EXPRESSION
 46:    LDC  3,2(6)	Load integer constant 
 47:     ST  3,-12(1)	Store variable zz
* EXPRESSION
 48:     LD  3,-12(1)	Load variable zz
 49:     ST  3,-13(1)	Push index 
* TOFF dec: -14
 50:    LDC  3,73(6)	Load integer constant 
* TOFF inc: -13
 51:     LD  4,-13(1)	Pop index 
 52:    LDA  5,-3(1)	Load address of base of array x
 53:    SUB  5,5,4	Compute offset of value 
 54:     ST  3,0(5)	Store variable x
* EXPRESSION
 55:     LD  3,-11(1)	Load variable z
 56:     ST  3,-13(1)	Push index 
* TOFF dec: -14
 57:    LDC  3,211(6)	Load integer constant 
* TOFF inc: -13
 58:     LD  4,-13(1)	Pop index 
 59:    LDA  5,-7(1)	Load address of base of array y
 60:    SUB  5,5,4	Compute offset of value 
 61:     ST  3,0(5)	Store variable y
* EXPRESSION
* CALL output
 62:     ST  1,-13(1)	Store fp in ghost frame for output
* TOFF dec: -14
* TOFF dec: -15
* Param 1
 63:    LDA  3,-3(1)	Load address of base of array x
 64:     ST  3,-15(1)	Push left side 
* TOFF dec: -16
 65:     LD  3,-12(1)	Load variable zz
* TOFF inc: -15
 66:     LD  4,-15(1)	Pop left into ac1 
 67:    SUB  3,4,3	compute location from index 
 68:     LD  3,0(3)	Load array element 
 69:     ST  3,-15(1)	Push left side 
* TOFF dec: -16
 70:    LDA  3,-7(1)	Load address of base of array y
 71:     ST  3,-16(1)	Push left side 
* TOFF dec: -17
 72:     LD  3,-11(1)	Load variable z
* TOFF inc: -16
 73:     LD  4,-16(1)	Pop left into ac1 
 74:    SUB  3,4,3	compute location from index 
 75:     LD  3,0(3)	Load array element 
* TOFF inc: -15
 76:     LD  4,-15(1)	Pop left into ac1 
 77:    ADD  3,4,3	Op + 
 78:     ST  3,-15(1)	Push parameter 
* TOFF dec: -16
* Param end output
 79:    LDA  1,-13(1)	Ghost frame becomes new active frame 
 80:    LDA  3,1(7)	Return address in ac 
 81:    JMP  7,-76(7)	CALL output
 82:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -13
* EXPRESSION
* CALL outnl
 83:     ST  1,-13(1)	Store fp in ghost frame for outnl
* TOFF dec: -14
* TOFF dec: -15
* Param end outnl
 84:    LDA  1,-13(1)	Ghost frame becomes new active frame 
 85:    LDA  3,1(7)	Return address in ac 
 86:    JMP  7,-53(7)	CALL outnl
 87:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -13
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
 88:    LDC  2,0(6)	Set return value to 0 
 89:     LD  3,-1(1)	Load return address 
 90:     LD  1,0(1)	Adjust fp 
 91:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,91(7)	Jump to init [backpatch] 
* INIT
 92:    LDA  1,0(0)	set first frame at end of globals 
 93:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 94:    LDA  3,1(7)	Return address in ac 
 95:    JMP  7,-57(7)	Jump to main 
 96:   HALT  0,0,0	DONE! 
* END INIT
