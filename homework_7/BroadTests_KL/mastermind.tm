* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  mastermind.c-
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
* FUNCTION rand
* TOFF set: -2
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -2
* Compound Body
* IF
 40:     LD  3,-1(0)	Load variable n
 41:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
 42:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -2
 43:     LD  4,-2(1)	Pop left into ac1 
 44:    TLT  3,4,3	Op < 
* THEN
* EXPRESSION
 46:     LD  3,-1(0)	Load variable n
 47:    NEG  3,3,3	Op unary - 
 48:     ST  3,-1(0)	Store variable n
 45:    JZR  3,3(7)	Jump around the THEN if false [backpatch] 
* END IF
* IF
 49:     LD  3,-1(0)	Load variable n
 50:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
 51:    LDC  3,128(6)	Load integer constant 
* TOFF inc: -2
 52:     LD  4,-2(1)	Pop left into ac1 
 53:    TGT  3,4,3	Op > 
* THEN
* EXPRESSION
 55:     LD  3,-1(0)	Load variable n
 56:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
 57:    LDC  3,128(6)	Load integer constant 
* TOFF inc: -2
 58:     LD  4,-2(1)	Pop left into ac1 
 59:    MOD  3,4,3	Op % 
 60:     ST  3,-1(0)	Store variable n
 54:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* END IF
* EXPRESSION
 61:     LD  3,-1(0)	load lhs variable n
 62:    LDA  3,1(3)	increment value of n
 63:     ST  3,-1(0)	Store variable n
* EXPRESSION
 64:     LD  3,-1(0)	Load variable n
 65:     ST  3,-2(1)	Push index 
* TOFF dec: -3
 66:    LDC  3,1366(6)	Load integer constant 
 67:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 68:    LDA  3,-3(0)	Load address of base of array r
 69:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 70:     LD  3,-1(0)	Load variable n
 71:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 72:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -5
 73:     LD  4,-5(1)	Pop left into ac1 
 74:    SUB  3,4,3	Op - 
* TOFF inc: -4
 75:     LD  4,-4(1)	Pop left into ac1 
 76:    SUB  3,4,3	compute location from index 
 77:     LD  3,0(3)	Load array element 
* TOFF inc: -3
 78:     LD  4,-3(1)	Pop left into ac1 
 79:    MUL  3,4,3	Op * 
 80:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 81:    LDC  3,150889(6)	Load integer constant 
* TOFF inc: -3
 82:     LD  4,-3(1)	Pop left into ac1 
 83:    ADD  3,4,3	Op + 
 84:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 85:    LDC  3,714025(6)	Load integer constant 
* TOFF inc: -3
 86:     LD  4,-3(1)	Pop left into ac1 
 87:    MOD  3,4,3	Op % 
* TOFF inc: -2
 88:     LD  4,-2(1)	Pop index 
 89:    LDA  5,-3(0)	Load address of base of array r
 90:    SUB  5,5,4	Compute offset of value 
 91:     ST  3,0(5)	Store variable r
* RETURN
 92:    LDA  3,-3(0)	Load address of base of array r
 93:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
 94:     LD  3,-1(0)	Load variable n
* TOFF inc: -2
 95:     LD  4,-2(1)	Pop left into ac1 
 96:    SUB  3,4,3	compute location from index 
 97:     LD  3,0(3)	Load array element 
 98:    LDA  2,0(3)	Copy result to return register 
 99:     LD  3,-1(1)	Load return address 
100:     LD  1,0(1)	Adjust fp 
101:    JMP  7,0(3)	Return 
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
102:    LDC  2,0(6)	Set return value to 0 
103:     LD  3,-1(1)	Load return address 
104:     LD  1,0(1)	Adjust fp 
105:    JMP  7,0(3)	Return 
* END FUNCTION rand
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION search
* TOFF set: -4
106:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -5
* Compound Body
* EXPRESSION
107:    LDC  3,0(6)	Load integer constant 
108:     ST  3,-4(1)	Store variable i
* WHILE
109:     LD  3,-4(1)	Load variable i
110:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
111:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -5
112:     LD  4,-5(1)	Pop left into ac1 
113:    TLT  3,4,3	Op < 
114:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -5
* Compound Body
* IF
116:     LD  3,-2(1)	Load address of base of array a
117:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
118:     LD  3,-4(1)	Load variable i
* TOFF inc: -5
119:     LD  4,-5(1)	Pop left into ac1 
120:    SUB  3,4,3	compute location from index 
121:     LD  3,0(3)	Load array element 
122:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
123:     LD  3,-3(1)	Load variable k
* TOFF inc: -5
124:     LD  4,-5(1)	Pop left into ac1 
125:    TEQ  3,4,3	Op = 
* THEN
* RETURN
127:    LDC  3,1(6)	Load Boolean constant 
128:    LDA  2,0(3)	Copy result to return register 
129:     LD  3,-1(1)	Load return address 
130:     LD  1,0(1)	Adjust fp 
131:    JMP  7,0(3)	Return 
126:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* END IF
* EXPRESSION
132:     LD  3,-4(1)	load lhs variable i
133:    LDA  3,1(3)	increment value of i
134:     ST  3,-4(1)	Store variable i
* TOFF set: -5
* END COMPOUND
135:    JMP  7,-27(7)	go to beginning of loop 
115:    JMP  7,20(7)	Jump past loop [backpatch] 
* END WHILE
* RETURN
136:    LDC  3,0(6)	Load Boolean constant 
137:    LDA  2,0(3)	Copy result to return register 
138:     LD  3,-1(1)	Load return address 
139:     LD  1,0(1)	Adjust fp 
140:    JMP  7,0(3)	Return 
* TOFF set: -4
* END COMPOUND
* Add standard closing in case there is no return statement
141:    LDC  2,0(6)	Set return value to 0 
142:     LD  3,-1(1)	Load return address 
143:     LD  1,0(1)	Adjust fp 
144:    JMP  7,0(3)	Return 
* END FUNCTION search
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION check
* TOFF set: -2
145:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -5
* Compound Body
* EXPRESSION
146:    LDC  3,0(6)	Load integer constant 
147:     ST  3,-4(1)	Store variable c2
148:     ST  3,-3(1)	Store variable c1
149:     ST  3,-2(1)	Store variable i
* WHILE
150:     LD  3,-2(1)	Load variable i
151:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
152:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -5
153:     LD  4,-5(1)	Pop left into ac1 
154:    TLT  3,4,3	Op < 
155:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -5
* Compound Body
* IF
157:    LDA  3,-132(0)	Load address of base of array known
158:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
159:     LD  3,-2(1)	Load variable i
* TOFF inc: -5
160:     LD  4,-5(1)	Pop left into ac1 
161:    SUB  3,4,3	compute location from index 
162:     LD  3,0(3)	Load array element 
163:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
164:    LDA  3,-137(0)	Load address of base of array guess
165:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
166:     LD  3,-2(1)	Load variable i
* TOFF inc: -6
167:     LD  4,-6(1)	Pop left into ac1 
168:    SUB  3,4,3	compute location from index 
169:     LD  3,0(3)	Load array element 
* TOFF inc: -5
170:     LD  4,-5(1)	Pop left into ac1 
171:    TEQ  3,4,3	Op = 
* THEN
* EXPRESSION
173:     LD  3,-4(1)	load lhs variable c2
174:    LDA  3,1(3)	increment value of c2
175:     ST  3,-4(1)	Store variable c2
172:    JZR  3,4(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
* CALL search
177:     ST  1,-5(1)	Store fp in ghost frame for search
* TOFF dec: -6
* TOFF dec: -7
* Param 1
178:    LDA  3,-132(0)	Load address of base of array known
179:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param 2
180:    LDA  3,-137(0)	Load address of base of array guess
181:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
182:     LD  3,-2(1)	Load variable i
* TOFF inc: -8
183:     LD  4,-8(1)	Pop left into ac1 
184:    SUB  3,4,3	compute location from index 
185:     LD  3,0(3)	Load array element 
186:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end search
187:    LDA  1,-5(1)	Ghost frame becomes new active frame 
188:    LDA  3,1(7)	Return address in ac 
189:    JMP  7,-84(7)	CALL search
190:    LDA  3,0(2)	Save the result in ac 
* Call end search
* TOFF set: -5
* THEN
* EXPRESSION
192:     LD  3,-3(1)	load lhs variable c1
193:    LDA  3,1(3)	increment value of c1
194:     ST  3,-3(1)	Store variable c1
191:    JZR  3,3(7)	Jump around the THEN if false [backpatch] 
* END IF
176:    JMP  7,18(7)	Jump around the ELSE [backpatch] 
* END IF
* EXPRESSION
195:     LD  3,-2(1)	load lhs variable i
196:    LDA  3,1(3)	increment value of i
197:     ST  3,-2(1)	Store variable i
* TOFF set: -5
* END COMPOUND
198:    JMP  7,-49(7)	go to beginning of loop 
156:    JMP  7,42(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
* CALL output
199:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
200:     LD  3,-3(1)	Load variable c1
201:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
202:    LDA  1,-5(1)	Ghost frame becomes new active frame 
203:    LDA  3,1(7)	Return address in ac 
204:    JMP  7,-199(7)	CALL output
205:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
206:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
207:     LD  3,-4(1)	Load variable c2
208:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
209:    LDA  1,-5(1)	Ghost frame becomes new active frame 
210:    LDA  3,1(7)	Return address in ac 
211:    JMP  7,-206(7)	CALL output
212:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL outnl
213:     ST  1,-5(1)	Store fp in ghost frame for outnl
* TOFF dec: -6
* TOFF dec: -7
* Param end outnl
214:    LDA  1,-5(1)	Ghost frame becomes new active frame 
215:    LDA  3,1(7)	Return address in ac 
216:    JMP  7,-183(7)	CALL outnl
217:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -5
* IF
218:     LD  3,-4(1)	Load variable c2
219:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
220:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -5
221:     LD  4,-5(1)	Pop left into ac1 
222:    TEQ  3,4,3	Op = 
* THEN
* RETURN
224:    LDC  3,1(6)	Load Boolean constant 
225:    LDA  2,0(3)	Copy result to return register 
226:     LD  3,-1(1)	Load return address 
227:     LD  1,0(1)	Adjust fp 
228:    JMP  7,0(3)	Return 
223:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* RETURN
230:    LDC  3,0(6)	Load Boolean constant 
231:    LDA  2,0(3)	Copy result to return register 
232:     LD  3,-1(1)	Load return address 
233:     LD  1,0(1)	Adjust fp 
234:    JMP  7,0(3)	Return 
229:    JMP  7,5(7)	Jump around the ELSE [backpatch] 
* END IF
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
235:    LDC  2,0(6)	Set return value to 0 
236:     LD  3,-1(1)	Load return address 
237:     LD  1,0(1)	Adjust fp 
238:    JMP  7,0(3)	Return 
* END FUNCTION check
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION turn
* TOFF set: -2
239:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
240:     LD  3,0(0)	load lhs variable turns
241:    LDA  3,1(3)	increment value of turns
242:     ST  3,0(0)	Store variable turns
* EXPRESSION
* CALL output
243:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
244:     LD  3,0(0)	Load variable turns
245:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
246:    LDA  1,-3(1)	Ghost frame becomes new active frame 
247:    LDA  3,1(7)	Return address in ac 
248:    JMP  7,-243(7)	CALL output
249:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL outnl
250:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
251:    LDA  1,-3(1)	Ghost frame becomes new active frame 
252:    LDA  3,1(7)	Return address in ac 
253:    JMP  7,-220(7)	CALL outnl
254:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* IF
255:     LD  3,0(0)	Load variable turns
256:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
257:    LDC  3,20(6)	Load integer constant 
* TOFF inc: -3
258:     LD  4,-3(1)	Pop left into ac1 
259:    TLE  3,4,3	Op <= 
* THEN
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
261:    LDC  3,0(6)	Load integer constant 
262:     ST  3,-2(1)	Store variable i
* WHILE
263:     LD  3,-2(1)	Load variable i
264:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
265:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -3
266:     LD  4,-3(1)	Pop left into ac1 
267:    TLT  3,4,3	Op < 
268:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
270:     LD  3,-2(1)	Load variable i
271:     ST  3,-3(1)	Push index 
* TOFF dec: -4
* CALL input
272:     ST  1,-4(1)	Store fp in ghost frame for input
* TOFF dec: -5
* TOFF dec: -6
* Param end input
273:    LDA  1,-4(1)	Ghost frame becomes new active frame 
274:    LDA  3,1(7)	Return address in ac 
275:    JMP  7,-275(7)	CALL input
276:    LDA  3,0(2)	Save the result in ac 
* Call end input
* TOFF set: -4
* TOFF inc: -3
277:     LD  4,-3(1)	Pop index 
278:    LDA  5,-137(0)	Load address of base of array guess
279:    SUB  5,5,4	Compute offset of value 
280:     ST  3,0(5)	Store variable guess
* IF
281:    LDA  3,-137(0)	Load address of base of array guess
282:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
283:     LD  3,-2(1)	Load variable i
* TOFF inc: -3
284:     LD  4,-3(1)	Pop left into ac1 
285:    SUB  3,4,3	compute location from index 
286:     LD  3,0(3)	Load array element 
287:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
288:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -3
289:     LD  4,-3(1)	Pop left into ac1 
290:    TLT  3,4,3	Op < 
* THEN
* RETURN
292:    LDC  3,0(6)	Load Boolean constant 
293:    LDA  2,0(3)	Copy result to return register 
294:     LD  3,-1(1)	Load return address 
295:     LD  1,0(1)	Adjust fp 
296:    JMP  7,0(3)	Return 
291:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* END IF
* IF
297:    LDA  3,-137(0)	Load address of base of array guess
298:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
299:     LD  3,-2(1)	Load variable i
* TOFF inc: -3
300:     LD  4,-3(1)	Pop left into ac1 
301:    SUB  3,4,3	compute location from index 
302:     LD  3,0(3)	Load array element 
303:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
304:    LDC  3,10(6)	Load integer constant 
* TOFF inc: -3
305:     LD  4,-3(1)	Pop left into ac1 
306:    TGT  3,4,3	Op > 
* THEN
* EXPRESSION
308:     LD  3,-2(1)	Load variable i
309:     ST  3,-3(1)	Push index 
* TOFF dec: -4
310:    LDA  3,-137(0)	Load address of base of array guess
311:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
312:     LD  3,-2(1)	Load variable i
* TOFF inc: -4
313:     LD  4,-4(1)	Pop left into ac1 
314:    SUB  3,4,3	compute location from index 
315:     LD  3,0(3)	Load array element 
316:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
317:    LDC  3,10(6)	Load integer constant 
* TOFF inc: -4
318:     LD  4,-4(1)	Pop left into ac1 
319:    MOD  3,4,3	Op % 
* TOFF inc: -3
320:     LD  4,-3(1)	Pop index 
321:    LDA  5,-137(0)	Load address of base of array guess
322:    SUB  5,5,4	Compute offset of value 
323:     ST  3,0(5)	Store variable guess
307:    JZR  3,16(7)	Jump around the THEN if false [backpatch] 
* END IF
* EXPRESSION
324:     LD  3,-2(1)	load lhs variable i
325:    LDA  3,1(3)	increment value of i
326:     ST  3,-2(1)	Store variable i
* TOFF set: -3
* END COMPOUND
327:    JMP  7,-65(7)	go to beginning of loop 
269:    JMP  7,58(7)	Jump past loop [backpatch] 
* END WHILE
* IF
* CALL check
328:     ST  1,-3(1)	Store fp in ghost frame for check
* TOFF dec: -4
* TOFF dec: -5
* Param end check
329:    LDA  1,-3(1)	Ghost frame becomes new active frame 
330:    LDA  3,1(7)	Return address in ac 
331:    JMP  7,-187(7)	CALL check
332:    LDA  3,0(2)	Save the result in ac 
* Call end check
* TOFF set: -3
* THEN
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
334:    LDC  3,0(6)	Load integer constant 
335:     ST  3,-2(1)	Store variable i
* WHILE
336:     LD  3,-2(1)	Load variable i
337:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
338:    LDC  3,10(6)	Load integer constant 
* TOFF inc: -3
339:     LD  4,-3(1)	Pop left into ac1 
340:    TLT  3,4,3	Op < 
341:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
* CALL outputb
343:     ST  1,-3(1)	Store fp in ghost frame for outputb
* TOFF dec: -4
* TOFF dec: -5
* Param 1
344:    LDC  3,1(6)	Load Boolean constant 
345:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end outputb
346:    LDA  1,-3(1)	Ghost frame becomes new active frame 
347:    LDA  3,1(7)	Return address in ac 
348:    JMP  7,-332(7)	CALL outputb
349:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -3
* EXPRESSION
350:     LD  3,-2(1)	load lhs variable i
351:    LDA  3,1(3)	increment value of i
352:     ST  3,-2(1)	Store variable i
* TOFF set: -3
* END COMPOUND
353:    JMP  7,-18(7)	go to beginning of loop 
342:    JMP  7,11(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
* CALL outnl
354:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
355:    LDA  1,-3(1)	Ghost frame becomes new active frame 
356:    LDA  3,1(7)	Return address in ac 
357:    JMP  7,-324(7)	CALL outnl
358:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* RETURN
359:    LDC  3,0(6)	Load Boolean constant 
360:    LDA  2,0(3)	Copy result to return register 
361:     LD  3,-1(1)	Load return address 
362:     LD  1,0(1)	Adjust fp 
363:    JMP  7,0(3)	Return 
* TOFF set: -3
* END COMPOUND
333:    JZR  3,31(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* TOFF set: -3
* Compound Body
* RETURN
365:    LDC  3,1(6)	Load Boolean constant 
366:    LDA  2,0(3)	Copy result to return register 
367:     LD  3,-1(1)	Load return address 
368:     LD  1,0(1)	Adjust fp 
369:    JMP  7,0(3)	Return 
* TOFF set: -3
* END COMPOUND
364:    JMP  7,5(7)	Jump around the ELSE [backpatch] 
* END IF
* TOFF set: -3
* END COMPOUND
260:    JZR  3,109(7)	Jump around the THEN if false [backpatch] 
* END IF
* EXPRESSION
370:    LDC  3,0(6)	Load integer constant 
371:     ST  3,-2(1)	Store variable i
* WHILE
372:     LD  3,-2(1)	Load variable i
373:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
374:    LDC  3,10(6)	Load integer constant 
* TOFF inc: -3
375:     LD  4,-3(1)	Pop left into ac1 
376:    TLT  3,4,3	Op < 
377:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
* CALL outputb
379:     ST  1,-3(1)	Store fp in ghost frame for outputb
* TOFF dec: -4
* TOFF dec: -5
* Param 1
380:    LDC  3,0(6)	Load Boolean constant 
381:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end outputb
382:    LDA  1,-3(1)	Ghost frame becomes new active frame 
383:    LDA  3,1(7)	Return address in ac 
384:    JMP  7,-368(7)	CALL outputb
385:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -3
* EXPRESSION
386:     LD  3,-2(1)	load lhs variable i
387:    LDA  3,1(3)	increment value of i
388:     ST  3,-2(1)	Store variable i
* TOFF set: -3
* END COMPOUND
389:    JMP  7,-18(7)	go to beginning of loop 
378:    JMP  7,11(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
* CALL outnl
390:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
391:    LDA  1,-3(1)	Ghost frame becomes new active frame 
392:    LDA  3,1(7)	Return address in ac 
393:    JMP  7,-360(7)	CALL outnl
394:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* RETURN
395:    LDC  3,0(6)	Load Boolean constant 
396:    LDA  2,0(3)	Copy result to return register 
397:     LD  3,-1(1)	Load return address 
398:     LD  1,0(1)	Adjust fp 
399:    JMP  7,0(3)	Return 
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
400:    LDC  2,0(6)	Set return value to 0 
401:     LD  3,-1(1)	Load return address 
402:     LD  1,0(1)	Adjust fp 
403:    JMP  7,0(3)	Return 
* END FUNCTION turn
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
404:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
405:    LDC  3,0(6)	Load integer constant 
406:     ST  3,-1(0)	Store variable n
* EXPRESSION
407:    LDC  3,0(6)	Load integer constant 
408:     ST  3,-3(1)	Push index 
* TOFF dec: -4
* CALL input
409:     ST  1,-4(1)	Store fp in ghost frame for input
* TOFF dec: -5
* TOFF dec: -6
* Param end input
410:    LDA  1,-4(1)	Ghost frame becomes new active frame 
411:    LDA  3,1(7)	Return address in ac 
412:    JMP  7,-412(7)	CALL input
413:    LDA  3,0(2)	Save the result in ac 
* Call end input
* TOFF set: -4
* TOFF inc: -3
414:     LD  4,-3(1)	Pop index 
415:    LDA  5,-3(0)	Load address of base of array r
416:    SUB  5,5,4	Compute offset of value 
417:     ST  3,0(5)	Store variable r
* EXPRESSION
* CALL outnl
418:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
419:    LDA  1,-3(1)	Ghost frame becomes new active frame 
420:    LDA  3,1(7)	Return address in ac 
421:    JMP  7,-388(7)	CALL outnl
422:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* EXPRESSION
423:    LDC  3,0(6)	Load integer constant 
424:     ST  3,-2(1)	Store variable i
* WHILE
425:     LD  3,-2(1)	Load variable i
426:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
427:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -3
428:     LD  4,-3(1)	Pop left into ac1 
429:    TLT  3,4,3	Op < 
430:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
432:     LD  3,-2(1)	Load variable i
433:     ST  3,-3(1)	Push index 
* TOFF dec: -4
* CALL rand
434:     ST  1,-4(1)	Store fp in ghost frame for rand
* TOFF dec: -5
* TOFF dec: -6
* Param end rand
435:    LDA  1,-4(1)	Ghost frame becomes new active frame 
436:    LDA  3,1(7)	Return address in ac 
437:    JMP  7,-399(7)	CALL rand
438:    LDA  3,0(2)	Save the result in ac 
* Call end rand
* TOFF set: -4
439:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
440:    LDC  3,10(6)	Load integer constant 
* TOFF inc: -4
441:     LD  4,-4(1)	Pop left into ac1 
442:    MOD  3,4,3	Op % 
* TOFF inc: -3
443:     LD  4,-3(1)	Pop index 
444:    LDA  5,-132(0)	Load address of base of array known
445:    SUB  5,5,4	Compute offset of value 
446:     ST  3,0(5)	Store variable known
* EXPRESSION
447:     LD  3,-2(1)	load lhs variable i
448:    LDA  3,1(3)	increment value of i
449:     ST  3,-2(1)	Store variable i
* TOFF set: -3
* END COMPOUND
450:    JMP  7,-26(7)	go to beginning of loop 
431:    JMP  7,19(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
451:    LDC  3,0(6)	Load integer constant 
452:     ST  3,0(0)	Store variable turns
* WHILE
* CALL turn
453:     ST  1,-3(1)	Store fp in ghost frame for turn
* TOFF dec: -4
* TOFF dec: -5
* Param end turn
454:    LDA  1,-3(1)	Ghost frame becomes new active frame 
455:    LDA  3,1(7)	Return address in ac 
456:    JMP  7,-218(7)	CALL turn
457:    LDA  3,0(2)	Save the result in ac 
* Call end turn
* TOFF set: -3
458:    JNZ  3,1(7)	Jump to while part 
* DO
460:    JMP  7,-8(7)	go to beginning of loop 
459:    JMP  7,1(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
* CALL outnl
461:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
462:    LDA  1,-3(1)	Ghost frame becomes new active frame 
463:    LDA  3,1(7)	Return address in ac 
464:    JMP  7,-431(7)	CALL outnl
465:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* EXPRESSION
466:    LDC  3,0(6)	Load integer constant 
467:     ST  3,-2(1)	Store variable i
* WHILE
468:     LD  3,-2(1)	Load variable i
469:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
470:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -3
471:     LD  4,-3(1)	Pop left into ac1 
472:    TLT  3,4,3	Op < 
473:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
* CALL output
475:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
476:    LDA  3,-132(0)	Load address of base of array known
477:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
478:     LD  3,-2(1)	Load variable i
* TOFF inc: -5
479:     LD  4,-5(1)	Pop left into ac1 
480:    SUB  3,4,3	compute location from index 
481:     LD  3,0(3)	Load array element 
482:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
483:    LDA  1,-3(1)	Ghost frame becomes new active frame 
484:    LDA  3,1(7)	Return address in ac 
485:    JMP  7,-480(7)	CALL output
486:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL outnl
487:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
488:    LDA  1,-3(1)	Ghost frame becomes new active frame 
489:    LDA  3,1(7)	Return address in ac 
490:    JMP  7,-457(7)	CALL outnl
491:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* EXPRESSION
492:     LD  3,-2(1)	load lhs variable i
493:    LDA  3,1(3)	increment value of i
494:     ST  3,-2(1)	Store variable i
* TOFF set: -3
* END COMPOUND
495:    JMP  7,-28(7)	go to beginning of loop 
474:    JMP  7,21(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
* CALL outnl
496:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
497:    LDA  1,-3(1)	Ghost frame becomes new active frame 
498:    LDA  3,1(7)	Return address in ac 
499:    JMP  7,-466(7)	CALL outnl
500:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
501:    LDC  2,0(6)	Set return value to 0 
502:     LD  3,-1(1)	Load return address 
503:     LD  1,0(1)	Adjust fp 
504:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,504(7)	Jump to init [backpatch] 
* INIT
505:    LDA  1,-141(0)	set first frame at end of globals 
506:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
507:    LDC  3,4(6)	load size of array guess
508:     ST  3,-136(0)	save size of array guess
509:    LDC  3,4(6)	load size of array known
510:     ST  3,-131(0)	save size of array known
511:    LDC  3,128(6)	load size of array r
512:     ST  3,-2(0)	save size of array r
* END INIT GLOBALS AND STATICS
513:    LDA  3,1(7)	Return address in ac 
514:    JMP  7,-111(7)	Jump to main 
515:   HALT  0,0,0	DONE! 
* END INIT
