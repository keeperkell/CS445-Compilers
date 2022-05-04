* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  d05.c-
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
* TOFF set: -5
* Compound Body
* EXPRESSION
 40:    LDC  3,213(6)	Load integer constant 
 41:     ST  3,-2(1)	Store variable a
* EXPRESSION
 42:    LDC  3,11(6)	Load integer constant 
 43:     ST  3,-3(1)	Store variable b
* EXPRESSION
 44:    LDC  3,4133(6)	Load integer constant 
 45:     ST  3,-4(1)	Store variable c
* EXPRESSION
* CALL outputb
 46:     ST  1,-5(1)	Store fp in ghost frame for outputb
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 47:     LD  3,-2(1)	Load variable a
 48:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
 49:     LD  3,-3(1)	Load variable b
* TOFF inc: -7
 50:     LD  4,-7(1)	Pop left into ac1 
 51:    TGT  3,4,3	Op > 
 52:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
 53:     LD  3,-3(1)	Load variable b
 54:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
 55:     LD  3,-4(1)	Load variable c
* TOFF inc: -8
 56:     LD  4,-8(1)	Pop left into ac1 
 57:    TLE  3,4,3	Op <= 
 58:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
 59:     LD  3,-4(1)	Load variable c
 60:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
 61:     LD  3,-2(1)	Load variable a
* TOFF inc: -9
 62:     LD  4,-9(1)	Pop left into ac1 
 63:    TGE  3,4,3	Op >= 
* TOFF inc: -8
 64:     LD  4,-8(1)	Pop left into ac1 
 65:    AND  3,4,3	Op AND 
* TOFF inc: -7
 66:     LD  4,-7(1)	Pop left into ac1 
 67:     OR  3,4,3	Op OR 
 68:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end outputb
 69:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 70:    LDA  3,1(7)	Return address in ac 
 71:    JMP  7,-55(7)	CALL outputb
 72:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -5
* EXPRESSION
* CALL outputb
 73:     ST  1,-5(1)	Store fp in ghost frame for outputb
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 74:     LD  3,-2(1)	Load variable a
 75:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
 76:     LD  3,-3(1)	Load variable b
* TOFF inc: -7
 77:     LD  4,-7(1)	Pop left into ac1 
 78:    TGT  3,4,3	Op > 
 79:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
 80:     LD  3,-3(1)	Load variable b
 81:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
 82:     LD  3,-4(1)	Load variable c
* TOFF inc: -8
 83:     LD  4,-8(1)	Pop left into ac1 
 84:    TLE  3,4,3	Op <= 
* TOFF inc: -7
 85:     LD  4,-7(1)	Pop left into ac1 
 86:    AND  3,4,3	Op AND 
 87:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
 88:     LD  3,-4(1)	Load variable c
 89:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
 90:     LD  3,-2(1)	Load variable a
* TOFF inc: -8
 91:     LD  4,-8(1)	Pop left into ac1 
 92:    TGE  3,4,3	Op >= 
* TOFF inc: -7
 93:     LD  4,-7(1)	Pop left into ac1 
 94:     OR  3,4,3	Op OR 
 95:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end outputb
 96:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 97:    LDA  3,1(7)	Return address in ac 
 98:    JMP  7,-82(7)	CALL outputb
 99:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -5
* EXPRESSION
* CALL outputb
100:     ST  1,-5(1)	Store fp in ghost frame for outputb
* TOFF dec: -6
* TOFF dec: -7
* Param 1
101:     LD  3,-2(1)	Load variable a
102:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
103:     LD  3,-3(1)	Load variable b
* TOFF inc: -7
104:     LD  4,-7(1)	Pop left into ac1 
105:    TGT  3,4,3	Op > 
106:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
107:     LD  3,-3(1)	Load variable b
108:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
109:     LD  3,-4(1)	Load variable c
* TOFF inc: -8
110:     LD  4,-8(1)	Pop left into ac1 
111:    TLE  3,4,3	Op <= 
* TOFF inc: -7
112:     LD  4,-7(1)	Pop left into ac1 
113:    AND  3,4,3	Op AND 
114:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
115:     LD  3,-4(1)	Load variable c
116:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
117:     LD  3,-2(1)	Load variable a
* TOFF inc: -8
118:     LD  4,-8(1)	Pop left into ac1 
119:    TGE  3,4,3	Op >= 
120:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
121:     LD  3,-4(1)	Load variable c
122:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
123:     LD  3,-2(1)	Load variable a
* TOFF inc: -9
124:     LD  4,-9(1)	Pop left into ac1 
125:    TGE  3,4,3	Op >= 
* TOFF inc: -8
126:     LD  4,-8(1)	Pop left into ac1 
127:    AND  3,4,3	Op AND 
* TOFF inc: -7
128:     LD  4,-7(1)	Pop left into ac1 
129:     OR  3,4,3	Op OR 
130:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end outputb
131:    LDA  1,-5(1)	Ghost frame becomes new active frame 
132:    LDA  3,1(7)	Return address in ac 
133:    JMP  7,-117(7)	CALL outputb
134:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -5
* EXPRESSION
* CALL outputb
135:     ST  1,-5(1)	Store fp in ghost frame for outputb
* TOFF dec: -6
* TOFF dec: -7
* Param 1
136:     LD  3,-2(1)	Load variable a
137:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
138:     LD  3,-3(1)	Load variable b
* TOFF inc: -7
139:     LD  4,-7(1)	Pop left into ac1 
140:    TGT  3,4,3	Op > 
141:    LDC  4,1(6)	Load 1 
142:    XOR  3,3,4	Op XOR to get logical not 
143:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
144:     LD  3,-3(1)	Load variable b
145:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
146:     LD  3,-4(1)	Load variable c
* TOFF inc: -8
147:     LD  4,-8(1)	Pop left into ac1 
148:    TLE  3,4,3	Op <= 
149:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
150:     LD  3,-4(1)	Load variable c
151:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
152:     LD  3,-2(1)	Load variable a
* TOFF inc: -9
153:     LD  4,-9(1)	Pop left into ac1 
154:    TGE  3,4,3	Op >= 
* TOFF inc: -8
155:     LD  4,-8(1)	Pop left into ac1 
156:    AND  3,4,3	Op AND 
* TOFF inc: -7
157:     LD  4,-7(1)	Pop left into ac1 
158:     OR  3,4,3	Op OR 
159:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end outputb
160:    LDA  1,-5(1)	Ghost frame becomes new active frame 
161:    LDA  3,1(7)	Return address in ac 
162:    JMP  7,-146(7)	CALL outputb
163:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -5
* EXPRESSION
* CALL outputb
164:     ST  1,-5(1)	Store fp in ghost frame for outputb
* TOFF dec: -6
* TOFF dec: -7
* Param 1
165:     LD  3,-2(1)	Load variable a
166:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
167:     LD  3,-3(1)	Load variable b
* TOFF inc: -7
168:     LD  4,-7(1)	Pop left into ac1 
169:    TGT  3,4,3	Op > 
170:    LDC  4,1(6)	Load 1 
171:    XOR  3,3,4	Op XOR to get logical not 
172:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
173:     LD  3,-3(1)	Load variable b
174:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
175:     LD  3,-4(1)	Load variable c
* TOFF inc: -8
176:     LD  4,-8(1)	Pop left into ac1 
177:    TLE  3,4,3	Op <= 
* TOFF inc: -7
178:     LD  4,-7(1)	Pop left into ac1 
179:    AND  3,4,3	Op AND 
180:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
181:     LD  3,-4(1)	Load variable c
182:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
183:     LD  3,-2(1)	Load variable a
* TOFF inc: -8
184:     LD  4,-8(1)	Pop left into ac1 
185:    TGE  3,4,3	Op >= 
* TOFF inc: -7
186:     LD  4,-7(1)	Pop left into ac1 
187:     OR  3,4,3	Op OR 
188:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end outputb
189:    LDA  1,-5(1)	Ghost frame becomes new active frame 
190:    LDA  3,1(7)	Return address in ac 
191:    JMP  7,-175(7)	CALL outputb
192:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -5
* EXPRESSION
* CALL outnl
193:     ST  1,-5(1)	Store fp in ghost frame for outnl
* TOFF dec: -6
* TOFF dec: -7
* Param end outnl
194:    LDA  1,-5(1)	Ghost frame becomes new active frame 
195:    LDA  3,1(7)	Return address in ac 
196:    JMP  7,-163(7)	CALL outnl
197:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -5
* EXPRESSION
198:    LDC  3,213(6)	Load integer constant 
199:     ST  3,-3(1)	Store variable b
* EXPRESSION
200:    LDC  3,11(6)	Load integer constant 
201:     ST  3,-4(1)	Store variable c
* EXPRESSION
202:    LDC  3,4133(6)	Load integer constant 
203:     ST  3,-2(1)	Store variable a
* EXPRESSION
* CALL outputb
204:     ST  1,-5(1)	Store fp in ghost frame for outputb
* TOFF dec: -6
* TOFF dec: -7
* Param 1
205:     LD  3,-2(1)	Load variable a
206:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
207:     LD  3,-3(1)	Load variable b
* TOFF inc: -7
208:     LD  4,-7(1)	Pop left into ac1 
209:    TGT  3,4,3	Op > 
210:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
211:     LD  3,-3(1)	Load variable b
212:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
213:     LD  3,-4(1)	Load variable c
* TOFF inc: -8
214:     LD  4,-8(1)	Pop left into ac1 
215:    TLE  3,4,3	Op <= 
216:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
217:     LD  3,-4(1)	Load variable c
218:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
219:     LD  3,-2(1)	Load variable a
* TOFF inc: -9
220:     LD  4,-9(1)	Pop left into ac1 
221:    TGE  3,4,3	Op >= 
* TOFF inc: -8
222:     LD  4,-8(1)	Pop left into ac1 
223:    AND  3,4,3	Op AND 
* TOFF inc: -7
224:     LD  4,-7(1)	Pop left into ac1 
225:     OR  3,4,3	Op OR 
226:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end outputb
227:    LDA  1,-5(1)	Ghost frame becomes new active frame 
228:    LDA  3,1(7)	Return address in ac 
229:    JMP  7,-213(7)	CALL outputb
230:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -5
* EXPRESSION
* CALL outputb
231:     ST  1,-5(1)	Store fp in ghost frame for outputb
* TOFF dec: -6
* TOFF dec: -7
* Param 1
232:     LD  3,-2(1)	Load variable a
233:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
234:     LD  3,-3(1)	Load variable b
* TOFF inc: -7
235:     LD  4,-7(1)	Pop left into ac1 
236:    TGT  3,4,3	Op > 
237:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
238:     LD  3,-3(1)	Load variable b
239:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
240:     LD  3,-4(1)	Load variable c
* TOFF inc: -8
241:     LD  4,-8(1)	Pop left into ac1 
242:    TLE  3,4,3	Op <= 
* TOFF inc: -7
243:     LD  4,-7(1)	Pop left into ac1 
244:    AND  3,4,3	Op AND 
245:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
246:     LD  3,-4(1)	Load variable c
247:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
248:     LD  3,-2(1)	Load variable a
* TOFF inc: -8
249:     LD  4,-8(1)	Pop left into ac1 
250:    TGE  3,4,3	Op >= 
* TOFF inc: -7
251:     LD  4,-7(1)	Pop left into ac1 
252:     OR  3,4,3	Op OR 
253:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end outputb
254:    LDA  1,-5(1)	Ghost frame becomes new active frame 
255:    LDA  3,1(7)	Return address in ac 
256:    JMP  7,-240(7)	CALL outputb
257:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -5
* EXPRESSION
* CALL outputb
258:     ST  1,-5(1)	Store fp in ghost frame for outputb
* TOFF dec: -6
* TOFF dec: -7
* Param 1
259:     LD  3,-2(1)	Load variable a
260:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
261:     LD  3,-3(1)	Load variable b
* TOFF inc: -7
262:     LD  4,-7(1)	Pop left into ac1 
263:    TGT  3,4,3	Op > 
264:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
265:     LD  3,-3(1)	Load variable b
266:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
267:     LD  3,-4(1)	Load variable c
* TOFF inc: -8
268:     LD  4,-8(1)	Pop left into ac1 
269:    TLE  3,4,3	Op <= 
* TOFF inc: -7
270:     LD  4,-7(1)	Pop left into ac1 
271:    AND  3,4,3	Op AND 
272:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
273:     LD  3,-4(1)	Load variable c
274:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
275:     LD  3,-2(1)	Load variable a
* TOFF inc: -8
276:     LD  4,-8(1)	Pop left into ac1 
277:    TGE  3,4,3	Op >= 
278:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
279:     LD  3,-4(1)	Load variable c
280:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
281:     LD  3,-2(1)	Load variable a
* TOFF inc: -9
282:     LD  4,-9(1)	Pop left into ac1 
283:    TGE  3,4,3	Op >= 
* TOFF inc: -8
284:     LD  4,-8(1)	Pop left into ac1 
285:    AND  3,4,3	Op AND 
* TOFF inc: -7
286:     LD  4,-7(1)	Pop left into ac1 
287:     OR  3,4,3	Op OR 
288:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end outputb
289:    LDA  1,-5(1)	Ghost frame becomes new active frame 
290:    LDA  3,1(7)	Return address in ac 
291:    JMP  7,-275(7)	CALL outputb
292:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -5
* EXPRESSION
* CALL outputb
293:     ST  1,-5(1)	Store fp in ghost frame for outputb
* TOFF dec: -6
* TOFF dec: -7
* Param 1
294:     LD  3,-2(1)	Load variable a
295:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
296:     LD  3,-3(1)	Load variable b
* TOFF inc: -7
297:     LD  4,-7(1)	Pop left into ac1 
298:    TGT  3,4,3	Op > 
299:    LDC  4,1(6)	Load 1 
300:    XOR  3,3,4	Op XOR to get logical not 
301:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
302:     LD  3,-3(1)	Load variable b
303:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
304:     LD  3,-4(1)	Load variable c
* TOFF inc: -8
305:     LD  4,-8(1)	Pop left into ac1 
306:    TLE  3,4,3	Op <= 
307:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
308:     LD  3,-4(1)	Load variable c
309:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
310:     LD  3,-2(1)	Load variable a
* TOFF inc: -9
311:     LD  4,-9(1)	Pop left into ac1 
312:    TGE  3,4,3	Op >= 
* TOFF inc: -8
313:     LD  4,-8(1)	Pop left into ac1 
314:    AND  3,4,3	Op AND 
* TOFF inc: -7
315:     LD  4,-7(1)	Pop left into ac1 
316:     OR  3,4,3	Op OR 
317:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end outputb
318:    LDA  1,-5(1)	Ghost frame becomes new active frame 
319:    LDA  3,1(7)	Return address in ac 
320:    JMP  7,-304(7)	CALL outputb
321:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -5
* EXPRESSION
* CALL outputb
322:     ST  1,-5(1)	Store fp in ghost frame for outputb
* TOFF dec: -6
* TOFF dec: -7
* Param 1
323:     LD  3,-2(1)	Load variable a
324:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
325:     LD  3,-3(1)	Load variable b
* TOFF inc: -7
326:     LD  4,-7(1)	Pop left into ac1 
327:    TGT  3,4,3	Op > 
328:    LDC  4,1(6)	Load 1 
329:    XOR  3,3,4	Op XOR to get logical not 
330:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
331:     LD  3,-3(1)	Load variable b
332:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
333:     LD  3,-4(1)	Load variable c
* TOFF inc: -8
334:     LD  4,-8(1)	Pop left into ac1 
335:    TLE  3,4,3	Op <= 
* TOFF inc: -7
336:     LD  4,-7(1)	Pop left into ac1 
337:    AND  3,4,3	Op AND 
338:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
339:     LD  3,-4(1)	Load variable c
340:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
341:     LD  3,-2(1)	Load variable a
* TOFF inc: -8
342:     LD  4,-8(1)	Pop left into ac1 
343:    TGE  3,4,3	Op >= 
* TOFF inc: -7
344:     LD  4,-7(1)	Pop left into ac1 
345:     OR  3,4,3	Op OR 
346:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end outputb
347:    LDA  1,-5(1)	Ghost frame becomes new active frame 
348:    LDA  3,1(7)	Return address in ac 
349:    JMP  7,-333(7)	CALL outputb
350:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -5
* EXPRESSION
* CALL outnl
351:     ST  1,-5(1)	Store fp in ghost frame for outnl
* TOFF dec: -6
* TOFF dec: -7
* Param end outnl
352:    LDA  1,-5(1)	Ghost frame becomes new active frame 
353:    LDA  3,1(7)	Return address in ac 
354:    JMP  7,-321(7)	CALL outnl
355:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -5
* EXPRESSION
356:    LDC  3,11(6)	Load integer constant 
357:     ST  3,-3(1)	Store variable b
* EXPRESSION
358:    LDC  3,213(6)	Load integer constant 
359:     ST  3,-4(1)	Store variable c
* EXPRESSION
360:    LDC  3,4133(6)	Load integer constant 
361:     ST  3,-2(1)	Store variable a
* EXPRESSION
* CALL outputb
362:     ST  1,-5(1)	Store fp in ghost frame for outputb
* TOFF dec: -6
* TOFF dec: -7
* Param 1
363:     LD  3,-2(1)	Load variable a
364:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
365:     LD  3,-3(1)	Load variable b
* TOFF inc: -7
366:     LD  4,-7(1)	Pop left into ac1 
367:    TGT  3,4,3	Op > 
368:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
369:     LD  3,-3(1)	Load variable b
370:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
371:     LD  3,-4(1)	Load variable c
* TOFF inc: -8
372:     LD  4,-8(1)	Pop left into ac1 
373:    TLE  3,4,3	Op <= 
374:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
375:     LD  3,-4(1)	Load variable c
376:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
377:     LD  3,-2(1)	Load variable a
* TOFF inc: -9
378:     LD  4,-9(1)	Pop left into ac1 
379:    TGE  3,4,3	Op >= 
* TOFF inc: -8
380:     LD  4,-8(1)	Pop left into ac1 
381:    AND  3,4,3	Op AND 
* TOFF inc: -7
382:     LD  4,-7(1)	Pop left into ac1 
383:     OR  3,4,3	Op OR 
384:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end outputb
385:    LDA  1,-5(1)	Ghost frame becomes new active frame 
386:    LDA  3,1(7)	Return address in ac 
387:    JMP  7,-371(7)	CALL outputb
388:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -5
* EXPRESSION
* CALL outputb
389:     ST  1,-5(1)	Store fp in ghost frame for outputb
* TOFF dec: -6
* TOFF dec: -7
* Param 1
390:     LD  3,-2(1)	Load variable a
391:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
392:     LD  3,-3(1)	Load variable b
* TOFF inc: -7
393:     LD  4,-7(1)	Pop left into ac1 
394:    TGT  3,4,3	Op > 
395:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
396:     LD  3,-3(1)	Load variable b
397:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
398:     LD  3,-4(1)	Load variable c
* TOFF inc: -8
399:     LD  4,-8(1)	Pop left into ac1 
400:    TLE  3,4,3	Op <= 
* TOFF inc: -7
401:     LD  4,-7(1)	Pop left into ac1 
402:    AND  3,4,3	Op AND 
403:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
404:     LD  3,-4(1)	Load variable c
405:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
406:     LD  3,-2(1)	Load variable a
* TOFF inc: -8
407:     LD  4,-8(1)	Pop left into ac1 
408:    TGE  3,4,3	Op >= 
* TOFF inc: -7
409:     LD  4,-7(1)	Pop left into ac1 
410:     OR  3,4,3	Op OR 
411:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end outputb
412:    LDA  1,-5(1)	Ghost frame becomes new active frame 
413:    LDA  3,1(7)	Return address in ac 
414:    JMP  7,-398(7)	CALL outputb
415:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -5
* EXPRESSION
* CALL outputb
416:     ST  1,-5(1)	Store fp in ghost frame for outputb
* TOFF dec: -6
* TOFF dec: -7
* Param 1
417:     LD  3,-2(1)	Load variable a
418:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
419:     LD  3,-3(1)	Load variable b
* TOFF inc: -7
420:     LD  4,-7(1)	Pop left into ac1 
421:    TGT  3,4,3	Op > 
422:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
423:     LD  3,-3(1)	Load variable b
424:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
425:     LD  3,-4(1)	Load variable c
* TOFF inc: -8
426:     LD  4,-8(1)	Pop left into ac1 
427:    TLE  3,4,3	Op <= 
* TOFF inc: -7
428:     LD  4,-7(1)	Pop left into ac1 
429:    AND  3,4,3	Op AND 
430:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
431:     LD  3,-4(1)	Load variable c
432:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
433:     LD  3,-2(1)	Load variable a
* TOFF inc: -8
434:     LD  4,-8(1)	Pop left into ac1 
435:    TGE  3,4,3	Op >= 
436:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
437:     LD  3,-4(1)	Load variable c
438:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
439:     LD  3,-2(1)	Load variable a
* TOFF inc: -9
440:     LD  4,-9(1)	Pop left into ac1 
441:    TGE  3,4,3	Op >= 
* TOFF inc: -8
442:     LD  4,-8(1)	Pop left into ac1 
443:    AND  3,4,3	Op AND 
* TOFF inc: -7
444:     LD  4,-7(1)	Pop left into ac1 
445:     OR  3,4,3	Op OR 
446:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end outputb
447:    LDA  1,-5(1)	Ghost frame becomes new active frame 
448:    LDA  3,1(7)	Return address in ac 
449:    JMP  7,-433(7)	CALL outputb
450:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -5
* EXPRESSION
* CALL outputb
451:     ST  1,-5(1)	Store fp in ghost frame for outputb
* TOFF dec: -6
* TOFF dec: -7
* Param 1
452:     LD  3,-2(1)	Load variable a
453:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
454:     LD  3,-3(1)	Load variable b
* TOFF inc: -7
455:     LD  4,-7(1)	Pop left into ac1 
456:    TGT  3,4,3	Op > 
457:    LDC  4,1(6)	Load 1 
458:    XOR  3,3,4	Op XOR to get logical not 
459:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
460:     LD  3,-3(1)	Load variable b
461:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
462:     LD  3,-4(1)	Load variable c
* TOFF inc: -8
463:     LD  4,-8(1)	Pop left into ac1 
464:    TLE  3,4,3	Op <= 
465:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
466:     LD  3,-4(1)	Load variable c
467:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
468:     LD  3,-2(1)	Load variable a
* TOFF inc: -9
469:     LD  4,-9(1)	Pop left into ac1 
470:    TGE  3,4,3	Op >= 
* TOFF inc: -8
471:     LD  4,-8(1)	Pop left into ac1 
472:    AND  3,4,3	Op AND 
* TOFF inc: -7
473:     LD  4,-7(1)	Pop left into ac1 
474:     OR  3,4,3	Op OR 
475:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end outputb
476:    LDA  1,-5(1)	Ghost frame becomes new active frame 
477:    LDA  3,1(7)	Return address in ac 
478:    JMP  7,-462(7)	CALL outputb
479:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -5
* EXPRESSION
* CALL outputb
480:     ST  1,-5(1)	Store fp in ghost frame for outputb
* TOFF dec: -6
* TOFF dec: -7
* Param 1
481:     LD  3,-2(1)	Load variable a
482:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
483:     LD  3,-3(1)	Load variable b
* TOFF inc: -7
484:     LD  4,-7(1)	Pop left into ac1 
485:    TGT  3,4,3	Op > 
486:    LDC  4,1(6)	Load 1 
487:    XOR  3,3,4	Op XOR to get logical not 
488:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
489:     LD  3,-3(1)	Load variable b
490:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
491:     LD  3,-4(1)	Load variable c
* TOFF inc: -8
492:     LD  4,-8(1)	Pop left into ac1 
493:    TLE  3,4,3	Op <= 
* TOFF inc: -7
494:     LD  4,-7(1)	Pop left into ac1 
495:    AND  3,4,3	Op AND 
496:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
497:     LD  3,-4(1)	Load variable c
498:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
499:     LD  3,-2(1)	Load variable a
* TOFF inc: -8
500:     LD  4,-8(1)	Pop left into ac1 
501:    TGE  3,4,3	Op >= 
* TOFF inc: -7
502:     LD  4,-7(1)	Pop left into ac1 
503:     OR  3,4,3	Op OR 
504:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end outputb
505:    LDA  1,-5(1)	Ghost frame becomes new active frame 
506:    LDA  3,1(7)	Return address in ac 
507:    JMP  7,-491(7)	CALL outputb
508:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -5
* EXPRESSION
* CALL outnl
509:     ST  1,-5(1)	Store fp in ghost frame for outnl
* TOFF dec: -6
* TOFF dec: -7
* Param end outnl
510:    LDA  1,-5(1)	Ghost frame becomes new active frame 
511:    LDA  3,1(7)	Return address in ac 
512:    JMP  7,-479(7)	CALL outnl
513:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -5
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
514:    LDC  2,0(6)	Set return value to 0 
515:     LD  3,-1(1)	Load return address 
516:     LD  1,0(1)	Adjust fp 
517:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,517(7)	Jump to init [backpatch] 
* INIT
518:    LDA  1,0(0)	set first frame at end of globals 
519:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
520:    LDA  3,1(7)	Return address in ac 
521:    JMP  7,-483(7)	Jump to main 
522:   HALT  0,0,0	DONE! 
* END INIT
