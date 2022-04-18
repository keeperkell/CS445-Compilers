* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  c0f.c-
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
* TOFF set: -10
 40:    LDC  3,7(6)	load size of array x
 41:     ST  3,-2(1)	save size of array x
* Compound Body
* EXPRESSION
 42:    LDC  3,3(6)	Load integer constant 
 43:     ST  3,-10(1)	Push index 
* TOFF dec: -11
 44:    LDC  3,1023(6)	Load integer constant 
* TOFF inc: -10
 45:     LD  4,-10(1)	Pop index 
 46:    LDA  5,-3(1)	Load address of base of array x
 47:    SUB  5,5,4	Compute offset of value 
 48:     ST  3,0(5)	Store variable x
* EXPRESSION
* CALL output
 49:     ST  1,-10(1)	Store fp in ghost frame for output
* TOFF dec: -11
* TOFF dec: -12
* Param 1
 50:    LDC  3,3(6)	Load integer constant 
 51:    LDA  5,-3(1)	Load address of base of array x
 52:    SUB  5,5,3	Compute offset of value 
 53:     LD  3,0(5)	load lhs variable x
 54:    LDA  3,1(3)	increment value of x
 55:     ST  3,0(5)	Store variable x
 56:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param end output
 57:    LDA  1,-10(1)	Ghost frame becomes new active frame 
 58:    LDA  3,1(7)	Return address in ac 
 59:    JMP  7,-54(7)	CALL output
 60:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -10
* EXPRESSION
* CALL outnl
 61:     ST  1,-10(1)	Store fp in ghost frame for outnl
* TOFF dec: -11
* TOFF dec: -12
* Param end outnl
 62:    LDA  1,-10(1)	Ghost frame becomes new active frame 
 63:    LDA  3,1(7)	Return address in ac 
 64:    JMP  7,-31(7)	CALL outnl
 65:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -10
* EXPRESSION
* CALL output
 66:     ST  1,-10(1)	Store fp in ghost frame for output
* TOFF dec: -11
* TOFF dec: -12
* Param 1
 67:    LDA  3,-3(1)	Load address of base of array x
 68:     ST  3,-12(1)	Push left side 
* TOFF dec: -13
 69:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -12
 70:     LD  4,-12(1)	Pop left into ac1 
 71:    SUB  3,4,3	compute location from index 
 72:     LD  3,0(3)	Load array element 
 73:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param end output
 74:    LDA  1,-10(1)	Ghost frame becomes new active frame 
 75:    LDA  3,1(7)	Return address in ac 
 76:    JMP  7,-71(7)	CALL output
 77:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -10
* EXPRESSION
* CALL outnl
 78:     ST  1,-10(1)	Store fp in ghost frame for outnl
* TOFF dec: -11
* TOFF dec: -12
* Param end outnl
 79:    LDA  1,-10(1)	Ghost frame becomes new active frame 
 80:    LDA  3,1(7)	Return address in ac 
 81:    JMP  7,-48(7)	CALL outnl
 82:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -10
* EXPRESSION
* CALL output
 83:     ST  1,-10(1)	Store fp in ghost frame for output
* TOFF dec: -11
* TOFF dec: -12
* Param 1
 84:    LDC  3,3(6)	Load integer constant 
 85:    LDA  5,-3(1)	Load address of base of array x
 86:    SUB  5,5,3	Compute offset of value 
 87:     LD  3,0(5)	load lhs variable x
 88:    LDA  3,-1(3)	decrement value of x
 89:     ST  3,0(5)	Store variable x
 90:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param end output
 91:    LDA  1,-10(1)	Ghost frame becomes new active frame 
 92:    LDA  3,1(7)	Return address in ac 
 93:    JMP  7,-88(7)	CALL output
 94:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -10
* EXPRESSION
* CALL outnl
 95:     ST  1,-10(1)	Store fp in ghost frame for outnl
* TOFF dec: -11
* TOFF dec: -12
* Param end outnl
 96:    LDA  1,-10(1)	Ghost frame becomes new active frame 
 97:    LDA  3,1(7)	Return address in ac 
 98:    JMP  7,-65(7)	CALL outnl
 99:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -10
* EXPRESSION
* CALL output
100:     ST  1,-10(1)	Store fp in ghost frame for output
* TOFF dec: -11
* TOFF dec: -12
* Param 1
101:    LDA  3,-3(1)	Load address of base of array x
102:     ST  3,-12(1)	Push left side 
* TOFF dec: -13
103:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -12
104:     LD  4,-12(1)	Pop left into ac1 
105:    SUB  3,4,3	compute location from index 
106:     LD  3,0(3)	Load array element 
107:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param end output
108:    LDA  1,-10(1)	Ghost frame becomes new active frame 
109:    LDA  3,1(7)	Return address in ac 
110:    JMP  7,-105(7)	CALL output
111:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -10
* EXPRESSION
* CALL outnl
112:     ST  1,-10(1)	Store fp in ghost frame for outnl
* TOFF dec: -11
* TOFF dec: -12
* Param end outnl
113:    LDA  1,-10(1)	Ghost frame becomes new active frame 
114:    LDA  3,1(7)	Return address in ac 
115:    JMP  7,-82(7)	CALL outnl
116:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -10
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
117:    LDC  2,0(6)	Set return value to 0 
118:     LD  3,-1(1)	Load return address 
119:     LD  1,0(1)	Adjust fp 
120:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,120(7)	Jump to init [backpatch] 
* INIT
121:    LDA  1,0(0)	set first frame at end of globals 
122:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
123:    LDA  3,1(7)	Return address in ac 
124:    JMP  7,-86(7)	Jump to main 
125:   HALT  0,0,0	DONE! 
* END INIT
