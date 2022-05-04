* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  c16.c-
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
* TOFF set: -4
* Compound Body
* EXPRESSION
 40:    LDC  3,1(6)	Load integer constant 
 41:     ST  3,-2(1)	Store variable z
* EXPRESSION
 42:    LDC  3,2(6)	Load integer constant 
 43:     ST  3,-3(1)	Store variable zz
* EXPRESSION
 44:     LD  3,-3(1)	Load variable zz
 45:     ST  3,-4(1)	Push index 
* TOFF dec: -5
 46:    LDC  3,73(6)	Load integer constant 
* TOFF inc: -4
 47:     LD  4,-4(1)	Pop index 
 48:    LDA  5,-1(0)	Load address of base of array x
 49:    SUB  5,5,4	Compute offset of value 
 50:     ST  3,0(5)	Store variable x
* EXPRESSION
 51:     LD  3,-2(1)	Load variable z
 52:     ST  3,-4(1)	Push index 
* TOFF dec: -5
 53:    LDC  3,211(6)	Load integer constant 
* TOFF inc: -4
 54:     LD  4,-4(1)	Pop index 
 55:    LDA  5,-5(0)	Load address of base of array y
 56:    SUB  5,5,4	Compute offset of value 
 57:     ST  3,0(5)	Store variable y
* EXPRESSION
* CALL output
 58:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 59:    LDA  3,-1(0)	Load address of base of array x
 60:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
 61:    LDC  3,33(6)	Load integer constant 
 62:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
 63:    LDC  3,31(6)	Load integer constant 
* TOFF inc: -7
 64:     LD  4,-7(1)	Pop left into ac1 
 65:    SUB  3,4,3	Op - 
* TOFF inc: -6
 66:     LD  4,-6(1)	Pop left into ac1 
 67:    SUB  3,4,3	compute location from index 
 68:     LD  3,0(3)	Load array element 
 69:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
 70:    LDA  3,-5(0)	Load address of base of array y
 71:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
 72:    LDC  3,9123(6)	Load integer constant 
 73:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
 74:    LDC  3,9100(6)	Load integer constant 
 75:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
 76:    LDC  3,23(6)	Load integer constant 
* TOFF inc: -9
 77:     LD  4,-9(1)	Pop left into ac1 
 78:    ADD  3,4,3	Op + 
* TOFF inc: -8
 79:     LD  4,-8(1)	Pop left into ac1 
 80:    DIV  3,4,3	Op / 
* TOFF inc: -7
 81:     LD  4,-7(1)	Pop left into ac1 
 82:    SUB  3,4,3	compute location from index 
 83:     LD  3,0(3)	Load array element 
* TOFF inc: -6
 84:     LD  4,-6(1)	Pop left into ac1 
 85:    ADD  3,4,3	Op + 
 86:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
 87:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 88:    LDA  3,1(7)	Return address in ac 
 89:    JMP  7,-84(7)	CALL output
 90:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
* CALL outnl
 91:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
 92:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 93:    LDA  3,1(7)	Return address in ac 
 94:    JMP  7,-61(7)	CALL outnl
 95:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
 96:    LDC  2,0(6)	Set return value to 0 
 97:     LD  3,-1(1)	Load return address 
 98:     LD  1,0(1)	Adjust fp 
 99:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,99(7)	Jump to init [backpatch] 
* INIT
100:    LDA  1,-9(0)	set first frame at end of globals 
101:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
102:    LDC  3,3(6)	load size of array x
103:     ST  3,0(0)	save size of array x
104:    LDC  3,4(6)	load size of array y
105:     ST  3,-4(0)	save size of array y
* END INIT GLOBALS AND STATICS
106:    LDA  3,1(7)	Return address in ac 
107:    JMP  7,-69(7)	Jump to main 
108:   HALT  0,0,0	DONE! 
* END INIT
