* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  inc.c-
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
* TOFF set: -6
 40:    LDC  3,1(6)	load size of array z
 41:     ST  3,-3(1)	save size of array z
* Compound Body
* EXPRESSION
* CALL output
 42:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
 43:    LDC  3,0(6)	Load integer constant 
 44:     LD  5,-2(1)	Load address of base of array y
 45:    SUB  5,5,3	Compute offset of value 
 46:     LD  3,0(5)	load lhs variable y
 47:    LDA  3,1(3)	increment value of y
 48:     ST  3,0(5)	Store variable y
 49:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
 50:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 51:    LDA  3,1(7)	Return address in ac 
 52:    JMP  7,-47(7)	CALL output
 53:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
 54:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
 55:     LD  3,-2(1)	Load address of base of array y
 56:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
 57:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -8
 58:     LD  4,-8(1)	Pop left into ac1 
 59:    SUB  3,4,3	compute location from index 
 60:     LD  3,0(3)	Load array element 
 61:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
 62:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 63:    LDA  3,1(7)	Return address in ac 
 64:    JMP  7,-59(7)	CALL output
 65:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
 66:    LDC  3,777(6)	Load integer constant 
 67:     ST  3,-5(1)	Store variable w
* EXPRESSION
 68:    LDC  3,0(6)	Load integer constant 
 69:     ST  3,-6(1)	Push index 
* TOFF dec: -7
 70:    LDC  3,888(6)	Load integer constant 
* TOFF inc: -6
 71:     LD  4,-6(1)	Pop index 
 72:    LDA  5,-4(1)	Load address of base of array z
 73:    SUB  5,5,4	Compute offset of value 
 74:     ST  3,0(5)	Store variable z
* EXPRESSION
* CALL output
 75:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
 76:     LD  3,-5(1)	load lhs variable w
 77:    LDA  3,1(3)	increment value of w
 78:     ST  3,-5(1)	Store variable w
 79:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
 80:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 81:    LDA  3,1(7)	Return address in ac 
 82:    JMP  7,-77(7)	CALL output
 83:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
 84:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
 85:     LD  3,-5(1)	Load variable w
 86:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
 87:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 88:    LDA  3,1(7)	Return address in ac 
 89:    JMP  7,-84(7)	CALL output
 90:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
 91:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
 92:    LDC  3,0(6)	Load integer constant 
 93:    LDA  5,-4(1)	Load address of base of array z
 94:    SUB  5,5,3	Compute offset of value 
 95:     LD  3,0(5)	load lhs variable z
 96:    LDA  3,1(3)	increment value of z
 97:     ST  3,0(5)	Store variable z
 98:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
 99:    LDA  1,-6(1)	Ghost frame becomes new active frame 
100:    LDA  3,1(7)	Return address in ac 
101:    JMP  7,-96(7)	CALL output
102:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
103:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
104:    LDA  3,-4(1)	Load address of base of array z
105:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
106:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -8
107:     LD  4,-8(1)	Pop left into ac1 
108:    SUB  3,4,3	compute location from index 
109:     LD  3,0(3)	Load array element 
110:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
111:    LDA  1,-6(1)	Ghost frame becomes new active frame 
112:    LDA  3,1(7)	Return address in ac 
113:    JMP  7,-108(7)	CALL output
114:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
115:    LDC  3,1023(6)	Load integer constant 
116:     ST  3,0(0)	Store variable g
* EXPRESSION
117:     LD  3,0(0)	load lhs variable g
118:    LDA  3,1(3)	increment value of g
119:     ST  3,0(0)	Store variable g
* EXPRESSION
* CALL output
120:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
121:     LD  3,0(0)	Load variable g
122:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
123:    LDA  1,-6(1)	Ghost frame becomes new active frame 
124:    LDA  3,1(7)	Return address in ac 
125:    JMP  7,-120(7)	CALL output
126:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
127:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
128:     LD  3,0(0)	load lhs variable g
129:    LDA  3,1(3)	increment value of g
130:     ST  3,0(0)	Store variable g
131:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
132:    LDA  1,-6(1)	Ghost frame becomes new active frame 
133:    LDA  3,1(7)	Return address in ac 
134:    JMP  7,-129(7)	CALL output
135:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
136:    LDC  2,0(6)	Set return value to 0 
137:     LD  3,-1(1)	Load return address 
138:     LD  1,0(1)	Adjust fp 
139:    JMP  7,0(3)	Return 
* END FUNCTION cat
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
140:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -4
141:    LDC  3,1(6)	load size of array x
142:     ST  3,-2(1)	save size of array x
* Compound Body
* EXPRESSION
143:    LDC  3,0(6)	Load integer constant 
144:     ST  3,-4(1)	Push index 
* TOFF dec: -5
145:    LDC  3,666(6)	Load integer constant 
* TOFF inc: -4
146:     LD  4,-4(1)	Pop index 
147:    LDA  5,-3(1)	Load address of base of array x
148:    SUB  5,5,4	Compute offset of value 
149:     ST  3,0(5)	Store variable x
* EXPRESSION
* CALL cat
150:     ST  1,-4(1)	Store fp in ghost frame for cat
* TOFF dec: -5
* TOFF dec: -6
* Param 1
151:    LDA  3,-3(1)	Load address of base of array x
152:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end cat
153:    LDA  1,-4(1)	Ghost frame becomes new active frame 
154:    LDA  3,1(7)	Return address in ac 
155:    JMP  7,-117(7)	CALL cat
156:    LDA  3,0(2)	Save the result in ac 
* Call end cat
* TOFF set: -4
* EXPRESSION
* CALL output
157:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
158:    LDA  3,-3(1)	Load address of base of array x
159:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
160:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -6
161:     LD  4,-6(1)	Pop left into ac1 
162:    SUB  3,4,3	compute location from index 
163:     LD  3,0(3)	Load array element 
164:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
165:    LDA  1,-4(1)	Ghost frame becomes new active frame 
166:    LDA  3,1(7)	Return address in ac 
167:    JMP  7,-162(7)	CALL output
168:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
169:    LDC  3,1023(6)	Load integer constant 
170:     ST  3,-1(0)	Store variable s
* EXPRESSION
171:     LD  3,-1(0)	load lhs variable s
172:    LDA  3,1(3)	increment value of s
173:     ST  3,-1(0)	Store variable s
* EXPRESSION
* CALL output
174:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
175:     LD  3,-1(0)	Load variable s
176:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
177:    LDA  1,-4(1)	Ghost frame becomes new active frame 
178:    LDA  3,1(7)	Return address in ac 
179:    JMP  7,-174(7)	CALL output
180:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
* CALL output
181:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
182:     LD  3,-1(0)	load lhs variable s
183:    LDA  3,1(3)	increment value of s
184:     ST  3,-1(0)	Store variable s
185:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
186:    LDA  1,-4(1)	Ghost frame becomes new active frame 
187:    LDA  3,1(7)	Return address in ac 
188:    JMP  7,-183(7)	CALL output
189:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* RETURN
190:    LDC  3,0(6)	Load integer constant 
191:    LDA  2,0(3)	Copy result to return register 
192:     LD  3,-1(1)	Load return address 
193:     LD  1,0(1)	Adjust fp 
194:    JMP  7,0(3)	Return 
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
195:    LDC  2,0(6)	Set return value to 0 
196:     LD  3,-1(1)	Load return address 
197:     LD  1,0(1)	Adjust fp 
198:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,198(7)	Jump to init [backpatch] 
* INIT
199:    LDA  1,-2(0)	set first frame at end of globals 
200:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
201:    LDA  3,1(7)	Return address in ac 
202:    JMP  7,-63(7)	Jump to main 
203:   HALT  0,0,0	DONE! 
* END INIT
