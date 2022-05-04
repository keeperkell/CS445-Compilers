* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  fromroman.c-
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
* FUNCTION getstring
* TOFF set: -3
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -4
* Compound Body
* EXPRESSION
 40:    LDC  3,1(6)	Load integer constant 
 41:    NEG  3,3,3	Op unary - 
 42:     ST  3,-3(1)	Store variable i
* WHILE
 43:    LDC  3,1(6)	Load Boolean constant 
 44:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -5
* Compound Body
* EXPRESSION
* CALL inputc
 46:     ST  1,-5(1)	Store fp in ghost frame for inputc
* TOFF dec: -6
* TOFF dec: -7
* Param end inputc
 47:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 48:    LDA  3,1(7)	Return address in ac 
 49:    JMP  7,-27(7)	CALL inputc
 50:    LDA  3,0(2)	Save the result in ac 
* Call end inputc
* TOFF set: -5
 51:     ST  3,-4(1)	Store variable c
* IF
 52:     LD  3,-3(1)	Load variable i
 53:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 54:     LD  3,-2(1)	Load address of base of array s
 55:     LD  3,1(3)	Load array size 
* TOFF inc: -5
 56:     LD  4,-5(1)	Pop left into ac1 
 57:    TLT  3,4,3	Op < 
* THEN
* COMPOUND
* TOFF set: -5
* Compound Body
* EXPRESSION
 59:     LD  3,-3(1)	load lhs variable i
 60:    LDA  3,1(3)	increment value of i
 61:     ST  3,-3(1)	Store variable i
* EXPRESSION
 62:     LD  3,-3(1)	Load variable i
 63:     ST  3,-5(1)	Push index 
* TOFF dec: -6
 64:     LD  3,-4(1)	Load variable c
* TOFF inc: -5
 65:     LD  4,-5(1)	Pop index 
 66:     LD  5,-2(1)	Load address of base of array s
 67:    SUB  5,5,4	Compute offset of value 
 68:     ST  3,0(5)	Store variable s
* TOFF set: -5
* END COMPOUND
 58:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* END IF
* IF
 69:     LD  3,-4(1)	Load variable c
 70:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 71:    LDC  3,10(6)	Load char constant 
* TOFF inc: -5
 72:     LD  4,-5(1)	Pop left into ac1 
 73:    TEQ  3,4,3	Op = 
* THEN
* BREAK
 75:    JMP  7,-31(7)	break 
 74:    JZR  3,1(7)	Jump around the THEN if false [backpatch] 
* END IF
* TOFF set: -4
* END COMPOUND
 76:    JMP  7,-34(7)	go to beginning of loop 
 45:    JMP  7,31(7)	Jump past loop [backpatch] 
* END WHILE
* RETURN
 77:     LD  3,-3(1)	Load variable i
 78:    LDA  2,0(3)	Copy result to return register 
 79:     LD  3,-1(1)	Load return address 
 80:     LD  1,0(1)	Adjust fp 
 81:    JMP  7,0(3)	Return 
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
 82:    LDC  2,0(6)	Set return value to 0 
 83:     LD  3,-1(1)	Load return address 
 84:     LD  1,0(1)	Adjust fp 
 85:    JMP  7,0(3)	Return 
* END FUNCTION getstring
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION putstring
* TOFF set: -4
 86:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -5
* Compound Body
* EXPRESSION
 87:    LDC  3,0(6)	Load integer constant 
 88:     ST  3,-4(1)	Store variable i
* WHILE
 89:     LD  3,-4(1)	Load variable i
 90:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 91:     LD  3,-2(1)	Load variable len
* TOFF inc: -5
 92:     LD  4,-5(1)	Pop left into ac1 
 93:    TLT  3,4,3	Op < 
 94:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -5
* Compound Body
* EXPRESSION
* CALL outputc
 96:     ST  1,-5(1)	Store fp in ghost frame for outputc
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 97:     LD  3,-3(1)	Load address of base of array s
 98:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
 99:     LD  3,-4(1)	Load variable i
* TOFF inc: -7
100:     LD  4,-7(1)	Pop left into ac1 
101:    SUB  3,4,3	compute location from index 
102:     LD  3,0(3)	Load array element 
103:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end outputc
104:    LDA  1,-5(1)	Ghost frame becomes new active frame 
105:    LDA  3,1(7)	Return address in ac 
106:    JMP  7,-79(7)	CALL outputc
107:    LDA  3,0(2)	Save the result in ac 
* Call end outputc
* TOFF set: -5
* EXPRESSION
108:     LD  3,-4(1)	load lhs variable i
109:    LDA  3,1(3)	increment value of i
110:     ST  3,-4(1)	Store variable i
* TOFF set: -5
* END COMPOUND
111:    JMP  7,-23(7)	go to beginning of loop 
 95:    JMP  7,16(7)	Jump past loop [backpatch] 
* END WHILE
* TOFF set: -4
* END COMPOUND
* Add standard closing in case there is no return statement
112:    LDC  2,0(6)	Set return value to 0 
113:     LD  3,-1(1)	Load return address 
114:     LD  1,0(1)	Adjust fp 
115:    JMP  7,0(3)	Return 
* END FUNCTION putstring
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION charvalue
* TOFF set: -3
116:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* IF
117:     LD  3,-2(1)	Load variable c
118:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
119:    LDC  3,73(6)	Load char constant 
* TOFF inc: -3
120:     LD  4,-3(1)	Pop left into ac1 
121:    TEQ  3,4,3	Op = 
* THEN
* RETURN
123:    LDC  3,1(6)	Load integer constant 
124:    LDA  2,0(3)	Copy result to return register 
125:     LD  3,-1(1)	Load return address 
126:     LD  1,0(1)	Adjust fp 
127:    JMP  7,0(3)	Return 
122:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
129:     LD  3,-2(1)	Load variable c
130:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
131:    LDC  3,86(6)	Load char constant 
* TOFF inc: -3
132:     LD  4,-3(1)	Pop left into ac1 
133:    TEQ  3,4,3	Op = 
* THEN
* RETURN
135:    LDC  3,5(6)	Load integer constant 
136:    LDA  2,0(3)	Copy result to return register 
137:     LD  3,-1(1)	Load return address 
138:     LD  1,0(1)	Adjust fp 
139:    JMP  7,0(3)	Return 
134:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
141:     LD  3,-2(1)	Load variable c
142:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
143:    LDC  3,88(6)	Load char constant 
* TOFF inc: -3
144:     LD  4,-3(1)	Pop left into ac1 
145:    TEQ  3,4,3	Op = 
* THEN
* RETURN
147:    LDC  3,10(6)	Load integer constant 
148:    LDA  2,0(3)	Copy result to return register 
149:     LD  3,-1(1)	Load return address 
150:     LD  1,0(1)	Adjust fp 
151:    JMP  7,0(3)	Return 
146:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
153:     LD  3,-2(1)	Load variable c
154:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
155:    LDC  3,76(6)	Load char constant 
* TOFF inc: -3
156:     LD  4,-3(1)	Pop left into ac1 
157:    TEQ  3,4,3	Op = 
* THEN
* RETURN
159:    LDC  3,50(6)	Load integer constant 
160:    LDA  2,0(3)	Copy result to return register 
161:     LD  3,-1(1)	Load return address 
162:     LD  1,0(1)	Adjust fp 
163:    JMP  7,0(3)	Return 
158:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
165:     LD  3,-2(1)	Load variable c
166:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
167:    LDC  3,67(6)	Load char constant 
* TOFF inc: -3
168:     LD  4,-3(1)	Pop left into ac1 
169:    TEQ  3,4,3	Op = 
* THEN
* RETURN
171:    LDC  3,100(6)	Load integer constant 
172:    LDA  2,0(3)	Copy result to return register 
173:     LD  3,-1(1)	Load return address 
174:     LD  1,0(1)	Adjust fp 
175:    JMP  7,0(3)	Return 
170:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
177:     LD  3,-2(1)	Load variable c
178:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
179:    LDC  3,68(6)	Load char constant 
* TOFF inc: -3
180:     LD  4,-3(1)	Pop left into ac1 
181:    TEQ  3,4,3	Op = 
* THEN
* RETURN
183:    LDC  3,500(6)	Load integer constant 
184:    LDA  2,0(3)	Copy result to return register 
185:     LD  3,-1(1)	Load return address 
186:     LD  1,0(1)	Adjust fp 
187:    JMP  7,0(3)	Return 
182:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
189:     LD  3,-2(1)	Load variable c
190:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
191:    LDC  3,77(6)	Load char constant 
* TOFF inc: -3
192:     LD  4,-3(1)	Pop left into ac1 
193:    TEQ  3,4,3	Op = 
* THEN
* RETURN
195:    LDC  3,1000(6)	Load integer constant 
196:    LDA  2,0(3)	Copy result to return register 
197:     LD  3,-1(1)	Load return address 
198:     LD  1,0(1)	Adjust fp 
199:    JMP  7,0(3)	Return 
194:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* RETURN
201:    LDC  3,0(6)	Load integer constant 
202:    LDA  2,0(3)	Copy result to return register 
203:     LD  3,-1(1)	Load return address 
204:     LD  1,0(1)	Adjust fp 
205:    JMP  7,0(3)	Return 
200:    JMP  7,5(7)	Jump around the ELSE [backpatch] 
* END IF
188:    JMP  7,17(7)	Jump around the ELSE [backpatch] 
* END IF
176:    JMP  7,29(7)	Jump around the ELSE [backpatch] 
* END IF
164:    JMP  7,41(7)	Jump around the ELSE [backpatch] 
* END IF
152:    JMP  7,53(7)	Jump around the ELSE [backpatch] 
* END IF
140:    JMP  7,65(7)	Jump around the ELSE [backpatch] 
* END IF
128:    JMP  7,77(7)	Jump around the ELSE [backpatch] 
* END IF
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
206:    LDC  2,0(6)	Set return value to 0 
207:     LD  3,-1(1)	Load return address 
208:     LD  1,0(1)	Adjust fp 
209:    JMP  7,0(3)	Return 
* END FUNCTION charvalue
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION roman2arabic
* TOFF set: -4
210:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -6
* Compound Body
* EXPRESSION
211:    LDC  3,0(6)	Load integer constant 
212:     ST  3,-5(1)	Store variable sum
* EXPRESSION
213:    LDC  3,0(6)	Load integer constant 
214:     ST  3,-4(1)	Store variable i
* WHILE
215:     LD  3,-4(1)	Load variable i
216:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
217:     LD  3,-2(1)	Load variable len
218:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
219:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -7
220:     LD  4,-7(1)	Pop left into ac1 
221:    SUB  3,4,3	Op - 
* TOFF inc: -6
222:     LD  4,-6(1)	Pop left into ac1 
223:    TLT  3,4,3	Op < 
224:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -6
* Compound Body
* IF
* CALL charvalue
226:     ST  1,-6(1)	Store fp in ghost frame for charvalue
* TOFF dec: -7
* TOFF dec: -8
* Param 1
227:     LD  3,-3(1)	Load address of base of array roman
228:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
229:     LD  3,-4(1)	Load variable i
* TOFF inc: -8
230:     LD  4,-8(1)	Pop left into ac1 
231:    SUB  3,4,3	compute location from index 
232:     LD  3,0(3)	Load array element 
233:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end charvalue
234:    LDA  1,-6(1)	Ghost frame becomes new active frame 
235:    LDA  3,1(7)	Return address in ac 
236:    JMP  7,-121(7)	CALL charvalue
237:    LDA  3,0(2)	Save the result in ac 
* Call end charvalue
* TOFF set: -6
238:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
* CALL charvalue
239:     ST  1,-7(1)	Store fp in ghost frame for charvalue
* TOFF dec: -8
* TOFF dec: -9
* Param 1
240:     LD  3,-3(1)	Load address of base of array roman
241:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
242:     LD  3,-4(1)	Load variable i
243:     ST  3,-10(1)	Push left side 
* TOFF dec: -11
244:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -10
245:     LD  4,-10(1)	Pop left into ac1 
246:    ADD  3,4,3	Op + 
* TOFF inc: -9
247:     LD  4,-9(1)	Pop left into ac1 
248:    SUB  3,4,3	compute location from index 
249:     LD  3,0(3)	Load array element 
250:     ST  3,-9(1)	Push parameter 
* TOFF dec: -10
* Param end charvalue
251:    LDA  1,-7(1)	Ghost frame becomes new active frame 
252:    LDA  3,1(7)	Return address in ac 
253:    JMP  7,-138(7)	CALL charvalue
254:    LDA  3,0(2)	Save the result in ac 
* Call end charvalue
* TOFF set: -7
* TOFF inc: -6
255:     LD  4,-6(1)	Pop left into ac1 
256:    TLT  3,4,3	Op < 
* THEN
* EXPRESSION
* CALL charvalue
258:     ST  1,-6(1)	Store fp in ghost frame for charvalue
* TOFF dec: -7
* TOFF dec: -8
* Param 1
259:     LD  3,-3(1)	Load address of base of array roman
260:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
261:     LD  3,-4(1)	Load variable i
* TOFF inc: -8
262:     LD  4,-8(1)	Pop left into ac1 
263:    SUB  3,4,3	compute location from index 
264:     LD  3,0(3)	Load array element 
265:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end charvalue
266:    LDA  1,-6(1)	Ghost frame becomes new active frame 
267:    LDA  3,1(7)	Return address in ac 
268:    JMP  7,-153(7)	CALL charvalue
269:    LDA  3,0(2)	Save the result in ac 
* Call end charvalue
* TOFF set: -6
270:     LD  4,-5(1)	load lhs variable sum
271:    SUB  3,4,3	op -= 
272:     ST  3,-5(1)	Store variable sum
257:    JZR  3,16(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
* CALL charvalue
274:     ST  1,-6(1)	Store fp in ghost frame for charvalue
* TOFF dec: -7
* TOFF dec: -8
* Param 1
275:     LD  3,-3(1)	Load address of base of array roman
276:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
277:     LD  3,-4(1)	Load variable i
* TOFF inc: -8
278:     LD  4,-8(1)	Pop left into ac1 
279:    SUB  3,4,3	compute location from index 
280:     LD  3,0(3)	Load array element 
281:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end charvalue
282:    LDA  1,-6(1)	Ghost frame becomes new active frame 
283:    LDA  3,1(7)	Return address in ac 
284:    JMP  7,-169(7)	CALL charvalue
285:    LDA  3,0(2)	Save the result in ac 
* Call end charvalue
* TOFF set: -6
286:     LD  4,-5(1)	load lhs variable sum
287:    ADD  3,4,3	op += 
288:     ST  3,-5(1)	Store variable sum
273:    JMP  7,15(7)	Jump around the ELSE [backpatch] 
* END IF
* EXPRESSION
289:     LD  3,-4(1)	load lhs variable i
290:    LDA  3,1(3)	increment value of i
291:     ST  3,-4(1)	Store variable i
* TOFF set: -6
* END COMPOUND
292:    JMP  7,-78(7)	go to beginning of loop 
225:    JMP  7,67(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
* CALL charvalue
293:     ST  1,-6(1)	Store fp in ghost frame for charvalue
* TOFF dec: -7
* TOFF dec: -8
* Param 1
294:     LD  3,-3(1)	Load address of base of array roman
295:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
296:     LD  3,-2(1)	Load variable len
297:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
298:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -9
299:     LD  4,-9(1)	Pop left into ac1 
300:    SUB  3,4,3	Op - 
* TOFF inc: -8
301:     LD  4,-8(1)	Pop left into ac1 
302:    SUB  3,4,3	compute location from index 
303:     LD  3,0(3)	Load array element 
304:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end charvalue
305:    LDA  1,-6(1)	Ghost frame becomes new active frame 
306:    LDA  3,1(7)	Return address in ac 
307:    JMP  7,-192(7)	CALL charvalue
308:    LDA  3,0(2)	Save the result in ac 
* Call end charvalue
* TOFF set: -6
309:     LD  4,-5(1)	load lhs variable sum
310:    ADD  3,4,3	op += 
311:     ST  3,-5(1)	Store variable sum
* RETURN
312:     LD  3,-5(1)	Load variable sum
313:    LDA  2,0(3)	Copy result to return register 
314:     LD  3,-1(1)	Load return address 
315:     LD  1,0(1)	Adjust fp 
316:    JMP  7,0(3)	Return 
* TOFF set: -4
* END COMPOUND
* Add standard closing in case there is no return statement
317:    LDC  2,0(6)	Set return value to 0 
318:     LD  3,-1(1)	Load return address 
319:     LD  1,0(1)	Adjust fp 
320:    JMP  7,0(3)	Return 
* END FUNCTION roman2arabic
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
321:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -54
322:    LDC  3,50(6)	load size of array s
323:     ST  3,-2(1)	save size of array s
* Compound Body
* WHILE
324:    LDC  3,1(6)	Load Boolean constant 
325:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -54
* Compound Body
* EXPRESSION
* CALL getstring
327:     ST  1,-54(1)	Store fp in ghost frame for getstring
* TOFF dec: -55
* TOFF dec: -56
* Param 1
328:    LDA  3,-3(1)	Load address of base of array s
329:     ST  3,-56(1)	Push parameter 
* TOFF dec: -57
* Param end getstring
330:    LDA  1,-54(1)	Ghost frame becomes new active frame 
331:    LDA  3,1(7)	Return address in ac 
332:    JMP  7,-294(7)	CALL getstring
333:    LDA  3,0(2)	Save the result in ac 
* Call end getstring
* TOFF set: -54
334:     ST  3,-53(1)	Store variable len
* IF
335:    LDA  3,-3(1)	Load address of base of array s
336:     ST  3,-54(1)	Push left side 
* TOFF dec: -55
337:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -54
338:     LD  4,-54(1)	Pop left into ac1 
339:    SUB  3,4,3	compute location from index 
340:     LD  3,0(3)	Load array element 
341:     ST  3,-54(1)	Push left side 
* TOFF dec: -55
342:    LDC  3,113(6)	Load char constant 
* TOFF inc: -54
343:     LD  4,-54(1)	Pop left into ac1 
344:    TEQ  3,4,3	Op = 
* THEN
* BREAK
346:    JMP  7,-21(7)	break 
345:    JZR  3,1(7)	Jump around the THEN if false [backpatch] 
* END IF
* EXPRESSION
* CALL putstring
347:     ST  1,-54(1)	Store fp in ghost frame for putstring
* TOFF dec: -55
* TOFF dec: -56
* Param 1
348:     LD  3,-53(1)	Load variable len
349:     ST  3,-56(1)	Push parameter 
* TOFF dec: -57
* Param 2
350:    LDA  3,-3(1)	Load address of base of array s
351:     ST  3,-57(1)	Push parameter 
* TOFF dec: -58
* Param end putstring
352:    LDA  1,-54(1)	Ghost frame becomes new active frame 
353:    LDA  3,1(7)	Return address in ac 
354:    JMP  7,-269(7)	CALL putstring
355:    LDA  3,0(2)	Save the result in ac 
* Call end putstring
* TOFF set: -54
* EXPRESSION
* CALL outnl
356:     ST  1,-54(1)	Store fp in ghost frame for outnl
* TOFF dec: -55
* TOFF dec: -56
* Param end outnl
357:    LDA  1,-54(1)	Ghost frame becomes new active frame 
358:    LDA  3,1(7)	Return address in ac 
359:    JMP  7,-326(7)	CALL outnl
360:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -54
* EXPRESSION
* CALL output
361:     ST  1,-54(1)	Store fp in ghost frame for output
* TOFF dec: -55
* TOFF dec: -56
* Param 1
* CALL roman2arabic
362:     ST  1,-56(1)	Store fp in ghost frame for roman2arabic
* TOFF dec: -57
* TOFF dec: -58
* Param 1
363:     LD  3,-53(1)	Load variable len
364:     ST  3,-58(1)	Push parameter 
* TOFF dec: -59
* Param 2
365:    LDA  3,-3(1)	Load address of base of array s
366:     ST  3,-59(1)	Push parameter 
* TOFF dec: -60
* Param end roman2arabic
367:    LDA  1,-56(1)	Ghost frame becomes new active frame 
368:    LDA  3,1(7)	Return address in ac 
369:    JMP  7,-160(7)	CALL roman2arabic
370:    LDA  3,0(2)	Save the result in ac 
* Call end roman2arabic
* TOFF set: -56
371:     ST  3,-56(1)	Push parameter 
* TOFF dec: -57
* Param end output
372:    LDA  1,-54(1)	Ghost frame becomes new active frame 
373:    LDA  3,1(7)	Return address in ac 
374:    JMP  7,-369(7)	CALL output
375:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -54
* EXPRESSION
* CALL outnl
376:     ST  1,-54(1)	Store fp in ghost frame for outnl
* TOFF dec: -55
* TOFF dec: -56
* Param end outnl
377:    LDA  1,-54(1)	Ghost frame becomes new active frame 
378:    LDA  3,1(7)	Return address in ac 
379:    JMP  7,-346(7)	CALL outnl
380:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -54
* TOFF set: -54
* END COMPOUND
381:    JMP  7,-58(7)	go to beginning of loop 
326:    JMP  7,55(7)	Jump past loop [backpatch] 
* END WHILE
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
382:    LDC  2,0(6)	Set return value to 0 
383:     LD  3,-1(1)	Load return address 
384:     LD  1,0(1)	Adjust fp 
385:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,385(7)	Jump to init [backpatch] 
* INIT
386:    LDA  1,0(0)	set first frame at end of globals 
387:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
388:    LDA  3,1(7)	Return address in ac 
389:    JMP  7,-69(7)	Jump to main 
390:   HALT  0,0,0	DONE! 
* END INIT
