* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  queens.c-
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
* FUNCTION printboard
* TOFF set: -3
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -4
* Compound Body
* EXPRESSION
 40:    LDC  3,0(6)	Load integer constant 
 41:     ST  3,-3(1)	Store variable i
* WHILE
 42:     LD  3,-3(1)	Load variable i
 43:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 44:     LD  3,-78(0)	Load variable n
* TOFF inc: -4
 45:     LD  4,-4(1)	Pop left into ac1 
 46:    TLT  3,4,3	Op < 
 47:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -4
* Compound Body
* EXPRESSION
* CALL output
 49:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 50:     LD  3,-2(1)	Load address of base of array col
 51:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
 52:     LD  3,-3(1)	Load variable i
* TOFF inc: -6
 53:     LD  4,-6(1)	Pop left into ac1 
 54:    SUB  3,4,3	compute location from index 
 55:     LD  3,0(3)	Load array element 
 56:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
 57:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 58:    LDA  3,1(7)	Return address in ac 
 59:    JMP  7,-54(7)	CALL output
 60:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
 61:     LD  3,-3(1)	load lhs variable i
 62:    LDA  3,1(3)	increment value of i
 63:     ST  3,-3(1)	Store variable i
* TOFF set: -4
* END COMPOUND
 64:    JMP  7,-23(7)	go to beginning of loop 
 48:    JMP  7,16(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
* CALL outnl
 65:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
 66:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 67:    LDA  3,1(7)	Return address in ac 
 68:    JMP  7,-35(7)	CALL outnl
 69:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
* EXPRESSION
 70:     LD  3,-79(0)	load lhs variable count
 71:    LDA  3,1(3)	increment value of count
 72:     ST  3,-79(0)	Store variable count
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
 73:    LDC  2,0(6)	Set return value to 0 
 74:     LD  3,-1(1)	Load return address 
 75:     LD  1,0(1)	Adjust fp 
 76:    JMP  7,0(3)	Return 
* END FUNCTION printboard
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION try
* TOFF set: -3
 77:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -4
* Compound Body
* IF
 78:     LD  3,-2(1)	Load variable c
 79:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 80:     LD  3,-78(0)	Load variable n
* TOFF inc: -4
 81:     LD  4,-4(1)	Pop left into ac1 
 82:    TEQ  3,4,3	Op = 
* THEN
* EXPRESSION
* CALL printboard
 84:     ST  1,-4(1)	Store fp in ghost frame for printboard
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 85:    LDA  3,-14(0)	Load address of base of array col
 86:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end printboard
 87:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 88:    LDA  3,1(7)	Return address in ac 
 89:    JMP  7,-51(7)	CALL printboard
 90:    LDA  3,0(2)	Save the result in ac 
* Call end printboard
* TOFF set: -4
 83:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* TOFF set: -4
* Compound Body
* EXPRESSION
 92:    LDC  3,0(6)	Load integer constant 
 93:     ST  3,-3(1)	Store variable r
* WHILE
 94:     LD  3,-3(1)	Load variable r
 95:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 96:     LD  3,-78(0)	Load variable n
* TOFF inc: -4
 97:     LD  4,-4(1)	Pop left into ac1 
 98:    TLT  3,4,3	Op < 
 99:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -4
* Compound Body
* IF
101:    LDA  3,-1(0)	Load address of base of array row
102:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
103:     LD  3,-3(1)	Load variable r
* TOFF inc: -4
104:     LD  4,-4(1)	Pop left into ac1 
105:    SUB  3,4,3	compute location from index 
106:     LD  3,0(3)	Load array element 
107:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
108:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -4
109:     LD  4,-4(1)	Pop left into ac1 
110:    TEQ  3,4,3	Op = 
111:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
112:    LDA  3,-27(0)	Load address of base of array diagone
113:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
114:     LD  3,-3(1)	Load variable r
115:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
116:     LD  3,-2(1)	Load variable c
* TOFF inc: -6
117:     LD  4,-6(1)	Pop left into ac1 
118:    ADD  3,4,3	Op + 
* TOFF inc: -5
119:     LD  4,-5(1)	Pop left into ac1 
120:    SUB  3,4,3	compute location from index 
121:     LD  3,0(3)	Load array element 
122:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
123:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -5
124:     LD  4,-5(1)	Pop left into ac1 
125:    TEQ  3,4,3	Op = 
* TOFF inc: -4
126:     LD  4,-4(1)	Pop left into ac1 
127:    AND  3,4,3	Op AND 
128:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
129:    LDA  3,-53(0)	Load address of base of array diagtwo
130:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
131:     LD  3,-3(1)	Load variable r
132:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
133:     LD  3,-78(0)	Load variable n
134:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
135:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -7
136:     LD  4,-7(1)	Pop left into ac1 
137:    SUB  3,4,3	Op - 
* TOFF inc: -6
138:     LD  4,-6(1)	Pop left into ac1 
139:    ADD  3,4,3	Op + 
140:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
141:     LD  3,-2(1)	Load variable c
* TOFF inc: -6
142:     LD  4,-6(1)	Pop left into ac1 
143:    SUB  3,4,3	Op - 
* TOFF inc: -5
144:     LD  4,-5(1)	Pop left into ac1 
145:    SUB  3,4,3	compute location from index 
146:     LD  3,0(3)	Load array element 
147:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
148:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -5
149:     LD  4,-5(1)	Pop left into ac1 
150:    TEQ  3,4,3	Op = 
* TOFF inc: -4
151:     LD  4,-4(1)	Pop left into ac1 
152:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* TOFF set: -4
* Compound Body
* EXPRESSION
154:     LD  3,-3(1)	Load variable r
155:     ST  3,-4(1)	Push index 
* TOFF dec: -5
156:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
157:     LD  4,-4(1)	Pop index 
158:    LDA  5,-1(0)	Load address of base of array row
159:    SUB  5,5,4	Compute offset of value 
160:     ST  3,0(5)	Store variable row
* EXPRESSION
161:     LD  3,-2(1)	Load variable c
162:     ST  3,-4(1)	Push index 
* TOFF dec: -5
163:     LD  3,-3(1)	Load variable r
* TOFF inc: -4
164:     LD  4,-4(1)	Pop index 
165:    LDA  5,-14(0)	Load address of base of array col
166:    SUB  5,5,4	Compute offset of value 
167:     ST  3,0(5)	Store variable col
* EXPRESSION
168:     LD  3,-3(1)	Load variable r
169:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
170:     LD  3,-2(1)	Load variable c
* TOFF inc: -4
171:     LD  4,-4(1)	Pop left into ac1 
172:    ADD  3,4,3	Op + 
173:     ST  3,-4(1)	Push index 
* TOFF dec: -5
174:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
175:     LD  4,-4(1)	Pop index 
176:    LDA  5,-27(0)	Load address of base of array diagone
177:    SUB  5,5,4	Compute offset of value 
178:     ST  3,0(5)	Store variable diagone
* EXPRESSION
179:     LD  3,-3(1)	Load variable r
180:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
181:     LD  3,-78(0)	Load variable n
182:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
183:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -5
184:     LD  4,-5(1)	Pop left into ac1 
185:    SUB  3,4,3	Op - 
* TOFF inc: -4
186:     LD  4,-4(1)	Pop left into ac1 
187:    ADD  3,4,3	Op + 
188:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
189:     LD  3,-2(1)	Load variable c
* TOFF inc: -4
190:     LD  4,-4(1)	Pop left into ac1 
191:    SUB  3,4,3	Op - 
192:     ST  3,-4(1)	Push index 
* TOFF dec: -5
193:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
194:     LD  4,-4(1)	Pop index 
195:    LDA  5,-53(0)	Load address of base of array diagtwo
196:    SUB  5,5,4	Compute offset of value 
197:     ST  3,0(5)	Store variable diagtwo
* EXPRESSION
* CALL try
198:     ST  1,-4(1)	Store fp in ghost frame for try
* TOFF dec: -5
* TOFF dec: -6
* Param 1
199:     LD  3,-2(1)	Load variable c
200:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
201:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -6
202:     LD  4,-6(1)	Pop left into ac1 
203:    ADD  3,4,3	Op + 
204:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end try
205:    LDA  1,-4(1)	Ghost frame becomes new active frame 
206:    LDA  3,1(7)	Return address in ac 
207:    JMP  7,-131(7)	CALL try
208:    LDA  3,0(2)	Save the result in ac 
* Call end try
* TOFF set: -4
* EXPRESSION
209:     LD  3,-3(1)	Load variable r
210:     ST  3,-4(1)	Push index 
* TOFF dec: -5
211:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -4
212:     LD  4,-4(1)	Pop index 
213:    LDA  5,-1(0)	Load address of base of array row
214:    SUB  5,5,4	Compute offset of value 
215:     ST  3,0(5)	Store variable row
* EXPRESSION
216:     LD  3,-3(1)	Load variable r
217:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
218:     LD  3,-2(1)	Load variable c
* TOFF inc: -4
219:     LD  4,-4(1)	Pop left into ac1 
220:    ADD  3,4,3	Op + 
221:     ST  3,-4(1)	Push index 
* TOFF dec: -5
222:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -4
223:     LD  4,-4(1)	Pop index 
224:    LDA  5,-27(0)	Load address of base of array diagone
225:    SUB  5,5,4	Compute offset of value 
226:     ST  3,0(5)	Store variable diagone
* EXPRESSION
227:     LD  3,-3(1)	Load variable r
228:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
229:     LD  3,-78(0)	Load variable n
230:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
231:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -5
232:     LD  4,-5(1)	Pop left into ac1 
233:    SUB  3,4,3	Op - 
* TOFF inc: -4
234:     LD  4,-4(1)	Pop left into ac1 
235:    ADD  3,4,3	Op + 
236:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
237:     LD  3,-2(1)	Load variable c
* TOFF inc: -4
238:     LD  4,-4(1)	Pop left into ac1 
239:    SUB  3,4,3	Op - 
240:     ST  3,-4(1)	Push index 
* TOFF dec: -5
241:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -4
242:     LD  4,-4(1)	Pop index 
243:    LDA  5,-53(0)	Load address of base of array diagtwo
244:    SUB  5,5,4	Compute offset of value 
245:     ST  3,0(5)	Store variable diagtwo
* TOFF set: -4
* END COMPOUND
153:    JZR  3,92(7)	Jump around the THEN if false [backpatch] 
* END IF
* EXPRESSION
246:     LD  3,-3(1)	load lhs variable r
247:    LDA  3,1(3)	increment value of r
248:     ST  3,-3(1)	Store variable r
* TOFF set: -4
* END COMPOUND
249:    JMP  7,-156(7)	go to beginning of loop 
100:    JMP  7,149(7)	Jump past loop [backpatch] 
* END WHILE
* TOFF set: -4
* END COMPOUND
 91:    JMP  7,158(7)	Jump around the ELSE [backpatch] 
* END IF
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
250:    LDC  2,0(6)	Set return value to 0 
251:     LD  3,-1(1)	Load return address 
252:     LD  1,0(1)	Adjust fp 
253:    JMP  7,0(3)	Return 
* END FUNCTION try
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION solve
* TOFF set: -3
254:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
255:     LD  3,-2(1)	Load variable num
256:     ST  3,-78(0)	Store variable n
* EXPRESSION
257:    LDC  3,0(6)	Load integer constant 
258:     ST  3,-79(0)	Store variable count
* EXPRESSION
* CALL try
259:     ST  1,-3(1)	Store fp in ghost frame for try
* TOFF dec: -4
* TOFF dec: -5
* Param 1
260:    LDC  3,0(6)	Load integer constant 
261:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end try
262:    LDA  1,-3(1)	Ghost frame becomes new active frame 
263:    LDA  3,1(7)	Return address in ac 
264:    JMP  7,-188(7)	CALL try
265:    LDA  3,0(2)	Save the result in ac 
* Call end try
* TOFF set: -3
* RETURN
266:     LD  3,-79(0)	Load variable count
267:    LDA  2,0(3)	Copy result to return register 
268:     LD  3,-1(1)	Load return address 
269:     LD  1,0(1)	Adjust fp 
270:    JMP  7,0(3)	Return 
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
271:    LDC  2,0(6)	Set return value to 0 
272:     LD  3,-1(1)	Load return address 
273:     LD  1,0(1)	Adjust fp 
274:    JMP  7,0(3)	Return 
* END FUNCTION solve
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
275:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* WHILE
* CALL input
276:     ST  1,-3(1)	Store fp in ghost frame for input
* TOFF dec: -4
* TOFF dec: -5
* Param end input
277:    LDA  1,-3(1)	Ghost frame becomes new active frame 
278:    LDA  3,1(7)	Return address in ac 
279:    JMP  7,-279(7)	CALL input
280:    LDA  3,0(2)	Save the result in ac 
* Call end input
* TOFF set: -3
281:     ST  3,-2(1)	Store variable num
282:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
283:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -3
284:     LD  4,-3(1)	Pop left into ac1 
285:    TGT  3,4,3	Op > 
286:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
* CALL output
288:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
* CALL solve
289:     ST  1,-5(1)	Store fp in ghost frame for solve
* TOFF dec: -6
* TOFF dec: -7
* Param 1
290:     LD  3,-2(1)	Load variable num
291:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end solve
292:    LDA  1,-5(1)	Ghost frame becomes new active frame 
293:    LDA  3,1(7)	Return address in ac 
294:    JMP  7,-41(7)	CALL solve
295:    LDA  3,0(2)	Save the result in ac 
* Call end solve
* TOFF set: -5
296:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
297:    LDA  1,-3(1)	Ghost frame becomes new active frame 
298:    LDA  3,1(7)	Return address in ac 
299:    JMP  7,-294(7)	CALL output
300:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL outnl
301:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
302:    LDA  1,-3(1)	Ghost frame becomes new active frame 
303:    LDA  3,1(7)	Return address in ac 
304:    JMP  7,-271(7)	CALL outnl
305:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* TOFF set: -3
* END COMPOUND
306:    JMP  7,-31(7)	go to beginning of loop 
287:    JMP  7,19(7)	Jump past loop [backpatch] 
* END WHILE
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
307:    LDC  2,0(6)	Set return value to 0 
308:     LD  3,-1(1)	Load return address 
309:     LD  1,0(1)	Adjust fp 
310:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,310(7)	Jump to init [backpatch] 
* INIT
311:    LDA  1,-80(0)	set first frame at end of globals 
312:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
313:    LDC  3,12(6)	load size of array col
314:     ST  3,-13(0)	save size of array col
315:    LDC  3,25(6)	load size of array diagone
316:     ST  3,-26(0)	save size of array diagone
317:    LDC  3,25(6)	load size of array diagtwo
318:     ST  3,-52(0)	save size of array diagtwo
319:    LDC  3,12(6)	load size of array row
320:     ST  3,0(0)	save size of array row
* END INIT GLOBALS AND STATICS
321:    LDA  3,1(7)	Return address in ac 
322:    JMP  7,-48(7)	Jump to main 
323:   HALT  0,0,0	DONE! 
* END INIT
