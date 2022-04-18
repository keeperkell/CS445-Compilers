* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  c0g.c-
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
 40:    LDC  3,3(6)	Load integer constant 
 41:     ST  3,-2(1)	Push index 
* TOFF dec: -3
 42:    LDC  3,1023(6)	Load integer constant 
* TOFF inc: -2
 43:     LD  4,-2(1)	Pop index 
 44:    LDA  5,-1(0)	Load address of base of array x
 45:    SUB  5,5,4	Compute offset of value 
 46:     ST  3,0(5)	Store variable x
* EXPRESSION
* CALL output
 47:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 48:    LDC  3,3(6)	Load integer constant 
 49:    LDA  5,-1(0)	Load address of base of array x
 50:    SUB  5,5,3	Compute offset of value 
 51:     LD  3,0(5)	load lhs variable x
 52:    LDA  3,1(3)	increment value of x
 53:     ST  3,0(5)	Store variable x
 54:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
 55:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 56:    LDA  3,1(7)	Return address in ac 
 57:    JMP  7,-52(7)	CALL output
 58:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL outnl
 59:     ST  1,-2(1)	Store fp in ghost frame for outnl
* TOFF dec: -3
* TOFF dec: -4
* Param end outnl
 60:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 61:    LDA  3,1(7)	Return address in ac 
 62:    JMP  7,-29(7)	CALL outnl
 63:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -2
* EXPRESSION
* CALL output
 64:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 65:    LDA  3,-1(0)	Load address of base of array x
 66:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 67:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -4
 68:     LD  4,-4(1)	Pop left into ac1 
 69:    SUB  3,4,3	compute location from index 
 70:     LD  3,0(3)	Load array element 
 71:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
 72:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 73:    LDA  3,1(7)	Return address in ac 
 74:    JMP  7,-69(7)	CALL output
 75:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL outnl
 76:     ST  1,-2(1)	Store fp in ghost frame for outnl
* TOFF dec: -3
* TOFF dec: -4
* Param end outnl
 77:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 78:    LDA  3,1(7)	Return address in ac 
 79:    JMP  7,-46(7)	CALL outnl
 80:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -2
* EXPRESSION
* CALL output
 81:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 82:    LDC  3,3(6)	Load integer constant 
 83:    LDA  5,-1(0)	Load address of base of array x
 84:    SUB  5,5,3	Compute offset of value 
 85:     LD  3,0(5)	load lhs variable x
 86:    LDA  3,-1(3)	decrement value of x
 87:     ST  3,0(5)	Store variable x
 88:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
 89:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 90:    LDA  3,1(7)	Return address in ac 
 91:    JMP  7,-86(7)	CALL output
 92:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL outnl
 93:     ST  1,-2(1)	Store fp in ghost frame for outnl
* TOFF dec: -3
* TOFF dec: -4
* Param end outnl
 94:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 95:    LDA  3,1(7)	Return address in ac 
 96:    JMP  7,-63(7)	CALL outnl
 97:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -2
* EXPRESSION
* CALL output
 98:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 99:    LDA  3,-1(0)	Load address of base of array x
100:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
101:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -4
102:     LD  4,-4(1)	Pop left into ac1 
103:    SUB  3,4,3	compute location from index 
104:     LD  3,0(3)	Load array element 
105:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
106:    LDA  1,-2(1)	Ghost frame becomes new active frame 
107:    LDA  3,1(7)	Return address in ac 
108:    JMP  7,-103(7)	CALL output
109:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL outnl
110:     ST  1,-2(1)	Store fp in ghost frame for outnl
* TOFF dec: -3
* TOFF dec: -4
* Param end outnl
111:    LDA  1,-2(1)	Ghost frame becomes new active frame 
112:    LDA  3,1(7)	Return address in ac 
113:    JMP  7,-80(7)	CALL outnl
114:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -2
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
115:    LDC  2,0(6)	Set return value to 0 
116:     LD  3,-1(1)	Load return address 
117:     LD  1,0(1)	Adjust fp 
118:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,118(7)	Jump to init [backpatch] 
* INIT
119:    LDA  1,-8(0)	set first frame at end of globals 
120:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
121:    LDC  3,7(6)	load size of array x
122:     ST  3,0(0)	save size of array x
* END INIT GLOBALS AND STATICS
123:    LDA  3,1(7)	Return address in ac 
124:    JMP  7,-86(7)	Jump to main 
125:   HALT  0,0,0	DONE! 
* END INIT
