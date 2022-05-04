* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  fractal.c-
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
* FUNCTION Mandelbrot
* TOFF set: -3
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* WHILE
 40:     LD  3,0(0)	Load variable TOP
 41:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 42:     LD  3,-7(0)	Load variable YMax
* TOFF inc: -3
 43:     LD  4,-3(1)	Pop left into ac1 
 44:    TLT  3,4,3	Op < 
 45:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
 47:    LDC  3,512(6)	Load integer constant 
 48:    NEG  3,3,3	Op unary - 
 49:     ST  3,-1(0)	Store variable LEFT
* WHILE
 50:     LD  3,-1(0)	Load variable LEFT
 51:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 52:     LD  3,-6(0)	Load variable XMax
* TOFF inc: -3
 53:     LD  4,-3(1)	Pop left into ac1 
 54:    TLT  3,4,3	Op < 
 55:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -8
* Compound Body
* EXPRESSION
 57:     LD  3,-1(0)	Load variable LEFT
 58:     ST  3,-5(1)	Store variable A
* EXPRESSION
 59:     LD  3,0(0)	Load variable TOP
 60:     ST  3,-4(1)	Store variable Bi
* EXPRESSION
 61:     LD  3,-5(1)	Load variable A
 62:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
 63:     LD  3,-5(1)	Load variable A
* TOFF inc: -8
 64:     LD  4,-8(1)	Pop left into ac1 
 65:    MUL  3,4,3	Op * 
 66:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
 67:    LDC  3,256(6)	Load integer constant 
* TOFF inc: -8
 68:     LD  4,-8(1)	Pop left into ac1 
 69:    DIV  3,4,3	Op / 
 70:     ST  3,-6(1)	Store variable NextA
* EXPRESSION
 71:     LD  3,-4(1)	Load variable Bi
 72:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
 73:     LD  3,-4(1)	Load variable Bi
* TOFF inc: -8
 74:     LD  4,-8(1)	Pop left into ac1 
 75:    MUL  3,4,3	Op * 
 76:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
 77:    LDC  3,256(6)	Load integer constant 
* TOFF inc: -8
 78:     LD  4,-8(1)	Pop left into ac1 
 79:    DIV  3,4,3	Op / 
 80:     ST  3,-7(1)	Store variable NextBi
* EXPRESSION
 81:     LD  3,-6(1)	Load variable NextA
 82:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
 83:     LD  3,-7(1)	Load variable NextBi
* TOFF inc: -8
 84:     LD  4,-8(1)	Pop left into ac1 
 85:    ADD  3,4,3	Op + 
 86:     ST  3,-3(1)	Store variable Len
* EXPRESSION
 87:    LDC  3,0(6)	Load integer constant 
 88:     ST  3,-8(0)	Store variable iter
* WHILE
 89:     LD  3,-3(1)	Load variable Len
 90:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
 91:    LDC  3,1024(6)	Load integer constant 
* TOFF inc: -8
 92:     LD  4,-8(1)	Pop left into ac1 
 93:    TLE  3,4,3	Op <= 
 94:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
 95:     LD  3,-8(0)	Load variable iter
 96:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
 97:    LDC  3,11(6)	Load integer constant 
* TOFF inc: -9
 98:     LD  4,-9(1)	Pop left into ac1 
 99:    TLT  3,4,3	Op < 
* TOFF inc: -8
100:     LD  4,-8(1)	Pop left into ac1 
101:    AND  3,4,3	Op AND 
102:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -8
* Compound Body
* EXPRESSION
104:    LDC  3,2(6)	Load integer constant 
105:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
106:     LD  3,-5(1)	Load variable A
107:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
108:     LD  3,-4(1)	Load variable Bi
* TOFF inc: -9
109:     LD  4,-9(1)	Pop left into ac1 
110:    MUL  3,4,3	Op * 
* TOFF inc: -8
111:     LD  4,-8(1)	Pop left into ac1 
112:    MUL  3,4,3	Op * 
113:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
114:    LDC  3,256(6)	Load integer constant 
* TOFF inc: -8
115:     LD  4,-8(1)	Pop left into ac1 
116:    DIV  3,4,3	Op / 
117:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
118:     LD  3,0(0)	Load variable TOP
* TOFF inc: -8
119:     LD  4,-8(1)	Pop left into ac1 
120:    ADD  3,4,3	Op + 
121:     ST  3,-4(1)	Store variable Bi
* EXPRESSION
122:     LD  3,-6(1)	Load variable NextA
123:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
124:     LD  3,-7(1)	Load variable NextBi
* TOFF inc: -8
125:     LD  4,-8(1)	Pop left into ac1 
126:    SUB  3,4,3	Op - 
127:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
128:     LD  3,-1(0)	Load variable LEFT
* TOFF inc: -8
129:     LD  4,-8(1)	Pop left into ac1 
130:    ADD  3,4,3	Op + 
131:     ST  3,-5(1)	Store variable A
* EXPRESSION
132:     LD  3,-5(1)	Load variable A
133:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
134:     LD  3,-5(1)	Load variable A
* TOFF inc: -8
135:     LD  4,-8(1)	Pop left into ac1 
136:    MUL  3,4,3	Op * 
137:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
138:    LDC  3,256(6)	Load integer constant 
* TOFF inc: -8
139:     LD  4,-8(1)	Pop left into ac1 
140:    DIV  3,4,3	Op / 
141:     ST  3,-6(1)	Store variable NextA
* EXPRESSION
142:     LD  3,-4(1)	Load variable Bi
143:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
144:     LD  3,-4(1)	Load variable Bi
* TOFF inc: -8
145:     LD  4,-8(1)	Pop left into ac1 
146:    MUL  3,4,3	Op * 
147:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
148:    LDC  3,256(6)	Load integer constant 
* TOFF inc: -8
149:     LD  4,-8(1)	Pop left into ac1 
150:    DIV  3,4,3	Op / 
151:     ST  3,-7(1)	Store variable NextBi
* EXPRESSION
152:     LD  3,-6(1)	Load variable NextA
153:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
154:     LD  3,-7(1)	Load variable NextBi
* TOFF inc: -8
155:     LD  4,-8(1)	Pop left into ac1 
156:    ADD  3,4,3	Op + 
157:     ST  3,-3(1)	Store variable Len
* EXPRESSION
158:     LD  3,-8(0)	load lhs variable iter
159:    LDA  3,1(3)	increment value of iter
160:     ST  3,-8(0)	Store variable iter
* TOFF set: -8
* END COMPOUND
161:    JMP  7,-73(7)	go to beginning of loop 
103:    JMP  7,58(7)	Jump past loop [backpatch] 
* END WHILE
* IF
162:     LD  3,-8(0)	Load variable iter
163:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
164:    LDC  3,12(6)	Load integer constant 
* TOFF inc: -8
165:     LD  4,-8(1)	Pop left into ac1 
166:    TLT  3,4,3	Op < 
* THEN
* COMPOUND
* TOFF set: -8
* Compound Body
* EXPRESSION
* CALL outputc
168:     ST  1,-8(1)	Store fp in ghost frame for outputc
* TOFF dec: -9
* TOFF dec: -10
* Param 1
169:    LDA  3,-10(0)	Load address of base of array grayScale
170:     ST  3,-10(1)	Push left side 
* TOFF dec: -11
171:     LD  3,-8(0)	Load variable iter
* TOFF inc: -10
172:     LD  4,-10(1)	Pop left into ac1 
173:    SUB  3,4,3	compute location from index 
174:     LD  3,0(3)	Load array element 
175:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end outputc
176:    LDA  1,-8(1)	Ghost frame becomes new active frame 
177:    LDA  3,1(7)	Return address in ac 
178:    JMP  7,-151(7)	CALL outputc
179:    LDA  3,0(2)	Save the result in ac 
* Call end outputc
* TOFF set: -8
* EXPRESSION
* CALL outputc
180:     ST  1,-8(1)	Store fp in ghost frame for outputc
* TOFF dec: -9
* TOFF dec: -10
* Param 1
181:    LDC  3,32(6)	Load char constant 
182:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end outputc
183:    LDA  1,-8(1)	Ghost frame becomes new active frame 
184:    LDA  3,1(7)	Return address in ac 
185:    JMP  7,-158(7)	CALL outputc
186:    LDA  3,0(2)	Save the result in ac 
* Call end outputc
* TOFF set: -8
* TOFF set: -8
* END COMPOUND
167:    JZR  3,19(7)	Jump around the THEN if false [backpatch] 
* END IF
* IF
187:     LD  3,-8(0)	Load variable iter
188:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
189:    LDC  3,11(6)	Load integer constant 
* TOFF inc: -8
190:     LD  4,-8(1)	Pop left into ac1 
191:    TEQ  3,4,3	Op = 
* THEN
* COMPOUND
* TOFF set: -8
* Compound Body
* EXPRESSION
193:    LDC  3,0(6)	Load integer constant 
194:     ST  3,-8(1)	Push index 
* TOFF dec: -9
195:     LD  3,-1(0)	Load variable LEFT
* TOFF inc: -8
196:     LD  4,-8(1)	Pop index 
197:     LD  5,-2(1)	Load address of base of array JuliaVals
198:    SUB  5,5,4	Compute offset of value 
199:     ST  3,0(5)	Store variable JuliaVals
* EXPRESSION
200:    LDC  3,1(6)	Load integer constant 
201:     ST  3,-8(1)	Push index 
* TOFF dec: -9
202:     LD  3,0(0)	Load variable TOP
* TOFF inc: -8
203:     LD  4,-8(1)	Pop index 
204:     LD  5,-2(1)	Load address of base of array JuliaVals
205:    SUB  5,5,4	Compute offset of value 
206:     ST  3,0(5)	Store variable JuliaVals
* TOFF set: -8
* END COMPOUND
192:    JZR  3,14(7)	Jump around the THEN if false [backpatch] 
* END IF
* EXPRESSION
207:     LD  3,-4(0)	Load variable XStep
208:     LD  4,-1(0)	load lhs variable LEFT
209:    ADD  3,4,3	op += 
210:     ST  3,-1(0)	Store variable LEFT
* TOFF set: -3
* END COMPOUND
211:    JMP  7,-162(7)	go to beginning of loop 
 56:    JMP  7,155(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
* CALL outnl
212:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
213:    LDA  1,-3(1)	Ghost frame becomes new active frame 
214:    LDA  3,1(7)	Return address in ac 
215:    JMP  7,-182(7)	CALL outnl
216:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* EXPRESSION
217:     LD  3,-5(0)	Load variable YStep
218:     LD  4,0(0)	load lhs variable TOP
219:    ADD  3,4,3	op += 
220:     ST  3,0(0)	Store variable TOP
* TOFF set: -3
* END COMPOUND
221:    JMP  7,-182(7)	go to beginning of loop 
 46:    JMP  7,175(7)	Jump past loop [backpatch] 
* END WHILE
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
222:    LDC  2,0(6)	Set return value to 0 
223:     LD  3,-1(1)	Load return address 
224:     LD  1,0(1)	Adjust fp 
225:    JMP  7,0(3)	Return 
* END FUNCTION Mandelbrot
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION Julia
* TOFF set: -4
226:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -4
* Compound Body
* WHILE
227:     LD  3,0(0)	Load variable TOP
228:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
229:     LD  3,-7(0)	Load variable YMax
* TOFF inc: -4
230:     LD  4,-4(1)	Pop left into ac1 
231:    TLT  3,4,3	Op < 
232:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -4
* Compound Body
* EXPRESSION
234:    LDC  3,512(6)	Load integer constant 
235:    NEG  3,3,3	Op unary - 
236:     ST  3,-1(0)	Store variable LEFT
* WHILE
237:     LD  3,-1(0)	Load variable LEFT
238:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
239:     LD  3,-6(0)	Load variable XMax
* TOFF inc: -4
240:     LD  4,-4(1)	Pop left into ac1 
241:    TLT  3,4,3	Op < 
242:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -9
* Compound Body
* EXPRESSION
244:     LD  3,-1(0)	Load variable LEFT
245:     ST  3,-6(1)	Store variable A
* EXPRESSION
246:     LD  3,0(0)	Load variable TOP
247:     ST  3,-5(1)	Store variable Bi
* EXPRESSION
248:     LD  3,-6(1)	Load variable A
249:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
250:     LD  3,-6(1)	Load variable A
* TOFF inc: -9
251:     LD  4,-9(1)	Pop left into ac1 
252:    MUL  3,4,3	Op * 
253:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
254:    LDC  3,256(6)	Load integer constant 
* TOFF inc: -9
255:     LD  4,-9(1)	Pop left into ac1 
256:    DIV  3,4,3	Op / 
257:     ST  3,-7(1)	Store variable NextA
* EXPRESSION
258:     LD  3,-5(1)	Load variable Bi
259:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
260:     LD  3,-5(1)	Load variable Bi
* TOFF inc: -9
261:     LD  4,-9(1)	Pop left into ac1 
262:    MUL  3,4,3	Op * 
263:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
264:    LDC  3,256(6)	Load integer constant 
* TOFF inc: -9
265:     LD  4,-9(1)	Pop left into ac1 
266:    DIV  3,4,3	Op / 
267:     ST  3,-8(1)	Store variable NextBi
* EXPRESSION
268:     LD  3,-7(1)	Load variable NextA
269:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
270:     LD  3,-8(1)	Load variable NextBi
* TOFF inc: -9
271:     LD  4,-9(1)	Pop left into ac1 
272:    ADD  3,4,3	Op + 
273:     ST  3,-4(1)	Store variable Len
* EXPRESSION
274:    LDC  3,0(6)	Load integer constant 
275:     ST  3,-8(0)	Store variable iter
* WHILE
276:     LD  3,-4(1)	Load variable Len
277:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
278:    LDC  3,1024(6)	Load integer constant 
* TOFF inc: -9
279:     LD  4,-9(1)	Pop left into ac1 
280:    TLE  3,4,3	Op <= 
281:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
282:     LD  3,-8(0)	Load variable iter
283:     ST  3,-10(1)	Push left side 
* TOFF dec: -11
284:    LDC  3,11(6)	Load integer constant 
* TOFF inc: -10
285:     LD  4,-10(1)	Pop left into ac1 
286:    TLT  3,4,3	Op < 
* TOFF inc: -9
287:     LD  4,-9(1)	Pop left into ac1 
288:    AND  3,4,3	Op AND 
289:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -9
* Compound Body
* EXPRESSION
291:    LDC  3,2(6)	Load integer constant 
292:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
293:     LD  3,-6(1)	Load variable A
294:     ST  3,-10(1)	Push left side 
* TOFF dec: -11
295:     LD  3,-5(1)	Load variable Bi
* TOFF inc: -10
296:     LD  4,-10(1)	Pop left into ac1 
297:    MUL  3,4,3	Op * 
* TOFF inc: -9
298:     LD  4,-9(1)	Pop left into ac1 
299:    MUL  3,4,3	Op * 
300:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
301:    LDC  3,256(6)	Load integer constant 
* TOFF inc: -9
302:     LD  4,-9(1)	Pop left into ac1 
303:    DIV  3,4,3	Op / 
304:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
305:     LD  3,-3(1)	Load variable CBi
* TOFF inc: -9
306:     LD  4,-9(1)	Pop left into ac1 
307:    ADD  3,4,3	Op + 
308:     ST  3,-5(1)	Store variable Bi
* EXPRESSION
309:     LD  3,-7(1)	Load variable NextA
310:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
311:     LD  3,-8(1)	Load variable NextBi
* TOFF inc: -9
312:     LD  4,-9(1)	Pop left into ac1 
313:    SUB  3,4,3	Op - 
314:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
315:     LD  3,-2(1)	Load variable CA
* TOFF inc: -9
316:     LD  4,-9(1)	Pop left into ac1 
317:    ADD  3,4,3	Op + 
318:     ST  3,-6(1)	Store variable A
* EXPRESSION
319:     LD  3,-6(1)	Load variable A
320:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
321:     LD  3,-6(1)	Load variable A
* TOFF inc: -9
322:     LD  4,-9(1)	Pop left into ac1 
323:    MUL  3,4,3	Op * 
324:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
325:    LDC  3,256(6)	Load integer constant 
* TOFF inc: -9
326:     LD  4,-9(1)	Pop left into ac1 
327:    DIV  3,4,3	Op / 
328:     ST  3,-7(1)	Store variable NextA
* EXPRESSION
329:     LD  3,-5(1)	Load variable Bi
330:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
331:     LD  3,-5(1)	Load variable Bi
* TOFF inc: -9
332:     LD  4,-9(1)	Pop left into ac1 
333:    MUL  3,4,3	Op * 
334:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
335:    LDC  3,256(6)	Load integer constant 
* TOFF inc: -9
336:     LD  4,-9(1)	Pop left into ac1 
337:    DIV  3,4,3	Op / 
338:     ST  3,-8(1)	Store variable NextBi
* EXPRESSION
339:     LD  3,-7(1)	Load variable NextA
340:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
341:     LD  3,-8(1)	Load variable NextBi
* TOFF inc: -9
342:     LD  4,-9(1)	Pop left into ac1 
343:    ADD  3,4,3	Op + 
344:     ST  3,-4(1)	Store variable Len
* EXPRESSION
345:     LD  3,-8(0)	load lhs variable iter
346:    LDA  3,1(3)	increment value of iter
347:     ST  3,-8(0)	Store variable iter
* TOFF set: -9
* END COMPOUND
348:    JMP  7,-73(7)	go to beginning of loop 
290:    JMP  7,58(7)	Jump past loop [backpatch] 
* END WHILE
* IF
349:     LD  3,-8(0)	Load variable iter
350:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
351:    LDC  3,10(6)	Load integer constant 
* TOFF inc: -9
352:     LD  4,-9(1)	Pop left into ac1 
353:    TLT  3,4,3	Op < 
* THEN
* COMPOUND
* TOFF set: -9
* Compound Body
* EXPRESSION
* CALL outputc
355:     ST  1,-9(1)	Store fp in ghost frame for outputc
* TOFF dec: -10
* TOFF dec: -11
* Param 1
356:    LDA  3,-10(0)	Load address of base of array grayScale
357:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
358:     LD  3,-8(0)	Load variable iter
* TOFF inc: -11
359:     LD  4,-11(1)	Pop left into ac1 
360:    SUB  3,4,3	compute location from index 
361:     LD  3,0(3)	Load array element 
362:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param end outputc
363:    LDA  1,-9(1)	Ghost frame becomes new active frame 
364:    LDA  3,1(7)	Return address in ac 
365:    JMP  7,-338(7)	CALL outputc
366:    LDA  3,0(2)	Save the result in ac 
* Call end outputc
* TOFF set: -9
* EXPRESSION
* CALL outputc
367:     ST  1,-9(1)	Store fp in ghost frame for outputc
* TOFF dec: -10
* TOFF dec: -11
* Param 1
368:    LDC  3,32(6)	Load char constant 
369:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param end outputc
370:    LDA  1,-9(1)	Ghost frame becomes new active frame 
371:    LDA  3,1(7)	Return address in ac 
372:    JMP  7,-345(7)	CALL outputc
373:    LDA  3,0(2)	Save the result in ac 
* Call end outputc
* TOFF set: -9
* TOFF set: -9
* END COMPOUND
354:    JZR  3,20(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
* CALL outputb
375:     ST  1,-9(1)	Store fp in ghost frame for outputb
* TOFF dec: -10
* TOFF dec: -11
* Param 1
376:     LD  3,-8(0)	Load variable iter
377:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
378:    LDC  3,11(6)	Load integer constant 
* TOFF inc: -11
379:     LD  4,-11(1)	Pop left into ac1 
380:    TEQ  3,4,3	Op = 
381:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param end outputb
382:    LDA  1,-9(1)	Ghost frame becomes new active frame 
383:    LDA  3,1(7)	Return address in ac 
384:    JMP  7,-368(7)	CALL outputb
385:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -9
374:    JMP  7,11(7)	Jump around the ELSE [backpatch] 
* END IF
* EXPRESSION
386:     LD  3,-4(0)	Load variable XStep
387:     LD  4,-1(0)	load lhs variable LEFT
388:    ADD  3,4,3	op += 
389:     ST  3,-1(0)	Store variable LEFT
* TOFF set: -4
* END COMPOUND
390:    JMP  7,-154(7)	go to beginning of loop 
243:    JMP  7,147(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
* CALL outnl
391:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
392:    LDA  1,-4(1)	Ghost frame becomes new active frame 
393:    LDA  3,1(7)	Return address in ac 
394:    JMP  7,-361(7)	CALL outnl
395:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
* EXPRESSION
396:     LD  3,-5(0)	Load variable YStep
397:     LD  4,0(0)	load lhs variable TOP
398:    ADD  3,4,3	op += 
399:     ST  3,0(0)	Store variable TOP
* TOFF set: -4
* END COMPOUND
400:    JMP  7,-174(7)	go to beginning of loop 
233:    JMP  7,167(7)	Jump past loop [backpatch] 
* END WHILE
* TOFF set: -4
* END COMPOUND
* Add standard closing in case there is no return statement
401:    LDC  2,0(6)	Set return value to 0 
402:     LD  3,-1(1)	Load return address 
403:     LD  1,0(1)	Adjust fp 
404:    JMP  7,0(3)	Return 
* END FUNCTION Julia
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
405:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -5
406:    LDC  3,2(6)	load size of array JuliaVals
407:     ST  3,-2(1)	save size of array JuliaVals
* Compound Body
* EXPRESSION
408:    LDC  3,0(6)	Load integer constant 
409:     ST  3,-5(1)	Push index 
* TOFF dec: -6
410:    LDC  3,32(6)	Load char constant 
* TOFF inc: -5
411:     LD  4,-5(1)	Pop index 
412:    LDA  5,-10(0)	Load address of base of array grayScale
413:    SUB  5,5,4	Compute offset of value 
414:     ST  3,0(5)	Store variable grayScale
* EXPRESSION
415:    LDC  3,1(6)	Load integer constant 
416:     ST  3,-5(1)	Push index 
* TOFF dec: -6
417:    LDC  3,46(6)	Load char constant 
* TOFF inc: -5
418:     LD  4,-5(1)	Pop index 
419:    LDA  5,-10(0)	Load address of base of array grayScale
420:    SUB  5,5,4	Compute offset of value 
421:     ST  3,0(5)	Store variable grayScale
* EXPRESSION
422:    LDC  3,2(6)	Load integer constant 
423:     ST  3,-5(1)	Push index 
* TOFF dec: -6
424:    LDC  3,32(6)	Load char constant 
* TOFF inc: -5
425:     LD  4,-5(1)	Pop index 
426:    LDA  5,-10(0)	Load address of base of array grayScale
427:    SUB  5,5,4	Compute offset of value 
428:     ST  3,0(5)	Store variable grayScale
* EXPRESSION
429:    LDC  3,3(6)	Load integer constant 
430:     ST  3,-5(1)	Push index 
* TOFF dec: -6
431:    LDC  3,59(6)	Load char constant 
* TOFF inc: -5
432:     LD  4,-5(1)	Pop index 
433:    LDA  5,-10(0)	Load address of base of array grayScale
434:    SUB  5,5,4	Compute offset of value 
435:     ST  3,0(5)	Store variable grayScale
* EXPRESSION
436:    LDC  3,4(6)	Load integer constant 
437:     ST  3,-5(1)	Push index 
* TOFF dec: -6
438:    LDC  3,45(6)	Load char constant 
* TOFF inc: -5
439:     LD  4,-5(1)	Pop index 
440:    LDA  5,-10(0)	Load address of base of array grayScale
441:    SUB  5,5,4	Compute offset of value 
442:     ST  3,0(5)	Store variable grayScale
* EXPRESSION
443:    LDC  3,5(6)	Load integer constant 
444:     ST  3,-5(1)	Push index 
* TOFF dec: -6
445:    LDC  3,43(6)	Load char constant 
* TOFF inc: -5
446:     LD  4,-5(1)	Pop index 
447:    LDA  5,-10(0)	Load address of base of array grayScale
448:    SUB  5,5,4	Compute offset of value 
449:     ST  3,0(5)	Store variable grayScale
* EXPRESSION
450:    LDC  3,6(6)	Load integer constant 
451:     ST  3,-5(1)	Push index 
* TOFF dec: -6
452:    LDC  3,73(6)	Load char constant 
* TOFF inc: -5
453:     LD  4,-5(1)	Pop index 
454:    LDA  5,-10(0)	Load address of base of array grayScale
455:    SUB  5,5,4	Compute offset of value 
456:     ST  3,0(5)	Store variable grayScale
* EXPRESSION
457:    LDC  3,7(6)	Load integer constant 
458:     ST  3,-5(1)	Push index 
* TOFF dec: -6
459:    LDC  3,79(6)	Load char constant 
* TOFF inc: -5
460:     LD  4,-5(1)	Pop index 
461:    LDA  5,-10(0)	Load address of base of array grayScale
462:    SUB  5,5,4	Compute offset of value 
463:     ST  3,0(5)	Store variable grayScale
* EXPRESSION
464:    LDC  3,8(6)	Load integer constant 
465:     ST  3,-5(1)	Push index 
* TOFF dec: -6
466:    LDC  3,86(6)	Load char constant 
* TOFF inc: -5
467:     LD  4,-5(1)	Pop index 
468:    LDA  5,-10(0)	Load address of base of array grayScale
469:    SUB  5,5,4	Compute offset of value 
470:     ST  3,0(5)	Store variable grayScale
* EXPRESSION
471:    LDC  3,9(6)	Load integer constant 
472:     ST  3,-5(1)	Push index 
* TOFF dec: -6
473:    LDC  3,87(6)	Load char constant 
* TOFF inc: -5
474:     LD  4,-5(1)	Pop index 
475:    LDA  5,-10(0)	Load address of base of array grayScale
476:    SUB  5,5,4	Compute offset of value 
477:     ST  3,0(5)	Store variable grayScale
* EXPRESSION
478:    LDC  3,10(6)	Load integer constant 
479:     ST  3,-5(1)	Push index 
* TOFF dec: -6
480:    LDC  3,35(6)	Load char constant 
* TOFF inc: -5
481:     LD  4,-5(1)	Pop index 
482:    LDA  5,-10(0)	Load address of base of array grayScale
483:    SUB  5,5,4	Compute offset of value 
484:     ST  3,0(5)	Store variable grayScale
* EXPRESSION
485:    LDC  3,11(6)	Load integer constant 
486:     ST  3,-5(1)	Push index 
* TOFF dec: -6
487:    LDC  3,64(6)	Load char constant 
* TOFF inc: -5
488:     LD  4,-5(1)	Pop index 
489:    LDA  5,-10(0)	Load address of base of array grayScale
490:    SUB  5,5,4	Compute offset of value 
491:     ST  3,0(5)	Store variable grayScale
* EXPRESSION
492:    LDC  3,320(6)	Load integer constant 
493:    NEG  3,3,3	Op unary - 
494:     ST  3,0(0)	Store variable TOP
* EXPRESSION
495:    LDC  3,512(6)	Load integer constant 
496:    NEG  3,3,3	Op unary - 
497:     ST  3,-1(0)	Store variable LEFT
* EXPRESSION
498:    LDC  3,640(6)	Load integer constant 
499:     ST  3,-2(0)	Store variable HEIGHT
* EXPRESSION
500:    LDC  3,716(6)	Load integer constant 
501:     ST  3,-3(0)	Store variable WIDTH
* EXPRESSION
502:     LD  3,-3(0)	Load variable WIDTH
503:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
504:    LDC  3,40(6)	Load integer constant 
* TOFF inc: -5
505:     LD  4,-5(1)	Pop left into ac1 
506:    DIV  3,4,3	Op / 
507:     ST  3,-4(0)	Store variable XStep
* EXPRESSION
508:     LD  3,-2(0)	Load variable HEIGHT
509:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
510:    LDC  3,36(6)	Load integer constant 
* TOFF inc: -5
511:     LD  4,-5(1)	Pop left into ac1 
512:    DIV  3,4,3	Op / 
513:     ST  3,-5(0)	Store variable YStep
* EXPRESSION
514:     LD  3,-1(0)	Load variable LEFT
515:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
516:     LD  3,-3(0)	Load variable WIDTH
* TOFF inc: -5
517:     LD  4,-5(1)	Pop left into ac1 
518:    ADD  3,4,3	Op + 
519:     ST  3,-6(0)	Store variable XMax
* EXPRESSION
520:     LD  3,0(0)	Load variable TOP
521:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
522:     LD  3,-2(0)	Load variable HEIGHT
* TOFF inc: -5
523:     LD  4,-5(1)	Pop left into ac1 
524:    ADD  3,4,3	Op + 
525:     ST  3,-7(0)	Store variable YMax
* EXPRESSION
* CALL Mandelbrot
526:     ST  1,-5(1)	Store fp in ghost frame for Mandelbrot
* TOFF dec: -6
* TOFF dec: -7
* Param 1
527:    LDA  3,-3(1)	Load address of base of array JuliaVals
528:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end Mandelbrot
529:    LDA  1,-5(1)	Ghost frame becomes new active frame 
530:    LDA  3,1(7)	Return address in ac 
531:    JMP  7,-493(7)	CALL Mandelbrot
532:    LDA  3,0(2)	Save the result in ac 
* Call end Mandelbrot
* TOFF set: -5
* EXPRESSION
* CALL outnl
533:     ST  1,-5(1)	Store fp in ghost frame for outnl
* TOFF dec: -6
* TOFF dec: -7
* Param end outnl
534:    LDA  1,-5(1)	Ghost frame becomes new active frame 
535:    LDA  3,1(7)	Return address in ac 
536:    JMP  7,-503(7)	CALL outnl
537:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -5
* EXPRESSION
538:    LDC  3,320(6)	Load integer constant 
539:    NEG  3,3,3	Op unary - 
540:     ST  3,0(0)	Store variable TOP
* EXPRESSION
541:    LDC  3,512(6)	Load integer constant 
542:    NEG  3,3,3	Op unary - 
543:     ST  3,-1(0)	Store variable LEFT
* EXPRESSION
544:    LDC  3,640(6)	Load integer constant 
545:     ST  3,-2(0)	Store variable HEIGHT
* EXPRESSION
546:    LDC  3,716(6)	Load integer constant 
547:     ST  3,-3(0)	Store variable WIDTH
* EXPRESSION
548:     LD  3,-3(0)	Load variable WIDTH
549:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
550:    LDC  3,40(6)	Load integer constant 
* TOFF inc: -5
551:     LD  4,-5(1)	Pop left into ac1 
552:    DIV  3,4,3	Op / 
553:     ST  3,-4(0)	Store variable XStep
* EXPRESSION
554:     LD  3,-2(0)	Load variable HEIGHT
555:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
556:    LDC  3,36(6)	Load integer constant 
* TOFF inc: -5
557:     LD  4,-5(1)	Pop left into ac1 
558:    DIV  3,4,3	Op / 
559:     ST  3,-5(0)	Store variable YStep
* EXPRESSION
560:     LD  3,-1(0)	Load variable LEFT
561:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
562:     LD  3,-3(0)	Load variable WIDTH
* TOFF inc: -5
563:     LD  4,-5(1)	Pop left into ac1 
564:    ADD  3,4,3	Op + 
565:     ST  3,-6(0)	Store variable XMax
* EXPRESSION
566:     LD  3,0(0)	Load variable TOP
567:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
568:     LD  3,-2(0)	Load variable HEIGHT
* TOFF inc: -5
569:     LD  4,-5(1)	Pop left into ac1 
570:    ADD  3,4,3	Op + 
571:     ST  3,-7(0)	Store variable YMax
* EXPRESSION
* CALL Julia
572:     ST  1,-5(1)	Store fp in ghost frame for Julia
* TOFF dec: -6
* TOFF dec: -7
* Param 1
573:    LDA  3,-3(1)	Load address of base of array JuliaVals
574:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
575:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -7
576:     LD  4,-7(1)	Pop left into ac1 
577:    SUB  3,4,3	compute location from index 
578:     LD  3,0(3)	Load array element 
579:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param 2
580:    LDA  3,-3(1)	Load address of base of array JuliaVals
581:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
582:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -8
583:     LD  4,-8(1)	Pop left into ac1 
584:    SUB  3,4,3	compute location from index 
585:     LD  3,0(3)	Load array element 
586:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end Julia
587:    LDA  1,-5(1)	Ghost frame becomes new active frame 
588:    LDA  3,1(7)	Return address in ac 
589:    JMP  7,-364(7)	CALL Julia
590:    LDA  3,0(2)	Save the result in ac 
* Call end Julia
* TOFF set: -5
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
591:    LDC  2,0(6)	Set return value to 0 
592:     LD  3,-1(1)	Load return address 
593:     LD  1,0(1)	Adjust fp 
594:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,594(7)	Jump to init [backpatch] 
* INIT
595:    LDA  1,-22(0)	set first frame at end of globals 
596:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
597:    LDC  3,12(6)	load size of array grayScale
598:     ST  3,-9(0)	save size of array grayScale
* END INIT GLOBALS AND STATICS
599:    LDA  3,1(7)	Return address in ac 
600:    JMP  7,-196(7)	Jump to main 
601:   HALT  0,0,0	DONE! 
* END INIT
