* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  c05.c-
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
* EXPRESSION
 40:    LDC  3,2(6)	Load integer constant 
 41:     ST  3,-2(1)	Push index 
* TOFF dec: -3
 42:    LDC  3,73(6)	Load integer constant 
* TOFF inc: -2
 43:     LD  4,-2(1)	Pop index 
 44:    LDA  5,-1(0)	Load address of base of array x
 45:    SUB  5,5,4	Compute offset of value 
 46:     ST  3,0(5)	Store variable x
* EXPRESSION
 47:    LDC  3,1(6)	Load integer constant 
 48:     ST  3,-2(1)	Push index 
* TOFF dec: -3
 49:    LDC  3,211(6)	Load integer constant 
* TOFF inc: -2
 50:     LD  4,-2(1)	Pop index 
 51:    LDA  5,-5(0)	Load address of base of array y
 52:    SUB  5,5,4	Compute offset of value 
 53:     ST  3,0(5)	Store variable y
* EXPRESSION
* CALL output
 54:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 55:    LDA  3,-1(0)	Load address of base of array x
 56:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 57:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -4
 58:     LD  4,-4(1)	Pop left into ac1 
 59:    SUB  3,4,3	compute location from index 
 60:     LD  3,0(3)	Load array element 
 61:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 62:    LDA  3,-5(0)	Load address of base of array y
 63:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 64:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -5
 65:     LD  4,-5(1)	Pop left into ac1 
 66:    SUB  3,4,3	compute location from index 
 67:     LD  3,0(3)	Load array element 
* TOFF inc: -4
 68:     LD  4,-4(1)	Pop left into ac1 
 69:    ADD  3,4,3	Op + 
 70:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
 71:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 72:    LDA  3,1(7)	Return address in ac 
 73:    JMP  7,-68(7)	CALL output
 74:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL outnl
 75:     ST  1,-2(1)	Store fp in ghost frame for outnl
* TOFF dec: -3
* TOFF dec: -4
* Param end outnl
 76:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 77:    LDA  3,1(7)	Return address in ac 
 78:    JMP  7,-45(7)	CALL outnl
 79:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -2
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
 80:    LDC  2,0(6)	Set return value to 0 
 81:     LD  3,-1(1)	Load return address 
 82:     LD  1,0(1)	Adjust fp 
 83:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,83(7)	Jump to init [backpatch] 
* INIT
 84:    LDA  1,-9(0)	set first frame at end of globals 
 85:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
 86:    LDC  3,3(6)	load size of array x
 87:     ST  3,0(0)	save size of array x
 88:    LDC  3,4(6)	load size of array y
 89:     ST  3,-4(0)	save size of array y
* END INIT GLOBALS AND STATICS
 90:    LDA  3,1(7)	Return address in ac 
 91:    JMP  7,-53(7)	Jump to main 
 92:   HALT  0,0,0	DONE! 
* END INIT
