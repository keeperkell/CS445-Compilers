* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  c0h.c-
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
* FUNCTION dog
* TOFF set: -3
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
* CALL output
 40:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 41:    LDC  3,3(6)	Load integer constant 
 42:     LD  5,-2(1)	Load address of base of array x
 43:    SUB  5,5,3	Compute offset of value 
 44:     LD  3,0(5)	load lhs variable x
 45:    LDA  3,1(3)	increment value of x
 46:     ST  3,0(5)	Store variable x
 47:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 48:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 49:    LDA  3,1(7)	Return address in ac 
 50:    JMP  7,-45(7)	CALL output
 51:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL outnl
 52:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
 53:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 54:    LDA  3,1(7)	Return address in ac 
 55:    JMP  7,-22(7)	CALL outnl
 56:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* EXPRESSION
* CALL output
 57:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 58:     LD  3,-2(1)	Load address of base of array x
 59:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 60:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -5
 61:     LD  4,-5(1)	Pop left into ac1 
 62:    SUB  3,4,3	compute location from index 
 63:     LD  3,0(3)	Load array element 
 64:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 65:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 66:    LDA  3,1(7)	Return address in ac 
 67:    JMP  7,-62(7)	CALL output
 68:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL outnl
 69:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
 70:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 71:    LDA  3,1(7)	Return address in ac 
 72:    JMP  7,-39(7)	CALL outnl
 73:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* EXPRESSION
* CALL output
 74:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 75:    LDC  3,3(6)	Load integer constant 
 76:     LD  5,-2(1)	Load address of base of array x
 77:    SUB  5,5,3	Compute offset of value 
 78:     LD  3,0(5)	load lhs variable x
 79:    LDA  3,-1(3)	decrement value of x
 80:     ST  3,0(5)	Store variable x
 81:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 82:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 83:    LDA  3,1(7)	Return address in ac 
 84:    JMP  7,-79(7)	CALL output
 85:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL outnl
 86:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
 87:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 88:    LDA  3,1(7)	Return address in ac 
 89:    JMP  7,-56(7)	CALL outnl
 90:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* EXPRESSION
* CALL output
 91:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 92:     LD  3,-2(1)	Load address of base of array x
 93:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 94:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -5
 95:     LD  4,-5(1)	Pop left into ac1 
 96:    SUB  3,4,3	compute location from index 
 97:     LD  3,0(3)	Load array element 
 98:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 99:    LDA  1,-3(1)	Ghost frame becomes new active frame 
100:    LDA  3,1(7)	Return address in ac 
101:    JMP  7,-96(7)	CALL output
102:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL outnl
103:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
104:    LDA  1,-3(1)	Ghost frame becomes new active frame 
105:    LDA  3,1(7)	Return address in ac 
106:    JMP  7,-73(7)	CALL outnl
107:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
108:    LDC  2,0(6)	Set return value to 0 
109:     LD  3,-1(1)	Load return address 
110:     LD  1,0(1)	Adjust fp 
111:    JMP  7,0(3)	Return 
* END FUNCTION dog
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
112:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -10
113:    LDC  3,7(6)	load size of array x
114:     ST  3,-2(1)	save size of array x
* Compound Body
* EXPRESSION
115:    LDC  3,3(6)	Load integer constant 
116:     ST  3,-10(1)	Push index 
* TOFF dec: -11
117:    LDC  3,1023(6)	Load integer constant 
* TOFF inc: -10
118:     LD  4,-10(1)	Pop index 
119:    LDA  5,-3(1)	Load address of base of array x
120:    SUB  5,5,4	Compute offset of value 
121:     ST  3,0(5)	Store variable x
* EXPRESSION
* CALL dog
122:     ST  1,-10(1)	Store fp in ghost frame for dog
* TOFF dec: -11
* TOFF dec: -12
* Param 1
123:    LDA  3,-3(1)	Load address of base of array x
124:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param end dog
125:    LDA  1,-10(1)	Ghost frame becomes new active frame 
126:    LDA  3,1(7)	Return address in ac 
127:    JMP  7,-89(7)	CALL dog
128:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -10
* EXPRESSION
* CALL output
129:     ST  1,-10(1)	Store fp in ghost frame for output
* TOFF dec: -11
* TOFF dec: -12
* Param 1
130:    LDA  3,-3(1)	Load address of base of array x
131:     ST  3,-12(1)	Push left side 
* TOFF dec: -13
132:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -12
133:     LD  4,-12(1)	Pop left into ac1 
134:    SUB  3,4,3	compute location from index 
135:     LD  3,0(3)	Load array element 
136:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param end output
137:    LDA  1,-10(1)	Ghost frame becomes new active frame 
138:    LDA  3,1(7)	Return address in ac 
139:    JMP  7,-134(7)	CALL output
140:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -10
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
141:    LDC  2,0(6)	Set return value to 0 
142:     LD  3,-1(1)	Load return address 
143:     LD  1,0(1)	Adjust fp 
144:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,144(7)	Jump to init [backpatch] 
* INIT
145:    LDA  1,0(0)	set first frame at end of globals 
146:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
147:    LDA  3,1(7)	Return address in ac 
148:    JMP  7,-37(7)	Jump to main 
149:   HALT  0,0,0	DONE! 
* END INIT
