* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  v03.c-
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
* FUNCTION main
* TOFF set: -2
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -11
 40:    LDC  3,3(6)	load size of array a
 41:     ST  3,-2(1)	save size of array a
  1:    LIT  "arm"
 42:    LDA  3,-1(0)	Load address of char array 
 43:    LDA  4,-3(1)	address of lhs 
 44:     LD  5,1(3)	size of rhs 
 45:     LD  6,1(4)	size of lhs 
 46:    SWP  5,6,6	pick smallest size 
 47:    MOV  4,3,5	array op = 
 48:    LDC  3,4(6)	load size of array b
 49:     ST  3,-6(1)	save size of array b
  5:    LIT  "army"
 50:    LDA  3,-5(0)	Load address of char array 
 51:    LDA  4,-7(1)	address of lhs 
 52:     LD  5,1(3)	size of rhs 
 53:     LD  6,1(4)	size of lhs 
 54:    SWP  5,6,6	pick smallest size 
 55:    MOV  4,3,5	array op = 
* Compound Body
* EXPRESSION
* CALL outputb
 56:     ST  1,-11(1)	Store fp in ghost frame for outputb
* TOFF dec: -12
* TOFF dec: -13
* Param 1
 57:    LDA  3,-3(1)	Load address of base of array a
 58:     ST  3,-13(1)	Push left side 
* TOFF dec: -14
 59:    LDA  3,-7(1)	Load address of base of array b
* TOFF inc: -13
 60:     LD  4,-13(1)	Pop left into ac1 
 61:     LD  5,1(3)	AC2 <- |RHS| 
 62:     LD  6,1(4)	AC3 <- |LHS| 
 63:    LDA  2,0(5)	R2 <- |RHS| 
 64:    SWP  5,6,6	pick smallest size 
 65:     LD  6,1(4)	AC3 <- |LHS| 
 66:     CO  4,3,5	setup array compare  LHS vs RHS 
 67:    TNE  5,4,3	if not equal then test (AC1, AC) 
 68:    JNZ  5,2,7	jump not equal 
 69:    LDA  3,0(2)	AC1 <- |RHS| 
 70:    LDA  4,0(6)	AC <- |LHS| 
 71:    TEQ  3,4,3	Op = 
 72:     ST  3,-13(1)	Push parameter 
* TOFF dec: -14
* Param end outputb
 73:    LDA  1,-11(1)	Ghost frame becomes new active frame 
 74:    LDA  3,1(7)	Return address in ac 
 75:    JMP  7,-59(7)	CALL outputb
 76:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -11
* EXPRESSION
* CALL outputb
 77:     ST  1,-11(1)	Store fp in ghost frame for outputb
* TOFF dec: -12
* TOFF dec: -13
* Param 1
 78:    LDA  3,-7(1)	Load address of base of array b
 79:     ST  3,-13(1)	Push left side 
* TOFF dec: -14
 80:    LDA  3,-3(1)	Load address of base of array a
* TOFF inc: -13
 81:     LD  4,-13(1)	Pop left into ac1 
 82:     LD  5,1(3)	AC2 <- |RHS| 
 83:     LD  6,1(4)	AC3 <- |LHS| 
 84:    LDA  2,0(5)	R2 <- |RHS| 
 85:    SWP  5,6,6	pick smallest size 
 86:     LD  6,1(4)	AC3 <- |LHS| 
 87:     CO  4,3,5	setup array compare  LHS vs RHS 
 88:    TNE  5,4,3	if not equal then test (AC1, AC) 
 89:    JNZ  5,2,7	jump not equal 
 90:    LDA  3,0(2)	AC1 <- |RHS| 
 91:    LDA  4,0(6)	AC <- |LHS| 
 92:    TEQ  3,4,3	Op = 
 93:     ST  3,-13(1)	Push parameter 
* TOFF dec: -14
* Param end outputb
 94:    LDA  1,-11(1)	Ghost frame becomes new active frame 
 95:    LDA  3,1(7)	Return address in ac 
 96:    JMP  7,-80(7)	CALL outputb
 97:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -11
* EXPRESSION
* CALL outnl
 98:     ST  1,-11(1)	Store fp in ghost frame for outnl
* TOFF dec: -12
* TOFF dec: -13
* Param end outnl
 99:    LDA  1,-11(1)	Ghost frame becomes new active frame 
100:    LDA  3,1(7)	Return address in ac 
101:    JMP  7,-68(7)	CALL outnl
102:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -11
* EXPRESSION
* CALL outputb
103:     ST  1,-11(1)	Store fp in ghost frame for outputb
* TOFF dec: -12
* TOFF dec: -13
* Param 1
104:    LDA  3,-3(1)	Load address of base of array a
105:     ST  3,-13(1)	Push left side 
* TOFF dec: -14
106:    LDA  3,-7(1)	Load address of base of array b
* TOFF inc: -13
107:     LD  4,-13(1)	Pop left into ac1 
108:     LD  5,1(3)	AC2 <- |RHS| 
109:     LD  6,1(4)	AC3 <- |LHS| 
110:    LDA  2,0(5)	R2 <- |RHS| 
111:    SWP  5,6,6	pick smallest size 
112:     LD  6,1(4)	AC3 <- |LHS| 
113:     CO  4,3,5	setup array compare  LHS vs RHS 
114:    TNE  5,4,3	if not equal then test (AC1, AC) 
115:    JNZ  5,2,7	jump not equal 
116:    LDA  3,0(2)	AC1 <- |RHS| 
117:    LDA  4,0(6)	AC <- |LHS| 
118:    TNE  3,4,3	Op >< 
119:     ST  3,-13(1)	Push parameter 
* TOFF dec: -14
* Param end outputb
120:    LDA  1,-11(1)	Ghost frame becomes new active frame 
121:    LDA  3,1(7)	Return address in ac 
122:    JMP  7,-106(7)	CALL outputb
123:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -11
* EXPRESSION
* CALL outputb
124:     ST  1,-11(1)	Store fp in ghost frame for outputb
* TOFF dec: -12
* TOFF dec: -13
* Param 1
125:    LDA  3,-7(1)	Load address of base of array b
126:     ST  3,-13(1)	Push left side 
* TOFF dec: -14
127:    LDA  3,-3(1)	Load address of base of array a
* TOFF inc: -13
128:     LD  4,-13(1)	Pop left into ac1 
129:     LD  5,1(3)	AC2 <- |RHS| 
130:     LD  6,1(4)	AC3 <- |LHS| 
131:    LDA  2,0(5)	R2 <- |RHS| 
132:    SWP  5,6,6	pick smallest size 
133:     LD  6,1(4)	AC3 <- |LHS| 
134:     CO  4,3,5	setup array compare  LHS vs RHS 
135:    TNE  5,4,3	if not equal then test (AC1, AC) 
136:    JNZ  5,2,7	jump not equal 
137:    LDA  3,0(2)	AC1 <- |RHS| 
138:    LDA  4,0(6)	AC <- |LHS| 
139:    TNE  3,4,3	Op >< 
140:     ST  3,-13(1)	Push parameter 
* TOFF dec: -14
* Param end outputb
141:    LDA  1,-11(1)	Ghost frame becomes new active frame 
142:    LDA  3,1(7)	Return address in ac 
143:    JMP  7,-127(7)	CALL outputb
144:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -11
* EXPRESSION
* CALL outnl
145:     ST  1,-11(1)	Store fp in ghost frame for outnl
* TOFF dec: -12
* TOFF dec: -13
* Param end outnl
146:    LDA  1,-11(1)	Ghost frame becomes new active frame 
147:    LDA  3,1(7)	Return address in ac 
148:    JMP  7,-115(7)	CALL outnl
149:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -11
* EXPRESSION
* CALL outputb
150:     ST  1,-11(1)	Store fp in ghost frame for outputb
* TOFF dec: -12
* TOFF dec: -13
* Param 1
151:    LDA  3,-3(1)	Load address of base of array a
152:     ST  3,-13(1)	Push left side 
* TOFF dec: -14
153:    LDA  3,-7(1)	Load address of base of array b
* TOFF inc: -13
154:     LD  4,-13(1)	Pop left into ac1 
155:     LD  5,1(3)	AC2 <- |RHS| 
156:     LD  6,1(4)	AC3 <- |LHS| 
157:    LDA  2,0(5)	R2 <- |RHS| 
158:    SWP  5,6,6	pick smallest size 
159:     LD  6,1(4)	AC3 <- |LHS| 
160:     CO  4,3,5	setup array compare  LHS vs RHS 
161:    TNE  5,4,3	if not equal then test (AC1, AC) 
162:    JNZ  5,2,7	jump not equal 
163:    LDA  3,0(2)	AC1 <- |RHS| 
164:    LDA  4,0(6)	AC <- |LHS| 
165:    TGT  3,4,3	Op > 
166:     ST  3,-13(1)	Push parameter 
* TOFF dec: -14
* Param end outputb
167:    LDA  1,-11(1)	Ghost frame becomes new active frame 
168:    LDA  3,1(7)	Return address in ac 
169:    JMP  7,-153(7)	CALL outputb
170:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -11
* EXPRESSION
* CALL outputb
171:     ST  1,-11(1)	Store fp in ghost frame for outputb
* TOFF dec: -12
* TOFF dec: -13
* Param 1
172:    LDA  3,-7(1)	Load address of base of array b
173:     ST  3,-13(1)	Push left side 
* TOFF dec: -14
174:    LDA  3,-3(1)	Load address of base of array a
* TOFF inc: -13
175:     LD  4,-13(1)	Pop left into ac1 
176:     LD  5,1(3)	AC2 <- |RHS| 
177:     LD  6,1(4)	AC3 <- |LHS| 
178:    LDA  2,0(5)	R2 <- |RHS| 
179:    SWP  5,6,6	pick smallest size 
180:     LD  6,1(4)	AC3 <- |LHS| 
181:     CO  4,3,5	setup array compare  LHS vs RHS 
182:    TNE  5,4,3	if not equal then test (AC1, AC) 
183:    JNZ  5,2,7	jump not equal 
184:    LDA  3,0(2)	AC1 <- |RHS| 
185:    LDA  4,0(6)	AC <- |LHS| 
186:    TGT  3,4,3	Op > 
187:     ST  3,-13(1)	Push parameter 
* TOFF dec: -14
* Param end outputb
188:    LDA  1,-11(1)	Ghost frame becomes new active frame 
189:    LDA  3,1(7)	Return address in ac 
190:    JMP  7,-174(7)	CALL outputb
191:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -11
* EXPRESSION
* CALL outnl
192:     ST  1,-11(1)	Store fp in ghost frame for outnl
* TOFF dec: -12
* TOFF dec: -13
* Param end outnl
193:    LDA  1,-11(1)	Ghost frame becomes new active frame 
194:    LDA  3,1(7)	Return address in ac 
195:    JMP  7,-162(7)	CALL outnl
196:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -11
* EXPRESSION
* CALL outputb
197:     ST  1,-11(1)	Store fp in ghost frame for outputb
* TOFF dec: -12
* TOFF dec: -13
* Param 1
198:    LDA  3,-3(1)	Load address of base of array a
199:     ST  3,-13(1)	Push left side 
* TOFF dec: -14
200:    LDA  3,-7(1)	Load address of base of array b
* TOFF inc: -13
201:     LD  4,-13(1)	Pop left into ac1 
202:     LD  5,1(3)	AC2 <- |RHS| 
203:     LD  6,1(4)	AC3 <- |LHS| 
204:    LDA  2,0(5)	R2 <- |RHS| 
205:    SWP  5,6,6	pick smallest size 
206:     LD  6,1(4)	AC3 <- |LHS| 
207:     CO  4,3,5	setup array compare  LHS vs RHS 
208:    TNE  5,4,3	if not equal then test (AC1, AC) 
209:    JNZ  5,2,7	jump not equal 
210:    LDA  3,0(2)	AC1 <- |RHS| 
211:    LDA  4,0(6)	AC <- |LHS| 
212:    TGE  3,4,3	Op >= 
213:     ST  3,-13(1)	Push parameter 
* TOFF dec: -14
* Param end outputb
214:    LDA  1,-11(1)	Ghost frame becomes new active frame 
215:    LDA  3,1(7)	Return address in ac 
216:    JMP  7,-200(7)	CALL outputb
217:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -11
* EXPRESSION
* CALL outputb
218:     ST  1,-11(1)	Store fp in ghost frame for outputb
* TOFF dec: -12
* TOFF dec: -13
* Param 1
219:    LDA  3,-7(1)	Load address of base of array b
220:     ST  3,-13(1)	Push left side 
* TOFF dec: -14
221:    LDA  3,-3(1)	Load address of base of array a
* TOFF inc: -13
222:     LD  4,-13(1)	Pop left into ac1 
223:     LD  5,1(3)	AC2 <- |RHS| 
224:     LD  6,1(4)	AC3 <- |LHS| 
225:    LDA  2,0(5)	R2 <- |RHS| 
226:    SWP  5,6,6	pick smallest size 
227:     LD  6,1(4)	AC3 <- |LHS| 
228:     CO  4,3,5	setup array compare  LHS vs RHS 
229:    TNE  5,4,3	if not equal then test (AC1, AC) 
230:    JNZ  5,2,7	jump not equal 
231:    LDA  3,0(2)	AC1 <- |RHS| 
232:    LDA  4,0(6)	AC <- |LHS| 
233:    TGE  3,4,3	Op >= 
234:     ST  3,-13(1)	Push parameter 
* TOFF dec: -14
* Param end outputb
235:    LDA  1,-11(1)	Ghost frame becomes new active frame 
236:    LDA  3,1(7)	Return address in ac 
237:    JMP  7,-221(7)	CALL outputb
238:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -11
* EXPRESSION
* CALL outnl
239:     ST  1,-11(1)	Store fp in ghost frame for outnl
* TOFF dec: -12
* TOFF dec: -13
* Param end outnl
240:    LDA  1,-11(1)	Ghost frame becomes new active frame 
241:    LDA  3,1(7)	Return address in ac 
242:    JMP  7,-209(7)	CALL outnl
243:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -11
* EXPRESSION
* CALL outputb
244:     ST  1,-11(1)	Store fp in ghost frame for outputb
* TOFF dec: -12
* TOFF dec: -13
* Param 1
245:    LDA  3,-3(1)	Load address of base of array a
246:     ST  3,-13(1)	Push left side 
* TOFF dec: -14
247:    LDA  3,-7(1)	Load address of base of array b
* TOFF inc: -13
248:     LD  4,-13(1)	Pop left into ac1 
249:     LD  5,1(3)	AC2 <- |RHS| 
250:     LD  6,1(4)	AC3 <- |LHS| 
251:    LDA  2,0(5)	R2 <- |RHS| 
252:    SWP  5,6,6	pick smallest size 
253:     LD  6,1(4)	AC3 <- |LHS| 
254:     CO  4,3,5	setup array compare  LHS vs RHS 
255:    TNE  5,4,3	if not equal then test (AC1, AC) 
256:    JNZ  5,2,7	jump not equal 
257:    LDA  3,0(2)	AC1 <- |RHS| 
258:    LDA  4,0(6)	AC <- |LHS| 
259:    TLT  3,4,3	Op < 
260:     ST  3,-13(1)	Push parameter 
* TOFF dec: -14
* Param end outputb
261:    LDA  1,-11(1)	Ghost frame becomes new active frame 
262:    LDA  3,1(7)	Return address in ac 
263:    JMP  7,-247(7)	CALL outputb
264:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -11
* EXPRESSION
* CALL outputb
265:     ST  1,-11(1)	Store fp in ghost frame for outputb
* TOFF dec: -12
* TOFF dec: -13
* Param 1
266:    LDA  3,-7(1)	Load address of base of array b
267:     ST  3,-13(1)	Push left side 
* TOFF dec: -14
268:    LDA  3,-3(1)	Load address of base of array a
* TOFF inc: -13
269:     LD  4,-13(1)	Pop left into ac1 
270:     LD  5,1(3)	AC2 <- |RHS| 
271:     LD  6,1(4)	AC3 <- |LHS| 
272:    LDA  2,0(5)	R2 <- |RHS| 
273:    SWP  5,6,6	pick smallest size 
274:     LD  6,1(4)	AC3 <- |LHS| 
275:     CO  4,3,5	setup array compare  LHS vs RHS 
276:    TNE  5,4,3	if not equal then test (AC1, AC) 
277:    JNZ  5,2,7	jump not equal 
278:    LDA  3,0(2)	AC1 <- |RHS| 
279:    LDA  4,0(6)	AC <- |LHS| 
280:    TLT  3,4,3	Op < 
281:     ST  3,-13(1)	Push parameter 
* TOFF dec: -14
* Param end outputb
282:    LDA  1,-11(1)	Ghost frame becomes new active frame 
283:    LDA  3,1(7)	Return address in ac 
284:    JMP  7,-268(7)	CALL outputb
285:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -11
* EXPRESSION
* CALL outnl
286:     ST  1,-11(1)	Store fp in ghost frame for outnl
* TOFF dec: -12
* TOFF dec: -13
* Param end outnl
287:    LDA  1,-11(1)	Ghost frame becomes new active frame 
288:    LDA  3,1(7)	Return address in ac 
289:    JMP  7,-256(7)	CALL outnl
290:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -11
* EXPRESSION
* CALL outputb
291:     ST  1,-11(1)	Store fp in ghost frame for outputb
* TOFF dec: -12
* TOFF dec: -13
* Param 1
292:    LDA  3,-3(1)	Load address of base of array a
293:     ST  3,-13(1)	Push left side 
* TOFF dec: -14
294:    LDA  3,-7(1)	Load address of base of array b
* TOFF inc: -13
295:     LD  4,-13(1)	Pop left into ac1 
296:     LD  5,1(3)	AC2 <- |RHS| 
297:     LD  6,1(4)	AC3 <- |LHS| 
298:    LDA  2,0(5)	R2 <- |RHS| 
299:    SWP  5,6,6	pick smallest size 
300:     LD  6,1(4)	AC3 <- |LHS| 
301:     CO  4,3,5	setup array compare  LHS vs RHS 
302:    TNE  5,4,3	if not equal then test (AC1, AC) 
303:    JNZ  5,2,7	jump not equal 
304:    LDA  3,0(2)	AC1 <- |RHS| 
305:    LDA  4,0(6)	AC <- |LHS| 
306:    TLE  3,4,3	Op <= 
307:     ST  3,-13(1)	Push parameter 
* TOFF dec: -14
* Param end outputb
308:    LDA  1,-11(1)	Ghost frame becomes new active frame 
309:    LDA  3,1(7)	Return address in ac 
310:    JMP  7,-294(7)	CALL outputb
311:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -11
* EXPRESSION
* CALL outputb
312:     ST  1,-11(1)	Store fp in ghost frame for outputb
* TOFF dec: -12
* TOFF dec: -13
* Param 1
313:    LDA  3,-7(1)	Load address of base of array b
314:     ST  3,-13(1)	Push left side 
* TOFF dec: -14
315:    LDA  3,-3(1)	Load address of base of array a
* TOFF inc: -13
316:     LD  4,-13(1)	Pop left into ac1 
317:     LD  5,1(3)	AC2 <- |RHS| 
318:     LD  6,1(4)	AC3 <- |LHS| 
319:    LDA  2,0(5)	R2 <- |RHS| 
320:    SWP  5,6,6	pick smallest size 
321:     LD  6,1(4)	AC3 <- |LHS| 
322:     CO  4,3,5	setup array compare  LHS vs RHS 
323:    TNE  5,4,3	if not equal then test (AC1, AC) 
324:    JNZ  5,2,7	jump not equal 
325:    LDA  3,0(2)	AC1 <- |RHS| 
326:    LDA  4,0(6)	AC <- |LHS| 
327:    TLE  3,4,3	Op <= 
328:     ST  3,-13(1)	Push parameter 
* TOFF dec: -14
* Param end outputb
329:    LDA  1,-11(1)	Ghost frame becomes new active frame 
330:    LDA  3,1(7)	Return address in ac 
331:    JMP  7,-315(7)	CALL outputb
332:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -11
* EXPRESSION
* CALL outnl
333:     ST  1,-11(1)	Store fp in ghost frame for outnl
* TOFF dec: -12
* TOFF dec: -13
* Param end outnl
334:    LDA  1,-11(1)	Ghost frame becomes new active frame 
335:    LDA  3,1(7)	Return address in ac 
336:    JMP  7,-303(7)	CALL outnl
337:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -11
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
338:    LDC  2,0(6)	Set return value to 0 
339:     LD  3,-1(1)	Load return address 
340:     LD  1,0(1)	Adjust fp 
341:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,341(7)	Jump to init [backpatch] 
* INIT
342:    LDA  1,-9(0)	set first frame at end of globals 
343:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
344:    LDA  3,1(7)	Return address in ac 
345:    JMP  7,-307(7)	Jump to main 
346:   HALT  0,0,0	DONE! 
* END INIT
