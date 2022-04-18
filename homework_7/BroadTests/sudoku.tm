* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  sudoku.c-
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
* FUNCTION initBoard
* TOFF set: -2
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
 40:    LDC  3,0(6)	Load integer constant 
 41:     ST  3,-2(1)	Store variable i
* WHILE
 42:     LD  3,-2(1)	Load variable i
 43:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 44:    LDC  3,81(6)	Load integer constant 
* TOFF inc: -3
 45:     LD  4,-3(1)	Pop left into ac1 
 46:    TLT  3,4,3	Op < 
 47:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
 49:     LD  3,-2(1)	Load variable i
 50:     ST  3,-3(1)	Push index 
* TOFF dec: -4
 51:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -3
 52:     LD  4,-3(1)	Pop index 
 53:    LDA  5,-1(0)	Load address of base of array board
 54:    SUB  5,5,4	Compute offset of value 
 55:     ST  3,0(5)	Store variable board
* EXPRESSION
 56:     LD  3,-2(1)	Load variable i
 57:     ST  3,-3(1)	Push index 
* TOFF dec: -4
 58:    LDC  3,0(6)	Load Boolean constant 
* TOFF inc: -3
 59:     LD  4,-3(1)	Pop index 
 60:    LDA  5,-83(0)	Load address of base of array locked
 61:    SUB  5,5,4	Compute offset of value 
 62:     ST  3,0(5)	Store variable locked
* EXPRESSION
 63:     LD  3,-2(1)	load lhs variable i
 64:    LDA  3,1(3)	increment value of i
 65:     ST  3,-2(1)	Store variable i
* TOFF set: -3
* END COMPOUND
 66:    JMP  7,-25(7)	go to beginning of loop 
 48:    JMP  7,18(7)	Jump past loop [backpatch] 
* END WHILE
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
 67:    LDC  2,0(6)	Set return value to 0 
 68:     LD  3,-1(1)	Load return address 
 69:     LD  1,0(1)	Adjust fp 
 70:    JMP  7,0(3)	Return 
* END FUNCTION initBoard
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION setValue
* TOFF set: -5
 71:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -5
* Compound Body
* EXPRESSION
 72:     LD  3,-2(1)	Load variable row
 73:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 74:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -5
 75:     LD  4,-5(1)	Pop left into ac1 
 76:    MUL  3,4,3	Op * 
 77:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 78:     LD  3,-3(1)	Load variable col
* TOFF inc: -5
 79:     LD  4,-5(1)	Pop left into ac1 
 80:    ADD  3,4,3	Op + 
 81:     ST  3,-5(1)	Push index 
* TOFF dec: -6
 82:     LD  3,-4(1)	Load variable value
* TOFF inc: -5
 83:     LD  4,-5(1)	Pop index 
 84:    LDA  5,-1(0)	Load address of base of array board
 85:    SUB  5,5,4	Compute offset of value 
 86:     ST  3,0(5)	Store variable board
* TOFF set: -5
* END COMPOUND
* Add standard closing in case there is no return statement
 87:    LDC  2,0(6)	Set return value to 0 
 88:     LD  3,-1(1)	Load return address 
 89:     LD  1,0(1)	Adjust fp 
 90:    JMP  7,0(3)	Return 
* END FUNCTION setValue
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION getValue
* TOFF set: -4
 91:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -4
* Compound Body
* RETURN
 92:    LDA  3,-1(0)	Load address of base of array board
 93:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 94:     LD  3,-2(1)	Load variable row
 95:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 96:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -5
 97:     LD  4,-5(1)	Pop left into ac1 
 98:    MUL  3,4,3	Op * 
 99:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
100:     LD  3,-3(1)	Load variable col
* TOFF inc: -5
101:     LD  4,-5(1)	Pop left into ac1 
102:    ADD  3,4,3	Op + 
* TOFF inc: -4
103:     LD  4,-4(1)	Pop left into ac1 
104:    SUB  3,4,3	compute location from index 
105:     LD  3,0(3)	Load array element 
106:    LDA  2,0(3)	Copy result to return register 
107:     LD  3,-1(1)	Load return address 
108:     LD  1,0(1)	Adjust fp 
109:    JMP  7,0(3)	Return 
* TOFF set: -4
* END COMPOUND
* Add standard closing in case there is no return statement
110:    LDC  2,0(6)	Set return value to 0 
111:     LD  3,-1(1)	Load return address 
112:     LD  1,0(1)	Adjust fp 
113:    JMP  7,0(3)	Return 
* END FUNCTION getValue
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION setLocked
* TOFF set: -5
114:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -5
* Compound Body
* EXPRESSION
115:     LD  3,-2(1)	Load variable row
116:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
117:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -5
118:     LD  4,-5(1)	Pop left into ac1 
119:    MUL  3,4,3	Op * 
120:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
121:     LD  3,-3(1)	Load variable col
* TOFF inc: -5
122:     LD  4,-5(1)	Pop left into ac1 
123:    ADD  3,4,3	Op + 
124:     ST  3,-5(1)	Push index 
* TOFF dec: -6
125:     LD  3,-4(1)	Load variable value
* TOFF inc: -5
126:     LD  4,-5(1)	Pop index 
127:    LDA  5,-83(0)	Load address of base of array locked
128:    SUB  5,5,4	Compute offset of value 
129:     ST  3,0(5)	Store variable locked
* TOFF set: -5
* END COMPOUND
* Add standard closing in case there is no return statement
130:    LDC  2,0(6)	Set return value to 0 
131:     LD  3,-1(1)	Load return address 
132:     LD  1,0(1)	Adjust fp 
133:    JMP  7,0(3)	Return 
* END FUNCTION setLocked
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION getLocked
* TOFF set: -4
134:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -4
* Compound Body
* RETURN
135:    LDA  3,-83(0)	Load address of base of array locked
136:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
137:     LD  3,-2(1)	Load variable row
138:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
139:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -5
140:     LD  4,-5(1)	Pop left into ac1 
141:    MUL  3,4,3	Op * 
142:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
143:     LD  3,-3(1)	Load variable col
* TOFF inc: -5
144:     LD  4,-5(1)	Pop left into ac1 
145:    ADD  3,4,3	Op + 
* TOFF inc: -4
146:     LD  4,-4(1)	Pop left into ac1 
147:    SUB  3,4,3	compute location from index 
148:     LD  3,0(3)	Load array element 
149:    LDA  2,0(3)	Copy result to return register 
150:     LD  3,-1(1)	Load return address 
151:     LD  1,0(1)	Adjust fp 
152:    JMP  7,0(3)	Return 
* TOFF set: -4
* END COMPOUND
* Add standard closing in case there is no return statement
153:    LDC  2,0(6)	Set return value to 0 
154:     LD  3,-1(1)	Load return address 
155:     LD  1,0(1)	Adjust fp 
156:    JMP  7,0(3)	Return 
* END FUNCTION getLocked
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION isOkAt
* TOFF set: -5
157:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -9
* Compound Body
* EXPRESSION
158:    LDC  3,0(6)	Load integer constant 
159:     ST  3,-5(1)	Store variable i
* WHILE
160:     LD  3,-5(1)	Load variable i
161:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
162:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -9
163:     LD  4,-9(1)	Pop left into ac1 
164:    TLT  3,4,3	Op < 
165:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -9
* Compound Body
* IF
* CALL getValue
167:     ST  1,-9(1)	Store fp in ghost frame for getValue
* TOFF dec: -10
* TOFF dec: -11
* Param 1
168:     LD  3,-5(1)	Load variable i
169:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param 2
170:     LD  3,-3(1)	Load variable col
171:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param end getValue
172:    LDA  1,-9(1)	Ghost frame becomes new active frame 
173:    LDA  3,1(7)	Return address in ac 
174:    JMP  7,-84(7)	CALL getValue
175:    LDA  3,0(2)	Save the result in ac 
* Call end getValue
* TOFF set: -9
176:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
177:     LD  3,-4(1)	Load variable value
* TOFF inc: -9
178:     LD  4,-9(1)	Pop left into ac1 
179:    TEQ  3,4,3	Op = 
* THEN
* RETURN
181:    LDC  3,0(6)	Load Boolean constant 
182:    LDA  2,0(3)	Copy result to return register 
183:     LD  3,-1(1)	Load return address 
184:     LD  1,0(1)	Adjust fp 
185:    JMP  7,0(3)	Return 
180:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* END IF
* IF
* CALL getValue
186:     ST  1,-9(1)	Store fp in ghost frame for getValue
* TOFF dec: -10
* TOFF dec: -11
* Param 1
187:     LD  3,-2(1)	Load variable row
188:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param 2
189:     LD  3,-5(1)	Load variable i
190:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param end getValue
191:    LDA  1,-9(1)	Ghost frame becomes new active frame 
192:    LDA  3,1(7)	Return address in ac 
193:    JMP  7,-103(7)	CALL getValue
194:    LDA  3,0(2)	Save the result in ac 
* Call end getValue
* TOFF set: -9
195:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
196:     LD  3,-4(1)	Load variable value
* TOFF inc: -9
197:     LD  4,-9(1)	Pop left into ac1 
198:    TEQ  3,4,3	Op = 
* THEN
* RETURN
200:    LDC  3,0(6)	Load Boolean constant 
201:    LDA  2,0(3)	Copy result to return register 
202:     LD  3,-1(1)	Load return address 
203:     LD  1,0(1)	Adjust fp 
204:    JMP  7,0(3)	Return 
199:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* END IF
* EXPRESSION
205:     LD  3,-5(1)	load lhs variable i
206:    LDA  3,1(3)	increment value of i
207:     ST  3,-5(1)	Store variable i
* TOFF set: -9
* END COMPOUND
208:    JMP  7,-49(7)	go to beginning of loop 
166:    JMP  7,42(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
209:     LD  3,-2(1)	Load variable row
210:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
211:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -9
212:     LD  4,-9(1)	Pop left into ac1 
213:    DIV  3,4,3	Op / 
214:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
215:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -9
216:     LD  4,-9(1)	Pop left into ac1 
217:    MUL  3,4,3	Op * 
218:     ST  3,-7(1)	Store variable boxRowStart
* EXPRESSION
219:     LD  3,-3(1)	Load variable col
220:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
221:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -9
222:     LD  4,-9(1)	Pop left into ac1 
223:    DIV  3,4,3	Op / 
224:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
225:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -9
226:     LD  4,-9(1)	Pop left into ac1 
227:    MUL  3,4,3	Op * 
228:     ST  3,-8(1)	Store variable boxColStart
* EXPRESSION
229:    LDC  3,0(6)	Load integer constant 
230:     ST  3,-5(1)	Store variable i
* WHILE
231:     LD  3,-5(1)	Load variable i
232:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
233:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -9
234:     LD  4,-9(1)	Pop left into ac1 
235:    TLT  3,4,3	Op < 
236:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -9
* Compound Body
* EXPRESSION
238:    LDC  3,0(6)	Load integer constant 
239:     ST  3,-6(1)	Store variable j
* WHILE
240:     LD  3,-6(1)	Load variable j
241:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
242:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -9
243:     LD  4,-9(1)	Pop left into ac1 
244:    TLT  3,4,3	Op < 
245:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -9
* Compound Body
* IF
* CALL getValue
247:     ST  1,-9(1)	Store fp in ghost frame for getValue
* TOFF dec: -10
* TOFF dec: -11
* Param 1
248:     LD  3,-7(1)	Load variable boxRowStart
249:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
250:     LD  3,-5(1)	Load variable i
* TOFF inc: -11
251:     LD  4,-11(1)	Pop left into ac1 
252:    ADD  3,4,3	Op + 
253:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param 2
254:     LD  3,-8(1)	Load variable boxColStart
255:     ST  3,-12(1)	Push left side 
* TOFF dec: -13
256:     LD  3,-6(1)	Load variable j
* TOFF inc: -12
257:     LD  4,-12(1)	Pop left into ac1 
258:    ADD  3,4,3	Op + 
259:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param end getValue
260:    LDA  1,-9(1)	Ghost frame becomes new active frame 
261:    LDA  3,1(7)	Return address in ac 
262:    JMP  7,-172(7)	CALL getValue
263:    LDA  3,0(2)	Save the result in ac 
* Call end getValue
* TOFF set: -9
264:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
265:     LD  3,-4(1)	Load variable value
* TOFF inc: -9
266:     LD  4,-9(1)	Pop left into ac1 
267:    TEQ  3,4,3	Op = 
* THEN
* RETURN
269:    LDC  3,0(6)	Load Boolean constant 
270:    LDA  2,0(3)	Copy result to return register 
271:     LD  3,-1(1)	Load return address 
272:     LD  1,0(1)	Adjust fp 
273:    JMP  7,0(3)	Return 
268:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* END IF
* EXPRESSION
274:     LD  3,-6(1)	load lhs variable j
275:    LDA  3,1(3)	increment value of j
276:     ST  3,-6(1)	Store variable j
* TOFF set: -9
* END COMPOUND
277:    JMP  7,-38(7)	go to beginning of loop 
246:    JMP  7,31(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
278:     LD  3,-5(1)	load lhs variable i
279:    LDA  3,1(3)	increment value of i
280:     ST  3,-5(1)	Store variable i
* TOFF set: -9
* END COMPOUND
281:    JMP  7,-51(7)	go to beginning of loop 
237:    JMP  7,44(7)	Jump past loop [backpatch] 
* END WHILE
* RETURN
282:    LDC  3,1(6)	Load Boolean constant 
283:    LDA  2,0(3)	Copy result to return register 
284:     LD  3,-1(1)	Load return address 
285:     LD  1,0(1)	Adjust fp 
286:    JMP  7,0(3)	Return 
* TOFF set: -5
* END COMPOUND
* Add standard closing in case there is no return statement
287:    LDC  2,0(6)	Set return value to 0 
288:     LD  3,-1(1)	Load return address 
289:     LD  1,0(1)	Adjust fp 
290:    JMP  7,0(3)	Return 
* END FUNCTION isOkAt
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION search
* TOFF set: -4
291:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -4
* Compound Body
* IF
* CALL getLocked
292:     ST  1,-4(1)	Store fp in ghost frame for getLocked
* TOFF dec: -5
* TOFF dec: -6
* Param 1
293:     LD  3,-2(1)	Load variable i
294:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param 2
295:     LD  3,-3(1)	Load variable j
296:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end getLocked
297:    LDA  1,-4(1)	Ghost frame becomes new active frame 
298:    LDA  3,1(7)	Return address in ac 
299:    JMP  7,-166(7)	CALL getLocked
300:    LDA  3,0(2)	Save the result in ac 
* Call end getLocked
* TOFF set: -4
* THEN
* COMPOUND
* TOFF set: -4
* Compound Body
* IF
302:     LD  3,-2(1)	Load variable i
303:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
304:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -4
305:     LD  4,-4(1)	Pop left into ac1 
306:    TEQ  3,4,3	Op = 
307:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
308:     LD  3,-3(1)	Load variable j
309:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
310:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -5
311:     LD  4,-5(1)	Pop left into ac1 
312:    TEQ  3,4,3	Op = 
* TOFF inc: -4
313:     LD  4,-4(1)	Pop left into ac1 
314:    AND  3,4,3	Op AND 
* THEN
* RETURN
316:    LDC  3,1(6)	Load Boolean constant 
317:    LDA  2,0(3)	Copy result to return register 
318:     LD  3,-1(1)	Load return address 
319:     LD  1,0(1)	Adjust fp 
320:    JMP  7,0(3)	Return 
315:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
322:     LD  3,-3(1)	Load variable j
323:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
324:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -4
325:     LD  4,-4(1)	Pop left into ac1 
326:    TEQ  3,4,3	Op = 
* THEN
* RETURN
* CALL search
328:     ST  1,-4(1)	Store fp in ghost frame for search
* TOFF dec: -5
* TOFF dec: -6
* Param 1
329:     LD  3,-2(1)	Load variable i
330:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
331:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -6
332:     LD  4,-6(1)	Pop left into ac1 
333:    ADD  3,4,3	Op + 
334:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param 2
335:    LDC  3,0(6)	Load integer constant 
336:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end search
337:    LDA  1,-4(1)	Ghost frame becomes new active frame 
338:    LDA  3,1(7)	Return address in ac 
339:    JMP  7,-49(7)	CALL search
340:    LDA  3,0(2)	Save the result in ac 
* Call end search
* TOFF set: -4
341:    LDA  2,0(3)	Copy result to return register 
342:     LD  3,-1(1)	Load return address 
343:     LD  1,0(1)	Adjust fp 
344:    JMP  7,0(3)	Return 
327:    JZR  3,18(7)	Jump around the THEN if false [backpatch] 
* ELSE
* RETURN
* CALL search
346:     ST  1,-4(1)	Store fp in ghost frame for search
* TOFF dec: -5
* TOFF dec: -6
* Param 1
347:     LD  3,-2(1)	Load variable i
348:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param 2
349:     LD  3,-3(1)	Load variable j
350:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
351:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -7
352:     LD  4,-7(1)	Pop left into ac1 
353:    ADD  3,4,3	Op + 
354:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end search
355:    LDA  1,-4(1)	Ghost frame becomes new active frame 
356:    LDA  3,1(7)	Return address in ac 
357:    JMP  7,-67(7)	CALL search
358:    LDA  3,0(2)	Save the result in ac 
* Call end search
* TOFF set: -4
359:    LDA  2,0(3)	Copy result to return register 
360:     LD  3,-1(1)	Load return address 
361:     LD  1,0(1)	Adjust fp 
362:    JMP  7,0(3)	Return 
345:    JMP  7,17(7)	Jump around the ELSE [backpatch] 
* END IF
321:    JMP  7,41(7)	Jump around the ELSE [backpatch] 
* END IF
* TOFF set: -4
* END COMPOUND
301:    JZR  3,62(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* TOFF set: -6
* Compound Body
* EXPRESSION
364:    LDC  3,1(6)	Load integer constant 
365:     ST  3,-4(1)	Store variable n
* WHILE
366:     LD  3,-4(1)	Load variable n
367:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
368:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -6
369:     LD  4,-6(1)	Pop left into ac1 
370:    TLE  3,4,3	Op <= 
371:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -6
* Compound Body
* IF
* CALL isOkAt
373:     ST  1,-6(1)	Store fp in ghost frame for isOkAt
* TOFF dec: -7
* TOFF dec: -8
* Param 1
374:     LD  3,-2(1)	Load variable i
375:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param 2
376:     LD  3,-3(1)	Load variable j
377:     ST  3,-9(1)	Push parameter 
* TOFF dec: -10
* Param 3
378:     LD  3,-4(1)	Load variable n
379:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end isOkAt
380:    LDA  1,-6(1)	Ghost frame becomes new active frame 
381:    LDA  3,1(7)	Return address in ac 
382:    JMP  7,-226(7)	CALL isOkAt
383:    LDA  3,0(2)	Save the result in ac 
* Call end isOkAt
* TOFF set: -6
* THEN
* COMPOUND
* TOFF set: -6
* Compound Body
* EXPRESSION
* CALL setValue
385:     ST  1,-6(1)	Store fp in ghost frame for setValue
* TOFF dec: -7
* TOFF dec: -8
* Param 1
386:     LD  3,-2(1)	Load variable i
387:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param 2
388:     LD  3,-3(1)	Load variable j
389:     ST  3,-9(1)	Push parameter 
* TOFF dec: -10
* Param 3
390:     LD  3,-4(1)	Load variable n
391:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end setValue
392:    LDA  1,-6(1)	Ghost frame becomes new active frame 
393:    LDA  3,1(7)	Return address in ac 
394:    JMP  7,-324(7)	CALL setValue
395:    LDA  3,0(2)	Save the result in ac 
* Call end setValue
* TOFF set: -6
* IF
396:     LD  3,-2(1)	Load variable i
397:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
398:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -6
399:     LD  4,-6(1)	Pop left into ac1 
400:    TEQ  3,4,3	Op = 
401:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
402:     LD  3,-3(1)	Load variable j
403:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
404:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -7
405:     LD  4,-7(1)	Pop left into ac1 
406:    TEQ  3,4,3	Op = 
* TOFF inc: -6
407:     LD  4,-6(1)	Pop left into ac1 
408:    AND  3,4,3	Op AND 
* THEN
* RETURN
410:    LDC  3,1(6)	Load Boolean constant 
411:    LDA  2,0(3)	Copy result to return register 
412:     LD  3,-1(1)	Load return address 
413:     LD  1,0(1)	Adjust fp 
414:    JMP  7,0(3)	Return 
409:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
416:     LD  3,-3(1)	Load variable j
417:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
418:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -6
419:     LD  4,-6(1)	Pop left into ac1 
420:    TEQ  3,4,3	Op = 
* THEN
* EXPRESSION
* CALL search
422:     ST  1,-6(1)	Store fp in ghost frame for search
* TOFF dec: -7
* TOFF dec: -8
* Param 1
423:     LD  3,-2(1)	Load variable i
424:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
425:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -8
426:     LD  4,-8(1)	Pop left into ac1 
427:    ADD  3,4,3	Op + 
428:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param 2
429:    LDC  3,0(6)	Load integer constant 
430:     ST  3,-9(1)	Push parameter 
* TOFF dec: -10
* Param end search
431:    LDA  1,-6(1)	Ghost frame becomes new active frame 
432:    LDA  3,1(7)	Return address in ac 
433:    JMP  7,-143(7)	CALL search
434:    LDA  3,0(2)	Save the result in ac 
* Call end search
* TOFF set: -6
435:     ST  3,-5(1)	Store variable foundOne
421:    JZR  3,15(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
* CALL search
437:     ST  1,-6(1)	Store fp in ghost frame for search
* TOFF dec: -7
* TOFF dec: -8
* Param 1
438:     LD  3,-2(1)	Load variable i
439:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param 2
440:     LD  3,-3(1)	Load variable j
441:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
442:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -9
443:     LD  4,-9(1)	Pop left into ac1 
444:    ADD  3,4,3	Op + 
445:     ST  3,-9(1)	Push parameter 
* TOFF dec: -10
* Param end search
446:    LDA  1,-6(1)	Ghost frame becomes new active frame 
447:    LDA  3,1(7)	Return address in ac 
448:    JMP  7,-158(7)	CALL search
449:    LDA  3,0(2)	Save the result in ac 
* Call end search
* TOFF set: -6
450:     ST  3,-5(1)	Store variable foundOne
436:    JMP  7,14(7)	Jump around the ELSE [backpatch] 
* END IF
415:    JMP  7,35(7)	Jump around the ELSE [backpatch] 
* END IF
* IF
451:     LD  3,-5(1)	Load variable foundOne
* THEN
* RETURN
453:    LDC  3,1(6)	Load Boolean constant 
454:    LDA  2,0(3)	Copy result to return register 
455:     LD  3,-1(1)	Load return address 
456:     LD  1,0(1)	Adjust fp 
457:    JMP  7,0(3)	Return 
452:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
* CALL setValue
459:     ST  1,-6(1)	Store fp in ghost frame for setValue
* TOFF dec: -7
* TOFF dec: -8
* Param 1
460:     LD  3,-2(1)	Load variable i
461:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param 2
462:     LD  3,-3(1)	Load variable j
463:     ST  3,-9(1)	Push parameter 
* TOFF dec: -10
* Param 3
464:    LDC  3,0(6)	Load integer constant 
465:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end setValue
466:    LDA  1,-6(1)	Ghost frame becomes new active frame 
467:    LDA  3,1(7)	Return address in ac 
468:    JMP  7,-398(7)	CALL setValue
469:    LDA  3,0(2)	Save the result in ac 
* Call end setValue
* TOFF set: -6
458:    JMP  7,11(7)	Jump around the ELSE [backpatch] 
* END IF
* TOFF set: -6
* END COMPOUND
384:    JZR  3,85(7)	Jump around the THEN if false [backpatch] 
* END IF
* EXPRESSION
470:     LD  3,-4(1)	load lhs variable n
471:    LDA  3,1(3)	increment value of n
472:     ST  3,-4(1)	Store variable n
* TOFF set: -6
* END COMPOUND
473:    JMP  7,-108(7)	go to beginning of loop 
372:    JMP  7,101(7)	Jump past loop [backpatch] 
* END WHILE
* TOFF set: -4
* END COMPOUND
363:    JMP  7,110(7)	Jump around the ELSE [backpatch] 
* END IF
* RETURN
474:    LDC  3,0(6)	Load Boolean constant 
475:    LDA  2,0(3)	Copy result to return register 
476:     LD  3,-1(1)	Load return address 
477:     LD  1,0(1)	Adjust fp 
478:    JMP  7,0(3)	Return 
* TOFF set: -4
* END COMPOUND
* Add standard closing in case there is no return statement
479:    LDC  2,0(6)	Set return value to 0 
480:     LD  3,-1(1)	Load return address 
481:     LD  1,0(1)	Adjust fp 
482:    JMP  7,0(3)	Return 
* END FUNCTION search
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION searchTrivial
* TOFF set: -2
483:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -8
* Compound Body
* EXPRESSION
484:    LDC  3,1(6)	Load Boolean constant 
485:     ST  3,-6(1)	Store variable changed
* WHILE
486:     LD  3,-6(1)	Load variable changed
487:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -8
* Compound Body
* EXPRESSION
489:    LDC  3,0(6)	Load Boolean constant 
490:     ST  3,-6(1)	Store variable changed
* EXPRESSION
491:    LDC  3,0(6)	Load integer constant 
492:     ST  3,-2(1)	Store variable i
* WHILE
493:     LD  3,-2(1)	Load variable i
494:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
495:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -8
496:     LD  4,-8(1)	Pop left into ac1 
497:    TLT  3,4,3	Op < 
498:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -8
* Compound Body
* EXPRESSION
500:    LDC  3,0(6)	Load integer constant 
501:     ST  3,-3(1)	Store variable j
* WHILE
502:     LD  3,-3(1)	Load variable j
503:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
504:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -8
505:     LD  4,-8(1)	Pop left into ac1 
506:    TLT  3,4,3	Op < 
507:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -8
* Compound Body
* IF
* CALL getLocked
509:     ST  1,-8(1)	Store fp in ghost frame for getLocked
* TOFF dec: -9
* TOFF dec: -10
* Param 1
510:     LD  3,-2(1)	Load variable i
511:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param 2
512:     LD  3,-3(1)	Load variable j
513:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param end getLocked
514:    LDA  1,-8(1)	Ghost frame becomes new active frame 
515:    LDA  3,1(7)	Return address in ac 
516:    JMP  7,-383(7)	CALL getLocked
517:    LDA  3,0(2)	Save the result in ac 
* Call end getLocked
* TOFF set: -8
518:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
519:    LDC  3,0(6)	Load Boolean constant 
* TOFF inc: -8
520:     LD  4,-8(1)	Pop left into ac1 
521:    TEQ  3,4,3	Op = 
* THEN
* COMPOUND
* TOFF set: -8
* Compound Body
* EXPRESSION
523:    LDC  3,1(6)	Load integer constant 
524:     ST  3,-4(1)	Store variable test
* EXPRESSION
525:    LDC  3,0(6)	Load Boolean constant 
526:     ST  3,-7(1)	Store variable foundOne
* WHILE
527:     LD  3,-4(1)	Load variable test
528:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
529:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -8
530:     LD  4,-8(1)	Pop left into ac1 
531:    TLE  3,4,3	Op <= 
532:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -8
* Compound Body
* IF
* CALL isOkAt
534:     ST  1,-8(1)	Store fp in ghost frame for isOkAt
* TOFF dec: -9
* TOFF dec: -10
* Param 1
535:     LD  3,-2(1)	Load variable i
536:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param 2
537:     LD  3,-3(1)	Load variable j
538:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param 3
539:     LD  3,-4(1)	Load variable test
540:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param end isOkAt
541:    LDA  1,-8(1)	Ghost frame becomes new active frame 
542:    LDA  3,1(7)	Return address in ac 
543:    JMP  7,-387(7)	CALL isOkAt
544:    LDA  3,0(2)	Save the result in ac 
* Call end isOkAt
* TOFF set: -8
* THEN
* COMPOUND
* TOFF set: -8
* Compound Body
* IF
546:     LD  3,-7(1)	Load variable foundOne
* THEN
* COMPOUND
* TOFF set: -8
* Compound Body
* EXPRESSION
548:    LDC  3,0(6)	Load Boolean constant 
549:     ST  3,-7(1)	Store variable foundOne
* BREAK
550:    JMP  7,-18(7)	break 
* TOFF set: -8
* END COMPOUND
547:    JZR  3,4(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* TOFF set: -8
* Compound Body
* EXPRESSION
552:    LDC  3,1(6)	Load Boolean constant 
553:     ST  3,-7(1)	Store variable foundOne
* EXPRESSION
554:     LD  3,-4(1)	Load variable test
555:     ST  3,-5(1)	Store variable value
* TOFF set: -8
* END COMPOUND
551:    JMP  7,4(7)	Jump around the ELSE [backpatch] 
* END IF
* TOFF set: -8
* END COMPOUND
545:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* END IF
* EXPRESSION
556:     LD  3,-4(1)	load lhs variable test
557:    LDA  3,1(3)	increment value of test
558:     ST  3,-4(1)	Store variable test
* TOFF set: -8
* END COMPOUND
559:    JMP  7,-33(7)	go to beginning of loop 
533:    JMP  7,26(7)	Jump past loop [backpatch] 
* END WHILE
* IF
560:     LD  3,-7(1)	Load variable foundOne
* THEN
* COMPOUND
* TOFF set: -8
* Compound Body
* EXPRESSION
* CALL setValue
562:     ST  1,-8(1)	Store fp in ghost frame for setValue
* TOFF dec: -9
* TOFF dec: -10
* Param 1
563:     LD  3,-2(1)	Load variable i
564:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param 2
565:     LD  3,-3(1)	Load variable j
566:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param 3
567:     LD  3,-5(1)	Load variable value
568:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param end setValue
569:    LDA  1,-8(1)	Ghost frame becomes new active frame 
570:    LDA  3,1(7)	Return address in ac 
571:    JMP  7,-501(7)	CALL setValue
572:    LDA  3,0(2)	Save the result in ac 
* Call end setValue
* TOFF set: -8
* EXPRESSION
* CALL setLocked
573:     ST  1,-8(1)	Store fp in ghost frame for setLocked
* TOFF dec: -9
* TOFF dec: -10
* Param 1
574:     LD  3,-2(1)	Load variable i
575:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param 2
576:     LD  3,-3(1)	Load variable j
577:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param 3
578:    LDC  3,1(6)	Load Boolean constant 
579:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param end setLocked
580:    LDA  1,-8(1)	Ghost frame becomes new active frame 
581:    LDA  3,1(7)	Return address in ac 
582:    JMP  7,-469(7)	CALL setLocked
583:    LDA  3,0(2)	Save the result in ac 
* Call end setLocked
* TOFF set: -8
* EXPRESSION
584:    LDC  3,1(6)	Load Boolean constant 
585:     ST  3,-6(1)	Store variable changed
* TOFF set: -8
* END COMPOUND
561:    JZR  3,24(7)	Jump around the THEN if false [backpatch] 
* END IF
* TOFF set: -8
* END COMPOUND
522:    JZR  3,63(7)	Jump around the THEN if false [backpatch] 
* END IF
* EXPRESSION
586:     LD  3,-3(1)	load lhs variable j
587:    LDA  3,1(3)	increment value of j
588:     ST  3,-3(1)	Store variable j
* TOFF set: -8
* END COMPOUND
589:    JMP  7,-88(7)	go to beginning of loop 
508:    JMP  7,81(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
590:     LD  3,-2(1)	load lhs variable i
591:    LDA  3,1(3)	increment value of i
592:     ST  3,-2(1)	Store variable i
* TOFF set: -8
* END COMPOUND
593:    JMP  7,-101(7)	go to beginning of loop 
499:    JMP  7,94(7)	Jump past loop [backpatch] 
* END WHILE
* TOFF set: -8
* END COMPOUND
594:    JMP  7,-109(7)	go to beginning of loop 
488:    JMP  7,106(7)	Jump past loop [backpatch] 
* END WHILE
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
595:    LDC  2,0(6)	Set return value to 0 
596:     LD  3,-1(1)	Load return address 
597:     LD  1,0(1)	Adjust fp 
598:    JMP  7,0(3)	Return 
* END FUNCTION searchTrivial
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION solve
* TOFF set: -2
599:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -5
* Compound Body
* EXPRESSION
600:    LDC  3,0(6)	Load integer constant 
601:     ST  3,-2(1)	Store variable i
* WHILE
602:     LD  3,-2(1)	Load variable i
603:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
604:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -5
605:     LD  4,-5(1)	Pop left into ac1 
606:    TLT  3,4,3	Op < 
607:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -5
* Compound Body
* EXPRESSION
609:    LDC  3,0(6)	Load integer constant 
610:     ST  3,-3(1)	Store variable j
* WHILE
611:     LD  3,-3(1)	Load variable j
612:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
613:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -5
614:     LD  4,-5(1)	Pop left into ac1 
615:    TLT  3,4,3	Op < 
616:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -5
* Compound Body
* EXPRESSION
* CALL getValue
618:     ST  1,-5(1)	Store fp in ghost frame for getValue
* TOFF dec: -6
* TOFF dec: -7
* Param 1
619:     LD  3,-2(1)	Load variable i
620:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param 2
621:     LD  3,-3(1)	Load variable j
622:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end getValue
623:    LDA  1,-5(1)	Ghost frame becomes new active frame 
624:    LDA  3,1(7)	Return address in ac 
625:    JMP  7,-535(7)	CALL getValue
626:    LDA  3,0(2)	Save the result in ac 
* Call end getValue
* TOFF set: -5
627:     ST  3,-4(1)	Store variable n
* EXPRESSION
* CALL setValue
628:     ST  1,-5(1)	Store fp in ghost frame for setValue
* TOFF dec: -6
* TOFF dec: -7
* Param 1
629:     LD  3,-2(1)	Load variable i
630:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param 2
631:     LD  3,-3(1)	Load variable j
632:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param 3
633:    LDC  3,0(6)	Load integer constant 
634:     ST  3,-9(1)	Push parameter 
* TOFF dec: -10
* Param end setValue
635:    LDA  1,-5(1)	Ghost frame becomes new active frame 
636:    LDA  3,1(7)	Return address in ac 
637:    JMP  7,-567(7)	CALL setValue
638:    LDA  3,0(2)	Save the result in ac 
* Call end setValue
* TOFF set: -5
* IF
* CALL getLocked
639:     ST  1,-5(1)	Store fp in ghost frame for getLocked
* TOFF dec: -6
* TOFF dec: -7
* Param 1
640:     LD  3,-2(1)	Load variable i
641:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param 2
642:     LD  3,-3(1)	Load variable j
643:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end getLocked
644:    LDA  1,-5(1)	Ghost frame becomes new active frame 
645:    LDA  3,1(7)	Return address in ac 
646:    JMP  7,-513(7)	CALL getLocked
647:    LDA  3,0(2)	Save the result in ac 
* Call end getLocked
* TOFF set: -5
648:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
649:    LDC  3,1(6)	Load Boolean constant 
* TOFF inc: -5
650:     LD  4,-5(1)	Pop left into ac1 
651:    TEQ  3,4,3	Op = 
652:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
* CALL isOkAt
653:     ST  1,-6(1)	Store fp in ghost frame for isOkAt
* TOFF dec: -7
* TOFF dec: -8
* Param 1
654:     LD  3,-2(1)	Load variable i
655:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param 2
656:     LD  3,-3(1)	Load variable j
657:     ST  3,-9(1)	Push parameter 
* TOFF dec: -10
* Param 3
658:     LD  3,-4(1)	Load variable n
659:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end isOkAt
660:    LDA  1,-6(1)	Ghost frame becomes new active frame 
661:    LDA  3,1(7)	Return address in ac 
662:    JMP  7,-506(7)	CALL isOkAt
663:    LDA  3,0(2)	Save the result in ac 
* Call end isOkAt
* TOFF set: -6
664:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
665:    LDC  3,0(6)	Load Boolean constant 
* TOFF inc: -6
666:     LD  4,-6(1)	Pop left into ac1 
667:    TEQ  3,4,3	Op = 
* TOFF inc: -5
668:     LD  4,-5(1)	Pop left into ac1 
669:    AND  3,4,3	Op AND 
* THEN
* RETURN
671:    LDC  3,0(6)	Load Boolean constant 
672:    LDA  2,0(3)	Copy result to return register 
673:     LD  3,-1(1)	Load return address 
674:     LD  1,0(1)	Adjust fp 
675:    JMP  7,0(3)	Return 
670:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* END IF
* EXPRESSION
* CALL setValue
676:     ST  1,-5(1)	Store fp in ghost frame for setValue
* TOFF dec: -6
* TOFF dec: -7
* Param 1
677:     LD  3,-2(1)	Load variable i
678:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param 2
679:     LD  3,-3(1)	Load variable j
680:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param 3
681:     LD  3,-4(1)	Load variable n
682:     ST  3,-9(1)	Push parameter 
* TOFF dec: -10
* Param end setValue
683:    LDA  1,-5(1)	Ghost frame becomes new active frame 
684:    LDA  3,1(7)	Return address in ac 
685:    JMP  7,-615(7)	CALL setValue
686:    LDA  3,0(2)	Save the result in ac 
* Call end setValue
* TOFF set: -5
* EXPRESSION
687:     LD  3,-3(1)	load lhs variable j
688:    LDA  3,1(3)	increment value of j
689:     ST  3,-3(1)	Store variable j
* TOFF set: -5
* END COMPOUND
690:    JMP  7,-80(7)	go to beginning of loop 
617:    JMP  7,73(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
691:     LD  3,-2(1)	load lhs variable i
692:    LDA  3,1(3)	increment value of i
693:     ST  3,-2(1)	Store variable i
* TOFF set: -5
* END COMPOUND
694:    JMP  7,-93(7)	go to beginning of loop 
608:    JMP  7,86(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
* CALL searchTrivial
695:     ST  1,-5(1)	Store fp in ghost frame for searchTrivial
* TOFF dec: -6
* TOFF dec: -7
* Param end searchTrivial
696:    LDA  1,-5(1)	Ghost frame becomes new active frame 
697:    LDA  3,1(7)	Return address in ac 
698:    JMP  7,-216(7)	CALL searchTrivial
699:    LDA  3,0(2)	Save the result in ac 
* Call end searchTrivial
* TOFF set: -5
* RETURN
* CALL search
700:     ST  1,-5(1)	Store fp in ghost frame for search
* TOFF dec: -6
* TOFF dec: -7
* Param 1
701:    LDC  3,0(6)	Load integer constant 
702:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param 2
703:    LDC  3,0(6)	Load integer constant 
704:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end search
705:    LDA  1,-5(1)	Ghost frame becomes new active frame 
706:    LDA  3,1(7)	Return address in ac 
707:    JMP  7,-417(7)	CALL search
708:    LDA  3,0(2)	Save the result in ac 
* Call end search
* TOFF set: -5
709:    LDA  2,0(3)	Copy result to return register 
710:     LD  3,-1(1)	Load return address 
711:     LD  1,0(1)	Adjust fp 
712:    JMP  7,0(3)	Return 
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
713:    LDC  2,0(6)	Set return value to 0 
714:     LD  3,-1(1)	Load return address 
715:     LD  1,0(1)	Adjust fp 
716:    JMP  7,0(3)	Return 
* END FUNCTION solve
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION showBoard
* TOFF set: -2
717:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -4
* Compound Body
* EXPRESSION
* CALL outnl
718:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
719:    LDA  1,-4(1)	Ghost frame becomes new active frame 
720:    LDA  3,1(7)	Return address in ac 
721:    JMP  7,-688(7)	CALL outnl
722:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
* EXPRESSION
723:    LDC  3,0(6)	Load integer constant 
724:     ST  3,-2(1)	Store variable i
* WHILE
725:     LD  3,-2(1)	Load variable i
726:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
727:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -4
728:     LD  4,-4(1)	Pop left into ac1 
729:    TLT  3,4,3	Op < 
730:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -4
* Compound Body
* EXPRESSION
732:    LDC  3,0(6)	Load integer constant 
733:     ST  3,-3(1)	Store variable j
* WHILE
734:     LD  3,-3(1)	Load variable j
735:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
736:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -4
737:     LD  4,-4(1)	Pop left into ac1 
738:    TLT  3,4,3	Op < 
739:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -4
* Compound Body
* EXPRESSION
* CALL output
741:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
* CALL getValue
742:     ST  1,-6(1)	Store fp in ghost frame for getValue
* TOFF dec: -7
* TOFF dec: -8
* Param 1
743:     LD  3,-2(1)	Load variable i
744:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param 2
745:     LD  3,-3(1)	Load variable j
746:     ST  3,-9(1)	Push parameter 
* TOFF dec: -10
* Param end getValue
747:    LDA  1,-6(1)	Ghost frame becomes new active frame 
748:    LDA  3,1(7)	Return address in ac 
749:    JMP  7,-659(7)	CALL getValue
750:    LDA  3,0(2)	Save the result in ac 
* Call end getValue
* TOFF set: -6
751:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
752:    LDA  1,-4(1)	Ghost frame becomes new active frame 
753:    LDA  3,1(7)	Return address in ac 
754:    JMP  7,-749(7)	CALL output
755:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
756:     LD  3,-3(1)	load lhs variable j
757:    LDA  3,1(3)	increment value of j
758:     ST  3,-3(1)	Store variable j
* TOFF set: -4
* END COMPOUND
759:    JMP  7,-26(7)	go to beginning of loop 
740:    JMP  7,19(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
* CALL outnl
760:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
761:    LDA  1,-4(1)	Ghost frame becomes new active frame 
762:    LDA  3,1(7)	Return address in ac 
763:    JMP  7,-730(7)	CALL outnl
764:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
* EXPRESSION
765:     LD  3,-2(1)	load lhs variable i
766:    LDA  3,1(3)	increment value of i
767:     ST  3,-2(1)	Store variable i
* TOFF set: -4
* END COMPOUND
768:    JMP  7,-44(7)	go to beginning of loop 
731:    JMP  7,37(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
* CALL outnl
769:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
770:    LDA  1,-4(1)	Ghost frame becomes new active frame 
771:    LDA  3,1(7)	Return address in ac 
772:    JMP  7,-739(7)	CALL outnl
773:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
774:    LDC  2,0(6)	Set return value to 0 
775:     LD  3,-1(1)	Load return address 
776:     LD  1,0(1)	Adjust fp 
777:    JMP  7,0(3)	Return 
* END FUNCTION showBoard
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION getInput
* TOFF set: -2
778:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -5
* Compound Body
* EXPRESSION
779:    LDC  3,0(6)	Load integer constant 
780:     ST  3,-2(1)	Store variable i
* WHILE
781:     LD  3,-2(1)	Load variable i
782:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
783:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -5
784:     LD  4,-5(1)	Pop left into ac1 
785:    TLT  3,4,3	Op < 
786:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -5
* Compound Body
* EXPRESSION
788:    LDC  3,0(6)	Load integer constant 
789:     ST  3,-3(1)	Store variable j
* WHILE
790:     LD  3,-3(1)	Load variable j
791:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
792:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -5
793:     LD  4,-5(1)	Pop left into ac1 
794:    TLT  3,4,3	Op < 
795:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -5
* Compound Body
* EXPRESSION
* CALL input
797:     ST  1,-5(1)	Store fp in ghost frame for input
* TOFF dec: -6
* TOFF dec: -7
* Param end input
798:    LDA  1,-5(1)	Ghost frame becomes new active frame 
799:    LDA  3,1(7)	Return address in ac 
800:    JMP  7,-800(7)	CALL input
801:    LDA  3,0(2)	Save the result in ac 
* Call end input
* TOFF set: -5
802:     ST  3,-4(1)	Store variable inputVal
* IF
803:     LD  3,-4(1)	Load variable inputVal
804:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
805:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -5
806:     LD  4,-5(1)	Pop left into ac1 
807:    TGT  3,4,3	Op > 
808:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
809:     LD  3,-4(1)	Load variable inputVal
810:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
811:    LDC  3,10(6)	Load integer constant 
* TOFF inc: -6
812:     LD  4,-6(1)	Pop left into ac1 
813:    TLT  3,4,3	Op < 
* TOFF inc: -5
814:     LD  4,-5(1)	Pop left into ac1 
815:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* TOFF set: -5
* Compound Body
* EXPRESSION
* CALL setValue
817:     ST  1,-5(1)	Store fp in ghost frame for setValue
* TOFF dec: -6
* TOFF dec: -7
* Param 1
818:     LD  3,-2(1)	Load variable i
819:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param 2
820:     LD  3,-3(1)	Load variable j
821:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param 3
822:     LD  3,-4(1)	Load variable inputVal
823:     ST  3,-9(1)	Push parameter 
* TOFF dec: -10
* Param end setValue
824:    LDA  1,-5(1)	Ghost frame becomes new active frame 
825:    LDA  3,1(7)	Return address in ac 
826:    JMP  7,-756(7)	CALL setValue
827:    LDA  3,0(2)	Save the result in ac 
* Call end setValue
* TOFF set: -5
* EXPRESSION
* CALL setLocked
828:     ST  1,-5(1)	Store fp in ghost frame for setLocked
* TOFF dec: -6
* TOFF dec: -7
* Param 1
829:     LD  3,-2(1)	Load variable i
830:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param 2
831:     LD  3,-3(1)	Load variable j
832:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param 3
833:    LDC  3,1(6)	Load Boolean constant 
834:     ST  3,-9(1)	Push parameter 
* TOFF dec: -10
* Param end setLocked
835:    LDA  1,-5(1)	Ghost frame becomes new active frame 
836:    LDA  3,1(7)	Return address in ac 
837:    JMP  7,-724(7)	CALL setLocked
838:    LDA  3,0(2)	Save the result in ac 
* Call end setLocked
* TOFF set: -5
* TOFF set: -5
* END COMPOUND
816:    JZR  3,22(7)	Jump around the THEN if false [backpatch] 
* END IF
* EXPRESSION
839:     LD  3,-3(1)	load lhs variable j
840:    LDA  3,1(3)	increment value of j
841:     ST  3,-3(1)	Store variable j
* TOFF set: -5
* END COMPOUND
842:    JMP  7,-53(7)	go to beginning of loop 
796:    JMP  7,46(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
* CALL outnl
843:     ST  1,-5(1)	Store fp in ghost frame for outnl
* TOFF dec: -6
* TOFF dec: -7
* Param end outnl
844:    LDA  1,-5(1)	Ghost frame becomes new active frame 
845:    LDA  3,1(7)	Return address in ac 
846:    JMP  7,-813(7)	CALL outnl
847:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -5
* EXPRESSION
848:     LD  3,-2(1)	load lhs variable i
849:    LDA  3,1(3)	increment value of i
850:     ST  3,-2(1)	Store variable i
* TOFF set: -5
* END COMPOUND
851:    JMP  7,-71(7)	go to beginning of loop 
787:    JMP  7,64(7)	Jump past loop [backpatch] 
* END WHILE
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
852:    LDC  2,0(6)	Set return value to 0 
853:     LD  3,-1(1)	Load return address 
854:     LD  1,0(1)	Adjust fp 
855:    JMP  7,0(3)	Return 
* END FUNCTION getInput
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
856:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -2
* Compound Body
* EXPRESSION
* CALL initBoard
857:     ST  1,-2(1)	Store fp in ghost frame for initBoard
* TOFF dec: -3
* TOFF dec: -4
* Param end initBoard
858:    LDA  1,-2(1)	Ghost frame becomes new active frame 
859:    LDA  3,1(7)	Return address in ac 
860:    JMP  7,-822(7)	CALL initBoard
861:    LDA  3,0(2)	Save the result in ac 
* Call end initBoard
* TOFF set: -2
* EXPRESSION
* CALL getInput
862:     ST  1,-2(1)	Store fp in ghost frame for getInput
* TOFF dec: -3
* TOFF dec: -4
* Param end getInput
863:    LDA  1,-2(1)	Ghost frame becomes new active frame 
864:    LDA  3,1(7)	Return address in ac 
865:    JMP  7,-88(7)	CALL getInput
866:    LDA  3,0(2)	Save the result in ac 
* Call end getInput
* TOFF set: -2
* IF
* CALL solve
867:     ST  1,-2(1)	Store fp in ghost frame for solve
* TOFF dec: -3
* TOFF dec: -4
* Param end solve
868:    LDA  1,-2(1)	Ghost frame becomes new active frame 
869:    LDA  3,1(7)	Return address in ac 
870:    JMP  7,-272(7)	CALL solve
871:    LDA  3,0(2)	Save the result in ac 
* Call end solve
* TOFF set: -2
* THEN
* COMPOUND
* TOFF set: -2
* Compound Body
* EXPRESSION
* CALL showBoard
873:     ST  1,-2(1)	Store fp in ghost frame for showBoard
* TOFF dec: -3
* TOFF dec: -4
* Param end showBoard
874:    LDA  1,-2(1)	Ghost frame becomes new active frame 
875:    LDA  3,1(7)	Return address in ac 
876:    JMP  7,-160(7)	CALL showBoard
877:    LDA  3,0(2)	Save the result in ac 
* Call end showBoard
* TOFF set: -2
* TOFF set: -2
* END COMPOUND
872:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* TOFF set: -2
* Compound Body
* EXPRESSION
* CALL outputb
879:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
880:    LDC  3,0(6)	Load Boolean constant 
881:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
882:    LDA  1,-2(1)	Ghost frame becomes new active frame 
883:    LDA  3,1(7)	Return address in ac 
884:    JMP  7,-868(7)	CALL outputb
885:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outnl
886:     ST  1,-2(1)	Store fp in ghost frame for outnl
* TOFF dec: -3
* TOFF dec: -4
* Param end outnl
887:    LDA  1,-2(1)	Ghost frame becomes new active frame 
888:    LDA  3,1(7)	Return address in ac 
889:    JMP  7,-856(7)	CALL outnl
890:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -2
* TOFF set: -2
* END COMPOUND
878:    JMP  7,12(7)	Jump around the ELSE [backpatch] 
* END IF
* RETURN
891:    LDC  3,0(6)	Load integer constant 
892:    LDA  2,0(3)	Copy result to return register 
893:     LD  3,-1(1)	Load return address 
894:     LD  1,0(1)	Adjust fp 
895:    JMP  7,0(3)	Return 
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
896:    LDC  2,0(6)	Set return value to 0 
897:     LD  3,-1(1)	Load return address 
898:     LD  1,0(1)	Adjust fp 
899:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,899(7)	Jump to init [backpatch] 
* INIT
900:    LDA  1,-164(0)	set first frame at end of globals 
901:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
902:    LDC  3,81(6)	load size of array board
903:     ST  3,0(0)	save size of array board
904:    LDC  3,81(6)	load size of array locked
905:     ST  3,-82(0)	save size of array locked
* END INIT GLOBALS AND STATICS
906:    LDA  3,1(7)	Return address in ac 
907:    JMP  7,-52(7)	Jump to main 
908:   HALT  0,0,0	DONE! 
* END INIT
