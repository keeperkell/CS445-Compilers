* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  v00.c-
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
* TOFF set: -14
 40:    LDC  3,5(6)	load size of array a
 41:     ST  3,-2(1)	save size of array a
  1:    LIT  "acid"
 42:    LDA  3,-1(0)	Load address of char array 
 43:    LDA  4,-3(1)	address of lhs 
 44:     LD  5,1(3)	size of rhs 
 45:     LD  6,1(4)	size of lhs 
 46:    SWP  5,6,6	pick smallest size 
 47:    MOV  4,3,5	array op = 
 48:    LDC  3,5(6)	load size of array b
 49:     ST  3,-8(1)	save size of array b
* Compound Body
* EXPRESSION
* CALL outputc
 50:     ST  1,-14(1)	Store fp in ghost frame for outputc
* TOFF dec: -15
* TOFF dec: -16
* Param 1
 51:    LDA  3,-3(1)	Load address of base of array a
 52:     ST  3,-16(1)	Push left side 
* TOFF dec: -17
 53:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -16
 54:     LD  4,-16(1)	Pop left into ac1 
 55:    SUB  3,4,3	compute location from index 
 56:     LD  3,0(3)	Load array element 
 57:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param end outputc
 58:    LDA  1,-14(1)	Ghost frame becomes new active frame 
 59:    LDA  3,1(7)	Return address in ac 
 60:    JMP  7,-33(7)	CALL outputc
 61:    LDA  3,0(2)	Save the result in ac 
* Call end outputc
* TOFF set: -14
* EXPRESSION
* CALL outputc
 62:     ST  1,-14(1)	Store fp in ghost frame for outputc
* TOFF dec: -15
* TOFF dec: -16
* Param 1
 63:    LDA  3,-3(1)	Load address of base of array a
 64:     ST  3,-16(1)	Push left side 
* TOFF dec: -17
 65:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -16
 66:     LD  4,-16(1)	Pop left into ac1 
 67:    SUB  3,4,3	compute location from index 
 68:     LD  3,0(3)	Load array element 
 69:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param end outputc
 70:    LDA  1,-14(1)	Ghost frame becomes new active frame 
 71:    LDA  3,1(7)	Return address in ac 
 72:    JMP  7,-45(7)	CALL outputc
 73:    LDA  3,0(2)	Save the result in ac 
* Call end outputc
* TOFF set: -14
* EXPRESSION
* CALL outputc
 74:     ST  1,-14(1)	Store fp in ghost frame for outputc
* TOFF dec: -15
* TOFF dec: -16
* Param 1
 75:    LDA  3,-3(1)	Load address of base of array a
 76:     ST  3,-16(1)	Push left side 
* TOFF dec: -17
 77:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -16
 78:     LD  4,-16(1)	Pop left into ac1 
 79:    SUB  3,4,3	compute location from index 
 80:     LD  3,0(3)	Load array element 
 81:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param end outputc
 82:    LDA  1,-14(1)	Ghost frame becomes new active frame 
 83:    LDA  3,1(7)	Return address in ac 
 84:    JMP  7,-57(7)	CALL outputc
 85:    LDA  3,0(2)	Save the result in ac 
* Call end outputc
* TOFF set: -14
* EXPRESSION
* CALL outputc
 86:     ST  1,-14(1)	Store fp in ghost frame for outputc
* TOFF dec: -15
* TOFF dec: -16
* Param 1
 87:    LDA  3,-3(1)	Load address of base of array a
 88:     ST  3,-16(1)	Push left side 
* TOFF dec: -17
 89:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -16
 90:     LD  4,-16(1)	Pop left into ac1 
 91:    SUB  3,4,3	compute location from index 
 92:     LD  3,0(3)	Load array element 
 93:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param end outputc
 94:    LDA  1,-14(1)	Ghost frame becomes new active frame 
 95:    LDA  3,1(7)	Return address in ac 
 96:    JMP  7,-69(7)	CALL outputc
 97:    LDA  3,0(2)	Save the result in ac 
* Call end outputc
* TOFF set: -14
* EXPRESSION
* CALL outnl
 98:     ST  1,-14(1)	Store fp in ghost frame for outnl
* TOFF dec: -15
* TOFF dec: -16
* Param end outnl
 99:    LDA  1,-14(1)	Ghost frame becomes new active frame 
100:    LDA  3,1(7)	Return address in ac 
101:    JMP  7,-68(7)	CALL outnl
102:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -14
* EXPRESSION
103:    LDA  3,-3(1)	Load address of base of array a
104:    LDA  4,-9(1)	address of lhs 
105:     LD  5,1(3)	size of rhs 
106:     LD  6,1(4)	size of lhs 
107:    SWP  5,6,6	pick smallest size 
108:    MOV  4,3,5	array op = 
* EXPRESSION
* CALL outputc
109:     ST  1,-14(1)	Store fp in ghost frame for outputc
* TOFF dec: -15
* TOFF dec: -16
* Param 1
110:    LDA  3,-9(1)	Load address of base of array b
111:     ST  3,-16(1)	Push left side 
* TOFF dec: -17
112:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -16
113:     LD  4,-16(1)	Pop left into ac1 
114:    SUB  3,4,3	compute location from index 
115:     LD  3,0(3)	Load array element 
116:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param end outputc
117:    LDA  1,-14(1)	Ghost frame becomes new active frame 
118:    LDA  3,1(7)	Return address in ac 
119:    JMP  7,-92(7)	CALL outputc
120:    LDA  3,0(2)	Save the result in ac 
* Call end outputc
* TOFF set: -14
* EXPRESSION
* CALL outputc
121:     ST  1,-14(1)	Store fp in ghost frame for outputc
* TOFF dec: -15
* TOFF dec: -16
* Param 1
122:    LDA  3,-9(1)	Load address of base of array b
123:     ST  3,-16(1)	Push left side 
* TOFF dec: -17
124:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -16
125:     LD  4,-16(1)	Pop left into ac1 
126:    SUB  3,4,3	compute location from index 
127:     LD  3,0(3)	Load array element 
128:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param end outputc
129:    LDA  1,-14(1)	Ghost frame becomes new active frame 
130:    LDA  3,1(7)	Return address in ac 
131:    JMP  7,-104(7)	CALL outputc
132:    LDA  3,0(2)	Save the result in ac 
* Call end outputc
* TOFF set: -14
* EXPRESSION
* CALL outputc
133:     ST  1,-14(1)	Store fp in ghost frame for outputc
* TOFF dec: -15
* TOFF dec: -16
* Param 1
134:    LDA  3,-9(1)	Load address of base of array b
135:     ST  3,-16(1)	Push left side 
* TOFF dec: -17
136:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -16
137:     LD  4,-16(1)	Pop left into ac1 
138:    SUB  3,4,3	compute location from index 
139:     LD  3,0(3)	Load array element 
140:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param end outputc
141:    LDA  1,-14(1)	Ghost frame becomes new active frame 
142:    LDA  3,1(7)	Return address in ac 
143:    JMP  7,-116(7)	CALL outputc
144:    LDA  3,0(2)	Save the result in ac 
* Call end outputc
* TOFF set: -14
* EXPRESSION
* CALL outputc
145:     ST  1,-14(1)	Store fp in ghost frame for outputc
* TOFF dec: -15
* TOFF dec: -16
* Param 1
146:    LDA  3,-9(1)	Load address of base of array b
147:     ST  3,-16(1)	Push left side 
* TOFF dec: -17
148:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -16
149:     LD  4,-16(1)	Pop left into ac1 
150:    SUB  3,4,3	compute location from index 
151:     LD  3,0(3)	Load array element 
152:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param end outputc
153:    LDA  1,-14(1)	Ghost frame becomes new active frame 
154:    LDA  3,1(7)	Return address in ac 
155:    JMP  7,-128(7)	CALL outputc
156:    LDA  3,0(2)	Save the result in ac 
* Call end outputc
* TOFF set: -14
* EXPRESSION
* CALL outnl
157:     ST  1,-14(1)	Store fp in ghost frame for outnl
* TOFF dec: -15
* TOFF dec: -16
* Param end outnl
158:    LDA  1,-14(1)	Ghost frame becomes new active frame 
159:    LDA  3,1(7)	Return address in ac 
160:    JMP  7,-127(7)	CALL outnl
161:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -14
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
162:    LDC  2,0(6)	Set return value to 0 
163:     LD  3,-1(1)	Load return address 
164:     LD  1,0(1)	Adjust fp 
165:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,165(7)	Jump to init [backpatch] 
* INIT
166:    LDA  1,-5(0)	set first frame at end of globals 
167:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
168:    LDA  3,1(7)	Return address in ac 
169:    JMP  7,-131(7)	Jump to main 
170:   HALT  0,0,0	DONE! 
* END INIT
