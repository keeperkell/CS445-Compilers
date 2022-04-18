* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  array1.c-
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
* FUNCTION ford
* TOFF set: -4
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -27
 40:    LDC  3,22(6)	load size of array z
 41:     ST  3,-4(1)	save size of array z
* Compound Body
* EXPRESSION
 42:     LD  3,-2(1)	Load address of base of array x
 43:     LD  3,1(3)	Load array size 
* EXPRESSION
 44:    LDC  3,11(6)	Load integer constant 
 45:     ST  3,-27(1)	Push index 
* TOFF dec: -28
 46:     LD  3,-2(1)	Load address of base of array x
 47:     ST  3,-28(1)	Push left side 
* TOFF dec: -29
 48:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -28
 49:     LD  4,-28(1)	Pop left into ac1 
 50:    SUB  3,4,3	compute location from index 
 51:     LD  3,0(3)	Load array element 
* TOFF inc: -27
 52:     LD  4,-27(1)	Pop index 
 53:    LDA  5,-5(1)	Load address of base of array z
 54:    SUB  5,5,4	Compute offset of value 
 55:     ST  3,0(5)	Store variable z
* EXPRESSION
 56:    LDC  3,3(6)	Load integer constant 
 57:     ST  3,-27(1)	Push index 
* TOFF dec: -28
 58:    LDC  3,777(6)	Load integer constant 
* TOFF inc: -27
 59:     LD  4,-27(1)	Pop index 
 60:     LD  5,-2(1)	Load address of base of array x
 61:    SUB  5,5,4	Compute offset of value 
 62:     ST  3,0(5)	Store variable x
* TOFF set: -4
* END COMPOUND
* Add standard closing in case there is no return statement
 63:    LDC  2,0(6)	Set return value to 0 
 64:     LD  3,-1(1)	Load return address 
 65:     LD  1,0(1)	Adjust fp 
 66:    JMP  7,0(3)	Return 
* END FUNCTION ford
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
 67:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -36
 68:    LDC  3,33(6)	load size of array y
 69:     ST  3,-2(1)	save size of array y
* Compound Body
* EXPRESSION
 70:    LDC  3,3(6)	Load integer constant 
 71:     ST  3,-36(1)	Push index 
* TOFF dec: -37
 72:    LDC  3,666(6)	Load integer constant 
* TOFF inc: -36
 73:     LD  4,-36(1)	Pop index 
 74:    LDA  5,-3(1)	Load address of base of array y
 75:    SUB  5,5,4	Compute offset of value 
 76:     ST  3,0(5)	Store variable y
* EXPRESSION
* CALL ford
 77:     ST  1,-36(1)	Store fp in ghost frame for ford
* TOFF dec: -37
* TOFF dec: -38
* Param 1
 78:    LDA  3,-3(1)	Load address of base of array y
 79:     ST  3,-38(1)	Push parameter 
* TOFF dec: -39
* Param 2
 80:    LDA  3,-3(1)	Load address of base of array y
 81:     ST  3,-39(1)	Push parameter 
* TOFF dec: -40
* Param end ford
 82:    LDA  1,-36(1)	Ghost frame becomes new active frame 
 83:    LDA  3,1(7)	Return address in ac 
 84:    JMP  7,-46(7)	CALL ford
 85:    LDA  3,0(2)	Save the result in ac 
* Call end ford
* TOFF set: -36
* EXPRESSION
* CALL output
 86:     ST  1,-36(1)	Store fp in ghost frame for output
* TOFF dec: -37
* TOFF dec: -38
* Param 1
 87:    LDA  3,-3(1)	Load address of base of array y
 88:     ST  3,-38(1)	Push left side 
* TOFF dec: -39
 89:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -38
 90:     LD  4,-38(1)	Pop left into ac1 
 91:    SUB  3,4,3	compute location from index 
 92:     LD  3,0(3)	Load array element 
 93:     ST  3,-38(1)	Push parameter 
* TOFF dec: -39
* Param end output
 94:    LDA  1,-36(1)	Ghost frame becomes new active frame 
 95:    LDA  3,1(7)	Return address in ac 
 96:    JMP  7,-91(7)	CALL output
 97:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -36
* EXPRESSION
* CALL outnl
 98:     ST  1,-36(1)	Store fp in ghost frame for outnl
* TOFF dec: -37
* TOFF dec: -38
* Param end outnl
 99:    LDA  1,-36(1)	Ghost frame becomes new active frame 
100:    LDA  3,1(7)	Return address in ac 
101:    JMP  7,-68(7)	CALL outnl
102:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -36
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
103:    LDC  2,0(6)	Set return value to 0 
104:     LD  3,-1(1)	Load return address 
105:     LD  1,0(1)	Adjust fp 
106:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,106(7)	Jump to init [backpatch] 
* INIT
107:    LDA  1,0(0)	set first frame at end of globals 
108:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
109:    LDA  3,1(7)	Return address in ac 
110:    JMP  7,-44(7)	Jump to main 
111:   HALT  0,0,0	DONE! 
* END INIT
