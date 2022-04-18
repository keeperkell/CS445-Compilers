* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  j00.c-
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
* TOFF set: -4
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -4
* Compound Body
* RETURN
 40:     LD  3,-2(1)	Load address of base of array x
 41:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 42:     LD  3,-3(1)	Load variable i
* TOFF inc: -4
 43:     LD  4,-4(1)	Pop left into ac1 
 44:    SUB  3,4,3	compute location from index 
 45:     LD  3,0(3)	Load array element 
 46:    LDA  2,0(3)	Copy result to return register 
 47:     LD  3,-1(1)	Load return address 
 48:     LD  1,0(1)	Adjust fp 
 49:    JMP  7,0(3)	Return 
* TOFF set: -4
* END COMPOUND
* Add standard closing in case there is no return statement
 50:    LDC  2,0(6)	Set return value to 0 
 51:     LD  3,-1(1)	Load return address 
 52:     LD  1,0(1)	Adjust fp 
 53:    JMP  7,0(3)	Return 
* END FUNCTION cat
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION dog
* TOFF set: -4
 54:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -4
* Compound Body
* RETURN
* CALL cat
 55:     ST  1,-4(1)	Store fp in ghost frame for cat
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 56:     LD  3,-2(1)	Load address of base of array x
 57:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param 2
 58:     LD  3,-3(1)	Load variable i
 59:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end cat
 60:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 61:    LDA  3,1(7)	Return address in ac 
 62:    JMP  7,-24(7)	CALL cat
 63:    LDA  3,0(2)	Save the result in ac 
* Call end cat
* TOFF set: -4
 64:    LDA  2,0(3)	Copy result to return register 
 65:     LD  3,-1(1)	Load return address 
 66:     LD  1,0(1)	Adjust fp 
 67:    JMP  7,0(3)	Return 
* TOFF set: -4
* END COMPOUND
* Add standard closing in case there is no return statement
 68:    LDC  2,0(6)	Set return value to 0 
 69:     LD  3,-1(1)	Load return address 
 70:     LD  1,0(1)	Adjust fp 
 71:    JMP  7,0(3)	Return 
* END FUNCTION dog
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION fox
* TOFF set: -4
 72:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -4
* Compound Body
* RETURN
* CALL dog
 73:     ST  1,-4(1)	Store fp in ghost frame for dog
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 74:     LD  3,-2(1)	Load address of base of array x
 75:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param 2
 76:     LD  3,-3(1)	Load variable i
 77:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end dog
 78:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 79:    LDA  3,1(7)	Return address in ac 
 80:    JMP  7,-27(7)	CALL dog
 81:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -4
 82:    LDA  2,0(3)	Copy result to return register 
 83:     LD  3,-1(1)	Load return address 
 84:     LD  1,0(1)	Adjust fp 
 85:    JMP  7,0(3)	Return 
* TOFF set: -4
* END COMPOUND
* Add standard closing in case there is no return statement
 86:    LDC  2,0(6)	Set return value to 0 
 87:     LD  3,-1(1)	Load return address 
 88:     LD  1,0(1)	Adjust fp 
 89:    JMP  7,0(3)	Return 
* END FUNCTION fox
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
 90:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -14
 91:    LDC  3,10(6)	load size of array h
 92:     ST  3,-3(1)	save size of array h
* Compound Body
* EXPRESSION
 93:    LDC  3,1(6)	Load integer constant 
 94:     ST  3,-2(1)	Store variable i
* WHILE
 95:     LD  3,-2(1)	Load variable i
 96:     ST  3,-14(1)	Push left side 
* TOFF dec: -15
 97:    LDC  3,10(6)	Load integer constant 
* TOFF inc: -14
 98:     LD  4,-14(1)	Pop left into ac1 
 99:    TLT  3,4,3	Op < 
100:    JNZ  3,1(7)	Jump to while part 
* DO
* EXPRESSION
102:     LD  3,-2(1)	Load variable i
103:     ST  3,-14(1)	Push index 
* TOFF dec: -15
104:     LD  3,-2(1)	Load variable i
105:     ST  3,-15(1)	Push index 
* TOFF dec: -16
106:     LD  3,-2(1)	Load variable i
107:     ST  3,-16(1)	Push index 
* TOFF dec: -17
108:     LD  3,-2(1)	load lhs variable i
109:    LDA  3,1(3)	increment value of i
110:     ST  3,-2(1)	Store variable i
* TOFF inc: -16
111:     LD  4,-16(1)	Pop index 
112:    LDA  5,-12(0)	Load address of base of array s
113:    SUB  5,5,4	Compute offset of value 
114:     ST  3,0(5)	Store variable s
* TOFF inc: -15
115:     LD  4,-15(1)	Pop index 
116:    LDA  5,-1(0)	Load address of base of array g
117:    SUB  5,5,4	Compute offset of value 
118:     ST  3,0(5)	Store variable g
* TOFF inc: -14
119:     LD  4,-14(1)	Pop index 
120:    LDA  5,-4(1)	Load address of base of array h
121:    SUB  5,5,4	Compute offset of value 
122:     ST  3,0(5)	Store variable h
123:    JMP  7,-29(7)	go to beginning of loop 
101:    JMP  7,22(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
* CALL output
124:     ST  1,-14(1)	Store fp in ghost frame for output
* TOFF dec: -15
* TOFF dec: -16
* Param 1
125:    LDA  3,-1(0)	Load address of base of array g
126:     ST  3,-16(1)	Push left side 
* TOFF dec: -17
127:    LDC  3,6(6)	Load integer constant 
* TOFF inc: -16
128:     LD  4,-16(1)	Pop left into ac1 
129:    SUB  3,4,3	compute location from index 
130:     LD  3,0(3)	Load array element 
131:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param end output
132:    LDA  1,-14(1)	Ghost frame becomes new active frame 
133:    LDA  3,1(7)	Return address in ac 
134:    JMP  7,-129(7)	CALL output
135:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -14
* EXPRESSION
* CALL output
136:     ST  1,-14(1)	Store fp in ghost frame for output
* TOFF dec: -15
* TOFF dec: -16
* Param 1
137:    LDA  3,-4(1)	Load address of base of array h
138:     ST  3,-16(1)	Push left side 
* TOFF dec: -17
139:    LDC  3,6(6)	Load integer constant 
* TOFF inc: -16
140:     LD  4,-16(1)	Pop left into ac1 
141:    SUB  3,4,3	compute location from index 
142:     LD  3,0(3)	Load array element 
143:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param end output
144:    LDA  1,-14(1)	Ghost frame becomes new active frame 
145:    LDA  3,1(7)	Return address in ac 
146:    JMP  7,-141(7)	CALL output
147:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -14
* EXPRESSION
* CALL output
148:     ST  1,-14(1)	Store fp in ghost frame for output
* TOFF dec: -15
* TOFF dec: -16
* Param 1
149:    LDA  3,-12(0)	Load address of base of array s
150:     ST  3,-16(1)	Push left side 
* TOFF dec: -17
151:    LDC  3,6(6)	Load integer constant 
* TOFF inc: -16
152:     LD  4,-16(1)	Pop left into ac1 
153:    SUB  3,4,3	compute location from index 
154:     LD  3,0(3)	Load array element 
155:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param end output
156:    LDA  1,-14(1)	Ghost frame becomes new active frame 
157:    LDA  3,1(7)	Return address in ac 
158:    JMP  7,-153(7)	CALL output
159:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -14
* EXPRESSION
* CALL outnl
160:     ST  1,-14(1)	Store fp in ghost frame for outnl
* TOFF dec: -15
* TOFF dec: -16
* Param end outnl
161:    LDA  1,-14(1)	Ghost frame becomes new active frame 
162:    LDA  3,1(7)	Return address in ac 
163:    JMP  7,-130(7)	CALL outnl
164:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -14
* EXPRESSION
* CALL output
165:     ST  1,-14(1)	Store fp in ghost frame for output
* TOFF dec: -15
* TOFF dec: -16
* Param 1
* CALL cat
166:     ST  1,-16(1)	Store fp in ghost frame for cat
* TOFF dec: -17
* TOFF dec: -18
* Param 1
167:    LDA  3,-1(0)	Load address of base of array g
168:     ST  3,-18(1)	Push parameter 
* TOFF dec: -19
* Param 2
169:    LDC  3,6(6)	Load integer constant 
170:     ST  3,-19(1)	Push parameter 
* TOFF dec: -20
* Param end cat
171:    LDA  1,-16(1)	Ghost frame becomes new active frame 
172:    LDA  3,1(7)	Return address in ac 
173:    JMP  7,-135(7)	CALL cat
174:    LDA  3,0(2)	Save the result in ac 
* Call end cat
* TOFF set: -16
175:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param end output
176:    LDA  1,-14(1)	Ghost frame becomes new active frame 
177:    LDA  3,1(7)	Return address in ac 
178:    JMP  7,-173(7)	CALL output
179:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -14
* EXPRESSION
* CALL output
180:     ST  1,-14(1)	Store fp in ghost frame for output
* TOFF dec: -15
* TOFF dec: -16
* Param 1
* CALL cat
181:     ST  1,-16(1)	Store fp in ghost frame for cat
* TOFF dec: -17
* TOFF dec: -18
* Param 1
182:    LDA  3,-4(1)	Load address of base of array h
183:     ST  3,-18(1)	Push parameter 
* TOFF dec: -19
* Param 2
184:    LDC  3,6(6)	Load integer constant 
185:     ST  3,-19(1)	Push parameter 
* TOFF dec: -20
* Param end cat
186:    LDA  1,-16(1)	Ghost frame becomes new active frame 
187:    LDA  3,1(7)	Return address in ac 
188:    JMP  7,-150(7)	CALL cat
189:    LDA  3,0(2)	Save the result in ac 
* Call end cat
* TOFF set: -16
190:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param end output
191:    LDA  1,-14(1)	Ghost frame becomes new active frame 
192:    LDA  3,1(7)	Return address in ac 
193:    JMP  7,-188(7)	CALL output
194:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -14
* EXPRESSION
* CALL output
195:     ST  1,-14(1)	Store fp in ghost frame for output
* TOFF dec: -15
* TOFF dec: -16
* Param 1
* CALL cat
196:     ST  1,-16(1)	Store fp in ghost frame for cat
* TOFF dec: -17
* TOFF dec: -18
* Param 1
197:    LDA  3,-12(0)	Load address of base of array s
198:     ST  3,-18(1)	Push parameter 
* TOFF dec: -19
* Param 2
199:    LDC  3,6(6)	Load integer constant 
200:     ST  3,-19(1)	Push parameter 
* TOFF dec: -20
* Param end cat
201:    LDA  1,-16(1)	Ghost frame becomes new active frame 
202:    LDA  3,1(7)	Return address in ac 
203:    JMP  7,-165(7)	CALL cat
204:    LDA  3,0(2)	Save the result in ac 
* Call end cat
* TOFF set: -16
205:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param end output
206:    LDA  1,-14(1)	Ghost frame becomes new active frame 
207:    LDA  3,1(7)	Return address in ac 
208:    JMP  7,-203(7)	CALL output
209:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -14
* EXPRESSION
* CALL outnl
210:     ST  1,-14(1)	Store fp in ghost frame for outnl
* TOFF dec: -15
* TOFF dec: -16
* Param end outnl
211:    LDA  1,-14(1)	Ghost frame becomes new active frame 
212:    LDA  3,1(7)	Return address in ac 
213:    JMP  7,-180(7)	CALL outnl
214:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -14
* EXPRESSION
* CALL output
215:     ST  1,-14(1)	Store fp in ghost frame for output
* TOFF dec: -15
* TOFF dec: -16
* Param 1
* CALL dog
216:     ST  1,-16(1)	Store fp in ghost frame for dog
* TOFF dec: -17
* TOFF dec: -18
* Param 1
217:    LDA  3,-1(0)	Load address of base of array g
218:     ST  3,-18(1)	Push parameter 
* TOFF dec: -19
* Param 2
219:    LDC  3,6(6)	Load integer constant 
220:     ST  3,-19(1)	Push parameter 
* TOFF dec: -20
* Param end dog
221:    LDA  1,-16(1)	Ghost frame becomes new active frame 
222:    LDA  3,1(7)	Return address in ac 
223:    JMP  7,-170(7)	CALL dog
224:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -16
225:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param end output
226:    LDA  1,-14(1)	Ghost frame becomes new active frame 
227:    LDA  3,1(7)	Return address in ac 
228:    JMP  7,-223(7)	CALL output
229:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -14
* EXPRESSION
* CALL output
230:     ST  1,-14(1)	Store fp in ghost frame for output
* TOFF dec: -15
* TOFF dec: -16
* Param 1
* CALL dog
231:     ST  1,-16(1)	Store fp in ghost frame for dog
* TOFF dec: -17
* TOFF dec: -18
* Param 1
232:    LDA  3,-4(1)	Load address of base of array h
233:     ST  3,-18(1)	Push parameter 
* TOFF dec: -19
* Param 2
234:    LDC  3,6(6)	Load integer constant 
235:     ST  3,-19(1)	Push parameter 
* TOFF dec: -20
* Param end dog
236:    LDA  1,-16(1)	Ghost frame becomes new active frame 
237:    LDA  3,1(7)	Return address in ac 
238:    JMP  7,-185(7)	CALL dog
239:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -16
240:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param end output
241:    LDA  1,-14(1)	Ghost frame becomes new active frame 
242:    LDA  3,1(7)	Return address in ac 
243:    JMP  7,-238(7)	CALL output
244:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -14
* EXPRESSION
* CALL output
245:     ST  1,-14(1)	Store fp in ghost frame for output
* TOFF dec: -15
* TOFF dec: -16
* Param 1
* CALL dog
246:     ST  1,-16(1)	Store fp in ghost frame for dog
* TOFF dec: -17
* TOFF dec: -18
* Param 1
247:    LDA  3,-12(0)	Load address of base of array s
248:     ST  3,-18(1)	Push parameter 
* TOFF dec: -19
* Param 2
249:    LDC  3,6(6)	Load integer constant 
250:     ST  3,-19(1)	Push parameter 
* TOFF dec: -20
* Param end dog
251:    LDA  1,-16(1)	Ghost frame becomes new active frame 
252:    LDA  3,1(7)	Return address in ac 
253:    JMP  7,-200(7)	CALL dog
254:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -16
255:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param end output
256:    LDA  1,-14(1)	Ghost frame becomes new active frame 
257:    LDA  3,1(7)	Return address in ac 
258:    JMP  7,-253(7)	CALL output
259:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -14
* EXPRESSION
* CALL outnl
260:     ST  1,-14(1)	Store fp in ghost frame for outnl
* TOFF dec: -15
* TOFF dec: -16
* Param end outnl
261:    LDA  1,-14(1)	Ghost frame becomes new active frame 
262:    LDA  3,1(7)	Return address in ac 
263:    JMP  7,-230(7)	CALL outnl
264:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -14
* EXPRESSION
* CALL output
265:     ST  1,-14(1)	Store fp in ghost frame for output
* TOFF dec: -15
* TOFF dec: -16
* Param 1
* CALL fox
266:     ST  1,-16(1)	Store fp in ghost frame for fox
* TOFF dec: -17
* TOFF dec: -18
* Param 1
267:    LDA  3,-1(0)	Load address of base of array g
268:     ST  3,-18(1)	Push parameter 
* TOFF dec: -19
* Param 2
269:    LDC  3,6(6)	Load integer constant 
270:     ST  3,-19(1)	Push parameter 
* TOFF dec: -20
* Param end fox
271:    LDA  1,-16(1)	Ghost frame becomes new active frame 
272:    LDA  3,1(7)	Return address in ac 
273:    JMP  7,-202(7)	CALL fox
274:    LDA  3,0(2)	Save the result in ac 
* Call end fox
* TOFF set: -16
275:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param end output
276:    LDA  1,-14(1)	Ghost frame becomes new active frame 
277:    LDA  3,1(7)	Return address in ac 
278:    JMP  7,-273(7)	CALL output
279:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -14
* EXPRESSION
* CALL output
280:     ST  1,-14(1)	Store fp in ghost frame for output
* TOFF dec: -15
* TOFF dec: -16
* Param 1
* CALL fox
281:     ST  1,-16(1)	Store fp in ghost frame for fox
* TOFF dec: -17
* TOFF dec: -18
* Param 1
282:    LDA  3,-4(1)	Load address of base of array h
283:     ST  3,-18(1)	Push parameter 
* TOFF dec: -19
* Param 2
284:    LDC  3,6(6)	Load integer constant 
285:     ST  3,-19(1)	Push parameter 
* TOFF dec: -20
* Param end fox
286:    LDA  1,-16(1)	Ghost frame becomes new active frame 
287:    LDA  3,1(7)	Return address in ac 
288:    JMP  7,-217(7)	CALL fox
289:    LDA  3,0(2)	Save the result in ac 
* Call end fox
* TOFF set: -16
290:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param end output
291:    LDA  1,-14(1)	Ghost frame becomes new active frame 
292:    LDA  3,1(7)	Return address in ac 
293:    JMP  7,-288(7)	CALL output
294:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -14
* EXPRESSION
* CALL output
295:     ST  1,-14(1)	Store fp in ghost frame for output
* TOFF dec: -15
* TOFF dec: -16
* Param 1
* CALL fox
296:     ST  1,-16(1)	Store fp in ghost frame for fox
* TOFF dec: -17
* TOFF dec: -18
* Param 1
297:    LDA  3,-12(0)	Load address of base of array s
298:     ST  3,-18(1)	Push parameter 
* TOFF dec: -19
* Param 2
299:    LDC  3,6(6)	Load integer constant 
300:     ST  3,-19(1)	Push parameter 
* TOFF dec: -20
* Param end fox
301:    LDA  1,-16(1)	Ghost frame becomes new active frame 
302:    LDA  3,1(7)	Return address in ac 
303:    JMP  7,-232(7)	CALL fox
304:    LDA  3,0(2)	Save the result in ac 
* Call end fox
* TOFF set: -16
305:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param end output
306:    LDA  1,-14(1)	Ghost frame becomes new active frame 
307:    LDA  3,1(7)	Return address in ac 
308:    JMP  7,-303(7)	CALL output
309:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -14
* EXPRESSION
* CALL outnl
310:     ST  1,-14(1)	Store fp in ghost frame for outnl
* TOFF dec: -15
* TOFF dec: -16
* Param end outnl
311:    LDA  1,-14(1)	Ghost frame becomes new active frame 
312:    LDA  3,1(7)	Return address in ac 
313:    JMP  7,-280(7)	CALL outnl
314:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -14
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
315:    LDC  2,0(6)	Set return value to 0 
316:     LD  3,-1(1)	Load return address 
317:     LD  1,0(1)	Adjust fp 
318:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,318(7)	Jump to init [backpatch] 
* INIT
319:    LDA  1,-22(0)	set first frame at end of globals 
320:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
321:    LDC  3,10(6)	load size of array g
322:     ST  3,0(0)	save size of array g
323:    LDC  3,10(6)	load size of array s
324:     ST  3,-11(0)	save size of array s
* END INIT GLOBALS AND STATICS
325:    LDA  3,1(7)	Return address in ac 
326:    JMP  7,-237(7)	Jump to main 
327:   HALT  0,0,0	DONE! 
* END INIT
