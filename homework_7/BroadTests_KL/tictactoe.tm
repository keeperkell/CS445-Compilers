* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  tictactoe.c-
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
* FUNCTION move
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
 44:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -3
 45:     LD  4,-3(1)	Pop left into ac1 
 46:    TLT  3,4,3	Op < 
 47:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -3
* Compound Body
* IF
 49:    LDA  3,-1(0)	Load address of base of array board
 50:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 51:     LD  3,-2(1)	Load variable i
* TOFF inc: -3
 52:     LD  4,-3(1)	Pop left into ac1 
 53:    SUB  3,4,3	compute location from index 
 54:     LD  3,0(3)	Load array element 
 55:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 56:    LDC  3,1(6)	Load integer constant 
 57:    NEG  3,3,3	Op unary - 
* TOFF inc: -3
 58:     LD  4,-3(1)	Pop left into ac1 
 59:    TEQ  3,4,3	Op = 
* THEN
* COMPOUND
* TOFF set: -3
* Compound Body
* BREAK
 61:    JMP  7,-14(7)	break 
* TOFF set: -3
* END COMPOUND
 60:    JZR  3,1(7)	Jump around the THEN if false [backpatch] 
* END IF
* EXPRESSION
 62:     LD  3,-2(1)	load lhs variable i
 63:    LDA  3,1(3)	increment value of i
 64:     ST  3,-2(1)	Store variable i
* TOFF set: -3
* END COMPOUND
 65:    JMP  7,-24(7)	go to beginning of loop 
 48:    JMP  7,17(7)	Jump past loop [backpatch] 
* END WHILE
* IF
 66:     LD  3,-2(1)	Load variable i
 67:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 68:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -3
 69:     LD  4,-3(1)	Pop left into ac1 
 70:    TLT  3,4,3	Op < 
* THEN
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
 72:     LD  3,-2(1)	Load variable i
 73:     ST  3,-3(1)	Push index 
* TOFF dec: -4
 74:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
 75:     LD  4,-3(1)	Pop index 
 76:    LDA  5,-1(0)	Load address of base of array board
 77:    SUB  5,5,4	Compute offset of value 
 78:     ST  3,0(5)	Store variable board
* EXPRESSION
 79:    LDC  3,1(6)	Load Boolean constant 
 80:     ST  3,-10(0)	Store variable gamenotdone
* TOFF set: -3
* END COMPOUND
 71:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
 82:    LDC  3,0(6)	Load Boolean constant 
 83:     ST  3,-10(0)	Store variable gamenotdone
* TOFF set: -3
* END COMPOUND
 81:    JMP  7,2(7)	Jump around the ELSE [backpatch] 
* END IF
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
 84:    LDC  2,0(6)	Set return value to 0 
 85:     LD  3,-1(1)	Load return address 
 86:     LD  1,0(1)	Adjust fp 
 87:    JMP  7,0(3)	Return 
* END FUNCTION move
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION win
* TOFF set: -2
 88:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -2
* Compound Body
* IF
 89:    LDA  3,-1(0)	Load address of base of array board
 90:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
 91:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -2
 92:     LD  4,-2(1)	Pop left into ac1 
 93:    SUB  3,4,3	compute location from index 
 94:     LD  3,0(3)	Load array element 
 95:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
 96:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -2
 97:     LD  4,-2(1)	Pop left into ac1 
 98:    TEQ  3,4,3	Op = 
 99:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
100:    LDA  3,-1(0)	Load address of base of array board
101:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
102:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -3
103:     LD  4,-3(1)	Pop left into ac1 
104:    SUB  3,4,3	compute location from index 
105:     LD  3,0(3)	Load array element 
106:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
107:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
108:     LD  4,-3(1)	Pop left into ac1 
109:    TEQ  3,4,3	Op = 
* TOFF inc: -2
110:     LD  4,-2(1)	Pop left into ac1 
111:    AND  3,4,3	Op AND 
112:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
113:    LDA  3,-1(0)	Load address of base of array board
114:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
115:    LDC  3,6(6)	Load integer constant 
* TOFF inc: -3
116:     LD  4,-3(1)	Pop left into ac1 
117:    SUB  3,4,3	compute location from index 
118:     LD  3,0(3)	Load array element 
119:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
120:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
121:     LD  4,-3(1)	Pop left into ac1 
122:    TEQ  3,4,3	Op = 
123:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
124:    LDA  3,-1(0)	Load address of base of array board
125:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
126:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -4
127:     LD  4,-4(1)	Pop left into ac1 
128:    SUB  3,4,3	compute location from index 
129:     LD  3,0(3)	Load array element 
130:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
131:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -4
132:     LD  4,-4(1)	Pop left into ac1 
133:    TEQ  3,4,3	Op = 
* TOFF inc: -3
134:     LD  4,-3(1)	Pop left into ac1 
135:    AND  3,4,3	Op AND 
* TOFF inc: -2
136:     LD  4,-2(1)	Pop left into ac1 
137:     OR  3,4,3	Op OR 
138:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
139:    LDA  3,-1(0)	Load address of base of array board
140:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
141:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -3
142:     LD  4,-3(1)	Pop left into ac1 
143:    SUB  3,4,3	compute location from index 
144:     LD  3,0(3)	Load array element 
145:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
146:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
147:     LD  4,-3(1)	Pop left into ac1 
148:    TEQ  3,4,3	Op = 
149:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
150:    LDA  3,-1(0)	Load address of base of array board
151:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
152:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -4
153:     LD  4,-4(1)	Pop left into ac1 
154:    SUB  3,4,3	compute location from index 
155:     LD  3,0(3)	Load array element 
156:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
157:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -4
158:     LD  4,-4(1)	Pop left into ac1 
159:    TEQ  3,4,3	Op = 
* TOFF inc: -3
160:     LD  4,-3(1)	Pop left into ac1 
161:    AND  3,4,3	Op AND 
* TOFF inc: -2
162:     LD  4,-2(1)	Pop left into ac1 
163:     OR  3,4,3	Op OR 
164:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
165:    LDA  3,-1(0)	Load address of base of array board
166:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
167:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
168:     LD  4,-3(1)	Pop left into ac1 
169:    SUB  3,4,3	compute location from index 
170:     LD  3,0(3)	Load array element 
171:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
172:    LDC  3,1(6)	Load integer constant 
173:    NEG  3,3,3	Op unary - 
* TOFF inc: -3
174:     LD  4,-3(1)	Pop left into ac1 
175:    TEQ  3,4,3	Op = 
* TOFF inc: -2
176:     LD  4,-2(1)	Pop left into ac1 
177:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* TOFF set: -2
* Compound Body
* EXPRESSION
179:    LDC  3,2(6)	Load integer constant 
180:     ST  3,-2(1)	Push index 
* TOFF dec: -3
181:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -2
182:     LD  4,-2(1)	Pop index 
183:    LDA  5,-1(0)	Load address of base of array board
184:    SUB  5,5,4	Compute offset of value 
185:     ST  3,0(5)	Store variable board
* EXPRESSION
186:    LDC  3,0(6)	Load Boolean constant 
187:     ST  3,-10(0)	Store variable gamenotdone
* TOFF set: -2
* END COMPOUND
178:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* TOFF set: -2
* Compound Body
* IF
189:    LDA  3,-1(0)	Load address of base of array board
190:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
191:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -2
192:     LD  4,-2(1)	Pop left into ac1 
193:    SUB  3,4,3	compute location from index 
194:     LD  3,0(3)	Load array element 
195:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
196:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -2
197:     LD  4,-2(1)	Pop left into ac1 
198:    TEQ  3,4,3	Op = 
199:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
200:    LDA  3,-1(0)	Load address of base of array board
201:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
202:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
203:     LD  4,-3(1)	Pop left into ac1 
204:    SUB  3,4,3	compute location from index 
205:     LD  3,0(3)	Load array element 
206:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
207:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
208:     LD  4,-3(1)	Pop left into ac1 
209:    TEQ  3,4,3	Op = 
* TOFF inc: -2
210:     LD  4,-2(1)	Pop left into ac1 
211:    AND  3,4,3	Op AND 
212:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
213:    LDA  3,-1(0)	Load address of base of array board
214:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
215:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -3
216:     LD  4,-3(1)	Pop left into ac1 
217:    SUB  3,4,3	compute location from index 
218:     LD  3,0(3)	Load array element 
219:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
220:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
221:     LD  4,-3(1)	Pop left into ac1 
222:    TEQ  3,4,3	Op = 
223:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
224:    LDA  3,-1(0)	Load address of base of array board
225:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
226:    LDC  3,7(6)	Load integer constant 
* TOFF inc: -4
227:     LD  4,-4(1)	Pop left into ac1 
228:    SUB  3,4,3	compute location from index 
229:     LD  3,0(3)	Load array element 
230:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
231:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -4
232:     LD  4,-4(1)	Pop left into ac1 
233:    TEQ  3,4,3	Op = 
* TOFF inc: -3
234:     LD  4,-3(1)	Pop left into ac1 
235:    AND  3,4,3	Op AND 
* TOFF inc: -2
236:     LD  4,-2(1)	Pop left into ac1 
237:     OR  3,4,3	Op OR 
238:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
239:    LDA  3,-1(0)	Load address of base of array board
240:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
241:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -3
242:     LD  4,-3(1)	Pop left into ac1 
243:    SUB  3,4,3	compute location from index 
244:     LD  3,0(3)	Load array element 
245:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
246:    LDC  3,1(6)	Load integer constant 
247:    NEG  3,3,3	Op unary - 
* TOFF inc: -3
248:     LD  4,-3(1)	Pop left into ac1 
249:    TEQ  3,4,3	Op = 
* TOFF inc: -2
250:     LD  4,-2(1)	Pop left into ac1 
251:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* TOFF set: -2
* Compound Body
* EXPRESSION
253:    LDC  3,1(6)	Load integer constant 
254:     ST  3,-2(1)	Push index 
* TOFF dec: -3
255:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -2
256:     LD  4,-2(1)	Pop index 
257:    LDA  5,-1(0)	Load address of base of array board
258:    SUB  5,5,4	Compute offset of value 
259:     ST  3,0(5)	Store variable board
* EXPRESSION
260:    LDC  3,0(6)	Load Boolean constant 
261:     ST  3,-10(0)	Store variable gamenotdone
* TOFF set: -2
* END COMPOUND
252:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* TOFF set: -2
* Compound Body
* IF
263:    LDA  3,-1(0)	Load address of base of array board
264:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
265:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -2
266:     LD  4,-2(1)	Pop left into ac1 
267:    SUB  3,4,3	compute location from index 
268:     LD  3,0(3)	Load array element 
269:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
270:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -2
271:     LD  4,-2(1)	Pop left into ac1 
272:    TEQ  3,4,3	Op = 
273:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
274:    LDA  3,-1(0)	Load address of base of array board
275:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
276:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -3
277:     LD  4,-3(1)	Pop left into ac1 
278:    SUB  3,4,3	compute location from index 
279:     LD  3,0(3)	Load array element 
280:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
281:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
282:     LD  4,-3(1)	Pop left into ac1 
283:    TEQ  3,4,3	Op = 
* TOFF inc: -2
284:     LD  4,-2(1)	Pop left into ac1 
285:    AND  3,4,3	Op AND 
286:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
287:    LDA  3,-1(0)	Load address of base of array board
288:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
289:    LDC  3,6(6)	Load integer constant 
* TOFF inc: -3
290:     LD  4,-3(1)	Pop left into ac1 
291:    SUB  3,4,3	compute location from index 
292:     LD  3,0(3)	Load array element 
293:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
294:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
295:     LD  4,-3(1)	Pop left into ac1 
296:    TEQ  3,4,3	Op = 
297:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
298:    LDA  3,-1(0)	Load address of base of array board
299:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
300:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -4
301:     LD  4,-4(1)	Pop left into ac1 
302:    SUB  3,4,3	compute location from index 
303:     LD  3,0(3)	Load array element 
304:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
305:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -4
306:     LD  4,-4(1)	Pop left into ac1 
307:    TEQ  3,4,3	Op = 
* TOFF inc: -3
308:     LD  4,-3(1)	Pop left into ac1 
309:    AND  3,4,3	Op AND 
* TOFF inc: -2
310:     LD  4,-2(1)	Pop left into ac1 
311:     OR  3,4,3	Op OR 
312:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
313:    LDA  3,-1(0)	Load address of base of array board
314:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
315:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -3
316:     LD  4,-3(1)	Pop left into ac1 
317:    SUB  3,4,3	compute location from index 
318:     LD  3,0(3)	Load array element 
319:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
320:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
321:     LD  4,-3(1)	Pop left into ac1 
322:    TEQ  3,4,3	Op = 
323:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
324:    LDA  3,-1(0)	Load address of base of array board
325:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
326:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -4
327:     LD  4,-4(1)	Pop left into ac1 
328:    SUB  3,4,3	compute location from index 
329:     LD  3,0(3)	Load array element 
330:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
331:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -4
332:     LD  4,-4(1)	Pop left into ac1 
333:    TEQ  3,4,3	Op = 
* TOFF inc: -3
334:     LD  4,-3(1)	Pop left into ac1 
335:    AND  3,4,3	Op AND 
* TOFF inc: -2
336:     LD  4,-2(1)	Pop left into ac1 
337:     OR  3,4,3	Op OR 
338:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
339:    LDA  3,-1(0)	Load address of base of array board
340:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
341:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -3
342:     LD  4,-3(1)	Pop left into ac1 
343:    SUB  3,4,3	compute location from index 
344:     LD  3,0(3)	Load array element 
345:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
346:    LDC  3,1(6)	Load integer constant 
347:    NEG  3,3,3	Op unary - 
* TOFF inc: -3
348:     LD  4,-3(1)	Pop left into ac1 
349:    TEQ  3,4,3	Op = 
* TOFF inc: -2
350:     LD  4,-2(1)	Pop left into ac1 
351:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* TOFF set: -2
* Compound Body
* EXPRESSION
353:    LDC  3,0(6)	Load integer constant 
354:     ST  3,-2(1)	Push index 
* TOFF dec: -3
355:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -2
356:     LD  4,-2(1)	Pop index 
357:    LDA  5,-1(0)	Load address of base of array board
358:    SUB  5,5,4	Compute offset of value 
359:     ST  3,0(5)	Store variable board
* EXPRESSION
360:    LDC  3,0(6)	Load Boolean constant 
361:     ST  3,-10(0)	Store variable gamenotdone
* TOFF set: -2
* END COMPOUND
352:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* TOFF set: -2
* Compound Body
* IF
363:    LDA  3,-1(0)	Load address of base of array board
364:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
365:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -2
366:     LD  4,-2(1)	Pop left into ac1 
367:    SUB  3,4,3	compute location from index 
368:     LD  3,0(3)	Load array element 
369:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
370:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -2
371:     LD  4,-2(1)	Pop left into ac1 
372:    TEQ  3,4,3	Op = 
373:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
374:    LDA  3,-1(0)	Load address of base of array board
375:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
376:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -3
377:     LD  4,-3(1)	Pop left into ac1 
378:    SUB  3,4,3	compute location from index 
379:     LD  3,0(3)	Load array element 
380:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
381:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
382:     LD  4,-3(1)	Pop left into ac1 
383:    TEQ  3,4,3	Op = 
* TOFF inc: -2
384:     LD  4,-2(1)	Pop left into ac1 
385:    AND  3,4,3	Op AND 
386:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
387:    LDA  3,-1(0)	Load address of base of array board
388:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
389:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
390:     LD  4,-3(1)	Pop left into ac1 
391:    SUB  3,4,3	compute location from index 
392:     LD  3,0(3)	Load array element 
393:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
394:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
395:     LD  4,-3(1)	Pop left into ac1 
396:    TEQ  3,4,3	Op = 
397:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
398:    LDA  3,-1(0)	Load address of base of array board
399:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
400:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -4
401:     LD  4,-4(1)	Pop left into ac1 
402:    SUB  3,4,3	compute location from index 
403:     LD  3,0(3)	Load array element 
404:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
405:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -4
406:     LD  4,-4(1)	Pop left into ac1 
407:    TEQ  3,4,3	Op = 
* TOFF inc: -3
408:     LD  4,-3(1)	Pop left into ac1 
409:    AND  3,4,3	Op AND 
* TOFF inc: -2
410:     LD  4,-2(1)	Pop left into ac1 
411:     OR  3,4,3	Op OR 
412:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
413:    LDA  3,-1(0)	Load address of base of array board
414:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
415:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -3
416:     LD  4,-3(1)	Pop left into ac1 
417:    SUB  3,4,3	compute location from index 
418:     LD  3,0(3)	Load array element 
419:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
420:    LDC  3,1(6)	Load integer constant 
421:    NEG  3,3,3	Op unary - 
* TOFF inc: -3
422:     LD  4,-3(1)	Pop left into ac1 
423:    TEQ  3,4,3	Op = 
* TOFF inc: -2
424:     LD  4,-2(1)	Pop left into ac1 
425:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* TOFF set: -2
* Compound Body
* EXPRESSION
427:    LDC  3,5(6)	Load integer constant 
428:     ST  3,-2(1)	Push index 
* TOFF dec: -3
429:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -2
430:     LD  4,-2(1)	Pop index 
431:    LDA  5,-1(0)	Load address of base of array board
432:    SUB  5,5,4	Compute offset of value 
433:     ST  3,0(5)	Store variable board
* EXPRESSION
434:    LDC  3,0(6)	Load Boolean constant 
435:     ST  3,-10(0)	Store variable gamenotdone
* TOFF set: -2
* END COMPOUND
426:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* TOFF set: -2
* Compound Body
* IF
437:    LDA  3,-1(0)	Load address of base of array board
438:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
439:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -2
440:     LD  4,-2(1)	Pop left into ac1 
441:    SUB  3,4,3	compute location from index 
442:     LD  3,0(3)	Load array element 
443:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
444:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -2
445:     LD  4,-2(1)	Pop left into ac1 
446:    TEQ  3,4,3	Op = 
447:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
448:    LDA  3,-1(0)	Load address of base of array board
449:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
450:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -3
451:     LD  4,-3(1)	Pop left into ac1 
452:    SUB  3,4,3	compute location from index 
453:     LD  3,0(3)	Load array element 
454:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
455:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
456:     LD  4,-3(1)	Pop left into ac1 
457:    TEQ  3,4,3	Op = 
* TOFF inc: -2
458:     LD  4,-2(1)	Pop left into ac1 
459:    AND  3,4,3	Op AND 
460:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
461:    LDA  3,-1(0)	Load address of base of array board
462:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
463:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -3
464:     LD  4,-3(1)	Pop left into ac1 
465:    SUB  3,4,3	compute location from index 
466:     LD  3,0(3)	Load array element 
467:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
468:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
469:     LD  4,-3(1)	Pop left into ac1 
470:    TEQ  3,4,3	Op = 
471:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
472:    LDA  3,-1(0)	Load address of base of array board
473:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
474:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -4
475:     LD  4,-4(1)	Pop left into ac1 
476:    SUB  3,4,3	compute location from index 
477:     LD  3,0(3)	Load array element 
478:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
479:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -4
480:     LD  4,-4(1)	Pop left into ac1 
481:    TEQ  3,4,3	Op = 
* TOFF inc: -3
482:     LD  4,-3(1)	Pop left into ac1 
483:    AND  3,4,3	Op AND 
* TOFF inc: -2
484:     LD  4,-2(1)	Pop left into ac1 
485:     OR  3,4,3	Op OR 
486:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
487:    LDA  3,-1(0)	Load address of base of array board
488:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
489:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
490:     LD  4,-3(1)	Pop left into ac1 
491:    SUB  3,4,3	compute location from index 
492:     LD  3,0(3)	Load array element 
493:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
494:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
495:     LD  4,-3(1)	Pop left into ac1 
496:    TEQ  3,4,3	Op = 
497:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
498:    LDA  3,-1(0)	Load address of base of array board
499:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
500:    LDC  3,6(6)	Load integer constant 
* TOFF inc: -4
501:     LD  4,-4(1)	Pop left into ac1 
502:    SUB  3,4,3	compute location from index 
503:     LD  3,0(3)	Load array element 
504:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
505:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -4
506:     LD  4,-4(1)	Pop left into ac1 
507:    TEQ  3,4,3	Op = 
* TOFF inc: -3
508:     LD  4,-3(1)	Pop left into ac1 
509:    AND  3,4,3	Op AND 
* TOFF inc: -2
510:     LD  4,-2(1)	Pop left into ac1 
511:     OR  3,4,3	Op OR 
512:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
513:    LDA  3,-1(0)	Load address of base of array board
514:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
515:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -3
516:     LD  4,-3(1)	Pop left into ac1 
517:    SUB  3,4,3	compute location from index 
518:     LD  3,0(3)	Load array element 
519:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
520:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
521:     LD  4,-3(1)	Pop left into ac1 
522:    TEQ  3,4,3	Op = 
523:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
524:    LDA  3,-1(0)	Load address of base of array board
525:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
526:    LDC  3,7(6)	Load integer constant 
* TOFF inc: -4
527:     LD  4,-4(1)	Pop left into ac1 
528:    SUB  3,4,3	compute location from index 
529:     LD  3,0(3)	Load array element 
530:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
531:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -4
532:     LD  4,-4(1)	Pop left into ac1 
533:    TEQ  3,4,3	Op = 
* TOFF inc: -3
534:     LD  4,-3(1)	Pop left into ac1 
535:    AND  3,4,3	Op AND 
* TOFF inc: -2
536:     LD  4,-2(1)	Pop left into ac1 
537:     OR  3,4,3	Op OR 
538:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
539:    LDA  3,-1(0)	Load address of base of array board
540:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
541:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -3
542:     LD  4,-3(1)	Pop left into ac1 
543:    SUB  3,4,3	compute location from index 
544:     LD  3,0(3)	Load array element 
545:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
546:    LDC  3,1(6)	Load integer constant 
547:    NEG  3,3,3	Op unary - 
* TOFF inc: -3
548:     LD  4,-3(1)	Pop left into ac1 
549:    TEQ  3,4,3	Op = 
* TOFF inc: -2
550:     LD  4,-2(1)	Pop left into ac1 
551:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* TOFF set: -2
* Compound Body
* EXPRESSION
553:    LDC  3,4(6)	Load integer constant 
554:     ST  3,-2(1)	Push index 
* TOFF dec: -3
555:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -2
556:     LD  4,-2(1)	Pop index 
557:    LDA  5,-1(0)	Load address of base of array board
558:    SUB  5,5,4	Compute offset of value 
559:     ST  3,0(5)	Store variable board
* EXPRESSION
560:    LDC  3,0(6)	Load Boolean constant 
561:     ST  3,-10(0)	Store variable gamenotdone
* TOFF set: -2
* END COMPOUND
552:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* TOFF set: -2
* Compound Body
* IF
563:    LDA  3,-1(0)	Load address of base of array board
564:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
565:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -2
566:     LD  4,-2(1)	Pop left into ac1 
567:    SUB  3,4,3	compute location from index 
568:     LD  3,0(3)	Load array element 
569:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
570:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -2
571:     LD  4,-2(1)	Pop left into ac1 
572:    TEQ  3,4,3	Op = 
573:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
574:    LDA  3,-1(0)	Load address of base of array board
575:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
576:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -3
577:     LD  4,-3(1)	Pop left into ac1 
578:    SUB  3,4,3	compute location from index 
579:     LD  3,0(3)	Load array element 
580:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
581:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
582:     LD  4,-3(1)	Pop left into ac1 
583:    TEQ  3,4,3	Op = 
* TOFF inc: -2
584:     LD  4,-2(1)	Pop left into ac1 
585:    AND  3,4,3	Op AND 
586:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
587:    LDA  3,-1(0)	Load address of base of array board
588:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
589:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -3
590:     LD  4,-3(1)	Pop left into ac1 
591:    SUB  3,4,3	compute location from index 
592:     LD  3,0(3)	Load array element 
593:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
594:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
595:     LD  4,-3(1)	Pop left into ac1 
596:    TEQ  3,4,3	Op = 
597:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
598:    LDA  3,-1(0)	Load address of base of array board
599:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
600:    LDC  3,6(6)	Load integer constant 
* TOFF inc: -4
601:     LD  4,-4(1)	Pop left into ac1 
602:    SUB  3,4,3	compute location from index 
603:     LD  3,0(3)	Load array element 
604:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
605:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -4
606:     LD  4,-4(1)	Pop left into ac1 
607:    TEQ  3,4,3	Op = 
* TOFF inc: -3
608:     LD  4,-3(1)	Pop left into ac1 
609:    AND  3,4,3	Op AND 
* TOFF inc: -2
610:     LD  4,-2(1)	Pop left into ac1 
611:     OR  3,4,3	Op OR 
612:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
613:    LDA  3,-1(0)	Load address of base of array board
614:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
615:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -3
616:     LD  4,-3(1)	Pop left into ac1 
617:    SUB  3,4,3	compute location from index 
618:     LD  3,0(3)	Load array element 
619:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
620:    LDC  3,1(6)	Load integer constant 
621:    NEG  3,3,3	Op unary - 
* TOFF inc: -3
622:     LD  4,-3(1)	Pop left into ac1 
623:    TEQ  3,4,3	Op = 
* TOFF inc: -2
624:     LD  4,-2(1)	Pop left into ac1 
625:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* TOFF set: -2
* Compound Body
* EXPRESSION
627:    LDC  3,3(6)	Load integer constant 
628:     ST  3,-2(1)	Push index 
* TOFF dec: -3
629:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -2
630:     LD  4,-2(1)	Pop index 
631:    LDA  5,-1(0)	Load address of base of array board
632:    SUB  5,5,4	Compute offset of value 
633:     ST  3,0(5)	Store variable board
* EXPRESSION
634:    LDC  3,0(6)	Load Boolean constant 
635:     ST  3,-10(0)	Store variable gamenotdone
* TOFF set: -2
* END COMPOUND
626:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* TOFF set: -2
* Compound Body
* IF
637:    LDA  3,-1(0)	Load address of base of array board
638:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
639:    LDC  3,6(6)	Load integer constant 
* TOFF inc: -2
640:     LD  4,-2(1)	Pop left into ac1 
641:    SUB  3,4,3	compute location from index 
642:     LD  3,0(3)	Load array element 
643:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
644:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -2
645:     LD  4,-2(1)	Pop left into ac1 
646:    TEQ  3,4,3	Op = 
647:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
648:    LDA  3,-1(0)	Load address of base of array board
649:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
650:    LDC  3,7(6)	Load integer constant 
* TOFF inc: -3
651:     LD  4,-3(1)	Pop left into ac1 
652:    SUB  3,4,3	compute location from index 
653:     LD  3,0(3)	Load array element 
654:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
655:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
656:     LD  4,-3(1)	Pop left into ac1 
657:    TEQ  3,4,3	Op = 
* TOFF inc: -2
658:     LD  4,-2(1)	Pop left into ac1 
659:    AND  3,4,3	Op AND 
660:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
661:    LDA  3,-1(0)	Load address of base of array board
662:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
663:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -3
664:     LD  4,-3(1)	Pop left into ac1 
665:    SUB  3,4,3	compute location from index 
666:     LD  3,0(3)	Load array element 
667:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
668:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
669:     LD  4,-3(1)	Pop left into ac1 
670:    TEQ  3,4,3	Op = 
671:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
672:    LDA  3,-1(0)	Load address of base of array board
673:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
674:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -4
675:     LD  4,-4(1)	Pop left into ac1 
676:    SUB  3,4,3	compute location from index 
677:     LD  3,0(3)	Load array element 
678:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
679:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -4
680:     LD  4,-4(1)	Pop left into ac1 
681:    TEQ  3,4,3	Op = 
* TOFF inc: -3
682:     LD  4,-3(1)	Pop left into ac1 
683:    AND  3,4,3	Op AND 
* TOFF inc: -2
684:     LD  4,-2(1)	Pop left into ac1 
685:     OR  3,4,3	Op OR 
686:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
687:    LDA  3,-1(0)	Load address of base of array board
688:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
689:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
690:     LD  4,-3(1)	Pop left into ac1 
691:    SUB  3,4,3	compute location from index 
692:     LD  3,0(3)	Load array element 
693:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
694:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
695:     LD  4,-3(1)	Pop left into ac1 
696:    TEQ  3,4,3	Op = 
697:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
698:    LDA  3,-1(0)	Load address of base of array board
699:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
700:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -4
701:     LD  4,-4(1)	Pop left into ac1 
702:    SUB  3,4,3	compute location from index 
703:     LD  3,0(3)	Load array element 
704:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
705:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -4
706:     LD  4,-4(1)	Pop left into ac1 
707:    TEQ  3,4,3	Op = 
* TOFF inc: -3
708:     LD  4,-3(1)	Pop left into ac1 
709:    AND  3,4,3	Op AND 
* TOFF inc: -2
710:     LD  4,-2(1)	Pop left into ac1 
711:     OR  3,4,3	Op OR 
712:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
713:    LDA  3,-1(0)	Load address of base of array board
714:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
715:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -3
716:     LD  4,-3(1)	Pop left into ac1 
717:    SUB  3,4,3	compute location from index 
718:     LD  3,0(3)	Load array element 
719:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
720:    LDC  3,1(6)	Load integer constant 
721:    NEG  3,3,3	Op unary - 
* TOFF inc: -3
722:     LD  4,-3(1)	Pop left into ac1 
723:    TEQ  3,4,3	Op = 
* TOFF inc: -2
724:     LD  4,-2(1)	Pop left into ac1 
725:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* TOFF set: -2
* Compound Body
* EXPRESSION
727:    LDC  3,8(6)	Load integer constant 
728:     ST  3,-2(1)	Push index 
* TOFF dec: -3
729:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -2
730:     LD  4,-2(1)	Pop index 
731:    LDA  5,-1(0)	Load address of base of array board
732:    SUB  5,5,4	Compute offset of value 
733:     ST  3,0(5)	Store variable board
* EXPRESSION
734:    LDC  3,0(6)	Load Boolean constant 
735:     ST  3,-10(0)	Store variable gamenotdone
* TOFF set: -2
* END COMPOUND
726:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* TOFF set: -2
* Compound Body
* IF
737:    LDA  3,-1(0)	Load address of base of array board
738:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
739:    LDC  3,6(6)	Load integer constant 
* TOFF inc: -2
740:     LD  4,-2(1)	Pop left into ac1 
741:    SUB  3,4,3	compute location from index 
742:     LD  3,0(3)	Load array element 
743:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
744:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -2
745:     LD  4,-2(1)	Pop left into ac1 
746:    TEQ  3,4,3	Op = 
747:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
748:    LDA  3,-1(0)	Load address of base of array board
749:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
750:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -3
751:     LD  4,-3(1)	Pop left into ac1 
752:    SUB  3,4,3	compute location from index 
753:     LD  3,0(3)	Load array element 
754:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
755:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
756:     LD  4,-3(1)	Pop left into ac1 
757:    TEQ  3,4,3	Op = 
* TOFF inc: -2
758:     LD  4,-2(1)	Pop left into ac1 
759:    AND  3,4,3	Op AND 
760:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
761:    LDA  3,-1(0)	Load address of base of array board
762:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
763:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -3
764:     LD  4,-3(1)	Pop left into ac1 
765:    SUB  3,4,3	compute location from index 
766:     LD  3,0(3)	Load array element 
767:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
768:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
769:     LD  4,-3(1)	Pop left into ac1 
770:    TEQ  3,4,3	Op = 
771:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
772:    LDA  3,-1(0)	Load address of base of array board
773:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
774:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
775:     LD  4,-4(1)	Pop left into ac1 
776:    SUB  3,4,3	compute location from index 
777:     LD  3,0(3)	Load array element 
778:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
779:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -4
780:     LD  4,-4(1)	Pop left into ac1 
781:    TEQ  3,4,3	Op = 
* TOFF inc: -3
782:     LD  4,-3(1)	Pop left into ac1 
783:    AND  3,4,3	Op AND 
* TOFF inc: -2
784:     LD  4,-2(1)	Pop left into ac1 
785:     OR  3,4,3	Op OR 
786:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
787:    LDA  3,-1(0)	Load address of base of array board
788:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
789:    LDC  3,7(6)	Load integer constant 
* TOFF inc: -3
790:     LD  4,-3(1)	Pop left into ac1 
791:    SUB  3,4,3	compute location from index 
792:     LD  3,0(3)	Load array element 
793:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
794:    LDC  3,1(6)	Load integer constant 
795:    NEG  3,3,3	Op unary - 
* TOFF inc: -3
796:     LD  4,-3(1)	Pop left into ac1 
797:    TEQ  3,4,3	Op = 
* TOFF inc: -2
798:     LD  4,-2(1)	Pop left into ac1 
799:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* TOFF set: -2
* Compound Body
* EXPRESSION
801:    LDC  3,7(6)	Load integer constant 
802:     ST  3,-2(1)	Push index 
* TOFF dec: -3
803:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -2
804:     LD  4,-2(1)	Pop index 
805:    LDA  5,-1(0)	Load address of base of array board
806:    SUB  5,5,4	Compute offset of value 
807:     ST  3,0(5)	Store variable board
* EXPRESSION
808:    LDC  3,0(6)	Load Boolean constant 
809:     ST  3,-10(0)	Store variable gamenotdone
* TOFF set: -2
* END COMPOUND
800:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* TOFF set: -2
* Compound Body
* IF
811:    LDA  3,-1(0)	Load address of base of array board
812:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
813:    LDC  3,7(6)	Load integer constant 
* TOFF inc: -2
814:     LD  4,-2(1)	Pop left into ac1 
815:    SUB  3,4,3	compute location from index 
816:     LD  3,0(3)	Load array element 
817:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
818:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -2
819:     LD  4,-2(1)	Pop left into ac1 
820:    TEQ  3,4,3	Op = 
821:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
822:    LDA  3,-1(0)	Load address of base of array board
823:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
824:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -3
825:     LD  4,-3(1)	Pop left into ac1 
826:    SUB  3,4,3	compute location from index 
827:     LD  3,0(3)	Load array element 
828:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
829:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
830:     LD  4,-3(1)	Pop left into ac1 
831:    TEQ  3,4,3	Op = 
* TOFF inc: -2
832:     LD  4,-2(1)	Pop left into ac1 
833:    AND  3,4,3	Op AND 
834:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
835:    LDA  3,-1(0)	Load address of base of array board
836:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
837:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -3
838:     LD  4,-3(1)	Pop left into ac1 
839:    SUB  3,4,3	compute location from index 
840:     LD  3,0(3)	Load array element 
841:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
842:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
843:     LD  4,-3(1)	Pop left into ac1 
844:    TEQ  3,4,3	Op = 
845:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
846:    LDA  3,-1(0)	Load address of base of array board
847:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
848:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -4
849:     LD  4,-4(1)	Pop left into ac1 
850:    SUB  3,4,3	compute location from index 
851:     LD  3,0(3)	Load array element 
852:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
853:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -4
854:     LD  4,-4(1)	Pop left into ac1 
855:    TEQ  3,4,3	Op = 
* TOFF inc: -3
856:     LD  4,-3(1)	Pop left into ac1 
857:    AND  3,4,3	Op AND 
* TOFF inc: -2
858:     LD  4,-2(1)	Pop left into ac1 
859:     OR  3,4,3	Op OR 
860:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
861:    LDA  3,-1(0)	Load address of base of array board
862:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
863:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -3
864:     LD  4,-3(1)	Pop left into ac1 
865:    SUB  3,4,3	compute location from index 
866:     LD  3,0(3)	Load array element 
867:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
868:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
869:     LD  4,-3(1)	Pop left into ac1 
870:    TEQ  3,4,3	Op = 
871:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
872:    LDA  3,-1(0)	Load address of base of array board
873:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
874:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -4
875:     LD  4,-4(1)	Pop left into ac1 
876:    SUB  3,4,3	compute location from index 
877:     LD  3,0(3)	Load array element 
878:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
879:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -4
880:     LD  4,-4(1)	Pop left into ac1 
881:    TEQ  3,4,3	Op = 
* TOFF inc: -3
882:     LD  4,-3(1)	Pop left into ac1 
883:    AND  3,4,3	Op AND 
* TOFF inc: -2
884:     LD  4,-2(1)	Pop left into ac1 
885:     OR  3,4,3	Op OR 
886:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
887:    LDA  3,-1(0)	Load address of base of array board
888:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
889:    LDC  3,6(6)	Load integer constant 
* TOFF inc: -3
890:     LD  4,-3(1)	Pop left into ac1 
891:    SUB  3,4,3	compute location from index 
892:     LD  3,0(3)	Load array element 
893:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
894:    LDC  3,1(6)	Load integer constant 
895:    NEG  3,3,3	Op unary - 
* TOFF inc: -3
896:     LD  4,-3(1)	Pop left into ac1 
897:    TEQ  3,4,3	Op = 
* TOFF inc: -2
898:     LD  4,-2(1)	Pop left into ac1 
899:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* TOFF set: -2
* Compound Body
* EXPRESSION
901:    LDC  3,6(6)	Load integer constant 
902:     ST  3,-2(1)	Push index 
* TOFF dec: -3
903:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -2
904:     LD  4,-2(1)	Pop index 
905:    LDA  5,-1(0)	Load address of base of array board
906:    SUB  5,5,4	Compute offset of value 
907:     ST  3,0(5)	Store variable board
* EXPRESSION
908:    LDC  3,0(6)	Load Boolean constant 
909:     ST  3,-10(0)	Store variable gamenotdone
* TOFF set: -2
* END COMPOUND
900:    JZR  3,9(7)	Jump around the THEN if false [backpatch] 
* END IF
* TOFF set: -2
* END COMPOUND
810:    JMP  7,99(7)	Jump around the ELSE [backpatch] 
* END IF
* TOFF set: -2
* END COMPOUND
736:    JMP  7,173(7)	Jump around the ELSE [backpatch] 
* END IF
* TOFF set: -2
* END COMPOUND
636:    JMP  7,273(7)	Jump around the ELSE [backpatch] 
* END IF
* TOFF set: -2
* END COMPOUND
562:    JMP  7,347(7)	Jump around the ELSE [backpatch] 
* END IF
* TOFF set: -2
* END COMPOUND
436:    JMP  7,473(7)	Jump around the ELSE [backpatch] 
* END IF
* TOFF set: -2
* END COMPOUND
362:    JMP  7,547(7)	Jump around the ELSE [backpatch] 
* END IF
* TOFF set: -2
* END COMPOUND
262:    JMP  7,647(7)	Jump around the ELSE [backpatch] 
* END IF
* TOFF set: -2
* END COMPOUND
188:    JMP  7,721(7)	Jump around the ELSE [backpatch] 
* END IF
* IF
910:     LD  3,-10(0)	Load variable gamenotdone
911:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
912:    LDC  3,0(6)	Load Boolean constant 
* TOFF inc: -2
913:     LD  4,-2(1)	Pop left into ac1 
914:    TNE  3,4,3	Op >< 
* THEN
* COMPOUND
* TOFF set: -2
* Compound Body
* RETURN
916:    LDC  3,0(6)	Load Boolean constant 
917:    LDA  2,0(3)	Copy result to return register 
918:     LD  3,-1(1)	Load return address 
919:     LD  1,0(1)	Adjust fp 
920:    JMP  7,0(3)	Return 
* TOFF set: -2
* END COMPOUND
915:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* END IF
* RETURN
921:    LDC  3,1(6)	Load Boolean constant 
922:    LDA  2,0(3)	Copy result to return register 
923:     LD  3,-1(1)	Load return address 
924:     LD  1,0(1)	Adjust fp 
925:    JMP  7,0(3)	Return 
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
926:    LDC  2,0(6)	Set return value to 0 
927:     LD  3,-1(1)	Load return address 
928:     LD  1,0(1)	Adjust fp 
929:    JMP  7,0(3)	Return 
* END FUNCTION win
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION blockplayer
* TOFF set: -2
930:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
931:    LDC  3,0(6)	Load Boolean constant 
932:     ST  3,-2(1)	Store variable blocked
* IF
933:    LDA  3,-1(0)	Load address of base of array board
934:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
935:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -3
936:     LD  4,-3(1)	Pop left into ac1 
937:    SUB  3,4,3	compute location from index 
938:     LD  3,0(3)	Load array element 
939:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
940:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -3
941:     LD  4,-3(1)	Pop left into ac1 
942:    TEQ  3,4,3	Op = 
943:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
944:    LDA  3,-1(0)	Load address of base of array board
945:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
946:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
947:     LD  4,-4(1)	Pop left into ac1 
948:    SUB  3,4,3	compute location from index 
949:     LD  3,0(3)	Load array element 
950:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
951:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
952:     LD  4,-4(1)	Pop left into ac1 
953:    TEQ  3,4,3	Op = 
* TOFF inc: -3
954:     LD  4,-3(1)	Pop left into ac1 
955:    AND  3,4,3	Op AND 
956:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
957:    LDA  3,-1(0)	Load address of base of array board
958:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
959:    LDC  3,6(6)	Load integer constant 
* TOFF inc: -4
960:     LD  4,-4(1)	Pop left into ac1 
961:    SUB  3,4,3	compute location from index 
962:     LD  3,0(3)	Load array element 
963:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
964:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
965:     LD  4,-4(1)	Pop left into ac1 
966:    TEQ  3,4,3	Op = 
967:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
968:    LDA  3,-1(0)	Load address of base of array board
969:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
970:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -5
971:     LD  4,-5(1)	Pop left into ac1 
972:    SUB  3,4,3	compute location from index 
973:     LD  3,0(3)	Load array element 
974:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
975:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -5
976:     LD  4,-5(1)	Pop left into ac1 
977:    TEQ  3,4,3	Op = 
* TOFF inc: -4
978:     LD  4,-4(1)	Pop left into ac1 
979:    AND  3,4,3	Op AND 
* TOFF inc: -3
980:     LD  4,-3(1)	Pop left into ac1 
981:     OR  3,4,3	Op OR 
982:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
983:    LDA  3,-1(0)	Load address of base of array board
984:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
985:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -4
986:     LD  4,-4(1)	Pop left into ac1 
987:    SUB  3,4,3	compute location from index 
988:     LD  3,0(3)	Load array element 
989:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
990:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
991:     LD  4,-4(1)	Pop left into ac1 
992:    TEQ  3,4,3	Op = 
993:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
994:    LDA  3,-1(0)	Load address of base of array board
995:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
996:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -5
997:     LD  4,-5(1)	Pop left into ac1 
998:    SUB  3,4,3	compute location from index 
999:     LD  3,0(3)	Load array element 
1000:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
1001:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -5
1002:     LD  4,-5(1)	Pop left into ac1 
1003:    TEQ  3,4,3	Op = 
* TOFF inc: -4
1004:     LD  4,-4(1)	Pop left into ac1 
1005:    AND  3,4,3	Op AND 
* TOFF inc: -3
1006:     LD  4,-3(1)	Pop left into ac1 
1007:     OR  3,4,3	Op OR 
1008:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1009:    LDA  3,-1(0)	Load address of base of array board
1010:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1011:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -4
1012:     LD  4,-4(1)	Pop left into ac1 
1013:    SUB  3,4,3	compute location from index 
1014:     LD  3,0(3)	Load array element 
1015:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1016:    LDC  3,1(6)	Load integer constant 
1017:    NEG  3,3,3	Op unary - 
* TOFF inc: -4
1018:     LD  4,-4(1)	Pop left into ac1 
1019:    TEQ  3,4,3	Op = 
* TOFF inc: -3
1020:     LD  4,-3(1)	Pop left into ac1 
1021:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
1023:    LDC  3,2(6)	Load integer constant 
1024:     ST  3,-3(1)	Push index 
* TOFF dec: -4
1025:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
1026:     LD  4,-3(1)	Pop index 
1027:    LDA  5,-1(0)	Load address of base of array board
1028:    SUB  5,5,4	Compute offset of value 
1029:     ST  3,0(5)	Store variable board
* EXPRESSION
1030:    LDC  3,1(6)	Load Boolean constant 
1031:     ST  3,-2(1)	Store variable blocked
* TOFF set: -3
* END COMPOUND
1022:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* TOFF set: -3
* Compound Body
* IF
1033:    LDA  3,-1(0)	Load address of base of array board
1034:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1035:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -3
1036:     LD  4,-3(1)	Pop left into ac1 
1037:    SUB  3,4,3	compute location from index 
1038:     LD  3,0(3)	Load array element 
1039:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1040:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -3
1041:     LD  4,-3(1)	Pop left into ac1 
1042:    TEQ  3,4,3	Op = 
1043:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1044:    LDA  3,-1(0)	Load address of base of array board
1045:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1046:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -4
1047:     LD  4,-4(1)	Pop left into ac1 
1048:    SUB  3,4,3	compute location from index 
1049:     LD  3,0(3)	Load array element 
1050:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1051:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
1052:     LD  4,-4(1)	Pop left into ac1 
1053:    TEQ  3,4,3	Op = 
* TOFF inc: -3
1054:     LD  4,-3(1)	Pop left into ac1 
1055:    AND  3,4,3	Op AND 
1056:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1057:    LDA  3,-1(0)	Load address of base of array board
1058:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1059:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -4
1060:     LD  4,-4(1)	Pop left into ac1 
1061:    SUB  3,4,3	compute location from index 
1062:     LD  3,0(3)	Load array element 
1063:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1064:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
1065:     LD  4,-4(1)	Pop left into ac1 
1066:    TEQ  3,4,3	Op = 
1067:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1068:    LDA  3,-1(0)	Load address of base of array board
1069:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
1070:    LDC  3,7(6)	Load integer constant 
* TOFF inc: -5
1071:     LD  4,-5(1)	Pop left into ac1 
1072:    SUB  3,4,3	compute location from index 
1073:     LD  3,0(3)	Load array element 
1074:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
1075:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -5
1076:     LD  4,-5(1)	Pop left into ac1 
1077:    TEQ  3,4,3	Op = 
* TOFF inc: -4
1078:     LD  4,-4(1)	Pop left into ac1 
1079:    AND  3,4,3	Op AND 
* TOFF inc: -3
1080:     LD  4,-3(1)	Pop left into ac1 
1081:     OR  3,4,3	Op OR 
1082:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1083:    LDA  3,-1(0)	Load address of base of array board
1084:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1085:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
1086:     LD  4,-4(1)	Pop left into ac1 
1087:    SUB  3,4,3	compute location from index 
1088:     LD  3,0(3)	Load array element 
1089:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1090:    LDC  3,1(6)	Load integer constant 
1091:    NEG  3,3,3	Op unary - 
* TOFF inc: -4
1092:     LD  4,-4(1)	Pop left into ac1 
1093:    TEQ  3,4,3	Op = 
* TOFF inc: -3
1094:     LD  4,-3(1)	Pop left into ac1 
1095:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
1097:    LDC  3,1(6)	Load integer constant 
1098:     ST  3,-3(1)	Push index 
* TOFF dec: -4
1099:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
1100:     LD  4,-3(1)	Pop index 
1101:    LDA  5,-1(0)	Load address of base of array board
1102:    SUB  5,5,4	Compute offset of value 
1103:     ST  3,0(5)	Store variable board
* EXPRESSION
1104:    LDC  3,1(6)	Load Boolean constant 
1105:     ST  3,-2(1)	Store variable blocked
* TOFF set: -3
* END COMPOUND
1096:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* TOFF set: -3
* Compound Body
* IF
1107:    LDA  3,-1(0)	Load address of base of array board
1108:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1109:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
1110:     LD  4,-3(1)	Pop left into ac1 
1111:    SUB  3,4,3	compute location from index 
1112:     LD  3,0(3)	Load array element 
1113:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1114:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -3
1115:     LD  4,-3(1)	Pop left into ac1 
1116:    TEQ  3,4,3	Op = 
1117:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1118:    LDA  3,-1(0)	Load address of base of array board
1119:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1120:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
1121:     LD  4,-4(1)	Pop left into ac1 
1122:    SUB  3,4,3	compute location from index 
1123:     LD  3,0(3)	Load array element 
1124:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1125:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
1126:     LD  4,-4(1)	Pop left into ac1 
1127:    TEQ  3,4,3	Op = 
* TOFF inc: -3
1128:     LD  4,-3(1)	Pop left into ac1 
1129:    AND  3,4,3	Op AND 
1130:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1131:    LDA  3,-1(0)	Load address of base of array board
1132:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1133:    LDC  3,6(6)	Load integer constant 
* TOFF inc: -4
1134:     LD  4,-4(1)	Pop left into ac1 
1135:    SUB  3,4,3	compute location from index 
1136:     LD  3,0(3)	Load array element 
1137:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1138:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
1139:     LD  4,-4(1)	Pop left into ac1 
1140:    TEQ  3,4,3	Op = 
1141:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1142:    LDA  3,-1(0)	Load address of base of array board
1143:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
1144:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -5
1145:     LD  4,-5(1)	Pop left into ac1 
1146:    SUB  3,4,3	compute location from index 
1147:     LD  3,0(3)	Load array element 
1148:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
1149:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -5
1150:     LD  4,-5(1)	Pop left into ac1 
1151:    TEQ  3,4,3	Op = 
* TOFF inc: -4
1152:     LD  4,-4(1)	Pop left into ac1 
1153:    AND  3,4,3	Op AND 
* TOFF inc: -3
1154:     LD  4,-3(1)	Pop left into ac1 
1155:     OR  3,4,3	Op OR 
1156:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1157:    LDA  3,-1(0)	Load address of base of array board
1158:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1159:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -4
1160:     LD  4,-4(1)	Pop left into ac1 
1161:    SUB  3,4,3	compute location from index 
1162:     LD  3,0(3)	Load array element 
1163:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1164:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
1165:     LD  4,-4(1)	Pop left into ac1 
1166:    TEQ  3,4,3	Op = 
1167:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1168:    LDA  3,-1(0)	Load address of base of array board
1169:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
1170:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -5
1171:     LD  4,-5(1)	Pop left into ac1 
1172:    SUB  3,4,3	compute location from index 
1173:     LD  3,0(3)	Load array element 
1174:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
1175:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -5
1176:     LD  4,-5(1)	Pop left into ac1 
1177:    TEQ  3,4,3	Op = 
* TOFF inc: -4
1178:     LD  4,-4(1)	Pop left into ac1 
1179:    AND  3,4,3	Op AND 
* TOFF inc: -3
1180:     LD  4,-3(1)	Pop left into ac1 
1181:     OR  3,4,3	Op OR 
1182:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1183:    LDA  3,-1(0)	Load address of base of array board
1184:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1185:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -4
1186:     LD  4,-4(1)	Pop left into ac1 
1187:    SUB  3,4,3	compute location from index 
1188:     LD  3,0(3)	Load array element 
1189:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1190:    LDC  3,1(6)	Load integer constant 
1191:    NEG  3,3,3	Op unary - 
* TOFF inc: -4
1192:     LD  4,-4(1)	Pop left into ac1 
1193:    TEQ  3,4,3	Op = 
* TOFF inc: -3
1194:     LD  4,-3(1)	Pop left into ac1 
1195:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
1197:    LDC  3,0(6)	Load integer constant 
1198:     ST  3,-3(1)	Push index 
* TOFF dec: -4
1199:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
1200:     LD  4,-3(1)	Pop index 
1201:    LDA  5,-1(0)	Load address of base of array board
1202:    SUB  5,5,4	Compute offset of value 
1203:     ST  3,0(5)	Store variable board
* EXPRESSION
1204:    LDC  3,1(6)	Load Boolean constant 
1205:     ST  3,-2(1)	Store variable blocked
* TOFF set: -3
* END COMPOUND
1196:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* TOFF set: -3
* Compound Body
* IF
1207:    LDA  3,-1(0)	Load address of base of array board
1208:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1209:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -3
1210:     LD  4,-3(1)	Pop left into ac1 
1211:    SUB  3,4,3	compute location from index 
1212:     LD  3,0(3)	Load array element 
1213:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1214:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -3
1215:     LD  4,-3(1)	Pop left into ac1 
1216:    TEQ  3,4,3	Op = 
1217:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1218:    LDA  3,-1(0)	Load address of base of array board
1219:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1220:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -4
1221:     LD  4,-4(1)	Pop left into ac1 
1222:    SUB  3,4,3	compute location from index 
1223:     LD  3,0(3)	Load array element 
1224:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1225:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
1226:     LD  4,-4(1)	Pop left into ac1 
1227:    TEQ  3,4,3	Op = 
* TOFF inc: -3
1228:     LD  4,-3(1)	Pop left into ac1 
1229:    AND  3,4,3	Op AND 
1230:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1231:    LDA  3,-1(0)	Load address of base of array board
1232:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1233:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -4
1234:     LD  4,-4(1)	Pop left into ac1 
1235:    SUB  3,4,3	compute location from index 
1236:     LD  3,0(3)	Load array element 
1237:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1238:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
1239:     LD  4,-4(1)	Pop left into ac1 
1240:    TEQ  3,4,3	Op = 
1241:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1242:    LDA  3,-1(0)	Load address of base of array board
1243:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
1244:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -5
1245:     LD  4,-5(1)	Pop left into ac1 
1246:    SUB  3,4,3	compute location from index 
1247:     LD  3,0(3)	Load array element 
1248:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
1249:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -5
1250:     LD  4,-5(1)	Pop left into ac1 
1251:    TEQ  3,4,3	Op = 
* TOFF inc: -4
1252:     LD  4,-4(1)	Pop left into ac1 
1253:    AND  3,4,3	Op AND 
* TOFF inc: -3
1254:     LD  4,-3(1)	Pop left into ac1 
1255:     OR  3,4,3	Op OR 
1256:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1257:    LDA  3,-1(0)	Load address of base of array board
1258:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1259:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -4
1260:     LD  4,-4(1)	Pop left into ac1 
1261:    SUB  3,4,3	compute location from index 
1262:     LD  3,0(3)	Load array element 
1263:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1264:    LDC  3,1(6)	Load integer constant 
1265:    NEG  3,3,3	Op unary - 
* TOFF inc: -4
1266:     LD  4,-4(1)	Pop left into ac1 
1267:    TEQ  3,4,3	Op = 
* TOFF inc: -3
1268:     LD  4,-3(1)	Pop left into ac1 
1269:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
1271:    LDC  3,5(6)	Load integer constant 
1272:     ST  3,-3(1)	Push index 
* TOFF dec: -4
1273:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
1274:     LD  4,-3(1)	Pop index 
1275:    LDA  5,-1(0)	Load address of base of array board
1276:    SUB  5,5,4	Compute offset of value 
1277:     ST  3,0(5)	Store variable board
* EXPRESSION
1278:    LDC  3,1(6)	Load Boolean constant 
1279:     ST  3,-2(1)	Store variable blocked
* TOFF set: -3
* END COMPOUND
1270:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* TOFF set: -3
* Compound Body
* IF
1281:    LDA  3,-1(0)	Load address of base of array board
1282:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1283:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -3
1284:     LD  4,-3(1)	Pop left into ac1 
1285:    SUB  3,4,3	compute location from index 
1286:     LD  3,0(3)	Load array element 
1287:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1288:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -3
1289:     LD  4,-3(1)	Pop left into ac1 
1290:    TEQ  3,4,3	Op = 
1291:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1292:    LDA  3,-1(0)	Load address of base of array board
1293:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1294:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -4
1295:     LD  4,-4(1)	Pop left into ac1 
1296:    SUB  3,4,3	compute location from index 
1297:     LD  3,0(3)	Load array element 
1298:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1299:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
1300:     LD  4,-4(1)	Pop left into ac1 
1301:    TEQ  3,4,3	Op = 
* TOFF inc: -3
1302:     LD  4,-3(1)	Pop left into ac1 
1303:    AND  3,4,3	Op AND 
1304:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1305:    LDA  3,-1(0)	Load address of base of array board
1306:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1307:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -4
1308:     LD  4,-4(1)	Pop left into ac1 
1309:    SUB  3,4,3	compute location from index 
1310:     LD  3,0(3)	Load array element 
1311:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1312:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
1313:     LD  4,-4(1)	Pop left into ac1 
1314:    TEQ  3,4,3	Op = 
1315:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1316:    LDA  3,-1(0)	Load address of base of array board
1317:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
1318:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -5
1319:     LD  4,-5(1)	Pop left into ac1 
1320:    SUB  3,4,3	compute location from index 
1321:     LD  3,0(3)	Load array element 
1322:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
1323:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -5
1324:     LD  4,-5(1)	Pop left into ac1 
1325:    TEQ  3,4,3	Op = 
* TOFF inc: -4
1326:     LD  4,-4(1)	Pop left into ac1 
1327:    AND  3,4,3	Op AND 
* TOFF inc: -3
1328:     LD  4,-3(1)	Pop left into ac1 
1329:     OR  3,4,3	Op OR 
1330:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1331:    LDA  3,-1(0)	Load address of base of array board
1332:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1333:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -4
1334:     LD  4,-4(1)	Pop left into ac1 
1335:    SUB  3,4,3	compute location from index 
1336:     LD  3,0(3)	Load array element 
1337:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1338:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
1339:     LD  4,-4(1)	Pop left into ac1 
1340:    TEQ  3,4,3	Op = 
1341:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1342:    LDA  3,-1(0)	Load address of base of array board
1343:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
1344:    LDC  3,6(6)	Load integer constant 
* TOFF inc: -5
1345:     LD  4,-5(1)	Pop left into ac1 
1346:    SUB  3,4,3	compute location from index 
1347:     LD  3,0(3)	Load array element 
1348:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
1349:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -5
1350:     LD  4,-5(1)	Pop left into ac1 
1351:    TEQ  3,4,3	Op = 
* TOFF inc: -4
1352:     LD  4,-4(1)	Pop left into ac1 
1353:    AND  3,4,3	Op AND 
* TOFF inc: -3
1354:     LD  4,-3(1)	Pop left into ac1 
1355:     OR  3,4,3	Op OR 
1356:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1357:    LDA  3,-1(0)	Load address of base of array board
1358:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1359:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
1360:     LD  4,-4(1)	Pop left into ac1 
1361:    SUB  3,4,3	compute location from index 
1362:     LD  3,0(3)	Load array element 
1363:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1364:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
1365:     LD  4,-4(1)	Pop left into ac1 
1366:    TEQ  3,4,3	Op = 
1367:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1368:    LDA  3,-1(0)	Load address of base of array board
1369:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
1370:    LDC  3,7(6)	Load integer constant 
* TOFF inc: -5
1371:     LD  4,-5(1)	Pop left into ac1 
1372:    SUB  3,4,3	compute location from index 
1373:     LD  3,0(3)	Load array element 
1374:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
1375:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -5
1376:     LD  4,-5(1)	Pop left into ac1 
1377:    TEQ  3,4,3	Op = 
* TOFF inc: -4
1378:     LD  4,-4(1)	Pop left into ac1 
1379:    AND  3,4,3	Op AND 
* TOFF inc: -3
1380:     LD  4,-3(1)	Pop left into ac1 
1381:     OR  3,4,3	Op OR 
1382:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1383:    LDA  3,-1(0)	Load address of base of array board
1384:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1385:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -4
1386:     LD  4,-4(1)	Pop left into ac1 
1387:    SUB  3,4,3	compute location from index 
1388:     LD  3,0(3)	Load array element 
1389:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1390:    LDC  3,1(6)	Load integer constant 
1391:    NEG  3,3,3	Op unary - 
* TOFF inc: -4
1392:     LD  4,-4(1)	Pop left into ac1 
1393:    TEQ  3,4,3	Op = 
* TOFF inc: -3
1394:     LD  4,-3(1)	Pop left into ac1 
1395:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
1397:    LDC  3,4(6)	Load integer constant 
1398:     ST  3,-3(1)	Push index 
* TOFF dec: -4
1399:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
1400:     LD  4,-3(1)	Pop index 
1401:    LDA  5,-1(0)	Load address of base of array board
1402:    SUB  5,5,4	Compute offset of value 
1403:     ST  3,0(5)	Store variable board
* EXPRESSION
1404:    LDC  3,1(6)	Load Boolean constant 
1405:     ST  3,-2(1)	Store variable blocked
* TOFF set: -3
* END COMPOUND
1396:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* TOFF set: -3
* Compound Body
* IF
1407:    LDA  3,-1(0)	Load address of base of array board
1408:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1409:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -3
1410:     LD  4,-3(1)	Pop left into ac1 
1411:    SUB  3,4,3	compute location from index 
1412:     LD  3,0(3)	Load array element 
1413:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1414:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -3
1415:     LD  4,-3(1)	Pop left into ac1 
1416:    TEQ  3,4,3	Op = 
1417:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1418:    LDA  3,-1(0)	Load address of base of array board
1419:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1420:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -4
1421:     LD  4,-4(1)	Pop left into ac1 
1422:    SUB  3,4,3	compute location from index 
1423:     LD  3,0(3)	Load array element 
1424:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1425:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
1426:     LD  4,-4(1)	Pop left into ac1 
1427:    TEQ  3,4,3	Op = 
* TOFF inc: -3
1428:     LD  4,-3(1)	Pop left into ac1 
1429:    AND  3,4,3	Op AND 
1430:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1431:    LDA  3,-1(0)	Load address of base of array board
1432:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1433:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -4
1434:     LD  4,-4(1)	Pop left into ac1 
1435:    SUB  3,4,3	compute location from index 
1436:     LD  3,0(3)	Load array element 
1437:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1438:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
1439:     LD  4,-4(1)	Pop left into ac1 
1440:    TEQ  3,4,3	Op = 
1441:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1442:    LDA  3,-1(0)	Load address of base of array board
1443:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
1444:    LDC  3,6(6)	Load integer constant 
* TOFF inc: -5
1445:     LD  4,-5(1)	Pop left into ac1 
1446:    SUB  3,4,3	compute location from index 
1447:     LD  3,0(3)	Load array element 
1448:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
1449:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -5
1450:     LD  4,-5(1)	Pop left into ac1 
1451:    TEQ  3,4,3	Op = 
* TOFF inc: -4
1452:     LD  4,-4(1)	Pop left into ac1 
1453:    AND  3,4,3	Op AND 
* TOFF inc: -3
1454:     LD  4,-3(1)	Pop left into ac1 
1455:     OR  3,4,3	Op OR 
1456:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1457:    LDA  3,-1(0)	Load address of base of array board
1458:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1459:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -4
1460:     LD  4,-4(1)	Pop left into ac1 
1461:    SUB  3,4,3	compute location from index 
1462:     LD  3,0(3)	Load array element 
1463:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1464:    LDC  3,1(6)	Load integer constant 
1465:    NEG  3,3,3	Op unary - 
* TOFF inc: -4
1466:     LD  4,-4(1)	Pop left into ac1 
1467:    TEQ  3,4,3	Op = 
* TOFF inc: -3
1468:     LD  4,-3(1)	Pop left into ac1 
1469:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
1471:    LDC  3,3(6)	Load integer constant 
1472:     ST  3,-3(1)	Push index 
* TOFF dec: -4
1473:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
1474:     LD  4,-3(1)	Pop index 
1475:    LDA  5,-1(0)	Load address of base of array board
1476:    SUB  5,5,4	Compute offset of value 
1477:     ST  3,0(5)	Store variable board
* EXPRESSION
1478:    LDC  3,1(6)	Load Boolean constant 
1479:     ST  3,-2(1)	Store variable blocked
* TOFF set: -3
* END COMPOUND
1470:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* TOFF set: -3
* Compound Body
* IF
1481:    LDA  3,-1(0)	Load address of base of array board
1482:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1483:    LDC  3,6(6)	Load integer constant 
* TOFF inc: -3
1484:     LD  4,-3(1)	Pop left into ac1 
1485:    SUB  3,4,3	compute location from index 
1486:     LD  3,0(3)	Load array element 
1487:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1488:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -3
1489:     LD  4,-3(1)	Pop left into ac1 
1490:    TEQ  3,4,3	Op = 
1491:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1492:    LDA  3,-1(0)	Load address of base of array board
1493:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1494:    LDC  3,7(6)	Load integer constant 
* TOFF inc: -4
1495:     LD  4,-4(1)	Pop left into ac1 
1496:    SUB  3,4,3	compute location from index 
1497:     LD  3,0(3)	Load array element 
1498:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1499:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
1500:     LD  4,-4(1)	Pop left into ac1 
1501:    TEQ  3,4,3	Op = 
* TOFF inc: -3
1502:     LD  4,-3(1)	Pop left into ac1 
1503:    AND  3,4,3	Op AND 
1504:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1505:    LDA  3,-1(0)	Load address of base of array board
1506:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1507:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -4
1508:     LD  4,-4(1)	Pop left into ac1 
1509:    SUB  3,4,3	compute location from index 
1510:     LD  3,0(3)	Load array element 
1511:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1512:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
1513:     LD  4,-4(1)	Pop left into ac1 
1514:    TEQ  3,4,3	Op = 
1515:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1516:    LDA  3,-1(0)	Load address of base of array board
1517:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
1518:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -5
1519:     LD  4,-5(1)	Pop left into ac1 
1520:    SUB  3,4,3	compute location from index 
1521:     LD  3,0(3)	Load array element 
1522:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
1523:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -5
1524:     LD  4,-5(1)	Pop left into ac1 
1525:    TEQ  3,4,3	Op = 
* TOFF inc: -4
1526:     LD  4,-4(1)	Pop left into ac1 
1527:    AND  3,4,3	Op AND 
* TOFF inc: -3
1528:     LD  4,-3(1)	Pop left into ac1 
1529:     OR  3,4,3	Op OR 
1530:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1531:    LDA  3,-1(0)	Load address of base of array board
1532:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1533:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -4
1534:     LD  4,-4(1)	Pop left into ac1 
1535:    SUB  3,4,3	compute location from index 
1536:     LD  3,0(3)	Load array element 
1537:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1538:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
1539:     LD  4,-4(1)	Pop left into ac1 
1540:    TEQ  3,4,3	Op = 
1541:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1542:    LDA  3,-1(0)	Load address of base of array board
1543:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
1544:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -5
1545:     LD  4,-5(1)	Pop left into ac1 
1546:    SUB  3,4,3	compute location from index 
1547:     LD  3,0(3)	Load array element 
1548:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
1549:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -5
1550:     LD  4,-5(1)	Pop left into ac1 
1551:    TEQ  3,4,3	Op = 
* TOFF inc: -4
1552:     LD  4,-4(1)	Pop left into ac1 
1553:    AND  3,4,3	Op AND 
* TOFF inc: -3
1554:     LD  4,-3(1)	Pop left into ac1 
1555:     OR  3,4,3	Op OR 
1556:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1557:    LDA  3,-1(0)	Load address of base of array board
1558:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1559:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -4
1560:     LD  4,-4(1)	Pop left into ac1 
1561:    SUB  3,4,3	compute location from index 
1562:     LD  3,0(3)	Load array element 
1563:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1564:    LDC  3,1(6)	Load integer constant 
1565:    NEG  3,3,3	Op unary - 
* TOFF inc: -4
1566:     LD  4,-4(1)	Pop left into ac1 
1567:    TEQ  3,4,3	Op = 
* TOFF inc: -3
1568:     LD  4,-3(1)	Pop left into ac1 
1569:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
1571:    LDC  3,8(6)	Load integer constant 
1572:     ST  3,-3(1)	Push index 
* TOFF dec: -4
1573:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
1574:     LD  4,-3(1)	Pop index 
1575:    LDA  5,-1(0)	Load address of base of array board
1576:    SUB  5,5,4	Compute offset of value 
1577:     ST  3,0(5)	Store variable board
* EXPRESSION
1578:    LDC  3,1(6)	Load Boolean constant 
1579:     ST  3,-2(1)	Store variable blocked
* TOFF set: -3
* END COMPOUND
1570:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* TOFF set: -3
* Compound Body
* IF
1581:    LDA  3,-1(0)	Load address of base of array board
1582:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1583:    LDC  3,6(6)	Load integer constant 
* TOFF inc: -3
1584:     LD  4,-3(1)	Pop left into ac1 
1585:    SUB  3,4,3	compute location from index 
1586:     LD  3,0(3)	Load array element 
1587:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1588:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -3
1589:     LD  4,-3(1)	Pop left into ac1 
1590:    TEQ  3,4,3	Op = 
1591:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1592:    LDA  3,-1(0)	Load address of base of array board
1593:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1594:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -4
1595:     LD  4,-4(1)	Pop left into ac1 
1596:    SUB  3,4,3	compute location from index 
1597:     LD  3,0(3)	Load array element 
1598:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1599:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
1600:     LD  4,-4(1)	Pop left into ac1 
1601:    TEQ  3,4,3	Op = 
* TOFF inc: -3
1602:     LD  4,-3(1)	Pop left into ac1 
1603:    AND  3,4,3	Op AND 
1604:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1605:    LDA  3,-1(0)	Load address of base of array board
1606:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1607:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -4
1608:     LD  4,-4(1)	Pop left into ac1 
1609:    SUB  3,4,3	compute location from index 
1610:     LD  3,0(3)	Load array element 
1611:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1612:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
1613:     LD  4,-4(1)	Pop left into ac1 
1614:    TEQ  3,4,3	Op = 
1615:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1616:    LDA  3,-1(0)	Load address of base of array board
1617:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
1618:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -5
1619:     LD  4,-5(1)	Pop left into ac1 
1620:    SUB  3,4,3	compute location from index 
1621:     LD  3,0(3)	Load array element 
1622:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
1623:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -5
1624:     LD  4,-5(1)	Pop left into ac1 
1625:    TEQ  3,4,3	Op = 
* TOFF inc: -4
1626:     LD  4,-4(1)	Pop left into ac1 
1627:    AND  3,4,3	Op AND 
* TOFF inc: -3
1628:     LD  4,-3(1)	Pop left into ac1 
1629:     OR  3,4,3	Op OR 
1630:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1631:    LDA  3,-1(0)	Load address of base of array board
1632:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1633:    LDC  3,7(6)	Load integer constant 
* TOFF inc: -4
1634:     LD  4,-4(1)	Pop left into ac1 
1635:    SUB  3,4,3	compute location from index 
1636:     LD  3,0(3)	Load array element 
1637:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1638:    LDC  3,1(6)	Load integer constant 
1639:    NEG  3,3,3	Op unary - 
* TOFF inc: -4
1640:     LD  4,-4(1)	Pop left into ac1 
1641:    TEQ  3,4,3	Op = 
* TOFF inc: -3
1642:     LD  4,-3(1)	Pop left into ac1 
1643:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
1645:    LDC  3,7(6)	Load integer constant 
1646:     ST  3,-3(1)	Push index 
* TOFF dec: -4
1647:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
1648:     LD  4,-3(1)	Pop index 
1649:    LDA  5,-1(0)	Load address of base of array board
1650:    SUB  5,5,4	Compute offset of value 
1651:     ST  3,0(5)	Store variable board
* EXPRESSION
1652:    LDC  3,1(6)	Load Boolean constant 
1653:     ST  3,-2(1)	Store variable blocked
* TOFF set: -3
* END COMPOUND
1644:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* TOFF set: -3
* Compound Body
* IF
1655:    LDA  3,-1(0)	Load address of base of array board
1656:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1657:    LDC  3,7(6)	Load integer constant 
* TOFF inc: -3
1658:     LD  4,-3(1)	Pop left into ac1 
1659:    SUB  3,4,3	compute location from index 
1660:     LD  3,0(3)	Load array element 
1661:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1662:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -3
1663:     LD  4,-3(1)	Pop left into ac1 
1664:    TEQ  3,4,3	Op = 
1665:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1666:    LDA  3,-1(0)	Load address of base of array board
1667:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1668:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -4
1669:     LD  4,-4(1)	Pop left into ac1 
1670:    SUB  3,4,3	compute location from index 
1671:     LD  3,0(3)	Load array element 
1672:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1673:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
1674:     LD  4,-4(1)	Pop left into ac1 
1675:    TEQ  3,4,3	Op = 
* TOFF inc: -3
1676:     LD  4,-3(1)	Pop left into ac1 
1677:    AND  3,4,3	Op AND 
1678:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1679:    LDA  3,-1(0)	Load address of base of array board
1680:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1681:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -4
1682:     LD  4,-4(1)	Pop left into ac1 
1683:    SUB  3,4,3	compute location from index 
1684:     LD  3,0(3)	Load array element 
1685:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1686:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
1687:     LD  4,-4(1)	Pop left into ac1 
1688:    TEQ  3,4,3	Op = 
1689:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1690:    LDA  3,-1(0)	Load address of base of array board
1691:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
1692:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -5
1693:     LD  4,-5(1)	Pop left into ac1 
1694:    SUB  3,4,3	compute location from index 
1695:     LD  3,0(3)	Load array element 
1696:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
1697:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -5
1698:     LD  4,-5(1)	Pop left into ac1 
1699:    TEQ  3,4,3	Op = 
* TOFF inc: -4
1700:     LD  4,-4(1)	Pop left into ac1 
1701:    AND  3,4,3	Op AND 
* TOFF inc: -3
1702:     LD  4,-3(1)	Pop left into ac1 
1703:     OR  3,4,3	Op OR 
1704:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1705:    LDA  3,-1(0)	Load address of base of array board
1706:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1707:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -4
1708:     LD  4,-4(1)	Pop left into ac1 
1709:    SUB  3,4,3	compute location from index 
1710:     LD  3,0(3)	Load array element 
1711:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1712:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
1713:     LD  4,-4(1)	Pop left into ac1 
1714:    TEQ  3,4,3	Op = 
1715:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1716:    LDA  3,-1(0)	Load address of base of array board
1717:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
1718:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -5
1719:     LD  4,-5(1)	Pop left into ac1 
1720:    SUB  3,4,3	compute location from index 
1721:     LD  3,0(3)	Load array element 
1722:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
1723:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -5
1724:     LD  4,-5(1)	Pop left into ac1 
1725:    TEQ  3,4,3	Op = 
* TOFF inc: -4
1726:     LD  4,-4(1)	Pop left into ac1 
1727:    AND  3,4,3	Op AND 
* TOFF inc: -3
1728:     LD  4,-3(1)	Pop left into ac1 
1729:     OR  3,4,3	Op OR 
1730:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1731:    LDA  3,-1(0)	Load address of base of array board
1732:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1733:    LDC  3,6(6)	Load integer constant 
* TOFF inc: -4
1734:     LD  4,-4(1)	Pop left into ac1 
1735:    SUB  3,4,3	compute location from index 
1736:     LD  3,0(3)	Load array element 
1737:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1738:    LDC  3,1(6)	Load integer constant 
1739:    NEG  3,3,3	Op unary - 
* TOFF inc: -4
1740:     LD  4,-4(1)	Pop left into ac1 
1741:    TEQ  3,4,3	Op = 
* TOFF inc: -3
1742:     LD  4,-3(1)	Pop left into ac1 
1743:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
1745:    LDC  3,6(6)	Load integer constant 
1746:     ST  3,-3(1)	Push index 
* TOFF dec: -4
1747:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
1748:     LD  4,-3(1)	Pop index 
1749:    LDA  5,-1(0)	Load address of base of array board
1750:    SUB  5,5,4	Compute offset of value 
1751:     ST  3,0(5)	Store variable board
* EXPRESSION
1752:    LDC  3,1(6)	Load Boolean constant 
1753:     ST  3,-2(1)	Store variable blocked
* TOFF set: -3
* END COMPOUND
1744:    JZR  3,9(7)	Jump around the THEN if false [backpatch] 
* END IF
* TOFF set: -3
* END COMPOUND
1654:    JMP  7,99(7)	Jump around the ELSE [backpatch] 
* END IF
* TOFF set: -3
* END COMPOUND
1580:    JMP  7,173(7)	Jump around the ELSE [backpatch] 
* END IF
* TOFF set: -3
* END COMPOUND
1480:    JMP  7,273(7)	Jump around the ELSE [backpatch] 
* END IF
* TOFF set: -3
* END COMPOUND
1406:    JMP  7,347(7)	Jump around the ELSE [backpatch] 
* END IF
* TOFF set: -3
* END COMPOUND
1280:    JMP  7,473(7)	Jump around the ELSE [backpatch] 
* END IF
* TOFF set: -3
* END COMPOUND
1206:    JMP  7,547(7)	Jump around the ELSE [backpatch] 
* END IF
* TOFF set: -3
* END COMPOUND
1106:    JMP  7,647(7)	Jump around the ELSE [backpatch] 
* END IF
* TOFF set: -3
* END COMPOUND
1032:    JMP  7,721(7)	Jump around the ELSE [backpatch] 
* END IF
* RETURN
1754:     LD  3,-2(1)	Load variable blocked
1755:    LDA  2,0(3)	Copy result to return register 
1756:     LD  3,-1(1)	Load return address 
1757:     LD  1,0(1)	Adjust fp 
1758:    JMP  7,0(3)	Return 
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
1759:    LDC  2,0(6)	Set return value to 0 
1760:     LD  3,-1(1)	Load return address 
1761:     LD  1,0(1)	Adjust fp 
1762:    JMP  7,0(3)	Return 
* END FUNCTION blockplayer
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION placey
* TOFF set: -2
1763:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -2
* Compound Body
* IF
* CALL win
1764:     ST  1,-2(1)	Store fp in ghost frame for win
* TOFF dec: -3
* TOFF dec: -4
* Param end win
1765:    LDA  1,-2(1)	Ghost frame becomes new active frame 
1766:    LDA  3,1(7)	Return address in ac 
1767:    JMP  7,-1680(7)	CALL win
1768:    LDA  3,0(2)	Save the result in ac 
* Call end win
* TOFF set: -2
1769:    LDC  4,1(6)	Load 1 
1770:    XOR  3,3,4	Op XOR to get logical not 
* THEN
* COMPOUND
* TOFF set: -2
* Compound Body
* IF
* CALL blockplayer
1772:     ST  1,-2(1)	Store fp in ghost frame for blockplayer
* TOFF dec: -3
* TOFF dec: -4
* Param end blockplayer
1773:    LDA  1,-2(1)	Ghost frame becomes new active frame 
1774:    LDA  3,1(7)	Return address in ac 
1775:    JMP  7,-846(7)	CALL blockplayer
1776:    LDA  3,0(2)	Save the result in ac 
* Call end blockplayer
* TOFF set: -2
1777:    LDC  4,1(6)	Load 1 
1778:    XOR  3,3,4	Op XOR to get logical not 
* THEN
* COMPOUND
* TOFF set: -2
* Compound Body
* EXPRESSION
* CALL move
1780:     ST  1,-2(1)	Store fp in ghost frame for move
* TOFF dec: -3
* TOFF dec: -4
* Param end move
1781:    LDA  1,-2(1)	Ghost frame becomes new active frame 
1782:    LDA  3,1(7)	Return address in ac 
1783:    JMP  7,-1745(7)	CALL move
1784:    LDA  3,0(2)	Save the result in ac 
* Call end move
* TOFF set: -2
* TOFF set: -2
* END COMPOUND
1779:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* END IF
* TOFF set: -2
* END COMPOUND
1771:    JZR  3,13(7)	Jump around the THEN if false [backpatch] 
* END IF
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
1785:    LDC  2,0(6)	Set return value to 0 
1786:     LD  3,-1(1)	Load return address 
1787:     LD  1,0(1)	Adjust fp 
1788:    JMP  7,0(3)	Return 
* END FUNCTION placey
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION xingrid
* TOFF set: -3
1789:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -4
* Compound Body
* EXPRESSION
1790:    LDC  3,0(6)	Load Boolean constant 
1791:     ST  3,-3(1)	Store variable retval
* IF
1792:     LD  3,-2(1)	Load variable x
1793:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1794:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -4
1795:     LD  4,-4(1)	Pop left into ac1 
1796:    TGE  3,4,3	Op >= 
1797:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1798:     LD  3,-2(1)	Load variable x
1799:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
1800:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -5
1801:     LD  4,-5(1)	Pop left into ac1 
1802:    TLE  3,4,3	Op <= 
* TOFF inc: -4
1803:     LD  4,-4(1)	Pop left into ac1 
1804:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* TOFF set: -4
* Compound Body
* IF
1806:    LDA  3,-1(0)	Load address of base of array board
1807:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1808:     LD  3,-2(1)	Load variable x
* TOFF inc: -4
1809:     LD  4,-4(1)	Pop left into ac1 
1810:    SUB  3,4,3	compute location from index 
1811:     LD  3,0(3)	Load array element 
1812:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1813:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
1814:     LD  4,-4(1)	Pop left into ac1 
1815:    TNE  3,4,3	Op >< 
1816:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1817:    LDA  3,-1(0)	Load address of base of array board
1818:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
1819:     LD  3,-2(1)	Load variable x
* TOFF inc: -5
1820:     LD  4,-5(1)	Pop left into ac1 
1821:    SUB  3,4,3	compute location from index 
1822:     LD  3,0(3)	Load array element 
1823:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
1824:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -5
1825:     LD  4,-5(1)	Pop left into ac1 
1826:    TNE  3,4,3	Op >< 
* TOFF inc: -4
1827:     LD  4,-4(1)	Pop left into ac1 
1828:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* TOFF set: -4
* Compound Body
* EXPRESSION
1830:     LD  3,-2(1)	Load variable x
1831:     ST  3,-4(1)	Push index 
* TOFF dec: -5
1832:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
1833:     LD  4,-4(1)	Pop index 
1834:    LDA  5,-1(0)	Load address of base of array board
1835:    SUB  5,5,4	Compute offset of value 
1836:     ST  3,0(5)	Store variable board
* EXPRESSION
1837:    LDC  3,1(6)	Load Boolean constant 
1838:     ST  3,-3(1)	Store variable retval
* TOFF set: -4
* END COMPOUND
1829:    JZR  3,9(7)	Jump around the THEN if false [backpatch] 
* END IF
* TOFF set: -4
* END COMPOUND
1805:    JZR  3,33(7)	Jump around the THEN if false [backpatch] 
* END IF
* RETURN
1839:     LD  3,-3(1)	Load variable retval
1840:    LDA  2,0(3)	Copy result to return register 
1841:     LD  3,-1(1)	Load return address 
1842:     LD  1,0(1)	Adjust fp 
1843:    JMP  7,0(3)	Return 
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
1844:    LDC  2,0(6)	Set return value to 0 
1845:     LD  3,-1(1)	Load return address 
1846:     LD  1,0(1)	Adjust fp 
1847:    JMP  7,0(3)	Return 
* END FUNCTION xingrid
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION printboard
* TOFF set: -2
1848:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
1849:    LDC  3,0(6)	Load integer constant 
1850:     ST  3,-2(1)	Store variable i
* WHILE
1851:     LD  3,-2(1)	Load variable i
1852:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1853:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -3
1854:     LD  4,-3(1)	Pop left into ac1 
1855:    TLT  3,4,3	Op < 
1856:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -3
* Compound Body
* IF
1858:    LDA  3,-1(0)	Load address of base of array board
1859:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1860:     LD  3,-2(1)	Load variable i
* TOFF inc: -3
1861:     LD  4,-3(1)	Pop left into ac1 
1862:    SUB  3,4,3	compute location from index 
1863:     LD  3,0(3)	Load array element 
1864:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1865:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -3
1866:     LD  4,-3(1)	Pop left into ac1 
1867:    TEQ  3,4,3	Op = 
* THEN
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
* CALL outputb
1869:     ST  1,-3(1)	Store fp in ghost frame for outputb
* TOFF dec: -4
* TOFF dec: -5
* Param 1
1870:    LDC  3,1(6)	Load Boolean constant 
1871:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end outputb
1872:    LDA  1,-3(1)	Ghost frame becomes new active frame 
1873:    LDA  3,1(7)	Return address in ac 
1874:    JMP  7,-1858(7)	CALL outputb
1875:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -3
* TOFF set: -3
* END COMPOUND
1868:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
1877:    LDA  3,-1(0)	Load address of base of array board
1878:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1879:     LD  3,-2(1)	Load variable i
* TOFF inc: -3
1880:     LD  4,-3(1)	Pop left into ac1 
1881:    SUB  3,4,3	compute location from index 
1882:     LD  3,0(3)	Load array element 
1883:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1884:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
1885:     LD  4,-3(1)	Pop left into ac1 
1886:    TEQ  3,4,3	Op = 
* THEN
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
* CALL outputb
1888:     ST  1,-3(1)	Store fp in ghost frame for outputb
* TOFF dec: -4
* TOFF dec: -5
* Param 1
1889:    LDC  3,0(6)	Load Boolean constant 
1890:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end outputb
1891:    LDA  1,-3(1)	Ghost frame becomes new active frame 
1892:    LDA  3,1(7)	Return address in ac 
1893:    JMP  7,-1877(7)	CALL outputb
1894:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -3
* TOFF set: -3
* END COMPOUND
1887:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
* CALL output
1896:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
1897:     LD  3,-2(1)	Load variable i
1898:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
1899:    LDA  1,-3(1)	Ghost frame becomes new active frame 
1900:    LDA  3,1(7)	Return address in ac 
1901:    JMP  7,-1896(7)	CALL output
1902:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* TOFF set: -3
* END COMPOUND
1895:    JMP  7,7(7)	Jump around the ELSE [backpatch] 
* END IF
1876:    JMP  7,26(7)	Jump around the ELSE [backpatch] 
* END IF
* IF
1903:     LD  3,-2(1)	Load variable i
1904:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1905:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
1906:     LD  4,-3(1)	Pop left into ac1 
1907:    TEQ  3,4,3	Op = 
1908:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1909:     LD  3,-2(1)	Load variable i
1910:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1911:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -4
1912:     LD  4,-4(1)	Pop left into ac1 
1913:    TEQ  3,4,3	Op = 
* TOFF inc: -3
1914:     LD  4,-3(1)	Pop left into ac1 
1915:     OR  3,4,3	Op OR 
1916:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1917:     LD  3,-2(1)	Load variable i
1918:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1919:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -4
1920:     LD  4,-4(1)	Pop left into ac1 
1921:    TEQ  3,4,3	Op = 
* TOFF inc: -3
1922:     LD  4,-3(1)	Pop left into ac1 
1923:     OR  3,4,3	Op OR 
* THEN
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
* CALL outnl
1925:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
1926:    LDA  1,-3(1)	Ghost frame becomes new active frame 
1927:    LDA  3,1(7)	Return address in ac 
1928:    JMP  7,-1895(7)	CALL outnl
1929:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* TOFF set: -3
* END COMPOUND
1924:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* END IF
* EXPRESSION
1930:     LD  3,-2(1)	load lhs variable i
1931:    LDA  3,1(3)	increment value of i
1932:     ST  3,-2(1)	Store variable i
* TOFF set: -3
* END COMPOUND
1933:    JMP  7,-83(7)	go to beginning of loop 
1857:    JMP  7,76(7)	Jump past loop [backpatch] 
* END WHILE
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
1934:    LDC  2,0(6)	Set return value to 0 
1935:     LD  3,-1(1)	Load return address 
1936:     LD  1,0(1)	Adjust fp 
1937:    JMP  7,0(3)	Return 
* END FUNCTION printboard
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION finished
* TOFF set: -2
1938:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
1939:    LDC  3,0(6)	Load integer constant 
1940:     ST  3,-2(1)	Store variable i
* IF
1941:    LDA  3,-1(0)	Load address of base of array board
1942:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1943:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -3
1944:     LD  4,-3(1)	Pop left into ac1 
1945:    SUB  3,4,3	compute location from index 
1946:     LD  3,0(3)	Load array element 
1947:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1948:    LDC  3,1(6)	Load integer constant 
1949:    NEG  3,3,3	Op unary - 
* TOFF inc: -3
1950:     LD  4,-3(1)	Pop left into ac1 
1951:    TNE  3,4,3	Op >< 
1952:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
1953:    LDA  3,-1(0)	Load address of base of array board
1954:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1955:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -4
1956:     LD  4,-4(1)	Pop left into ac1 
1957:    SUB  3,4,3	compute location from index 
1958:     LD  3,0(3)	Load array element 
1959:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1960:    LDA  3,-1(0)	Load address of base of array board
1961:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
1962:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -5
1963:     LD  4,-5(1)	Pop left into ac1 
1964:    SUB  3,4,3	compute location from index 
1965:     LD  3,0(3)	Load array element 
* TOFF inc: -4
1966:     LD  4,-4(1)	Pop left into ac1 
1967:    TEQ  3,4,3	Op = 
1968:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1969:    LDA  3,-1(0)	Load address of base of array board
1970:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
1971:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -5
1972:     LD  4,-5(1)	Pop left into ac1 
1973:    SUB  3,4,3	compute location from index 
1974:     LD  3,0(3)	Load array element 
1975:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
1976:    LDA  3,-1(0)	Load address of base of array board
1977:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
1978:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -6
1979:     LD  4,-6(1)	Pop left into ac1 
1980:    SUB  3,4,3	compute location from index 
1981:     LD  3,0(3)	Load array element 
* TOFF inc: -5
1982:     LD  4,-5(1)	Pop left into ac1 
1983:    TEQ  3,4,3	Op = 
* TOFF inc: -4
1984:     LD  4,-4(1)	Pop left into ac1 
1985:    AND  3,4,3	Op AND 
1986:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
1987:    LDA  3,-1(0)	Load address of base of array board
1988:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
1989:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -5
1990:     LD  4,-5(1)	Pop left into ac1 
1991:    SUB  3,4,3	compute location from index 
1992:     LD  3,0(3)	Load array element 
1993:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
1994:    LDA  3,-1(0)	Load address of base of array board
1995:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
1996:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -6
1997:     LD  4,-6(1)	Pop left into ac1 
1998:    SUB  3,4,3	compute location from index 
1999:     LD  3,0(3)	Load array element 
* TOFF inc: -5
2000:     LD  4,-5(1)	Pop left into ac1 
2001:    TEQ  3,4,3	Op = 
2002:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
2003:    LDA  3,-1(0)	Load address of base of array board
2004:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
2005:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -6
2006:     LD  4,-6(1)	Pop left into ac1 
2007:    SUB  3,4,3	compute location from index 
2008:     LD  3,0(3)	Load array element 
2009:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
2010:    LDA  3,-1(0)	Load address of base of array board
2011:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
2012:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -7
2013:     LD  4,-7(1)	Pop left into ac1 
2014:    SUB  3,4,3	compute location from index 
2015:     LD  3,0(3)	Load array element 
* TOFF inc: -6
2016:     LD  4,-6(1)	Pop left into ac1 
2017:    TEQ  3,4,3	Op = 
* TOFF inc: -5
2018:     LD  4,-5(1)	Pop left into ac1 
2019:    AND  3,4,3	Op AND 
* TOFF inc: -4
2020:     LD  4,-4(1)	Pop left into ac1 
2021:     OR  3,4,3	Op OR 
2022:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
2023:    LDA  3,-1(0)	Load address of base of array board
2024:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
2025:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -5
2026:     LD  4,-5(1)	Pop left into ac1 
2027:    SUB  3,4,3	compute location from index 
2028:     LD  3,0(3)	Load array element 
2029:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
2030:    LDA  3,-1(0)	Load address of base of array board
2031:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
2032:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -6
2033:     LD  4,-6(1)	Pop left into ac1 
2034:    SUB  3,4,3	compute location from index 
2035:     LD  3,0(3)	Load array element 
* TOFF inc: -5
2036:     LD  4,-5(1)	Pop left into ac1 
2037:    TEQ  3,4,3	Op = 
2038:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
2039:    LDA  3,-1(0)	Load address of base of array board
2040:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
2041:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -6
2042:     LD  4,-6(1)	Pop left into ac1 
2043:    SUB  3,4,3	compute location from index 
2044:     LD  3,0(3)	Load array element 
2045:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
2046:    LDA  3,-1(0)	Load address of base of array board
2047:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
2048:    LDC  3,6(6)	Load integer constant 
* TOFF inc: -7
2049:     LD  4,-7(1)	Pop left into ac1 
2050:    SUB  3,4,3	compute location from index 
2051:     LD  3,0(3)	Load array element 
* TOFF inc: -6
2052:     LD  4,-6(1)	Pop left into ac1 
2053:    TEQ  3,4,3	Op = 
* TOFF inc: -5
2054:     LD  4,-5(1)	Pop left into ac1 
2055:    AND  3,4,3	Op AND 
* TOFF inc: -4
2056:     LD  4,-4(1)	Pop left into ac1 
2057:     OR  3,4,3	Op OR 
* TOFF inc: -3
2058:     LD  4,-3(1)	Pop left into ac1 
2059:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* TOFF set: -3
* Compound Body
* RETURN
2061:    LDC  3,1(6)	Load Boolean constant 
2062:    LDA  2,0(3)	Copy result to return register 
2063:     LD  3,-1(1)	Load return address 
2064:     LD  1,0(1)	Adjust fp 
2065:    JMP  7,0(3)	Return 
* TOFF set: -3
* END COMPOUND
2060:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* END IF
* IF
2066:    LDA  3,-1(0)	Load address of base of array board
2067:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
2068:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -3
2069:     LD  4,-3(1)	Pop left into ac1 
2070:    SUB  3,4,3	compute location from index 
2071:     LD  3,0(3)	Load array element 
2072:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
2073:    LDC  3,1(6)	Load integer constant 
2074:    NEG  3,3,3	Op unary - 
* TOFF inc: -3
2075:     LD  4,-3(1)	Pop left into ac1 
2076:    TNE  3,4,3	Op >< 
2077:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
2078:    LDA  3,-1(0)	Load address of base of array board
2079:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
2080:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
2081:     LD  4,-4(1)	Pop left into ac1 
2082:    SUB  3,4,3	compute location from index 
2083:     LD  3,0(3)	Load array element 
2084:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
2085:    LDA  3,-1(0)	Load address of base of array board
2086:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
2087:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -5
2088:     LD  4,-5(1)	Pop left into ac1 
2089:    SUB  3,4,3	compute location from index 
2090:     LD  3,0(3)	Load array element 
* TOFF inc: -4
2091:     LD  4,-4(1)	Pop left into ac1 
2092:    TEQ  3,4,3	Op = 
2093:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
2094:    LDA  3,-1(0)	Load address of base of array board
2095:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
2096:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -5
2097:     LD  4,-5(1)	Pop left into ac1 
2098:    SUB  3,4,3	compute location from index 
2099:     LD  3,0(3)	Load array element 
2100:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
2101:    LDA  3,-1(0)	Load address of base of array board
2102:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
2103:    LDC  3,7(6)	Load integer constant 
* TOFF inc: -6
2104:     LD  4,-6(1)	Pop left into ac1 
2105:    SUB  3,4,3	compute location from index 
2106:     LD  3,0(3)	Load array element 
* TOFF inc: -5
2107:     LD  4,-5(1)	Pop left into ac1 
2108:    TEQ  3,4,3	Op = 
* TOFF inc: -4
2109:     LD  4,-4(1)	Pop left into ac1 
2110:    AND  3,4,3	Op AND 
* TOFF inc: -3
2111:     LD  4,-3(1)	Pop left into ac1 
2112:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* TOFF set: -3
* Compound Body
* RETURN
2114:    LDC  3,1(6)	Load Boolean constant 
2115:    LDA  2,0(3)	Copy result to return register 
2116:     LD  3,-1(1)	Load return address 
2117:     LD  1,0(1)	Adjust fp 
2118:    JMP  7,0(3)	Return 
* TOFF set: -3
* END COMPOUND
2113:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* END IF
* IF
2119:    LDA  3,-1(0)	Load address of base of array board
2120:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
2121:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
2122:     LD  4,-3(1)	Pop left into ac1 
2123:    SUB  3,4,3	compute location from index 
2124:     LD  3,0(3)	Load array element 
2125:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
2126:    LDC  3,1(6)	Load integer constant 
2127:    NEG  3,3,3	Op unary - 
* TOFF inc: -3
2128:     LD  4,-3(1)	Pop left into ac1 
2129:    TNE  3,4,3	Op >< 
2130:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
2131:    LDA  3,-1(0)	Load address of base of array board
2132:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
2133:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -4
2134:     LD  4,-4(1)	Pop left into ac1 
2135:    SUB  3,4,3	compute location from index 
2136:     LD  3,0(3)	Load array element 
2137:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
2138:    LDA  3,-1(0)	Load address of base of array board
2139:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
2140:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -5
2141:     LD  4,-5(1)	Pop left into ac1 
2142:    SUB  3,4,3	compute location from index 
2143:     LD  3,0(3)	Load array element 
* TOFF inc: -4
2144:     LD  4,-4(1)	Pop left into ac1 
2145:    TEQ  3,4,3	Op = 
2146:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
2147:    LDA  3,-1(0)	Load address of base of array board
2148:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
2149:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -5
2150:     LD  4,-5(1)	Pop left into ac1 
2151:    SUB  3,4,3	compute location from index 
2152:     LD  3,0(3)	Load array element 
2153:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
2154:    LDA  3,-1(0)	Load address of base of array board
2155:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
2156:    LDC  3,6(6)	Load integer constant 
* TOFF inc: -6
2157:     LD  4,-6(1)	Pop left into ac1 
2158:    SUB  3,4,3	compute location from index 
2159:     LD  3,0(3)	Load array element 
* TOFF inc: -5
2160:     LD  4,-5(1)	Pop left into ac1 
2161:    TEQ  3,4,3	Op = 
* TOFF inc: -4
2162:     LD  4,-4(1)	Pop left into ac1 
2163:    AND  3,4,3	Op AND 
2164:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
2165:    LDA  3,-1(0)	Load address of base of array board
2166:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
2167:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -5
2168:     LD  4,-5(1)	Pop left into ac1 
2169:    SUB  3,4,3	compute location from index 
2170:     LD  3,0(3)	Load array element 
2171:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
2172:    LDA  3,-1(0)	Load address of base of array board
2173:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
2174:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -6
2175:     LD  4,-6(1)	Pop left into ac1 
2176:    SUB  3,4,3	compute location from index 
2177:     LD  3,0(3)	Load array element 
* TOFF inc: -5
2178:     LD  4,-5(1)	Pop left into ac1 
2179:    TEQ  3,4,3	Op = 
2180:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
2181:    LDA  3,-1(0)	Load address of base of array board
2182:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
2183:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -6
2184:     LD  4,-6(1)	Pop left into ac1 
2185:    SUB  3,4,3	compute location from index 
2186:     LD  3,0(3)	Load array element 
2187:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
2188:    LDA  3,-1(0)	Load address of base of array board
2189:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
2190:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -7
2191:     LD  4,-7(1)	Pop left into ac1 
2192:    SUB  3,4,3	compute location from index 
2193:     LD  3,0(3)	Load array element 
* TOFF inc: -6
2194:     LD  4,-6(1)	Pop left into ac1 
2195:    TEQ  3,4,3	Op = 
* TOFF inc: -5
2196:     LD  4,-5(1)	Pop left into ac1 
2197:    AND  3,4,3	Op AND 
* TOFF inc: -4
2198:     LD  4,-4(1)	Pop left into ac1 
2199:     OR  3,4,3	Op OR 
* TOFF inc: -3
2200:     LD  4,-3(1)	Pop left into ac1 
2201:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* TOFF set: -3
* Compound Body
* RETURN
2203:    LDC  3,1(6)	Load Boolean constant 
2204:    LDA  2,0(3)	Copy result to return register 
2205:     LD  3,-1(1)	Load return address 
2206:     LD  1,0(1)	Adjust fp 
2207:    JMP  7,0(3)	Return 
* TOFF set: -3
* END COMPOUND
2202:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* END IF
* IF
2208:    LDA  3,-1(0)	Load address of base of array board
2209:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
2210:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -3
2211:     LD  4,-3(1)	Pop left into ac1 
2212:    SUB  3,4,3	compute location from index 
2213:     LD  3,0(3)	Load array element 
2214:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
2215:    LDC  3,1(6)	Load integer constant 
2216:    NEG  3,3,3	Op unary - 
* TOFF inc: -3
2217:     LD  4,-3(1)	Pop left into ac1 
2218:    TNE  3,4,3	Op >< 
2219:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
2220:    LDA  3,-1(0)	Load address of base of array board
2221:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
2222:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -4
2223:     LD  4,-4(1)	Pop left into ac1 
2224:    SUB  3,4,3	compute location from index 
2225:     LD  3,0(3)	Load array element 
2226:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
2227:    LDA  3,-1(0)	Load address of base of array board
2228:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
2229:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -5
2230:     LD  4,-5(1)	Pop left into ac1 
2231:    SUB  3,4,3	compute location from index 
2232:     LD  3,0(3)	Load array element 
* TOFF inc: -4
2233:     LD  4,-4(1)	Pop left into ac1 
2234:    TEQ  3,4,3	Op = 
2235:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
2236:    LDA  3,-1(0)	Load address of base of array board
2237:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
2238:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -5
2239:     LD  4,-5(1)	Pop left into ac1 
2240:    SUB  3,4,3	compute location from index 
2241:     LD  3,0(3)	Load array element 
2242:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
2243:    LDA  3,-1(0)	Load address of base of array board
2244:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
2245:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -6
2246:     LD  4,-6(1)	Pop left into ac1 
2247:    SUB  3,4,3	compute location from index 
2248:     LD  3,0(3)	Load array element 
* TOFF inc: -5
2249:     LD  4,-5(1)	Pop left into ac1 
2250:    TEQ  3,4,3	Op = 
* TOFF inc: -4
2251:     LD  4,-4(1)	Pop left into ac1 
2252:    AND  3,4,3	Op AND 
* TOFF inc: -3
2253:     LD  4,-3(1)	Pop left into ac1 
2254:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* TOFF set: -3
* Compound Body
* RETURN
2256:    LDC  3,1(6)	Load Boolean constant 
2257:    LDA  2,0(3)	Copy result to return register 
2258:     LD  3,-1(1)	Load return address 
2259:     LD  1,0(1)	Adjust fp 
2260:    JMP  7,0(3)	Return 
* TOFF set: -3
* END COMPOUND
2255:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* END IF
* IF
2261:    LDA  3,-1(0)	Load address of base of array board
2262:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
2263:    LDC  3,6(6)	Load integer constant 
* TOFF inc: -3
2264:     LD  4,-3(1)	Pop left into ac1 
2265:    SUB  3,4,3	compute location from index 
2266:     LD  3,0(3)	Load array element 
2267:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
2268:    LDC  3,1(6)	Load integer constant 
2269:    NEG  3,3,3	Op unary - 
* TOFF inc: -3
2270:     LD  4,-3(1)	Pop left into ac1 
2271:    TNE  3,4,3	Op >< 
2272:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
2273:    LDA  3,-1(0)	Load address of base of array board
2274:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
2275:    LDC  3,6(6)	Load integer constant 
* TOFF inc: -4
2276:     LD  4,-4(1)	Pop left into ac1 
2277:    SUB  3,4,3	compute location from index 
2278:     LD  3,0(3)	Load array element 
2279:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
2280:    LDA  3,-1(0)	Load address of base of array board
2281:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
2282:    LDC  3,7(6)	Load integer constant 
* TOFF inc: -5
2283:     LD  4,-5(1)	Pop left into ac1 
2284:    SUB  3,4,3	compute location from index 
2285:     LD  3,0(3)	Load array element 
* TOFF inc: -4
2286:     LD  4,-4(1)	Pop left into ac1 
2287:    TEQ  3,4,3	Op = 
2288:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
2289:    LDA  3,-1(0)	Load address of base of array board
2290:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
2291:    LDC  3,6(6)	Load integer constant 
* TOFF inc: -5
2292:     LD  4,-5(1)	Pop left into ac1 
2293:    SUB  3,4,3	compute location from index 
2294:     LD  3,0(3)	Load array element 
2295:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
2296:    LDA  3,-1(0)	Load address of base of array board
2297:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
2298:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -6
2299:     LD  4,-6(1)	Pop left into ac1 
2300:    SUB  3,4,3	compute location from index 
2301:     LD  3,0(3)	Load array element 
* TOFF inc: -5
2302:     LD  4,-5(1)	Pop left into ac1 
2303:    TEQ  3,4,3	Op = 
* TOFF inc: -4
2304:     LD  4,-4(1)	Pop left into ac1 
2305:    AND  3,4,3	Op AND 
* TOFF inc: -3
2306:     LD  4,-3(1)	Pop left into ac1 
2307:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* TOFF set: -3
* Compound Body
* RETURN
2309:    LDC  3,1(6)	Load Boolean constant 
2310:    LDA  2,0(3)	Copy result to return register 
2311:     LD  3,-1(1)	Load return address 
2312:     LD  1,0(1)	Adjust fp 
2313:    JMP  7,0(3)	Return 
* TOFF set: -3
* END COMPOUND
2308:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* END IF
* WHILE
2314:    LDA  3,-1(0)	Load address of base of array board
2315:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
2316:     LD  3,-2(1)	Load variable i
* TOFF inc: -3
2317:     LD  4,-3(1)	Pop left into ac1 
2318:    SUB  3,4,3	compute location from index 
2319:     LD  3,0(3)	Load array element 
2320:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
2321:    LDC  3,1(6)	Load integer constant 
2322:    NEG  3,3,3	Op unary - 
* TOFF inc: -3
2323:     LD  4,-3(1)	Pop left into ac1 
2324:    TNE  3,4,3	Op >< 
2325:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
2326:     LD  3,-2(1)	Load variable i
2327:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
2328:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -4
2329:     LD  4,-4(1)	Pop left into ac1 
2330:    TLT  3,4,3	Op < 
* TOFF inc: -3
2331:     LD  4,-3(1)	Pop left into ac1 
2332:    AND  3,4,3	Op AND 
2333:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
2335:     LD  3,-2(1)	load lhs variable i
2336:    LDA  3,1(3)	increment value of i
2337:     ST  3,-2(1)	Store variable i
* TOFF set: -3
* END COMPOUND
2338:    JMP  7,-25(7)	go to beginning of loop 
2334:    JMP  7,4(7)	Jump past loop [backpatch] 
* END WHILE
* IF
2339:     LD  3,-2(1)	Load variable i
2340:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
2341:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -3
2342:     LD  4,-3(1)	Pop left into ac1 
2343:    TEQ  3,4,3	Op = 
* THEN
* COMPOUND
* TOFF set: -3
* Compound Body
* RETURN
2345:    LDC  3,1(6)	Load Boolean constant 
2346:    LDA  2,0(3)	Copy result to return register 
2347:     LD  3,-1(1)	Load return address 
2348:     LD  1,0(1)	Adjust fp 
2349:    JMP  7,0(3)	Return 
* TOFF set: -3
* END COMPOUND
2344:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* TOFF set: -3
* Compound Body
* RETURN
2351:    LDC  3,0(6)	Load Boolean constant 
2352:    LDA  2,0(3)	Copy result to return register 
2353:     LD  3,-1(1)	Load return address 
2354:     LD  1,0(1)	Adjust fp 
2355:    JMP  7,0(3)	Return 
* TOFF set: -3
* END COMPOUND
2350:    JMP  7,5(7)	Jump around the ELSE [backpatch] 
* END IF
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
2356:    LDC  2,0(6)	Set return value to 0 
2357:     LD  3,-1(1)	Load return address 
2358:     LD  1,0(1)	Adjust fp 
2359:    JMP  7,0(3)	Return 
* END FUNCTION finished
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION playgame
* TOFF set: -2
2360:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
2361:    LDC  3,9(6)	Load integer constant 
2362:     ST  3,-2(1)	Store variable x
* EXPRESSION
* CALL outnl
2363:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
2364:    LDA  1,-3(1)	Ghost frame becomes new active frame 
2365:    LDA  3,1(7)	Return address in ac 
2366:    JMP  7,-2333(7)	CALL outnl
2367:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* EXPRESSION
* CALL printboard
2368:     ST  1,-3(1)	Store fp in ghost frame for printboard
* TOFF dec: -4
* TOFF dec: -5
* Param end printboard
2369:    LDA  1,-3(1)	Ghost frame becomes new active frame 
2370:    LDA  3,1(7)	Return address in ac 
2371:    JMP  7,-524(7)	CALL printboard
2372:    LDA  3,0(2)	Save the result in ac 
* Call end printboard
* TOFF set: -3
* WHILE
* CALL finished
2373:     ST  1,-3(1)	Store fp in ghost frame for finished
* TOFF dec: -4
* TOFF dec: -5
* Param end finished
2374:    LDA  1,-3(1)	Ghost frame becomes new active frame 
2375:    LDA  3,1(7)	Return address in ac 
2376:    JMP  7,-439(7)	CALL finished
2377:    LDA  3,0(2)	Save the result in ac 
* Call end finished
* TOFF set: -3
2378:    LDC  4,1(6)	Load 1 
2379:    XOR  3,3,4	Op XOR to get logical not 
2380:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
2381:     LD  3,-10(0)	Load variable gamenotdone
2382:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
2383:    LDC  3,1(6)	Load Boolean constant 
* TOFF inc: -4
2384:     LD  4,-4(1)	Pop left into ac1 
2385:    TEQ  3,4,3	Op = 
* TOFF inc: -3
2386:     LD  4,-3(1)	Pop left into ac1 
2387:    AND  3,4,3	Op AND 
2388:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
* CALL input
2390:     ST  1,-3(1)	Store fp in ghost frame for input
* TOFF dec: -4
* TOFF dec: -5
* Param end input
2391:    LDA  1,-3(1)	Ghost frame becomes new active frame 
2392:    LDA  3,1(7)	Return address in ac 
2393:    JMP  7,-2393(7)	CALL input
2394:    LDA  3,0(2)	Save the result in ac 
* Call end input
* TOFF set: -3
2395:     ST  3,-2(1)	Store variable x
* IF
* CALL xingrid
2396:     ST  1,-3(1)	Store fp in ghost frame for xingrid
* TOFF dec: -4
* TOFF dec: -5
* Param 1
2397:     LD  3,-2(1)	Load variable x
2398:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end xingrid
2399:    LDA  1,-3(1)	Ghost frame becomes new active frame 
2400:    LDA  3,1(7)	Return address in ac 
2401:    JMP  7,-613(7)	CALL xingrid
2402:    LDA  3,0(2)	Save the result in ac 
* Call end xingrid
* TOFF set: -3
2403:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
* CALL finished
2404:     ST  1,-4(1)	Store fp in ghost frame for finished
* TOFF dec: -5
* TOFF dec: -6
* Param end finished
2405:    LDA  1,-4(1)	Ghost frame becomes new active frame 
2406:    LDA  3,1(7)	Return address in ac 
2407:    JMP  7,-470(7)	CALL finished
2408:    LDA  3,0(2)	Save the result in ac 
* Call end finished
* TOFF set: -4
2409:    LDC  4,1(6)	Load 1 
2410:    XOR  3,3,4	Op XOR to get logical not 
* TOFF inc: -3
2411:     LD  4,-3(1)	Pop left into ac1 
2412:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
* CALL placey
2414:     ST  1,-3(1)	Store fp in ghost frame for placey
* TOFF dec: -4
* TOFF dec: -5
* Param end placey
2415:    LDA  1,-3(1)	Ghost frame becomes new active frame 
2416:    LDA  3,1(7)	Return address in ac 
2417:    JMP  7,-655(7)	CALL placey
2418:    LDA  3,0(2)	Save the result in ac 
* Call end placey
* TOFF set: -3
* EXPRESSION
* CALL outnl
2419:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
2420:    LDA  1,-3(1)	Ghost frame becomes new active frame 
2421:    LDA  3,1(7)	Return address in ac 
2422:    JMP  7,-2389(7)	CALL outnl
2423:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* EXPRESSION
* CALL printboard
2424:     ST  1,-3(1)	Store fp in ghost frame for printboard
* TOFF dec: -4
* TOFF dec: -5
* Param end printboard
2425:    LDA  1,-3(1)	Ghost frame becomes new active frame 
2426:    LDA  3,1(7)	Return address in ac 
2427:    JMP  7,-580(7)	CALL printboard
2428:    LDA  3,0(2)	Save the result in ac 
* Call end printboard
* TOFF set: -3
* EXPRESSION
* CALL outnl
2429:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
2430:    LDA  1,-3(1)	Ghost frame becomes new active frame 
2431:    LDA  3,1(7)	Return address in ac 
2432:    JMP  7,-2399(7)	CALL outnl
2433:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* TOFF set: -3
* END COMPOUND
2413:    JZR  3,20(7)	Jump around the THEN if false [backpatch] 
* END IF
* TOFF set: -3
* END COMPOUND
2434:    JMP  7,-62(7)	go to beginning of loop 
2389:    JMP  7,45(7)	Jump past loop [backpatch] 
* END WHILE
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
2435:    LDC  2,0(6)	Set return value to 0 
2436:     LD  3,-1(1)	Load return address 
2437:     LD  1,0(1)	Adjust fp 
2438:    JMP  7,0(3)	Return 
* END FUNCTION playgame
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
2439:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
2440:    LDC  3,0(6)	Load integer constant 
2441:     ST  3,-2(1)	Store variable i
* WHILE
2442:     LD  3,-2(1)	Load variable i
2443:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
2444:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -3
2445:     LD  4,-3(1)	Pop left into ac1 
2446:    TLT  3,4,3	Op < 
2447:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
2449:     LD  3,-2(1)	Load variable i
2450:     ST  3,-3(1)	Push index 
* TOFF dec: -4
2451:    LDC  3,1(6)	Load integer constant 
2452:    NEG  3,3,3	Op unary - 
* TOFF inc: -3
2453:     LD  4,-3(1)	Pop index 
2454:    LDA  5,-1(0)	Load address of base of array board
2455:    SUB  5,5,4	Compute offset of value 
2456:     ST  3,0(5)	Store variable board
* EXPRESSION
2457:     LD  3,-2(1)	load lhs variable i
2458:    LDA  3,1(3)	increment value of i
2459:     ST  3,-2(1)	Store variable i
* TOFF set: -3
* END COMPOUND
2460:    JMP  7,-19(7)	go to beginning of loop 
2448:    JMP  7,12(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
2461:    LDC  3,1(6)	Load Boolean constant 
2462:     ST  3,-10(0)	Store variable gamenotdone
* EXPRESSION
* CALL playgame
2463:     ST  1,-3(1)	Store fp in ghost frame for playgame
* TOFF dec: -4
* TOFF dec: -5
* Param end playgame
2464:    LDA  1,-3(1)	Ghost frame becomes new active frame 
2465:    LDA  3,1(7)	Return address in ac 
2466:    JMP  7,-107(7)	CALL playgame
2467:    LDA  3,0(2)	Save the result in ac 
* Call end playgame
* TOFF set: -3
* EXPRESSION
* CALL outnl
2468:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
2469:    LDA  1,-3(1)	Ghost frame becomes new active frame 
2470:    LDA  3,1(7)	Return address in ac 
2471:    JMP  7,-2438(7)	CALL outnl
2472:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* EXPRESSION
* CALL printboard
2473:     ST  1,-3(1)	Store fp in ghost frame for printboard
* TOFF dec: -4
* TOFF dec: -5
* Param end printboard
2474:    LDA  1,-3(1)	Ghost frame becomes new active frame 
2475:    LDA  3,1(7)	Return address in ac 
2476:    JMP  7,-629(7)	CALL printboard
2477:    LDA  3,0(2)	Save the result in ac 
* Call end printboard
* TOFF set: -3
* EXPRESSION
* CALL outnl
2478:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
2479:    LDA  1,-3(1)	Ghost frame becomes new active frame 
2480:    LDA  3,1(7)	Return address in ac 
2481:    JMP  7,-2448(7)	CALL outnl
2482:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
2483:    LDC  2,0(6)	Set return value to 0 
2484:     LD  3,-1(1)	Load return address 
2485:     LD  1,0(1)	Adjust fp 
2486:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,2486(7)	Jump to init [backpatch] 
* INIT
2487:    LDA  1,-11(0)	set first frame at end of globals 
2488:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
2489:    LDC  3,9(6)	load size of array board
2490:     ST  3,0(0)	save size of array board
* END INIT GLOBALS AND STATICS
2491:    LDA  3,1(7)	Return address in ac 
2492:    JMP  7,-54(7)	Jump to main 
2493:   HALT  0,0,0	DONE! 
* END INIT
