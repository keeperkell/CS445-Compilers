* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  arraysize.c-
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
* TOFF set: -3
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -18
 40:    LDC  3,13(6)	load size of array y
 41:     ST  3,-4(1)	save size of array y
* Compound Body
* EXPRESSION
 42:    LDC  3,0(6)	Load integer constant 
 43:     ST  3,-18(1)	Push index 
* TOFF dec: -19
 44:    LDC  3,666(6)	Load integer constant 
* TOFF inc: -18
 45:     LD  4,-18(1)	Pop index 
 46:    LDA  5,-5(1)	Load address of base of array y
 47:    SUB  5,5,4	Compute offset of value 
 48:     ST  3,0(5)	Store variable y
* EXPRESSION
 49:    LDC  3,0(6)	Load integer constant 
 50:     ST  3,-18(1)	Push index 
* TOFF dec: -19
 51:    LDC  3,888(6)	Load integer constant 
* TOFF inc: -18
 52:     LD  4,-18(1)	Pop index 
 53:    LDA  5,-1(0)	Load address of base of array g
 54:    SUB  5,5,4	Compute offset of value 
 55:     ST  3,0(5)	Store variable g
* EXPRESSION
* CALL output
 56:     ST  1,-18(1)	Store fp in ghost frame for output
* TOFF dec: -19
* TOFF dec: -20
* Param 1
 57:     LD  3,-2(1)	Load address of base of array x
 58:     ST  3,-20(1)	Push left side 
* TOFF dec: -21
 59:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -20
 60:     LD  4,-20(1)	Pop left into ac1 
 61:    SUB  3,4,3	compute location from index 
 62:     LD  3,0(3)	Load array element 
 63:     ST  3,-20(1)	Push parameter 
* TOFF dec: -21
* Param end output
 64:    LDA  1,-18(1)	Ghost frame becomes new active frame 
 65:    LDA  3,1(7)	Return address in ac 
 66:    JMP  7,-61(7)	CALL output
 67:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -18
* EXPRESSION
* CALL output
 68:     ST  1,-18(1)	Store fp in ghost frame for output
* TOFF dec: -19
* TOFF dec: -20
* Param 1
 69:     LD  3,-2(1)	Load address of base of array x
 70:     LD  3,1(3)	Load array size 
 71:     ST  3,-20(1)	Push parameter 
* TOFF dec: -21
* Param end output
 72:    LDA  1,-18(1)	Ghost frame becomes new active frame 
 73:    LDA  3,1(7)	Return address in ac 
 74:    JMP  7,-69(7)	CALL output
 75:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -18
* EXPRESSION
* CALL output
 76:     ST  1,-18(1)	Store fp in ghost frame for output
* TOFF dec: -19
* TOFF dec: -20
* Param 1
 77:    LDA  3,-1(0)	Load address of base of array g
 78:     ST  3,-20(1)	Push left side 
* TOFF dec: -21
 79:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -20
 80:     LD  4,-20(1)	Pop left into ac1 
 81:    SUB  3,4,3	compute location from index 
 82:     LD  3,0(3)	Load array element 
 83:     ST  3,-20(1)	Push parameter 
* TOFF dec: -21
* Param end output
 84:    LDA  1,-18(1)	Ghost frame becomes new active frame 
 85:    LDA  3,1(7)	Return address in ac 
 86:    JMP  7,-81(7)	CALL output
 87:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -18
* EXPRESSION
* CALL output
 88:     ST  1,-18(1)	Store fp in ghost frame for output
* TOFF dec: -19
* TOFF dec: -20
* Param 1
 89:    LDA  3,-1(0)	Load address of base of array g
 90:     ST  3,-20(1)	Push left side 
* TOFF dec: -21
 91:    LDC  3,1(6)	Load integer constant 
 92:    NEG  3,3,3	Op unary - 
* TOFF inc: -20
 93:     LD  4,-20(1)	Pop left into ac1 
 94:    SUB  3,4,3	compute location from index 
 95:     LD  3,0(3)	Load array element 
 96:     ST  3,-20(1)	Push parameter 
* TOFF dec: -21
* Param end output
 97:    LDA  1,-18(1)	Ghost frame becomes new active frame 
 98:    LDA  3,1(7)	Return address in ac 
 99:    JMP  7,-94(7)	CALL output
100:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -18
* EXPRESSION
* CALL outnl
101:     ST  1,-18(1)	Store fp in ghost frame for outnl
* TOFF dec: -19
* TOFF dec: -20
* Param end outnl
102:    LDA  1,-18(1)	Ghost frame becomes new active frame 
103:    LDA  3,1(7)	Return address in ac 
104:    JMP  7,-71(7)	CALL outnl
105:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -18
* EXPRESSION
* CALL output
106:     ST  1,-18(1)	Store fp in ghost frame for output
* TOFF dec: -19
* TOFF dec: -20
* Param 1
107:    LDA  3,-5(1)	Load address of base of array y
108:     ST  3,-20(1)	Push left side 
* TOFF dec: -21
109:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -20
110:     LD  4,-20(1)	Pop left into ac1 
111:    SUB  3,4,3	compute location from index 
112:     LD  3,0(3)	Load array element 
113:     ST  3,-20(1)	Push parameter 
* TOFF dec: -21
* Param end output
114:    LDA  1,-18(1)	Ghost frame becomes new active frame 
115:    LDA  3,1(7)	Return address in ac 
116:    JMP  7,-111(7)	CALL output
117:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -18
* EXPRESSION
* CALL output
118:     ST  1,-18(1)	Store fp in ghost frame for output
* TOFF dec: -19
* TOFF dec: -20
* Param 1
119:    LDA  3,-5(1)	Load address of base of array y
120:     LD  3,1(3)	Load array size 
121:     ST  3,-20(1)	Push parameter 
* TOFF dec: -21
* Param end output
122:    LDA  1,-18(1)	Ghost frame becomes new active frame 
123:    LDA  3,1(7)	Return address in ac 
124:    JMP  7,-119(7)	CALL output
125:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -18
* EXPRESSION
* CALL outnl
126:     ST  1,-18(1)	Store fp in ghost frame for outnl
* TOFF dec: -19
* TOFF dec: -20
* Param end outnl
127:    LDA  1,-18(1)	Ghost frame becomes new active frame 
128:    LDA  3,1(7)	Return address in ac 
129:    JMP  7,-96(7)	CALL outnl
130:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -18
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
131:    LDC  2,0(6)	Set return value to 0 
132:     LD  3,-1(1)	Load return address 
133:     LD  1,0(1)	Adjust fp 
134:    JMP  7,0(3)	Return 
* END FUNCTION ford
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
135:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -14
136:    LDC  3,11(6)	load size of array m
137:     ST  3,-2(1)	save size of array m
* Compound Body
* EXPRESSION
138:    LDC  3,0(6)	Load integer constant 
139:     ST  3,-14(1)	Push index 
* TOFF dec: -15
140:    LDC  3,777(6)	Load integer constant 
* TOFF inc: -14
141:     LD  4,-14(1)	Pop index 
142:    LDA  5,-3(1)	Load address of base of array m
143:    SUB  5,5,4	Compute offset of value 
144:     ST  3,0(5)	Store variable m
* EXPRESSION
* CALL output
145:     ST  1,-14(1)	Store fp in ghost frame for output
* TOFF dec: -15
* TOFF dec: -16
* Param 1
146:    LDA  3,-3(1)	Load address of base of array m
147:     ST  3,-16(1)	Push left side 
* TOFF dec: -17
148:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -16
149:     LD  4,-16(1)	Pop left into ac1 
150:    SUB  3,4,3	compute location from index 
151:     LD  3,0(3)	Load array element 
152:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param end output
153:    LDA  1,-14(1)	Ghost frame becomes new active frame 
154:    LDA  3,1(7)	Return address in ac 
155:    JMP  7,-150(7)	CALL output
156:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -14
* EXPRESSION
* CALL output
157:     ST  1,-14(1)	Store fp in ghost frame for output
* TOFF dec: -15
* TOFF dec: -16
* Param 1
158:    LDA  3,-3(1)	Load address of base of array m
159:     LD  3,1(3)	Load array size 
160:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param end output
161:    LDA  1,-14(1)	Ghost frame becomes new active frame 
162:    LDA  3,1(7)	Return address in ac 
163:    JMP  7,-158(7)	CALL output
164:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -14
* EXPRESSION
* CALL output
165:     ST  1,-14(1)	Store fp in ghost frame for output
* TOFF dec: -15
* TOFF dec: -16
* Param 1
166:    LDA  3,-1(0)	Load address of base of array g
167:     ST  3,-16(1)	Push left side 
* TOFF dec: -17
168:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -16
169:     LD  4,-16(1)	Pop left into ac1 
170:    SUB  3,4,3	compute location from index 
171:     LD  3,0(3)	Load array element 
172:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param end output
173:    LDA  1,-14(1)	Ghost frame becomes new active frame 
174:    LDA  3,1(7)	Return address in ac 
175:    JMP  7,-170(7)	CALL output
176:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -14
* EXPRESSION
* CALL output
177:     ST  1,-14(1)	Store fp in ghost frame for output
* TOFF dec: -15
* TOFF dec: -16
* Param 1
178:    LDA  3,-1(0)	Load address of base of array g
179:     LD  3,1(3)	Load array size 
180:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param end output
181:    LDA  1,-14(1)	Ghost frame becomes new active frame 
182:    LDA  3,1(7)	Return address in ac 
183:    JMP  7,-178(7)	CALL output
184:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -14
* EXPRESSION
* CALL outnl
185:     ST  1,-14(1)	Store fp in ghost frame for outnl
* TOFF dec: -15
* TOFF dec: -16
* Param end outnl
186:    LDA  1,-14(1)	Ghost frame becomes new active frame 
187:    LDA  3,1(7)	Return address in ac 
188:    JMP  7,-155(7)	CALL outnl
189:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -14
* EXPRESSION
* CALL ford
190:     ST  1,-14(1)	Store fp in ghost frame for ford
* TOFF dec: -15
* TOFF dec: -16
* Param 1
191:    LDA  3,-3(1)	Load address of base of array m
192:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param end ford
193:    LDA  1,-14(1)	Ghost frame becomes new active frame 
194:    LDA  3,1(7)	Return address in ac 
195:    JMP  7,-157(7)	CALL ford
196:    LDA  3,0(2)	Save the result in ac 
* Call end ford
* TOFF set: -14
* EXPRESSION
* CALL ford
197:     ST  1,-14(1)	Store fp in ghost frame for ford
* TOFF dec: -15
* TOFF dec: -16
* Param 1
198:    LDA  3,-1(0)	Load address of base of array g
199:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param end ford
200:    LDA  1,-14(1)	Ghost frame becomes new active frame 
201:    LDA  3,1(7)	Return address in ac 
202:    JMP  7,-164(7)	CALL ford
203:    LDA  3,0(2)	Save the result in ac 
* Call end ford
* TOFF set: -14
* EXPRESSION
* CALL output
204:     ST  1,-14(1)	Store fp in ghost frame for output
* TOFF dec: -15
* TOFF dec: -16
* Param 1
205:    LDA  3,-3(1)	Load address of base of array m
206:     LD  3,1(3)	Load array size 
207:     ST  3,-16(1)	Push left side 
* TOFF dec: -17
208:    LDA  3,-1(0)	Load address of base of array g
209:     LD  3,1(3)	Load array size 
* TOFF inc: -16
210:     LD  4,-16(1)	Pop left into ac1 
211:    MUL  3,4,3	Op * 
212:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param end output
213:    LDA  1,-14(1)	Ghost frame becomes new active frame 
214:    LDA  3,1(7)	Return address in ac 
215:    JMP  7,-210(7)	CALL output
216:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -14
* EXPRESSION
* CALL outnl
217:     ST  1,-14(1)	Store fp in ghost frame for outnl
* TOFF dec: -15
* TOFF dec: -16
* Param end outnl
218:    LDA  1,-14(1)	Ghost frame becomes new active frame 
219:    LDA  3,1(7)	Return address in ac 
220:    JMP  7,-187(7)	CALL outnl
221:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -14
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
222:    LDC  2,0(6)	Set return value to 0 
223:     LD  3,-1(1)	Load return address 
224:     LD  1,0(1)	Adjust fp 
225:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,225(7)	Jump to init [backpatch] 
* INIT
226:    LDA  1,-37(0)	set first frame at end of globals 
227:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
228:    LDC  3,12(6)	load size of array g
229:     ST  3,0(0)	save size of array g
230:    LDC  3,23(6)	load size of array h
231:     ST  3,-13(0)	save size of array h
* END INIT GLOBALS AND STATICS
232:    LDA  3,1(7)	Return address in ac 
233:    JMP  7,-99(7)	Jump to main 
234:   HALT  0,0,0	DONE! 
* END INIT
