* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  walsh.c-
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
* FUNCTION pow
* TOFF set: -4
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -6
* Compound Body
* EXPRESSION
 40:    LDC  3,1(6)	Load integer constant 
 41:     ST  3,-5(1)	Store variable ans
* EXPRESSION
 42:     LD  3,-2(1)	Load variable n
 43:     ST  3,-4(1)	Store variable sqr
* WHILE
 44:    LDC  3,1(6)	Load Boolean constant 
 45:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -6
* Compound Body
* IF
 47:     LD  3,-3(1)	Load variable p
 48:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
 49:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -6
 50:     LD  4,-6(1)	Pop left into ac1 
 51:    MOD  3,4,3	Op % 
 52:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
 53:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -6
 54:     LD  4,-6(1)	Pop left into ac1 
 55:    TEQ  3,4,3	Op = 
* THEN
* EXPRESSION
 57:     LD  3,-5(1)	Load variable ans
 58:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
 59:     LD  3,-4(1)	Load variable sqr
* TOFF inc: -6
 60:     LD  4,-6(1)	Pop left into ac1 
 61:    MUL  3,4,3	Op * 
 62:     ST  3,-5(1)	Store variable ans
 56:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* END IF
* EXPRESSION
 63:     LD  3,-3(1)	Load variable p
 64:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
 65:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -6
 66:     LD  4,-6(1)	Pop left into ac1 
 67:    DIV  3,4,3	Op / 
 68:     ST  3,-3(1)	Store variable p
* IF
 69:     LD  3,-3(1)	Load variable p
 70:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
 71:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -6
 72:     LD  4,-6(1)	Pop left into ac1 
 73:    TEQ  3,4,3	Op = 
* THEN
* RETURN
 75:     LD  3,-5(1)	Load variable ans
 76:    LDA  2,0(3)	Copy result to return register 
 77:     LD  3,-1(1)	Load return address 
 78:     LD  1,0(1)	Adjust fp 
 79:    JMP  7,0(3)	Return 
 74:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* END IF
* EXPRESSION
 80:     LD  3,-4(1)	Load variable sqr
 81:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
 82:     LD  3,-4(1)	Load variable sqr
* TOFF inc: -6
 83:     LD  4,-6(1)	Pop left into ac1 
 84:    MUL  3,4,3	Op * 
 85:     ST  3,-4(1)	Store variable sqr
* TOFF set: -6
* END COMPOUND
 86:    JMP  7,-43(7)	go to beginning of loop 
 46:    JMP  7,40(7)	Jump past loop [backpatch] 
* END WHILE
* TOFF set: -4
* END COMPOUND
* Add standard closing in case there is no return statement
 87:    LDC  2,0(6)	Set return value to 0 
 88:     LD  3,-1(1)	Load return address 
 89:     LD  1,0(1)	Adjust fp 
 90:    JMP  7,0(3)	Return 
* END FUNCTION pow
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION getFunc
* TOFF set: -3
 91:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -6
* Compound Body
* IF
* CALL input
 92:     ST  1,-6(1)	Store fp in ghost frame for input
* TOFF dec: -7
* TOFF dec: -8
* Param end input
 93:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 94:    LDA  3,1(7)	Return address in ac 
 95:    JMP  7,-95(7)	CALL input
 96:    LDA  3,0(2)	Save the result in ac 
* Call end input
* TOFF set: -6
 97:     ST  3,-3(1)	Store variable numbits
 98:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
 99:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -6
100:     LD  4,-6(1)	Pop left into ac1 
101:    TEQ  3,4,3	Op = 
* THEN
* RETURN
103:    LDC  3,0(6)	Load integer constant 
104:    LDA  2,0(3)	Copy result to return register 
105:     LD  3,-1(1)	Load return address 
106:     LD  1,0(1)	Adjust fp 
107:    JMP  7,0(3)	Return 
102:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* END IF
* EXPRESSION
* CALL pow
108:     ST  1,-6(1)	Store fp in ghost frame for pow
* TOFF dec: -7
* TOFF dec: -8
* Param 1
109:    LDC  3,2(6)	Load integer constant 
110:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param 2
111:     LD  3,-3(1)	Load variable numbits
112:     ST  3,-9(1)	Push parameter 
* TOFF dec: -10
* Param end pow
113:    LDA  1,-6(1)	Ghost frame becomes new active frame 
114:    LDA  3,1(7)	Return address in ac 
115:    JMP  7,-77(7)	CALL pow
116:    LDA  3,0(2)	Save the result in ac 
* Call end pow
* TOFF set: -6
117:     ST  3,-5(1)	Store variable size
* EXPRESSION
118:    LDC  3,0(6)	Load integer constant 
119:     ST  3,-4(1)	Store variable i
* WHILE
120:     LD  3,-4(1)	Load variable i
121:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
122:     LD  3,-5(1)	Load variable size
* TOFF inc: -6
123:     LD  4,-6(1)	Pop left into ac1 
124:    TLT  3,4,3	Op < 
125:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -6
* Compound Body
* EXPRESSION
127:     LD  3,-4(1)	Load variable i
128:     ST  3,-6(1)	Push index 
* TOFF dec: -7
* CALL input
129:     ST  1,-7(1)	Store fp in ghost frame for input
* TOFF dec: -8
* TOFF dec: -9
* Param end input
130:    LDA  1,-7(1)	Ghost frame becomes new active frame 
131:    LDA  3,1(7)	Return address in ac 
132:    JMP  7,-132(7)	CALL input
133:    LDA  3,0(2)	Save the result in ac 
* Call end input
* TOFF set: -7
* TOFF inc: -6
134:     LD  4,-6(1)	Pop index 
135:     LD  5,-2(1)	Load address of base of array f
136:    SUB  5,5,4	Compute offset of value 
137:     ST  3,0(5)	Store variable f
* EXPRESSION
138:     LD  3,-4(1)	Load variable i
139:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
140:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -6
141:     LD  4,-6(1)	Pop left into ac1 
142:    ADD  3,4,3	Op + 
143:     ST  3,-4(1)	Store variable i
* TOFF set: -6
* END COMPOUND
144:    JMP  7,-25(7)	go to beginning of loop 
126:    JMP  7,18(7)	Jump past loop [backpatch] 
* END WHILE
* RETURN
145:     LD  3,-3(1)	Load variable numbits
146:    LDA  2,0(3)	Copy result to return register 
147:     LD  3,-1(1)	Load return address 
148:     LD  1,0(1)	Adjust fp 
149:    JMP  7,0(3)	Return 
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
150:    LDC  2,0(6)	Set return value to 0 
151:     LD  3,-1(1)	Load return address 
152:     LD  1,0(1)	Adjust fp 
153:    JMP  7,0(3)	Return 
* END FUNCTION getFunc
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION printFunc
* TOFF set: -4
154:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -5
* Compound Body
* EXPRESSION
155:    LDC  3,0(6)	Load integer constant 
156:     ST  3,-4(1)	Store variable i
* WHILE
157:     LD  3,-4(1)	Load variable i
158:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
159:     LD  3,-3(1)	Load variable size
* TOFF inc: -5
160:     LD  4,-5(1)	Pop left into ac1 
161:    TLT  3,4,3	Op < 
162:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -5
* Compound Body
* EXPRESSION
* CALL output
164:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
165:     LD  3,-2(1)	Load address of base of array f
166:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
167:     LD  3,-4(1)	Load variable i
* TOFF inc: -7
168:     LD  4,-7(1)	Pop left into ac1 
169:    SUB  3,4,3	compute location from index 
170:     LD  3,0(3)	Load array element 
171:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
172:    LDA  1,-5(1)	Ghost frame becomes new active frame 
173:    LDA  3,1(7)	Return address in ac 
174:    JMP  7,-169(7)	CALL output
175:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
176:     LD  3,-4(1)	Load variable i
177:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
178:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -5
179:     LD  4,-5(1)	Pop left into ac1 
180:    ADD  3,4,3	Op + 
181:     ST  3,-4(1)	Store variable i
* TOFF set: -5
* END COMPOUND
182:    JMP  7,-26(7)	go to beginning of loop 
163:    JMP  7,19(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
* CALL outnl
183:     ST  1,-5(1)	Store fp in ghost frame for outnl
* TOFF dec: -6
* TOFF dec: -7
* Param end outnl
184:    LDA  1,-5(1)	Ghost frame becomes new active frame 
185:    LDA  3,1(7)	Return address in ac 
186:    JMP  7,-153(7)	CALL outnl
187:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -5
* TOFF set: -4
* END COMPOUND
* Add standard closing in case there is no return statement
188:    LDC  2,0(6)	Set return value to 0 
189:     LD  3,-1(1)	Load return address 
190:     LD  1,0(1)	Adjust fp 
191:    JMP  7,0(3)	Return 
* END FUNCTION printFunc
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION fwt
* TOFF set: -5
192:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -8
* Compound Body
* EXPRESSION
193:     LD  3,-4(1)	Load variable size
194:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
195:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -8
196:     LD  4,-8(1)	Pop left into ac1 
197:    DIV  3,4,3	Op / 
198:     ST  3,-4(1)	Store variable size
* IF
199:     LD  3,-4(1)	Load variable size
200:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
201:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -8
202:     LD  4,-8(1)	Pop left into ac1 
203:    TGT  3,4,3	Op > 
* THEN
* COMPOUND
* TOFF set: -8
* Compound Body
* EXPRESSION
* CALL fwt
205:     ST  1,-8(1)	Store fp in ghost frame for fwt
* TOFF dec: -9
* TOFF dec: -10
* Param 1
206:     LD  3,-2(1)	Load address of base of array w
207:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param 2
208:     LD  3,-3(1)	Load variable start
209:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param 3
210:     LD  3,-4(1)	Load variable size
211:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param end fwt
212:    LDA  1,-8(1)	Ghost frame becomes new active frame 
213:    LDA  3,1(7)	Return address in ac 
214:    JMP  7,-23(7)	CALL fwt
215:    LDA  3,0(2)	Save the result in ac 
* Call end fwt
* TOFF set: -8
* EXPRESSION
* CALL fwt
216:     ST  1,-8(1)	Store fp in ghost frame for fwt
* TOFF dec: -9
* TOFF dec: -10
* Param 1
217:     LD  3,-2(1)	Load address of base of array w
218:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param 2
219:     LD  3,-3(1)	Load variable start
220:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
221:     LD  3,-4(1)	Load variable size
* TOFF inc: -11
222:     LD  4,-11(1)	Pop left into ac1 
223:    ADD  3,4,3	Op + 
224:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param 3
225:     LD  3,-4(1)	Load variable size
226:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param end fwt
227:    LDA  1,-8(1)	Ghost frame becomes new active frame 
228:    LDA  3,1(7)	Return address in ac 
229:    JMP  7,-38(7)	CALL fwt
230:    LDA  3,0(2)	Save the result in ac 
* Call end fwt
* TOFF set: -8
* TOFF set: -8
* END COMPOUND
204:    JZR  3,26(7)	Jump around the THEN if false [backpatch] 
* END IF
* EXPRESSION
231:     LD  3,-3(1)	Load variable start
232:     ST  3,-5(1)	Store variable a
* EXPRESSION
233:     LD  3,-3(1)	Load variable start
234:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
235:     LD  3,-4(1)	Load variable size
* TOFF inc: -8
236:     LD  4,-8(1)	Pop left into ac1 
237:    ADD  3,4,3	Op + 
238:     ST  3,-6(1)	Store variable b
* WHILE
239:     LD  3,-5(1)	Load variable a
240:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
241:     LD  3,-3(1)	Load variable start
242:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
243:     LD  3,-4(1)	Load variable size
* TOFF inc: -9
244:     LD  4,-9(1)	Pop left into ac1 
245:    ADD  3,4,3	Op + 
* TOFF inc: -8
246:     LD  4,-8(1)	Pop left into ac1 
247:    TLT  3,4,3	Op < 
248:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -8
* Compound Body
* EXPRESSION
250:     LD  3,-2(1)	Load address of base of array w
251:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
252:     LD  3,-5(1)	Load variable a
* TOFF inc: -8
253:     LD  4,-8(1)	Pop left into ac1 
254:    SUB  3,4,3	compute location from index 
255:     LD  3,0(3)	Load array element 
256:     ST  3,-7(1)	Store variable tmp
* EXPRESSION
257:     LD  3,-5(1)	Load variable a
258:     ST  3,-8(1)	Push index 
* TOFF dec: -9
259:     LD  3,-2(1)	Load address of base of array w
260:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
261:     LD  3,-5(1)	Load variable a
* TOFF inc: -9
262:     LD  4,-9(1)	Pop left into ac1 
263:    SUB  3,4,3	compute location from index 
264:     LD  3,0(3)	Load array element 
265:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
266:     LD  3,-2(1)	Load address of base of array w
267:     ST  3,-10(1)	Push left side 
* TOFF dec: -11
268:     LD  3,-6(1)	Load variable b
* TOFF inc: -10
269:     LD  4,-10(1)	Pop left into ac1 
270:    SUB  3,4,3	compute location from index 
271:     LD  3,0(3)	Load array element 
* TOFF inc: -9
272:     LD  4,-9(1)	Pop left into ac1 
273:    ADD  3,4,3	Op + 
* TOFF inc: -8
274:     LD  4,-8(1)	Pop index 
275:     LD  5,-2(1)	Load address of base of array w
276:    SUB  5,5,4	Compute offset of value 
277:     ST  3,0(5)	Store variable w
* EXPRESSION
278:     LD  3,-6(1)	Load variable b
279:     ST  3,-8(1)	Push index 
* TOFF dec: -9
280:     LD  3,-7(1)	Load variable tmp
281:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
282:     LD  3,-2(1)	Load address of base of array w
283:     ST  3,-10(1)	Push left side 
* TOFF dec: -11
284:     LD  3,-6(1)	Load variable b
* TOFF inc: -10
285:     LD  4,-10(1)	Pop left into ac1 
286:    SUB  3,4,3	compute location from index 
287:     LD  3,0(3)	Load array element 
* TOFF inc: -9
288:     LD  4,-9(1)	Pop left into ac1 
289:    SUB  3,4,3	Op - 
* TOFF inc: -8
290:     LD  4,-8(1)	Pop index 
291:     LD  5,-2(1)	Load address of base of array w
292:    SUB  5,5,4	Compute offset of value 
293:     ST  3,0(5)	Store variable w
* EXPRESSION
294:     LD  3,-5(1)	Load variable a
295:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
296:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -8
297:     LD  4,-8(1)	Pop left into ac1 
298:    ADD  3,4,3	Op + 
299:     ST  3,-5(1)	Store variable a
* EXPRESSION
300:     LD  3,-6(1)	Load variable b
301:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
302:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -8
303:     LD  4,-8(1)	Pop left into ac1 
304:    ADD  3,4,3	Op + 
305:     ST  3,-6(1)	Store variable b
* TOFF set: -8
* END COMPOUND
306:    JMP  7,-68(7)	go to beginning of loop 
249:    JMP  7,57(7)	Jump past loop [backpatch] 
* END WHILE
* TOFF set: -5
* END COMPOUND
* Add standard closing in case there is no return statement
307:    LDC  2,0(6)	Set return value to 0 
308:     LD  3,-1(1)	Load return address 
309:     LD  1,0(1)	Adjust fp 
310:    JMP  7,0(3)	Return 
* END FUNCTION fwt
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION div
* TOFF set: -4
311:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -5
* Compound Body
* EXPRESSION
312:    LDC  3,0(6)	Load integer constant 
313:     ST  3,-4(1)	Store variable i
* WHILE
314:     LD  3,-4(1)	Load variable i
315:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
316:     LD  3,-3(1)	Load variable size
* TOFF inc: -5
317:     LD  4,-5(1)	Pop left into ac1 
318:    TLT  3,4,3	Op < 
319:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -5
* Compound Body
* EXPRESSION
321:     LD  3,-4(1)	Load variable i
322:     ST  3,-5(1)	Push index 
* TOFF dec: -6
323:     LD  3,-2(1)	Load address of base of array f
324:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
325:     LD  3,-4(1)	Load variable i
* TOFF inc: -6
326:     LD  4,-6(1)	Pop left into ac1 
327:    SUB  3,4,3	compute location from index 
328:     LD  3,0(3)	Load array element 
329:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
330:     LD  3,-3(1)	Load variable size
* TOFF inc: -6
331:     LD  4,-6(1)	Pop left into ac1 
332:    DIV  3,4,3	Op / 
* TOFF inc: -5
333:     LD  4,-5(1)	Pop index 
334:     LD  5,-2(1)	Load address of base of array f
335:    SUB  5,5,4	Compute offset of value 
336:     ST  3,0(5)	Store variable f
* EXPRESSION
337:     LD  3,-4(1)	load lhs variable i
338:    LDA  3,1(3)	increment value of i
339:     ST  3,-4(1)	Store variable i
* TOFF set: -5
* END COMPOUND
340:    JMP  7,-27(7)	go to beginning of loop 
320:    JMP  7,20(7)	Jump past loop [backpatch] 
* END WHILE
* TOFF set: -4
* END COMPOUND
* Add standard closing in case there is no return statement
341:    LDC  2,0(6)	Set return value to 0 
342:     LD  3,-1(1)	Load return address 
343:     LD  1,0(1)	Adjust fp 
344:    JMP  7,0(3)	Return 
* END FUNCTION div
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
345:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -262
346:    LDC  3,256(6)	load size of array f
347:     ST  3,-2(1)	save size of array f
* Compound Body
* WHILE
348:    LDC  3,1(6)	Load Boolean constant 
349:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -262
* Compound Body
* IF
* CALL getFunc
351:     ST  1,-262(1)	Store fp in ghost frame for getFunc
* TOFF dec: -263
* TOFF dec: -264
* Param 1
352:    LDA  3,-3(1)	Load address of base of array f
353:     ST  3,-264(1)	Push parameter 
* TOFF dec: -265
* Param end getFunc
354:    LDA  1,-262(1)	Ghost frame becomes new active frame 
355:    LDA  3,1(7)	Return address in ac 
356:    JMP  7,-266(7)	CALL getFunc
357:    LDA  3,0(2)	Save the result in ac 
* Call end getFunc
* TOFF set: -262
358:     ST  3,-260(1)	Store variable numbits
359:     ST  3,-262(1)	Push left side 
* TOFF dec: -263
360:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -262
361:     LD  4,-262(1)	Pop left into ac1 
362:    TEQ  3,4,3	Op = 
* THEN
* RETURN
364:    LDC  3,0(6)	Load integer constant 
365:    LDA  2,0(3)	Copy result to return register 
366:     LD  3,-1(1)	Load return address 
367:     LD  1,0(1)	Adjust fp 
368:    JMP  7,0(3)	Return 
363:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* END IF
* EXPRESSION
* CALL pow
369:     ST  1,-262(1)	Store fp in ghost frame for pow
* TOFF dec: -263
* TOFF dec: -264
* Param 1
370:    LDC  3,2(6)	Load integer constant 
371:     ST  3,-264(1)	Push parameter 
* TOFF dec: -265
* Param 2
372:     LD  3,-260(1)	Load variable numbits
373:     ST  3,-265(1)	Push parameter 
* TOFF dec: -266
* Param end pow
374:    LDA  1,-262(1)	Ghost frame becomes new active frame 
375:    LDA  3,1(7)	Return address in ac 
376:    JMP  7,-338(7)	CALL pow
377:    LDA  3,0(2)	Save the result in ac 
* Call end pow
* TOFF set: -262
378:     ST  3,-259(1)	Store variable size
* EXPRESSION
379:     LD  3,-259(1)	Load variable size
380:     ST  3,-262(1)	Push left side 
* TOFF dec: -263
381:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -262
382:     LD  4,-262(1)	Pop left into ac1 
383:    DIV  3,4,3	Op / 
384:     ST  3,-261(1)	Store variable half
* EXPRESSION
* CALL fwt
385:     ST  1,-262(1)	Store fp in ghost frame for fwt
* TOFF dec: -263
* TOFF dec: -264
* Param 1
386:    LDA  3,-3(1)	Load address of base of array f
387:     ST  3,-264(1)	Push parameter 
* TOFF dec: -265
* Param 2
388:    LDC  3,0(6)	Load integer constant 
389:     ST  3,-265(1)	Push parameter 
* TOFF dec: -266
* Param 3
390:     LD  3,-259(1)	Load variable size
391:     ST  3,-266(1)	Push parameter 
* TOFF dec: -267
* Param end fwt
392:    LDA  1,-262(1)	Ghost frame becomes new active frame 
393:    LDA  3,1(7)	Return address in ac 
394:    JMP  7,-203(7)	CALL fwt
395:    LDA  3,0(2)	Save the result in ac 
* Call end fwt
* TOFF set: -262
* EXPRESSION
* CALL printFunc
396:     ST  1,-262(1)	Store fp in ghost frame for printFunc
* TOFF dec: -263
* TOFF dec: -264
* Param 1
397:    LDA  3,-3(1)	Load address of base of array f
398:     ST  3,-264(1)	Push parameter 
* TOFF dec: -265
* Param 2
399:     LD  3,-259(1)	Load variable size
400:     ST  3,-265(1)	Push parameter 
* TOFF dec: -266
* Param end printFunc
401:    LDA  1,-262(1)	Ghost frame becomes new active frame 
402:    LDA  3,1(7)	Return address in ac 
403:    JMP  7,-250(7)	CALL printFunc
404:    LDA  3,0(2)	Save the result in ac 
* Call end printFunc
* TOFF set: -262
* EXPRESSION
* CALL fwt
405:     ST  1,-262(1)	Store fp in ghost frame for fwt
* TOFF dec: -263
* TOFF dec: -264
* Param 1
406:    LDA  3,-3(1)	Load address of base of array f
407:     ST  3,-264(1)	Push parameter 
* TOFF dec: -265
* Param 2
408:    LDC  3,0(6)	Load integer constant 
409:     ST  3,-265(1)	Push parameter 
* TOFF dec: -266
* Param 3
410:     LD  3,-259(1)	Load variable size
411:     ST  3,-266(1)	Push parameter 
* TOFF dec: -267
* Param end fwt
412:    LDA  1,-262(1)	Ghost frame becomes new active frame 
413:    LDA  3,1(7)	Return address in ac 
414:    JMP  7,-223(7)	CALL fwt
415:    LDA  3,0(2)	Save the result in ac 
* Call end fwt
* TOFF set: -262
* EXPRESSION
* CALL div
416:     ST  1,-262(1)	Store fp in ghost frame for div
* TOFF dec: -263
* TOFF dec: -264
* Param 1
417:    LDA  3,-3(1)	Load address of base of array f
418:     ST  3,-264(1)	Push parameter 
* TOFF dec: -265
* Param 2
419:     LD  3,-259(1)	Load variable size
420:     ST  3,-265(1)	Push parameter 
* TOFF dec: -266
* Param end div
421:    LDA  1,-262(1)	Ghost frame becomes new active frame 
422:    LDA  3,1(7)	Return address in ac 
423:    JMP  7,-113(7)	CALL div
424:    LDA  3,0(2)	Save the result in ac 
* Call end div
* TOFF set: -262
* EXPRESSION
* CALL printFunc
425:     ST  1,-262(1)	Store fp in ghost frame for printFunc
* TOFF dec: -263
* TOFF dec: -264
* Param 1
426:    LDA  3,-3(1)	Load address of base of array f
427:     ST  3,-264(1)	Push parameter 
* TOFF dec: -265
* Param 2
428:     LD  3,-259(1)	Load variable size
429:     ST  3,-265(1)	Push parameter 
* TOFF dec: -266
* Param end printFunc
430:    LDA  1,-262(1)	Ghost frame becomes new active frame 
431:    LDA  3,1(7)	Return address in ac 
432:    JMP  7,-279(7)	CALL printFunc
433:    LDA  3,0(2)	Save the result in ac 
* Call end printFunc
* TOFF set: -262
* TOFF set: -262
* END COMPOUND
434:    JMP  7,-87(7)	go to beginning of loop 
350:    JMP  7,84(7)	Jump past loop [backpatch] 
* END WHILE
* RETURN
435:    LDC  3,0(6)	Load integer constant 
436:    LDA  2,0(3)	Copy result to return register 
437:     LD  3,-1(1)	Load return address 
438:     LD  1,0(1)	Adjust fp 
439:    JMP  7,0(3)	Return 
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
440:    LDC  2,0(6)	Set return value to 0 
441:     LD  3,-1(1)	Load return address 
442:     LD  1,0(1)	Adjust fp 
443:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,443(7)	Jump to init [backpatch] 
* INIT
444:    LDA  1,0(0)	set first frame at end of globals 
445:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
446:    LDA  3,1(7)	Return address in ac 
447:    JMP  7,-103(7)	Jump to main 
448:   HALT  0,0,0	DONE! 
* END INIT
