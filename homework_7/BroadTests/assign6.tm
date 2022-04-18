* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  assign6.c-
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
* FUNCTION dog
* TOFF set: -4
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -17
 40:    LDC  3,10(6)	load size of array b
 41:     ST  3,-5(1)	save size of array b
* Compound Body
* EXPRESSION
 42:    LDC  3,777(6)	Load integer constant 
 43:     ST  3,-4(1)	Store variable a
* EXPRESSION
* CALL output
 44:     ST  1,-17(1)	Store fp in ghost frame for output
* TOFF dec: -18
* TOFF dec: -19
* Param 1
 45:     LD  3,-4(1)	Load variable a
 46:     ST  3,-19(1)	Push parameter 
* TOFF dec: -20
* Param end output
 47:    LDA  1,-17(1)	Ghost frame becomes new active frame 
 48:    LDA  3,1(7)	Return address in ac 
 49:    JMP  7,-44(7)	CALL output
 50:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -17
* EXPRESSION
 51:    LDC  3,666(6)	Load integer constant 
 52:     LD  4,-4(1)	load lhs variable a
 53:    ADD  3,4,3	op += 
 54:     ST  3,-4(1)	Store variable a
* EXPRESSION
* CALL output
 55:     ST  1,-17(1)	Store fp in ghost frame for output
* TOFF dec: -18
* TOFF dec: -19
* Param 1
 56:     LD  3,-4(1)	Load variable a
 57:     ST  3,-19(1)	Push parameter 
* TOFF dec: -20
* Param end output
 58:    LDA  1,-17(1)	Ghost frame becomes new active frame 
 59:    LDA  3,1(7)	Return address in ac 
 60:    JMP  7,-55(7)	CALL output
 61:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -17
* EXPRESSION
 62:    LDC  3,666(6)	Load integer constant 
 63:     LD  4,-4(1)	load lhs variable a
 64:    SUB  3,4,3	op -= 
 65:     ST  3,-4(1)	Store variable a
* EXPRESSION
* CALL output
 66:     ST  1,-17(1)	Store fp in ghost frame for output
* TOFF dec: -18
* TOFF dec: -19
* Param 1
 67:     LD  3,-4(1)	Load variable a
 68:     ST  3,-19(1)	Push parameter 
* TOFF dec: -20
* Param end output
 69:    LDA  1,-17(1)	Ghost frame becomes new active frame 
 70:    LDA  3,1(7)	Return address in ac 
 71:    JMP  7,-66(7)	CALL output
 72:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -17
* EXPRESSION
* CALL outnl
 73:     ST  1,-17(1)	Store fp in ghost frame for outnl
* TOFF dec: -18
* TOFF dec: -19
* Param end outnl
 74:    LDA  1,-17(1)	Ghost frame becomes new active frame 
 75:    LDA  3,1(7)	Return address in ac 
 76:    JMP  7,-43(7)	CALL outnl
 77:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -17
* EXPRESSION
 78:    LDC  3,777(6)	Load integer constant 
 79:     ST  3,0(0)	Store variable g
* EXPRESSION
* CALL output
 80:     ST  1,-17(1)	Store fp in ghost frame for output
* TOFF dec: -18
* TOFF dec: -19
* Param 1
 81:     LD  3,0(0)	Load variable g
 82:     ST  3,-19(1)	Push parameter 
* TOFF dec: -20
* Param end output
 83:    LDA  1,-17(1)	Ghost frame becomes new active frame 
 84:    LDA  3,1(7)	Return address in ac 
 85:    JMP  7,-80(7)	CALL output
 86:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -17
* EXPRESSION
 87:    LDC  3,666(6)	Load integer constant 
 88:     LD  4,0(0)	load lhs variable g
 89:    ADD  3,4,3	op += 
 90:     ST  3,0(0)	Store variable g
* EXPRESSION
* CALL output
 91:     ST  1,-17(1)	Store fp in ghost frame for output
* TOFF dec: -18
* TOFF dec: -19
* Param 1
 92:     LD  3,0(0)	Load variable g
 93:     ST  3,-19(1)	Push parameter 
* TOFF dec: -20
* Param end output
 94:    LDA  1,-17(1)	Ghost frame becomes new active frame 
 95:    LDA  3,1(7)	Return address in ac 
 96:    JMP  7,-91(7)	CALL output
 97:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -17
* EXPRESSION
 98:    LDC  3,666(6)	Load integer constant 
 99:     LD  4,0(0)	load lhs variable g
100:    SUB  3,4,3	op -= 
101:     ST  3,0(0)	Store variable g
* EXPRESSION
* CALL output
102:     ST  1,-17(1)	Store fp in ghost frame for output
* TOFF dec: -18
* TOFF dec: -19
* Param 1
103:     LD  3,0(0)	Load variable g
104:     ST  3,-19(1)	Push parameter 
* TOFF dec: -20
* Param end output
105:    LDA  1,-17(1)	Ghost frame becomes new active frame 
106:    LDA  3,1(7)	Return address in ac 
107:    JMP  7,-102(7)	CALL output
108:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -17
* EXPRESSION
* CALL outnl
109:     ST  1,-17(1)	Store fp in ghost frame for outnl
* TOFF dec: -18
* TOFF dec: -19
* Param end outnl
110:    LDA  1,-17(1)	Ghost frame becomes new active frame 
111:    LDA  3,1(7)	Return address in ac 
112:    JMP  7,-79(7)	CALL outnl
113:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -17
* EXPRESSION
114:    LDC  3,777(6)	Load integer constant 
115:     ST  3,-2(1)	Store variable p
* EXPRESSION
* CALL output
116:     ST  1,-17(1)	Store fp in ghost frame for output
* TOFF dec: -18
* TOFF dec: -19
* Param 1
117:     LD  3,-2(1)	Load variable p
118:     ST  3,-19(1)	Push parameter 
* TOFF dec: -20
* Param end output
119:    LDA  1,-17(1)	Ghost frame becomes new active frame 
120:    LDA  3,1(7)	Return address in ac 
121:    JMP  7,-116(7)	CALL output
122:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -17
* EXPRESSION
123:    LDC  3,666(6)	Load integer constant 
124:     LD  4,-2(1)	load lhs variable p
125:    ADD  3,4,3	op += 
126:     ST  3,-2(1)	Store variable p
* EXPRESSION
* CALL output
127:     ST  1,-17(1)	Store fp in ghost frame for output
* TOFF dec: -18
* TOFF dec: -19
* Param 1
128:     LD  3,-2(1)	Load variable p
129:     ST  3,-19(1)	Push parameter 
* TOFF dec: -20
* Param end output
130:    LDA  1,-17(1)	Ghost frame becomes new active frame 
131:    LDA  3,1(7)	Return address in ac 
132:    JMP  7,-127(7)	CALL output
133:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -17
* EXPRESSION
134:    LDC  3,666(6)	Load integer constant 
135:     LD  4,-2(1)	load lhs variable p
136:    SUB  3,4,3	op -= 
137:     ST  3,-2(1)	Store variable p
* EXPRESSION
* CALL output
138:     ST  1,-17(1)	Store fp in ghost frame for output
* TOFF dec: -18
* TOFF dec: -19
* Param 1
139:     LD  3,-2(1)	Load variable p
140:     ST  3,-19(1)	Push parameter 
* TOFF dec: -20
* Param end output
141:    LDA  1,-17(1)	Ghost frame becomes new active frame 
142:    LDA  3,1(7)	Return address in ac 
143:    JMP  7,-138(7)	CALL output
144:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -17
* EXPRESSION
* CALL outnl
145:     ST  1,-17(1)	Store fp in ghost frame for outnl
* TOFF dec: -18
* TOFF dec: -19
* Param end outnl
146:    LDA  1,-17(1)	Ghost frame becomes new active frame 
147:    LDA  3,1(7)	Return address in ac 
148:    JMP  7,-115(7)	CALL outnl
149:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -17
* EXPRESSION
150:    LDC  3,1(6)	Load integer constant 
151:     ST  3,-17(1)	Push index 
* TOFF dec: -18
152:    LDC  3,777(6)	Load integer constant 
* TOFF inc: -17
153:     LD  4,-17(1)	Pop index 
154:    LDA  5,-6(1)	Load address of base of array b
155:    SUB  5,5,4	Compute offset of value 
156:     ST  3,0(5)	Store variable b
* EXPRESSION
* CALL output
157:     ST  1,-17(1)	Store fp in ghost frame for output
* TOFF dec: -18
* TOFF dec: -19
* Param 1
158:    LDA  3,-6(1)	Load address of base of array b
159:     ST  3,-19(1)	Push left side 
* TOFF dec: -20
160:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -19
161:     LD  4,-19(1)	Pop left into ac1 
162:    SUB  3,4,3	compute location from index 
163:     LD  3,0(3)	Load array element 
164:     ST  3,-19(1)	Push parameter 
* TOFF dec: -20
* Param end output
165:    LDA  1,-17(1)	Ghost frame becomes new active frame 
166:    LDA  3,1(7)	Return address in ac 
167:    JMP  7,-162(7)	CALL output
168:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -17
* EXPRESSION
169:    LDC  3,1(6)	Load integer constant 
170:     ST  3,-17(1)	Push index 
* TOFF dec: -18
171:    LDC  3,666(6)	Load integer constant 
* TOFF inc: -17
172:     LD  4,-17(1)	Pop index 
173:    LDA  5,-6(1)	Load address of base of array b
174:    SUB  5,5,4	Compute offset of value 
175:     LD  4,0(5)	load lhs variable b
176:    ADD  3,4,3	op += 
177:     ST  3,0(5)	Store variable b
* EXPRESSION
* CALL output
178:     ST  1,-17(1)	Store fp in ghost frame for output
* TOFF dec: -18
* TOFF dec: -19
* Param 1
179:    LDA  3,-6(1)	Load address of base of array b
180:     ST  3,-19(1)	Push left side 
* TOFF dec: -20
181:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -19
182:     LD  4,-19(1)	Pop left into ac1 
183:    SUB  3,4,3	compute location from index 
184:     LD  3,0(3)	Load array element 
185:     ST  3,-19(1)	Push parameter 
* TOFF dec: -20
* Param end output
186:    LDA  1,-17(1)	Ghost frame becomes new active frame 
187:    LDA  3,1(7)	Return address in ac 
188:    JMP  7,-183(7)	CALL output
189:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -17
* EXPRESSION
190:    LDC  3,1(6)	Load integer constant 
191:     ST  3,-17(1)	Push index 
* TOFF dec: -18
192:    LDC  3,666(6)	Load integer constant 
* TOFF inc: -17
193:     LD  4,-17(1)	Pop index 
194:    LDA  5,-6(1)	Load address of base of array b
195:    SUB  5,5,4	Compute offset of value 
196:     LD  4,0(5)	load lhs variable b
197:    SUB  3,4,3	op -= 
198:     ST  3,0(5)	Store variable b
* EXPRESSION
* CALL output
199:     ST  1,-17(1)	Store fp in ghost frame for output
* TOFF dec: -18
* TOFF dec: -19
* Param 1
200:    LDA  3,-6(1)	Load address of base of array b
201:     ST  3,-19(1)	Push left side 
* TOFF dec: -20
202:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -19
203:     LD  4,-19(1)	Pop left into ac1 
204:    SUB  3,4,3	compute location from index 
205:     LD  3,0(3)	Load array element 
206:     ST  3,-19(1)	Push parameter 
* TOFF dec: -20
* Param end output
207:    LDA  1,-17(1)	Ghost frame becomes new active frame 
208:    LDA  3,1(7)	Return address in ac 
209:    JMP  7,-204(7)	CALL output
210:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -17
* EXPRESSION
* CALL outnl
211:     ST  1,-17(1)	Store fp in ghost frame for outnl
* TOFF dec: -18
* TOFF dec: -19
* Param end outnl
212:    LDA  1,-17(1)	Ghost frame becomes new active frame 
213:    LDA  3,1(7)	Return address in ac 
214:    JMP  7,-181(7)	CALL outnl
215:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -17
* EXPRESSION
216:    LDC  3,1(6)	Load integer constant 
217:     ST  3,-17(1)	Push index 
* TOFF dec: -18
218:    LDC  3,777(6)	Load integer constant 
* TOFF inc: -17
219:     LD  4,-17(1)	Pop index 
220:    LDA  5,-2(0)	Load address of base of array h
221:    SUB  5,5,4	Compute offset of value 
222:     ST  3,0(5)	Store variable h
* EXPRESSION
* CALL output
223:     ST  1,-17(1)	Store fp in ghost frame for output
* TOFF dec: -18
* TOFF dec: -19
* Param 1
224:    LDA  3,-2(0)	Load address of base of array h
225:     ST  3,-19(1)	Push left side 
* TOFF dec: -20
226:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -19
227:     LD  4,-19(1)	Pop left into ac1 
228:    SUB  3,4,3	compute location from index 
229:     LD  3,0(3)	Load array element 
230:     ST  3,-19(1)	Push parameter 
* TOFF dec: -20
* Param end output
231:    LDA  1,-17(1)	Ghost frame becomes new active frame 
232:    LDA  3,1(7)	Return address in ac 
233:    JMP  7,-228(7)	CALL output
234:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -17
* EXPRESSION
235:    LDC  3,1(6)	Load integer constant 
236:     ST  3,-17(1)	Push index 
* TOFF dec: -18
237:    LDC  3,666(6)	Load integer constant 
* TOFF inc: -17
238:     LD  4,-17(1)	Pop index 
239:    LDA  5,-2(0)	Load address of base of array h
240:    SUB  5,5,4	Compute offset of value 
241:     LD  4,0(5)	load lhs variable h
242:    ADD  3,4,3	op += 
243:     ST  3,0(5)	Store variable h
* EXPRESSION
* CALL output
244:     ST  1,-17(1)	Store fp in ghost frame for output
* TOFF dec: -18
* TOFF dec: -19
* Param 1
245:    LDA  3,-2(0)	Load address of base of array h
246:     ST  3,-19(1)	Push left side 
* TOFF dec: -20
247:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -19
248:     LD  4,-19(1)	Pop left into ac1 
249:    SUB  3,4,3	compute location from index 
250:     LD  3,0(3)	Load array element 
251:     ST  3,-19(1)	Push parameter 
* TOFF dec: -20
* Param end output
252:    LDA  1,-17(1)	Ghost frame becomes new active frame 
253:    LDA  3,1(7)	Return address in ac 
254:    JMP  7,-249(7)	CALL output
255:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -17
* EXPRESSION
256:    LDC  3,1(6)	Load integer constant 
257:     ST  3,-17(1)	Push index 
* TOFF dec: -18
258:    LDC  3,666(6)	Load integer constant 
* TOFF inc: -17
259:     LD  4,-17(1)	Pop index 
260:    LDA  5,-2(0)	Load address of base of array h
261:    SUB  5,5,4	Compute offset of value 
262:     LD  4,0(5)	load lhs variable h
263:    SUB  3,4,3	op -= 
264:     ST  3,0(5)	Store variable h
* EXPRESSION
* CALL output
265:     ST  1,-17(1)	Store fp in ghost frame for output
* TOFF dec: -18
* TOFF dec: -19
* Param 1
266:    LDA  3,-2(0)	Load address of base of array h
267:     ST  3,-19(1)	Push left side 
* TOFF dec: -20
268:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -19
269:     LD  4,-19(1)	Pop left into ac1 
270:    SUB  3,4,3	compute location from index 
271:     LD  3,0(3)	Load array element 
272:     ST  3,-19(1)	Push parameter 
* TOFF dec: -20
* Param end output
273:    LDA  1,-17(1)	Ghost frame becomes new active frame 
274:    LDA  3,1(7)	Return address in ac 
275:    JMP  7,-270(7)	CALL output
276:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -17
* EXPRESSION
* CALL outnl
277:     ST  1,-17(1)	Store fp in ghost frame for outnl
* TOFF dec: -18
* TOFF dec: -19
* Param end outnl
278:    LDA  1,-17(1)	Ghost frame becomes new active frame 
279:    LDA  3,1(7)	Return address in ac 
280:    JMP  7,-247(7)	CALL outnl
281:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -17
* EXPRESSION
282:    LDC  3,1(6)	Load integer constant 
283:     ST  3,-17(1)	Push index 
* TOFF dec: -18
284:    LDC  3,777(6)	Load integer constant 
* TOFF inc: -17
285:     LD  4,-17(1)	Pop index 
286:     LD  5,-3(1)	Load address of base of array q
287:    SUB  5,5,4	Compute offset of value 
288:     ST  3,0(5)	Store variable q
* EXPRESSION
* CALL output
289:     ST  1,-17(1)	Store fp in ghost frame for output
* TOFF dec: -18
* TOFF dec: -19
* Param 1
290:     LD  3,-3(1)	Load address of base of array q
291:     ST  3,-19(1)	Push left side 
* TOFF dec: -20
292:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -19
293:     LD  4,-19(1)	Pop left into ac1 
294:    SUB  3,4,3	compute location from index 
295:     LD  3,0(3)	Load array element 
296:     ST  3,-19(1)	Push parameter 
* TOFF dec: -20
* Param end output
297:    LDA  1,-17(1)	Ghost frame becomes new active frame 
298:    LDA  3,1(7)	Return address in ac 
299:    JMP  7,-294(7)	CALL output
300:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -17
* EXPRESSION
301:    LDC  3,1(6)	Load integer constant 
302:     ST  3,-17(1)	Push index 
* TOFF dec: -18
303:    LDC  3,666(6)	Load integer constant 
* TOFF inc: -17
304:     LD  4,-17(1)	Pop index 
305:     LD  5,-3(1)	Load address of base of array q
306:    SUB  5,5,4	Compute offset of value 
307:     LD  4,0(5)	load lhs variable q
308:    ADD  3,4,3	op += 
309:     ST  3,0(5)	Store variable q
* EXPRESSION
* CALL output
310:     ST  1,-17(1)	Store fp in ghost frame for output
* TOFF dec: -18
* TOFF dec: -19
* Param 1
311:     LD  3,-3(1)	Load address of base of array q
312:     ST  3,-19(1)	Push left side 
* TOFF dec: -20
313:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -19
314:     LD  4,-19(1)	Pop left into ac1 
315:    SUB  3,4,3	compute location from index 
316:     LD  3,0(3)	Load array element 
317:     ST  3,-19(1)	Push parameter 
* TOFF dec: -20
* Param end output
318:    LDA  1,-17(1)	Ghost frame becomes new active frame 
319:    LDA  3,1(7)	Return address in ac 
320:    JMP  7,-315(7)	CALL output
321:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -17
* EXPRESSION
322:    LDC  3,1(6)	Load integer constant 
323:     ST  3,-17(1)	Push index 
* TOFF dec: -18
324:    LDC  3,666(6)	Load integer constant 
* TOFF inc: -17
325:     LD  4,-17(1)	Pop index 
326:     LD  5,-3(1)	Load address of base of array q
327:    SUB  5,5,4	Compute offset of value 
328:     LD  4,0(5)	load lhs variable q
329:    SUB  3,4,3	op -= 
330:     ST  3,0(5)	Store variable q
* EXPRESSION
* CALL output
331:     ST  1,-17(1)	Store fp in ghost frame for output
* TOFF dec: -18
* TOFF dec: -19
* Param 1
332:     LD  3,-3(1)	Load address of base of array q
333:     ST  3,-19(1)	Push left side 
* TOFF dec: -20
334:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -19
335:     LD  4,-19(1)	Pop left into ac1 
336:    SUB  3,4,3	compute location from index 
337:     LD  3,0(3)	Load array element 
338:     ST  3,-19(1)	Push parameter 
* TOFF dec: -20
* Param end output
339:    LDA  1,-17(1)	Ghost frame becomes new active frame 
340:    LDA  3,1(7)	Return address in ac 
341:    JMP  7,-336(7)	CALL output
342:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -17
* EXPRESSION
* CALL outnl
343:     ST  1,-17(1)	Store fp in ghost frame for outnl
* TOFF dec: -18
* TOFF dec: -19
* Param end outnl
344:    LDA  1,-17(1)	Ghost frame becomes new active frame 
345:    LDA  3,1(7)	Return address in ac 
346:    JMP  7,-313(7)	CALL outnl
347:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -17
* EXPRESSION
348:    LDC  3,1(6)	Load integer constant 
349:     ST  3,-17(1)	Push index 
* TOFF dec: -18
350:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -17
351:     LD  4,-17(1)	Pop index 
352:    LDA  5,-6(1)	Load address of base of array b
353:    SUB  5,5,4	Compute offset of value 
354:     ST  3,0(5)	Store variable b
* EXPRESSION
355:    LDA  3,-6(1)	Load address of base of array b
356:     ST  3,-17(1)	Push left side 
* TOFF dec: -18
357:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -17
358:     LD  4,-17(1)	Pop left into ac1 
359:    SUB  3,4,3	compute location from index 
360:     LD  3,0(3)	Load array element 
361:     ST  3,-17(1)	Push left side 
* TOFF dec: -18
362:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -17
363:     LD  4,-17(1)	Pop left into ac1 
364:    ADD  3,4,3	Op + 
365:     ST  3,-17(1)	Push index 
* TOFF dec: -18
366:    LDC  3,777(6)	Load integer constant 
* TOFF inc: -17
367:     LD  4,-17(1)	Pop index 
368:     LD  5,-3(1)	Load address of base of array q
369:    SUB  5,5,4	Compute offset of value 
370:     ST  3,0(5)	Store variable q
* EXPRESSION
* CALL output
371:     ST  1,-17(1)	Store fp in ghost frame for output
* TOFF dec: -18
* TOFF dec: -19
* Param 1
372:     LD  3,-3(1)	Load address of base of array q
373:     ST  3,-19(1)	Push left side 
* TOFF dec: -20
374:    LDA  3,-6(1)	Load address of base of array b
375:     ST  3,-20(1)	Push left side 
* TOFF dec: -21
376:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -20
377:     LD  4,-20(1)	Pop left into ac1 
378:    SUB  3,4,3	compute location from index 
379:     LD  3,0(3)	Load array element 
380:     ST  3,-20(1)	Push left side 
* TOFF dec: -21
381:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -20
382:     LD  4,-20(1)	Pop left into ac1 
383:    ADD  3,4,3	Op + 
* TOFF inc: -19
384:     LD  4,-19(1)	Pop left into ac1 
385:    SUB  3,4,3	compute location from index 
386:     LD  3,0(3)	Load array element 
387:     ST  3,-19(1)	Push parameter 
* TOFF dec: -20
* Param end output
388:    LDA  1,-17(1)	Ghost frame becomes new active frame 
389:    LDA  3,1(7)	Return address in ac 
390:    JMP  7,-385(7)	CALL output
391:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -17
* EXPRESSION
392:    LDA  3,-6(1)	Load address of base of array b
393:     ST  3,-17(1)	Push left side 
* TOFF dec: -18
394:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -17
395:     LD  4,-17(1)	Pop left into ac1 
396:    SUB  3,4,3	compute location from index 
397:     LD  3,0(3)	Load array element 
398:     ST  3,-17(1)	Push left side 
* TOFF dec: -18
399:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -17
400:     LD  4,-17(1)	Pop left into ac1 
401:    ADD  3,4,3	Op + 
402:     ST  3,-17(1)	Push index 
* TOFF dec: -18
403:    LDC  3,666(6)	Load integer constant 
* TOFF inc: -17
404:     LD  4,-17(1)	Pop index 
405:     LD  5,-3(1)	Load address of base of array q
406:    SUB  5,5,4	Compute offset of value 
407:     LD  4,0(5)	load lhs variable q
408:    ADD  3,4,3	op += 
409:     ST  3,0(5)	Store variable q
* EXPRESSION
* CALL output
410:     ST  1,-17(1)	Store fp in ghost frame for output
* TOFF dec: -18
* TOFF dec: -19
* Param 1
411:     LD  3,-3(1)	Load address of base of array q
412:     ST  3,-19(1)	Push left side 
* TOFF dec: -20
413:    LDA  3,-6(1)	Load address of base of array b
414:     ST  3,-20(1)	Push left side 
* TOFF dec: -21
415:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -20
416:     LD  4,-20(1)	Pop left into ac1 
417:    SUB  3,4,3	compute location from index 
418:     LD  3,0(3)	Load array element 
419:     ST  3,-20(1)	Push left side 
* TOFF dec: -21
420:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -20
421:     LD  4,-20(1)	Pop left into ac1 
422:    ADD  3,4,3	Op + 
* TOFF inc: -19
423:     LD  4,-19(1)	Pop left into ac1 
424:    SUB  3,4,3	compute location from index 
425:     LD  3,0(3)	Load array element 
426:     ST  3,-19(1)	Push parameter 
* TOFF dec: -20
* Param end output
427:    LDA  1,-17(1)	Ghost frame becomes new active frame 
428:    LDA  3,1(7)	Return address in ac 
429:    JMP  7,-424(7)	CALL output
430:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -17
* EXPRESSION
431:    LDA  3,-6(1)	Load address of base of array b
432:     ST  3,-17(1)	Push left side 
* TOFF dec: -18
433:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -17
434:     LD  4,-17(1)	Pop left into ac1 
435:    SUB  3,4,3	compute location from index 
436:     LD  3,0(3)	Load array element 
437:     ST  3,-17(1)	Push left side 
* TOFF dec: -18
438:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -17
439:     LD  4,-17(1)	Pop left into ac1 
440:    ADD  3,4,3	Op + 
441:     ST  3,-17(1)	Push index 
* TOFF dec: -18
442:    LDC  3,666(6)	Load integer constant 
* TOFF inc: -17
443:     LD  4,-17(1)	Pop index 
444:     LD  5,-3(1)	Load address of base of array q
445:    SUB  5,5,4	Compute offset of value 
446:     LD  4,0(5)	load lhs variable q
447:    SUB  3,4,3	op -= 
448:     ST  3,0(5)	Store variable q
* EXPRESSION
* CALL output
449:     ST  1,-17(1)	Store fp in ghost frame for output
* TOFF dec: -18
* TOFF dec: -19
* Param 1
450:     LD  3,-3(1)	Load address of base of array q
451:     ST  3,-19(1)	Push left side 
* TOFF dec: -20
452:    LDA  3,-6(1)	Load address of base of array b
453:     ST  3,-20(1)	Push left side 
* TOFF dec: -21
454:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -20
455:     LD  4,-20(1)	Pop left into ac1 
456:    SUB  3,4,3	compute location from index 
457:     LD  3,0(3)	Load array element 
458:     ST  3,-20(1)	Push left side 
* TOFF dec: -21
459:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -20
460:     LD  4,-20(1)	Pop left into ac1 
461:    ADD  3,4,3	Op + 
* TOFF inc: -19
462:     LD  4,-19(1)	Pop left into ac1 
463:    SUB  3,4,3	compute location from index 
464:     LD  3,0(3)	Load array element 
465:     ST  3,-19(1)	Push parameter 
* TOFF dec: -20
* Param end output
466:    LDA  1,-17(1)	Ghost frame becomes new active frame 
467:    LDA  3,1(7)	Return address in ac 
468:    JMP  7,-463(7)	CALL output
469:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -17
* EXPRESSION
* CALL outnl
470:     ST  1,-17(1)	Store fp in ghost frame for outnl
* TOFF dec: -18
* TOFF dec: -19
* Param end outnl
471:    LDA  1,-17(1)	Ghost frame becomes new active frame 
472:    LDA  3,1(7)	Return address in ac 
473:    JMP  7,-440(7)	CALL outnl
474:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -17
* EXPRESSION
475:    LDC  3,777(6)	Load integer constant 
476:     ST  3,-4(1)	Store variable a
477:     ST  3,-16(1)	Store variable x
* EXPRESSION
* CALL output
478:     ST  1,-17(1)	Store fp in ghost frame for output
* TOFF dec: -18
* TOFF dec: -19
* Param 1
479:     LD  3,-16(1)	Load variable x
480:     ST  3,-19(1)	Push parameter 
* TOFF dec: -20
* Param end output
481:    LDA  1,-17(1)	Ghost frame becomes new active frame 
482:    LDA  3,1(7)	Return address in ac 
483:    JMP  7,-478(7)	CALL output
484:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -17
* EXPRESSION
485:    LDC  3,666(6)	Load integer constant 
486:     LD  4,-4(1)	load lhs variable a
487:    ADD  3,4,3	op += 
488:     ST  3,-4(1)	Store variable a
489:     ST  3,-16(1)	Store variable x
* EXPRESSION
* CALL output
490:     ST  1,-17(1)	Store fp in ghost frame for output
* TOFF dec: -18
* TOFF dec: -19
* Param 1
491:     LD  3,-16(1)	Load variable x
492:     ST  3,-19(1)	Push parameter 
* TOFF dec: -20
* Param end output
493:    LDA  1,-17(1)	Ghost frame becomes new active frame 
494:    LDA  3,1(7)	Return address in ac 
495:    JMP  7,-490(7)	CALL output
496:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -17
* EXPRESSION
497:    LDC  3,666(6)	Load integer constant 
498:     LD  4,-4(1)	load lhs variable a
499:    SUB  3,4,3	op -= 
500:     ST  3,-4(1)	Store variable a
501:     ST  3,-16(1)	Store variable x
* EXPRESSION
* CALL output
502:     ST  1,-17(1)	Store fp in ghost frame for output
* TOFF dec: -18
* TOFF dec: -19
* Param 1
503:     LD  3,-16(1)	Load variable x
504:     ST  3,-19(1)	Push parameter 
* TOFF dec: -20
* Param end output
505:    LDA  1,-17(1)	Ghost frame becomes new active frame 
506:    LDA  3,1(7)	Return address in ac 
507:    JMP  7,-502(7)	CALL output
508:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -17
* EXPRESSION
* CALL outnl
509:     ST  1,-17(1)	Store fp in ghost frame for outnl
* TOFF dec: -18
* TOFF dec: -19
* Param end outnl
510:    LDA  1,-17(1)	Ghost frame becomes new active frame 
511:    LDA  3,1(7)	Return address in ac 
512:    JMP  7,-479(7)	CALL outnl
513:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -17
* EXPRESSION
514:    LDC  3,1(6)	Load integer constant 
515:     ST  3,-17(1)	Push index 
* TOFF dec: -18
516:    LDC  3,2(6)	Load integer constant 
517:     ST  3,-18(1)	Push index 
* TOFF dec: -19
518:    LDC  3,777(6)	Load integer constant 
* TOFF inc: -18
519:     LD  4,-18(1)	Pop index 
520:    LDA  5,-6(1)	Load address of base of array b
521:    SUB  5,5,4	Compute offset of value 
522:     ST  3,0(5)	Store variable b
* TOFF inc: -17
523:     LD  4,-17(1)	Pop index 
524:    LDA  5,-6(1)	Load address of base of array b
525:    SUB  5,5,4	Compute offset of value 
526:     ST  3,0(5)	Store variable b
* EXPRESSION
* CALL output
527:     ST  1,-17(1)	Store fp in ghost frame for output
* TOFF dec: -18
* TOFF dec: -19
* Param 1
528:    LDA  3,-6(1)	Load address of base of array b
529:     ST  3,-19(1)	Push left side 
* TOFF dec: -20
530:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -19
531:     LD  4,-19(1)	Pop left into ac1 
532:    SUB  3,4,3	compute location from index 
533:     LD  3,0(3)	Load array element 
534:     ST  3,-19(1)	Push parameter 
* TOFF dec: -20
* Param end output
535:    LDA  1,-17(1)	Ghost frame becomes new active frame 
536:    LDA  3,1(7)	Return address in ac 
537:    JMP  7,-532(7)	CALL output
538:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -17
* EXPRESSION
539:    LDC  3,1(6)	Load integer constant 
540:     ST  3,-17(1)	Push index 
* TOFF dec: -18
541:    LDC  3,2(6)	Load integer constant 
542:     ST  3,-18(1)	Push index 
* TOFF dec: -19
543:    LDC  3,666(6)	Load integer constant 
* TOFF inc: -18
544:     LD  4,-18(1)	Pop index 
545:    LDA  5,-6(1)	Load address of base of array b
546:    SUB  5,5,4	Compute offset of value 
547:     LD  4,0(5)	load lhs variable b
548:    ADD  3,4,3	op += 
549:     ST  3,0(5)	Store variable b
* TOFF inc: -17
550:     LD  4,-17(1)	Pop index 
551:    LDA  5,-6(1)	Load address of base of array b
552:    SUB  5,5,4	Compute offset of value 
553:     ST  3,0(5)	Store variable b
* EXPRESSION
* CALL output
554:     ST  1,-17(1)	Store fp in ghost frame for output
* TOFF dec: -18
* TOFF dec: -19
* Param 1
555:    LDA  3,-6(1)	Load address of base of array b
556:     ST  3,-19(1)	Push left side 
* TOFF dec: -20
557:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -19
558:     LD  4,-19(1)	Pop left into ac1 
559:    SUB  3,4,3	compute location from index 
560:     LD  3,0(3)	Load array element 
561:     ST  3,-19(1)	Push parameter 
* TOFF dec: -20
* Param end output
562:    LDA  1,-17(1)	Ghost frame becomes new active frame 
563:    LDA  3,1(7)	Return address in ac 
564:    JMP  7,-559(7)	CALL output
565:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -17
* EXPRESSION
566:    LDC  3,1(6)	Load integer constant 
567:     ST  3,-17(1)	Push index 
* TOFF dec: -18
568:    LDC  3,2(6)	Load integer constant 
569:     ST  3,-18(1)	Push index 
* TOFF dec: -19
570:    LDC  3,666(6)	Load integer constant 
* TOFF inc: -18
571:     LD  4,-18(1)	Pop index 
572:    LDA  5,-6(1)	Load address of base of array b
573:    SUB  5,5,4	Compute offset of value 
574:     LD  4,0(5)	load lhs variable b
575:    SUB  3,4,3	op -= 
576:     ST  3,0(5)	Store variable b
* TOFF inc: -17
577:     LD  4,-17(1)	Pop index 
578:    LDA  5,-6(1)	Load address of base of array b
579:    SUB  5,5,4	Compute offset of value 
580:     ST  3,0(5)	Store variable b
* EXPRESSION
* CALL output
581:     ST  1,-17(1)	Store fp in ghost frame for output
* TOFF dec: -18
* TOFF dec: -19
* Param 1
582:    LDA  3,-6(1)	Load address of base of array b
583:     ST  3,-19(1)	Push left side 
* TOFF dec: -20
584:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -19
585:     LD  4,-19(1)	Pop left into ac1 
586:    SUB  3,4,3	compute location from index 
587:     LD  3,0(3)	Load array element 
588:     ST  3,-19(1)	Push parameter 
* TOFF dec: -20
* Param end output
589:    LDA  1,-17(1)	Ghost frame becomes new active frame 
590:    LDA  3,1(7)	Return address in ac 
591:    JMP  7,-586(7)	CALL output
592:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -17
* EXPRESSION
* CALL outnl
593:     ST  1,-17(1)	Store fp in ghost frame for outnl
* TOFF dec: -18
* TOFF dec: -19
* Param end outnl
594:    LDA  1,-17(1)	Ghost frame becomes new active frame 
595:    LDA  3,1(7)	Return address in ac 
596:    JMP  7,-563(7)	CALL outnl
597:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -17
* EXPRESSION
598:     LD  3,-4(1)	Load variable a
599:     ST  3,-17(1)	Push left side 
* TOFF dec: -18
600:     LD  3,-16(1)	Load variable x
* TOFF inc: -17
601:     LD  4,-17(1)	Pop left into ac1 
602:    MUL  3,4,3	Op * 
603:     LD  4,-4(1)	load lhs variable a
604:    ADD  3,4,3	op += 
605:     ST  3,-4(1)	Store variable a
* EXPRESSION
* CALL output
606:     ST  1,-17(1)	Store fp in ghost frame for output
* TOFF dec: -18
* TOFF dec: -19
* Param 1
607:     LD  3,-4(1)	Load variable a
608:     ST  3,-19(1)	Push parameter 
* TOFF dec: -20
* Param end output
609:    LDA  1,-17(1)	Ghost frame becomes new active frame 
610:    LDA  3,1(7)	Return address in ac 
611:    JMP  7,-606(7)	CALL output
612:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -17
* EXPRESSION
* CALL outnl
613:     ST  1,-17(1)	Store fp in ghost frame for outnl
* TOFF dec: -18
* TOFF dec: -19
* Param end outnl
614:    LDA  1,-17(1)	Ghost frame becomes new active frame 
615:    LDA  3,1(7)	Return address in ac 
616:    JMP  7,-583(7)	CALL outnl
617:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -17
* TOFF set: -4
* END COMPOUND
* Add standard closing in case there is no return statement
618:    LDC  2,0(6)	Set return value to 0 
619:     LD  3,-1(1)	Load return address 
620:     LD  1,0(1)	Adjust fp 
621:    JMP  7,0(3)	Return 
* END FUNCTION dog
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
622:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -24
623:    LDC  3,20(6)	load size of array qq
624:     ST  3,-3(1)	save size of array qq
* Compound Body
* EXPRESSION
625:    LDC  3,888(6)	Load integer constant 
626:     ST  3,-2(1)	Store variable pp
* EXPRESSION
627:    LDC  3,1(6)	Load integer constant 
628:     ST  3,-24(1)	Push index 
* TOFF dec: -25
629:    LDC  3,999(6)	Load integer constant 
* TOFF inc: -24
630:     LD  4,-24(1)	Pop index 
631:    LDA  5,-4(1)	Load address of base of array qq
632:    SUB  5,5,4	Compute offset of value 
633:     ST  3,0(5)	Store variable qq
* EXPRESSION
* CALL dog
634:     ST  1,-24(1)	Store fp in ghost frame for dog
* TOFF dec: -25
* TOFF dec: -26
* Param 1
635:     LD  3,-2(1)	Load variable pp
636:     ST  3,-26(1)	Push parameter 
* TOFF dec: -27
* Param 2
637:    LDA  3,-4(1)	Load address of base of array qq
638:     ST  3,-27(1)	Push parameter 
* TOFF dec: -28
* Param end dog
639:    LDA  1,-24(1)	Ghost frame becomes new active frame 
640:    LDA  3,1(7)	Return address in ac 
641:    JMP  7,-603(7)	CALL dog
642:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -24
* EXPRESSION
* CALL output
643:     ST  1,-24(1)	Store fp in ghost frame for output
* TOFF dec: -25
* TOFF dec: -26
* Param 1
644:     LD  3,-2(1)	Load variable pp
645:     ST  3,-26(1)	Push parameter 
* TOFF dec: -27
* Param end output
646:    LDA  1,-24(1)	Ghost frame becomes new active frame 
647:    LDA  3,1(7)	Return address in ac 
648:    JMP  7,-643(7)	CALL output
649:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -24
* EXPRESSION
* CALL output
650:     ST  1,-24(1)	Store fp in ghost frame for output
* TOFF dec: -25
* TOFF dec: -26
* Param 1
651:    LDA  3,-4(1)	Load address of base of array qq
652:     ST  3,-26(1)	Push left side 
* TOFF dec: -27
653:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -26
654:     LD  4,-26(1)	Pop left into ac1 
655:    SUB  3,4,3	compute location from index 
656:     LD  3,0(3)	Load array element 
657:     ST  3,-26(1)	Push parameter 
* TOFF dec: -27
* Param end output
658:    LDA  1,-24(1)	Ghost frame becomes new active frame 
659:    LDA  3,1(7)	Return address in ac 
660:    JMP  7,-655(7)	CALL output
661:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -24
* EXPRESSION
* CALL outnl
662:     ST  1,-24(1)	Store fp in ghost frame for outnl
* TOFF dec: -25
* TOFF dec: -26
* Param end outnl
663:    LDA  1,-24(1)	Ghost frame becomes new active frame 
664:    LDA  3,1(7)	Return address in ac 
665:    JMP  7,-632(7)	CALL outnl
666:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -24
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
667:    LDC  2,0(6)	Set return value to 0 
668:     LD  3,-1(1)	Load return address 
669:     LD  1,0(1)	Adjust fp 
670:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,670(7)	Jump to init [backpatch] 
* INIT
671:    LDA  1,-12(0)	set first frame at end of globals 
672:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
673:    LDC  3,10(6)	load size of array h
674:     ST  3,-1(0)	save size of array h
* END INIT GLOBALS AND STATICS
675:    LDA  3,1(7)	Return address in ac 
676:    JMP  7,-55(7)	Jump to main 
677:   HALT  0,0,0	DONE! 
* END INIT
