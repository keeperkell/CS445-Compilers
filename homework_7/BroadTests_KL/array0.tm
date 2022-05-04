* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  array0.c-
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
* FUNCTION show
* TOFF set: -4
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -4
* Compound Body
* EXPRESSION
* CALL output
 40:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 41:     LD  3,-2(1)	Load address of base of array z
 42:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
 43:     LD  3,-3(1)	Load variable n
* TOFF inc: -6
 44:     LD  4,-6(1)	Pop left into ac1 
 45:    SUB  3,4,3	compute location from index 
 46:     LD  3,0(3)	Load array element 
 47:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
 48:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 49:    LDA  3,1(7)	Return address in ac 
 50:    JMP  7,-45(7)	CALL output
 51:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* RETURN
 52:     LD  3,-2(1)	Load address of base of array z
 53:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 54:     LD  3,-3(1)	Load variable n
* TOFF inc: -4
 55:     LD  4,-4(1)	Pop left into ac1 
 56:    SUB  3,4,3	compute location from index 
 57:     LD  3,0(3)	Load array element 
 58:    LDA  2,0(3)	Copy result to return register 
 59:     LD  3,-1(1)	Load return address 
 60:     LD  1,0(1)	Adjust fp 
 61:    JMP  7,0(3)	Return 
* TOFF set: -4
* END COMPOUND
* Add standard closing in case there is no return statement
 62:    LDC  2,0(6)	Set return value to 0 
 63:     LD  3,-1(1)	Load return address 
 64:     LD  1,0(1)	Adjust fp 
 65:    JMP  7,0(3)	Return 
* END FUNCTION show
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
 66:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -7
 67:    LDC  3,4(6)	load size of array a
 68:     ST  3,-2(1)	save size of array a
* Compound Body
* EXPRESSION
 69:    LDC  3,1(6)	Load integer constant 
 70:     ST  3,-7(1)	Push index 
* TOFF dec: -8
 71:    LDC  3,666(6)	Load integer constant 
* TOFF inc: -7
 72:     LD  4,-7(1)	Pop index 
 73:    LDA  5,-1(0)	Load address of base of array g
 74:    SUB  5,5,4	Compute offset of value 
 75:     ST  3,0(5)	Store variable g
* EXPRESSION
 76:    LDC  3,1(6)	Load integer constant 
 77:     ST  3,-7(1)	Push index 
* TOFF dec: -8
 78:    LDC  3,777(6)	Load integer constant 
* TOFF inc: -7
 79:     LD  4,-7(1)	Pop index 
 80:    LDA  5,-3(1)	Load address of base of array a
 81:    SUB  5,5,4	Compute offset of value 
 82:     ST  3,0(5)	Store variable a
* EXPRESSION
* CALL output
 83:     ST  1,-7(1)	Store fp in ghost frame for output
* TOFF dec: -8
* TOFF dec: -9
* Param 1
 84:    LDA  3,-3(1)	Load address of base of array a
 85:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
 86:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -9
 87:     LD  4,-9(1)	Pop left into ac1 
 88:    SUB  3,4,3	compute location from index 
 89:     LD  3,0(3)	Load array element 
 90:     ST  3,-9(1)	Push parameter 
* TOFF dec: -10
* Param end output
 91:    LDA  1,-7(1)	Ghost frame becomes new active frame 
 92:    LDA  3,1(7)	Return address in ac 
 93:    JMP  7,-88(7)	CALL output
 94:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -7
* EXPRESSION
* CALL output
 95:     ST  1,-7(1)	Store fp in ghost frame for output
* TOFF dec: -8
* TOFF dec: -9
* Param 1
 96:    LDA  3,-1(0)	Load address of base of array g
 97:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
 98:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -9
 99:     LD  4,-9(1)	Pop left into ac1 
100:    SUB  3,4,3	compute location from index 
101:     LD  3,0(3)	Load array element 
102:     ST  3,-9(1)	Push parameter 
* TOFF dec: -10
* Param end output
103:    LDA  1,-7(1)	Ghost frame becomes new active frame 
104:    LDA  3,1(7)	Return address in ac 
105:    JMP  7,-100(7)	CALL output
106:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -7
* EXPRESSION
* CALL outnl
107:     ST  1,-7(1)	Store fp in ghost frame for outnl
* TOFF dec: -8
* TOFF dec: -9
* Param end outnl
108:    LDA  1,-7(1)	Ghost frame becomes new active frame 
109:    LDA  3,1(7)	Return address in ac 
110:    JMP  7,-77(7)	CALL outnl
111:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -7
* EXPRESSION
* CALL show
112:     ST  1,-7(1)	Store fp in ghost frame for show
* TOFF dec: -8
* TOFF dec: -9
* Param 1
113:    LDA  3,-3(1)	Load address of base of array a
114:     ST  3,-9(1)	Push parameter 
* TOFF dec: -10
* Param 2
115:    LDC  3,1(6)	Load integer constant 
116:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end show
117:    LDA  1,-7(1)	Ghost frame becomes new active frame 
118:    LDA  3,1(7)	Return address in ac 
119:    JMP  7,-81(7)	CALL show
120:    LDA  3,0(2)	Save the result in ac 
* Call end show
* TOFF set: -7
* EXPRESSION
* CALL show
121:     ST  1,-7(1)	Store fp in ghost frame for show
* TOFF dec: -8
* TOFF dec: -9
* Param 1
122:    LDA  3,-1(0)	Load address of base of array g
123:     ST  3,-9(1)	Push parameter 
* TOFF dec: -10
* Param 2
124:    LDC  3,1(6)	Load integer constant 
125:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end show
126:    LDA  1,-7(1)	Ghost frame becomes new active frame 
127:    LDA  3,1(7)	Return address in ac 
128:    JMP  7,-90(7)	CALL show
129:    LDA  3,0(2)	Save the result in ac 
* Call end show
* TOFF set: -7
* EXPRESSION
* CALL outnl
130:     ST  1,-7(1)	Store fp in ghost frame for outnl
* TOFF dec: -8
* TOFF dec: -9
* Param end outnl
131:    LDA  1,-7(1)	Ghost frame becomes new active frame 
132:    LDA  3,1(7)	Return address in ac 
133:    JMP  7,-100(7)	CALL outnl
134:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -7
* EXPRESSION
* CALL output
135:     ST  1,-7(1)	Store fp in ghost frame for output
* TOFF dec: -8
* TOFF dec: -9
* Param 1
* CALL show
136:     ST  1,-9(1)	Store fp in ghost frame for show
* TOFF dec: -10
* TOFF dec: -11
* Param 1
137:    LDA  3,-3(1)	Load address of base of array a
138:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param 2
139:    LDC  3,1(6)	Load integer constant 
140:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param end show
141:    LDA  1,-9(1)	Ghost frame becomes new active frame 
142:    LDA  3,1(7)	Return address in ac 
143:    JMP  7,-105(7)	CALL show
144:    LDA  3,0(2)	Save the result in ac 
* Call end show
* TOFF set: -9
145:     ST  3,-9(1)	Push parameter 
* TOFF dec: -10
* Param end output
146:    LDA  1,-7(1)	Ghost frame becomes new active frame 
147:    LDA  3,1(7)	Return address in ac 
148:    JMP  7,-143(7)	CALL output
149:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -7
* EXPRESSION
* CALL output
150:     ST  1,-7(1)	Store fp in ghost frame for output
* TOFF dec: -8
* TOFF dec: -9
* Param 1
* CALL show
151:     ST  1,-9(1)	Store fp in ghost frame for show
* TOFF dec: -10
* TOFF dec: -11
* Param 1
152:    LDA  3,-1(0)	Load address of base of array g
153:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param 2
154:    LDC  3,1(6)	Load integer constant 
155:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param end show
156:    LDA  1,-9(1)	Ghost frame becomes new active frame 
157:    LDA  3,1(7)	Return address in ac 
158:    JMP  7,-120(7)	CALL show
159:    LDA  3,0(2)	Save the result in ac 
* Call end show
* TOFF set: -9
160:     ST  3,-9(1)	Push parameter 
* TOFF dec: -10
* Param end output
161:    LDA  1,-7(1)	Ghost frame becomes new active frame 
162:    LDA  3,1(7)	Return address in ac 
163:    JMP  7,-158(7)	CALL output
164:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -7
* EXPRESSION
* CALL outnl
165:     ST  1,-7(1)	Store fp in ghost frame for outnl
* TOFF dec: -8
* TOFF dec: -9
* Param end outnl
166:    LDA  1,-7(1)	Ghost frame becomes new active frame 
167:    LDA  3,1(7)	Return address in ac 
168:    JMP  7,-135(7)	CALL outnl
169:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -7
* EXPRESSION
170:    LDC  3,1(6)	Load integer constant 
171:     ST  3,-7(1)	Push index 
* TOFF dec: -8
172:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -7
173:     LD  4,-7(1)	Pop index 
174:    LDA  5,-1(0)	Load address of base of array g
175:    SUB  5,5,4	Compute offset of value 
176:     LD  4,0(5)	load lhs variable g
177:    ADD  3,4,3	op += 
178:     ST  3,0(5)	Store variable g
* EXPRESSION
179:    LDC  3,1(6)	Load integer constant 
180:     ST  3,-7(1)	Push index 
* TOFF dec: -8
181:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -7
182:     LD  4,-7(1)	Pop index 
183:    LDA  5,-3(1)	Load address of base of array a
184:    SUB  5,5,4	Compute offset of value 
185:     LD  4,0(5)	load lhs variable a
186:    ADD  3,4,3	op += 
187:     ST  3,0(5)	Store variable a
* EXPRESSION
* CALL output
188:     ST  1,-7(1)	Store fp in ghost frame for output
* TOFF dec: -8
* TOFF dec: -9
* Param 1
189:    LDA  3,-3(1)	Load address of base of array a
190:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
191:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -9
192:     LD  4,-9(1)	Pop left into ac1 
193:    SUB  3,4,3	compute location from index 
194:     LD  3,0(3)	Load array element 
195:     ST  3,-9(1)	Push parameter 
* TOFF dec: -10
* Param end output
196:    LDA  1,-7(1)	Ghost frame becomes new active frame 
197:    LDA  3,1(7)	Return address in ac 
198:    JMP  7,-193(7)	CALL output
199:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -7
* EXPRESSION
* CALL output
200:     ST  1,-7(1)	Store fp in ghost frame for output
* TOFF dec: -8
* TOFF dec: -9
* Param 1
201:    LDA  3,-1(0)	Load address of base of array g
202:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
203:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -9
204:     LD  4,-9(1)	Pop left into ac1 
205:    SUB  3,4,3	compute location from index 
206:     LD  3,0(3)	Load array element 
207:     ST  3,-9(1)	Push parameter 
* TOFF dec: -10
* Param end output
208:    LDA  1,-7(1)	Ghost frame becomes new active frame 
209:    LDA  3,1(7)	Return address in ac 
210:    JMP  7,-205(7)	CALL output
211:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -7
* EXPRESSION
* CALL outnl
212:     ST  1,-7(1)	Store fp in ghost frame for outnl
* TOFF dec: -8
* TOFF dec: -9
* Param end outnl
213:    LDA  1,-7(1)	Ghost frame becomes new active frame 
214:    LDA  3,1(7)	Return address in ac 
215:    JMP  7,-182(7)	CALL outnl
216:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -7
* EXPRESSION
* CALL output
217:     ST  1,-7(1)	Store fp in ghost frame for output
* TOFF dec: -8
* TOFF dec: -9
* Param 1
218:    LDC  3,1(6)	Load integer constant 
219:     ST  3,-9(1)	Push index 
* TOFF dec: -10
220:    LDC  3,100(6)	Load integer constant 
* TOFF inc: -9
221:     LD  4,-9(1)	Pop index 
222:    LDA  5,-3(1)	Load address of base of array a
223:    SUB  5,5,4	Compute offset of value 
224:     LD  4,0(5)	load lhs variable a
225:    ADD  3,4,3	op += 
226:     ST  3,0(5)	Store variable a
227:     ST  3,-9(1)	Push parameter 
* TOFF dec: -10
* Param end output
228:    LDA  1,-7(1)	Ghost frame becomes new active frame 
229:    LDA  3,1(7)	Return address in ac 
230:    JMP  7,-225(7)	CALL output
231:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -7
* EXPRESSION
* CALL output
232:     ST  1,-7(1)	Store fp in ghost frame for output
* TOFF dec: -8
* TOFF dec: -9
* Param 1
233:    LDC  3,1(6)	Load integer constant 
234:     ST  3,-9(1)	Push index 
* TOFF dec: -10
235:    LDC  3,100(6)	Load integer constant 
* TOFF inc: -9
236:     LD  4,-9(1)	Pop index 
237:    LDA  5,-1(0)	Load address of base of array g
238:    SUB  5,5,4	Compute offset of value 
239:     LD  4,0(5)	load lhs variable g
240:    ADD  3,4,3	op += 
241:     ST  3,0(5)	Store variable g
242:     ST  3,-9(1)	Push parameter 
* TOFF dec: -10
* Param end output
243:    LDA  1,-7(1)	Ghost frame becomes new active frame 
244:    LDA  3,1(7)	Return address in ac 
245:    JMP  7,-240(7)	CALL output
246:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -7
* EXPRESSION
* CALL outnl
247:     ST  1,-7(1)	Store fp in ghost frame for outnl
* TOFF dec: -8
* TOFF dec: -9
* Param end outnl
248:    LDA  1,-7(1)	Ghost frame becomes new active frame 
249:    LDA  3,1(7)	Return address in ac 
250:    JMP  7,-217(7)	CALL outnl
251:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -7
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
252:    LDC  2,0(6)	Set return value to 0 
253:     LD  3,-1(1)	Load return address 
254:     LD  1,0(1)	Adjust fp 
255:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,255(7)	Jump to init [backpatch] 
* INIT
256:    LDA  1,-5(0)	set first frame at end of globals 
257:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
258:    LDC  3,4(6)	load size of array g
259:     ST  3,0(0)	save size of array g
* END INIT GLOBALS AND STATICS
260:    LDA  3,1(7)	Return address in ac 
261:    JMP  7,-196(7)	Jump to main 
262:   HALT  0,0,0	DONE! 
* END INIT
