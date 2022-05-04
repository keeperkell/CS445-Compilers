* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  assign2.c-
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
* TOFF set: -32
 40:    LDC  3,8(6)	load size of array x
 41:     ST  3,-2(1)	save size of array x
 42:    LDC  3,7(6)	load size of array y
 43:     ST  3,-11(1)	save size of array y
 44:    LDC  3,6(6)	load size of array a
 45:     ST  3,-19(1)	save size of array a
 46:    LDC  3,5(6)	load size of array b
 47:     ST  3,-26(1)	save size of array b
* Compound Body
* EXPRESSION
 48:    LDC  3,5(6)	Load integer constant 
 49:     ST  3,-32(1)	Push index 
* TOFF dec: -33
 50:    LDC  3,111(6)	Load integer constant 
* TOFF inc: -32
 51:     LD  4,-32(1)	Pop index 
 52:    LDA  5,-3(1)	Load address of base of array x
 53:    SUB  5,5,4	Compute offset of value 
 54:     ST  3,0(5)	Store variable x
* EXPRESSION
* CALL output
 55:     ST  1,-32(1)	Store fp in ghost frame for output
* TOFF dec: -33
* TOFF dec: -34
* Param 1
 56:    LDA  3,-3(1)	Load address of base of array x
 57:     ST  3,-34(1)	Push left side 
* TOFF dec: -35
 58:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -34
 59:     LD  4,-34(1)	Pop left into ac1 
 60:    SUB  3,4,3	compute location from index 
 61:     LD  3,0(3)	Load array element 
 62:     ST  3,-34(1)	Push parameter 
* TOFF dec: -35
* Param end output
 63:    LDA  1,-32(1)	Ghost frame becomes new active frame 
 64:    LDA  3,1(7)	Return address in ac 
 65:    JMP  7,-60(7)	CALL output
 66:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -32
* EXPRESSION
 67:    LDC  3,4(6)	Load integer constant 
 68:     ST  3,-32(1)	Push index 
* TOFF dec: -33
 69:    LDC  3,222(6)	Load integer constant 
* TOFF inc: -32
 70:     LD  4,-32(1)	Pop index 
 71:    LDA  5,-12(1)	Load address of base of array y
 72:    SUB  5,5,4	Compute offset of value 
 73:     ST  3,0(5)	Store variable y
* EXPRESSION
* CALL output
 74:     ST  1,-32(1)	Store fp in ghost frame for output
* TOFF dec: -33
* TOFF dec: -34
* Param 1
 75:    LDA  3,-12(1)	Load address of base of array y
 76:     ST  3,-34(1)	Push left side 
* TOFF dec: -35
 77:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -34
 78:     LD  4,-34(1)	Pop left into ac1 
 79:    SUB  3,4,3	compute location from index 
 80:     LD  3,0(3)	Load array element 
 81:     ST  3,-34(1)	Push parameter 
* TOFF dec: -35
* Param end output
 82:    LDA  1,-32(1)	Ghost frame becomes new active frame 
 83:    LDA  3,1(7)	Return address in ac 
 84:    JMP  7,-79(7)	CALL output
 85:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -32
* EXPRESSION
 86:    LDC  3,3(6)	Load integer constant 
 87:     ST  3,-32(1)	Push index 
* TOFF dec: -33
 88:    LDC  3,1(6)	Load Boolean constant 
* TOFF inc: -32
 89:     LD  4,-32(1)	Pop index 
 90:    LDA  5,-20(1)	Load address of base of array a
 91:    SUB  5,5,4	Compute offset of value 
 92:     ST  3,0(5)	Store variable a
* EXPRESSION
* CALL outputb
 93:     ST  1,-32(1)	Store fp in ghost frame for outputb
* TOFF dec: -33
* TOFF dec: -34
* Param 1
 94:    LDA  3,-20(1)	Load address of base of array a
 95:     ST  3,-34(1)	Push left side 
* TOFF dec: -35
 96:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -34
 97:     LD  4,-34(1)	Pop left into ac1 
 98:    SUB  3,4,3	compute location from index 
 99:     LD  3,0(3)	Load array element 
100:     ST  3,-34(1)	Push parameter 
* TOFF dec: -35
* Param end outputb
101:    LDA  1,-32(1)	Ghost frame becomes new active frame 
102:    LDA  3,1(7)	Return address in ac 
103:    JMP  7,-87(7)	CALL outputb
104:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -32
* EXPRESSION
105:    LDC  3,2(6)	Load integer constant 
106:     ST  3,-32(1)	Push index 
* TOFF dec: -33
107:    LDC  3,0(6)	Load Boolean constant 
* TOFF inc: -32
108:     LD  4,-32(1)	Pop index 
109:    LDA  5,-27(1)	Load address of base of array b
110:    SUB  5,5,4	Compute offset of value 
111:     ST  3,0(5)	Store variable b
* EXPRESSION
* CALL outputb
112:     ST  1,-32(1)	Store fp in ghost frame for outputb
* TOFF dec: -33
* TOFF dec: -34
* Param 1
113:    LDA  3,-27(1)	Load address of base of array b
114:     ST  3,-34(1)	Push left side 
* TOFF dec: -35
115:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -34
116:     LD  4,-34(1)	Pop left into ac1 
117:    SUB  3,4,3	compute location from index 
118:     LD  3,0(3)	Load array element 
119:     ST  3,-34(1)	Push parameter 
* TOFF dec: -35
* Param end outputb
120:    LDA  1,-32(1)	Ghost frame becomes new active frame 
121:    LDA  3,1(7)	Return address in ac 
122:    JMP  7,-106(7)	CALL outputb
123:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -32
* EXPRESSION
* CALL outnl
124:     ST  1,-32(1)	Store fp in ghost frame for outnl
* TOFF dec: -33
* TOFF dec: -34
* Param end outnl
125:    LDA  1,-32(1)	Ghost frame becomes new active frame 
126:    LDA  3,1(7)	Return address in ac 
127:    JMP  7,-94(7)	CALL outnl
128:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -32
* EXPRESSION
129:    LDC  3,5(6)	Load integer constant 
130:     ST  3,-32(1)	Push index 
* TOFF dec: -33
131:    LDC  3,333(6)	Load integer constant 
* TOFF inc: -32
132:     LD  4,-32(1)	Pop index 
133:    LDA  5,-1(0)	Load address of base of array gx
134:    SUB  5,5,4	Compute offset of value 
135:     ST  3,0(5)	Store variable gx
* EXPRESSION
* CALL output
136:     ST  1,-32(1)	Store fp in ghost frame for output
* TOFF dec: -33
* TOFF dec: -34
* Param 1
137:    LDA  3,-1(0)	Load address of base of array gx
138:     ST  3,-34(1)	Push left side 
* TOFF dec: -35
139:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -34
140:     LD  4,-34(1)	Pop left into ac1 
141:    SUB  3,4,3	compute location from index 
142:     LD  3,0(3)	Load array element 
143:     ST  3,-34(1)	Push parameter 
* TOFF dec: -35
* Param end output
144:    LDA  1,-32(1)	Ghost frame becomes new active frame 
145:    LDA  3,1(7)	Return address in ac 
146:    JMP  7,-141(7)	CALL output
147:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -32
* EXPRESSION
148:    LDC  3,4(6)	Load integer constant 
149:     ST  3,-32(1)	Push index 
* TOFF dec: -33
150:    LDC  3,444(6)	Load integer constant 
* TOFF inc: -32
151:     LD  4,-32(1)	Pop index 
152:    LDA  5,-9(0)	Load address of base of array gy
153:    SUB  5,5,4	Compute offset of value 
154:     ST  3,0(5)	Store variable gy
* EXPRESSION
* CALL output
155:     ST  1,-32(1)	Store fp in ghost frame for output
* TOFF dec: -33
* TOFF dec: -34
* Param 1
156:    LDA  3,-9(0)	Load address of base of array gy
157:     ST  3,-34(1)	Push left side 
* TOFF dec: -35
158:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -34
159:     LD  4,-34(1)	Pop left into ac1 
160:    SUB  3,4,3	compute location from index 
161:     LD  3,0(3)	Load array element 
162:     ST  3,-34(1)	Push parameter 
* TOFF dec: -35
* Param end output
163:    LDA  1,-32(1)	Ghost frame becomes new active frame 
164:    LDA  3,1(7)	Return address in ac 
165:    JMP  7,-160(7)	CALL output
166:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -32
* EXPRESSION
167:    LDC  3,3(6)	Load integer constant 
168:     ST  3,-32(1)	Push index 
* TOFF dec: -33
169:    LDC  3,0(6)	Load Boolean constant 
* TOFF inc: -32
170:     LD  4,-32(1)	Pop index 
171:    LDA  5,-16(0)	Load address of base of array ga
172:    SUB  5,5,4	Compute offset of value 
173:     ST  3,0(5)	Store variable ga
* EXPRESSION
* CALL outputb
174:     ST  1,-32(1)	Store fp in ghost frame for outputb
* TOFF dec: -33
* TOFF dec: -34
* Param 1
175:    LDA  3,-16(0)	Load address of base of array ga
176:     ST  3,-34(1)	Push left side 
* TOFF dec: -35
177:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -34
178:     LD  4,-34(1)	Pop left into ac1 
179:    SUB  3,4,3	compute location from index 
180:     LD  3,0(3)	Load array element 
181:     ST  3,-34(1)	Push parameter 
* TOFF dec: -35
* Param end outputb
182:    LDA  1,-32(1)	Ghost frame becomes new active frame 
183:    LDA  3,1(7)	Return address in ac 
184:    JMP  7,-168(7)	CALL outputb
185:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -32
* EXPRESSION
186:    LDC  3,2(6)	Load integer constant 
187:     ST  3,-32(1)	Push index 
* TOFF dec: -33
188:    LDC  3,1(6)	Load Boolean constant 
* TOFF inc: -32
189:     LD  4,-32(1)	Pop index 
190:    LDA  5,-22(0)	Load address of base of array gb
191:    SUB  5,5,4	Compute offset of value 
192:     ST  3,0(5)	Store variable gb
* EXPRESSION
* CALL outputb
193:     ST  1,-32(1)	Store fp in ghost frame for outputb
* TOFF dec: -33
* TOFF dec: -34
* Param 1
194:    LDA  3,-22(0)	Load address of base of array gb
195:     ST  3,-34(1)	Push left side 
* TOFF dec: -35
196:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -34
197:     LD  4,-34(1)	Pop left into ac1 
198:    SUB  3,4,3	compute location from index 
199:     LD  3,0(3)	Load array element 
200:     ST  3,-34(1)	Push parameter 
* TOFF dec: -35
* Param end outputb
201:    LDA  1,-32(1)	Ghost frame becomes new active frame 
202:    LDA  3,1(7)	Return address in ac 
203:    JMP  7,-187(7)	CALL outputb
204:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -32
* EXPRESSION
* CALL outnl
205:     ST  1,-32(1)	Store fp in ghost frame for outnl
* TOFF dec: -33
* TOFF dec: -34
* Param end outnl
206:    LDA  1,-32(1)	Ghost frame becomes new active frame 
207:    LDA  3,1(7)	Return address in ac 
208:    JMP  7,-175(7)	CALL outnl
209:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -32
* EXPRESSION
210:    LDC  3,5(6)	Load integer constant 
211:     ST  3,-32(1)	Push index 
* TOFF dec: -33
212:    LDA  3,-12(1)	Load address of base of array y
213:     ST  3,-33(1)	Push left side 
* TOFF dec: -34
214:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -33
215:     LD  4,-33(1)	Pop left into ac1 
216:    SUB  3,4,3	compute location from index 
217:     LD  3,0(3)	Load array element 
* TOFF inc: -32
218:     LD  4,-32(1)	Pop index 
219:    LDA  5,-3(1)	Load address of base of array x
220:    SUB  5,5,4	Compute offset of value 
221:     ST  3,0(5)	Store variable x
* EXPRESSION
* CALL output
222:     ST  1,-32(1)	Store fp in ghost frame for output
* TOFF dec: -33
* TOFF dec: -34
* Param 1
223:    LDA  3,-3(1)	Load address of base of array x
224:     ST  3,-34(1)	Push left side 
* TOFF dec: -35
225:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -34
226:     LD  4,-34(1)	Pop left into ac1 
227:    SUB  3,4,3	compute location from index 
228:     LD  3,0(3)	Load array element 
229:     ST  3,-34(1)	Push parameter 
* TOFF dec: -35
* Param end output
230:    LDA  1,-32(1)	Ghost frame becomes new active frame 
231:    LDA  3,1(7)	Return address in ac 
232:    JMP  7,-227(7)	CALL output
233:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -32
* EXPRESSION
234:    LDC  3,3(6)	Load integer constant 
235:     ST  3,-32(1)	Push index 
* TOFF dec: -33
236:    LDA  3,-27(1)	Load address of base of array b
237:     ST  3,-33(1)	Push left side 
* TOFF dec: -34
238:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -33
239:     LD  4,-33(1)	Pop left into ac1 
240:    SUB  3,4,3	compute location from index 
241:     LD  3,0(3)	Load array element 
* TOFF inc: -32
242:     LD  4,-32(1)	Pop index 
243:    LDA  5,-20(1)	Load address of base of array a
244:    SUB  5,5,4	Compute offset of value 
245:     ST  3,0(5)	Store variable a
* EXPRESSION
* CALL outputb
246:     ST  1,-32(1)	Store fp in ghost frame for outputb
* TOFF dec: -33
* TOFF dec: -34
* Param 1
247:    LDA  3,-20(1)	Load address of base of array a
248:     ST  3,-34(1)	Push left side 
* TOFF dec: -35
249:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -34
250:     LD  4,-34(1)	Pop left into ac1 
251:    SUB  3,4,3	compute location from index 
252:     LD  3,0(3)	Load array element 
253:     ST  3,-34(1)	Push parameter 
* TOFF dec: -35
* Param end outputb
254:    LDA  1,-32(1)	Ghost frame becomes new active frame 
255:    LDA  3,1(7)	Return address in ac 
256:    JMP  7,-240(7)	CALL outputb
257:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -32
* EXPRESSION
* CALL outnl
258:     ST  1,-32(1)	Store fp in ghost frame for outnl
* TOFF dec: -33
* TOFF dec: -34
* Param end outnl
259:    LDA  1,-32(1)	Ghost frame becomes new active frame 
260:    LDA  3,1(7)	Return address in ac 
261:    JMP  7,-228(7)	CALL outnl
262:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -32
* EXPRESSION
263:    LDC  3,5(6)	Load integer constant 
264:     ST  3,-32(1)	Push index 
* TOFF dec: -33
265:    LDA  3,-9(0)	Load address of base of array gy
266:     ST  3,-33(1)	Push left side 
* TOFF dec: -34
267:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -33
268:     LD  4,-33(1)	Pop left into ac1 
269:    SUB  3,4,3	compute location from index 
270:     LD  3,0(3)	Load array element 
* TOFF inc: -32
271:     LD  4,-32(1)	Pop index 
272:    LDA  5,-1(0)	Load address of base of array gx
273:    SUB  5,5,4	Compute offset of value 
274:     ST  3,0(5)	Store variable gx
* EXPRESSION
* CALL output
275:     ST  1,-32(1)	Store fp in ghost frame for output
* TOFF dec: -33
* TOFF dec: -34
* Param 1
276:    LDA  3,-1(0)	Load address of base of array gx
277:     ST  3,-34(1)	Push left side 
* TOFF dec: -35
278:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -34
279:     LD  4,-34(1)	Pop left into ac1 
280:    SUB  3,4,3	compute location from index 
281:     LD  3,0(3)	Load array element 
282:     ST  3,-34(1)	Push parameter 
* TOFF dec: -35
* Param end output
283:    LDA  1,-32(1)	Ghost frame becomes new active frame 
284:    LDA  3,1(7)	Return address in ac 
285:    JMP  7,-280(7)	CALL output
286:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -32
* EXPRESSION
287:    LDC  3,3(6)	Load integer constant 
288:     ST  3,-32(1)	Push index 
* TOFF dec: -33
289:    LDA  3,-22(0)	Load address of base of array gb
290:     ST  3,-33(1)	Push left side 
* TOFF dec: -34
291:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -33
292:     LD  4,-33(1)	Pop left into ac1 
293:    SUB  3,4,3	compute location from index 
294:     LD  3,0(3)	Load array element 
* TOFF inc: -32
295:     LD  4,-32(1)	Pop index 
296:    LDA  5,-16(0)	Load address of base of array ga
297:    SUB  5,5,4	Compute offset of value 
298:     ST  3,0(5)	Store variable ga
* EXPRESSION
* CALL outputb
299:     ST  1,-32(1)	Store fp in ghost frame for outputb
* TOFF dec: -33
* TOFF dec: -34
* Param 1
300:    LDA  3,-16(0)	Load address of base of array ga
301:     ST  3,-34(1)	Push left side 
* TOFF dec: -35
302:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -34
303:     LD  4,-34(1)	Pop left into ac1 
304:    SUB  3,4,3	compute location from index 
305:     LD  3,0(3)	Load array element 
306:     ST  3,-34(1)	Push parameter 
* TOFF dec: -35
* Param end outputb
307:    LDA  1,-32(1)	Ghost frame becomes new active frame 
308:    LDA  3,1(7)	Return address in ac 
309:    JMP  7,-293(7)	CALL outputb
310:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -32
* EXPRESSION
* CALL outnl
311:     ST  1,-32(1)	Store fp in ghost frame for outnl
* TOFF dec: -33
* TOFF dec: -34
* Param end outnl
312:    LDA  1,-32(1)	Ghost frame becomes new active frame 
313:    LDA  3,1(7)	Return address in ac 
314:    JMP  7,-281(7)	CALL outnl
315:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -32
* RETURN
316:     LD  3,-1(1)	Load return address 
317:     LD  1,0(1)	Adjust fp 
318:    JMP  7,0(3)	Return 
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
319:    LDC  2,0(6)	Set return value to 0 
320:     LD  3,-1(1)	Load return address 
321:     LD  1,0(1)	Adjust fp 
322:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,322(7)	Jump to init [backpatch] 
* INIT
323:    LDA  1,-26(0)	set first frame at end of globals 
324:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
325:    LDC  3,5(6)	load size of array ga
326:     ST  3,-15(0)	save size of array ga
327:    LDC  3,4(6)	load size of array gb
328:     ST  3,-21(0)	save size of array gb
329:    LDC  3,7(6)	load size of array gx
330:     ST  3,0(0)	save size of array gx
331:    LDC  3,6(6)	load size of array gy
332:     ST  3,-8(0)	save size of array gy
* END INIT GLOBALS AND STATICS
333:    LDA  3,1(7)	Return address in ac 
334:    JMP  7,-296(7)	Jump to main 
335:   HALT  0,0,0	DONE! 
* END INIT
