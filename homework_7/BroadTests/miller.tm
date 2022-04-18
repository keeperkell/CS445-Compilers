* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  miller.c-
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
* FUNCTION showIntArray
* TOFF set: -4
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -5
* Compound Body
* EXPRESSION
 40:    LDC  3,0(6)	Load integer constant 
 41:     ST  3,-4(1)	Store variable i
* WHILE
 42:     LD  3,-4(1)	Load variable i
 43:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 44:     LD  3,-3(1)	Load variable size
* TOFF inc: -5
 45:     LD  4,-5(1)	Pop left into ac1 
 46:    TLT  3,4,3	Op < 
 47:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -5
* Compound Body
* EXPRESSION
* CALL output
 49:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 50:     LD  3,-2(1)	Load address of base of array x
 51:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
 52:     LD  3,-4(1)	Load variable i
* TOFF inc: -7
 53:     LD  4,-7(1)	Pop left into ac1 
 54:    SUB  3,4,3	compute location from index 
 55:     LD  3,0(3)	Load array element 
 56:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
 57:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 58:    LDA  3,1(7)	Return address in ac 
 59:    JMP  7,-54(7)	CALL output
 60:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
 61:     LD  3,-4(1)	Load variable i
 62:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 63:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -5
 64:     LD  4,-5(1)	Pop left into ac1 
 65:    ADD  3,4,3	Op + 
 66:     ST  3,-4(1)	Store variable i
* TOFF set: -5
* END COMPOUND
 67:    JMP  7,-26(7)	go to beginning of loop 
 48:    JMP  7,19(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
* CALL outnl
 68:     ST  1,-5(1)	Store fp in ghost frame for outnl
* TOFF dec: -6
* TOFF dec: -7
* Param end outnl
 69:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 70:    LDA  3,1(7)	Return address in ac 
 71:    JMP  7,-38(7)	CALL outnl
 72:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -5
* TOFF set: -4
* END COMPOUND
* Add standard closing in case there is no return statement
 73:    LDC  2,0(6)	Set return value to 0 
 74:     LD  3,-1(1)	Load return address 
 75:     LD  1,0(1)	Adjust fp 
 76:    JMP  7,0(3)	Return 
* END FUNCTION showIntArray
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION dog
* TOFF set: -4
 77:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -4
* Compound Body
* EXPRESSION
 78:     LD  3,-2(1)	Load variable a
 79:     ST  3,-2(1)	Store variable a
* EXPRESSION
 80:    LDC  3,7(6)	Load integer constant 
 81:     ST  3,-4(1)	Push index 
* TOFF dec: -5
 82:     LD  3,-3(1)	Load address of base of array b
 83:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 84:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -5
 85:     LD  4,-5(1)	Pop left into ac1 
 86:    SUB  3,4,3	compute location from index 
 87:     LD  3,0(3)	Load array element 
* TOFF inc: -4
 88:     LD  4,-4(1)	Pop index 
 89:     LD  5,-3(1)	Load address of base of array b
 90:    SUB  5,5,4	Compute offset of value 
 91:     ST  3,0(5)	Store variable b
* EXPRESSION
* CALL output
 92:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 93:     LD  3,-2(1)	Load variable a
 94:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
 95:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 96:    LDA  3,1(7)	Return address in ac 
 97:    JMP  7,-92(7)	CALL output
 98:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
* CALL outnl
 99:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
100:    LDA  1,-4(1)	Ghost frame becomes new active frame 
101:    LDA  3,1(7)	Return address in ac 
102:    JMP  7,-69(7)	CALL outnl
103:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
* EXPRESSION
* CALL output
104:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
105:     LD  3,-3(1)	Load address of base of array b
106:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
107:    LDC  3,7(6)	Load integer constant 
* TOFF inc: -6
108:     LD  4,-6(1)	Pop left into ac1 
109:    SUB  3,4,3	compute location from index 
110:     LD  3,0(3)	Load array element 
111:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
112:    LDA  1,-4(1)	Ghost frame becomes new active frame 
113:    LDA  3,1(7)	Return address in ac 
114:    JMP  7,-109(7)	CALL output
115:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
* CALL outnl
116:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
117:    LDA  1,-4(1)	Ghost frame becomes new active frame 
118:    LDA  3,1(7)	Return address in ac 
119:    JMP  7,-86(7)	CALL outnl
120:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
* TOFF set: -4
* END COMPOUND
* Add standard closing in case there is no return statement
121:    LDC  2,0(6)	Set return value to 0 
122:     LD  3,-1(1)	Load return address 
123:     LD  1,0(1)	Adjust fp 
124:    JMP  7,0(3)	Return 
* END FUNCTION dog
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION getnxtindex
* TOFF set: -3
125:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* RETURN
126:     LD  3,-2(1)	Load variable x
127:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
128:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -3
129:     LD  4,-3(1)	Pop left into ac1 
130:    ADD  3,4,3	Op + 
131:    LDA  2,0(3)	Copy result to return register 
132:     LD  3,-1(1)	Load return address 
133:     LD  1,0(1)	Adjust fp 
134:    JMP  7,0(3)	Return 
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
135:    LDC  2,0(6)	Set return value to 0 
136:     LD  3,-1(1)	Load return address 
137:     LD  1,0(1)	Adjust fp 
138:    JMP  7,0(3)	Return 
* END FUNCTION getnxtindex
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
139:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -58
140:    LDC  3,10(6)	load size of array c
141:     ST  3,-3(1)	save size of array c
142:    LDC  3,10(6)	load size of array d
143:     ST  3,-14(1)	save size of array d
144:    LDC  3,10(6)	load size of array y
145:     ST  3,-25(1)	save size of array y
146:    LDC  3,10(6)	load size of array z
147:     ST  3,-36(1)	save size of array z
148:    LDC  3,10(6)	load size of array w
149:     ST  3,-47(1)	save size of array w
* Compound Body
* EXPRESSION
150:    LDC  3,0(6)	Load integer constant 
151:     ST  3,-58(1)	Push index 
* TOFF dec: -59
152:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -58
153:     LD  4,-58(1)	Pop index 
154:    LDA  5,-4(1)	Load address of base of array c
155:    SUB  5,5,4	Compute offset of value 
156:     ST  3,0(5)	Store variable c
* EXPRESSION
157:    LDC  3,3(6)	Load integer constant 
158:     ST  3,-58(1)	Push index 
* TOFF dec: -59
159:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -58
160:     LD  4,-58(1)	Pop index 
161:    LDA  5,-15(1)	Load address of base of array d
162:    SUB  5,5,4	Compute offset of value 
163:     ST  3,0(5)	Store variable d
* EXPRESSION
164:    LDC  3,4(6)	Load integer constant 
165:     ST  3,-58(1)	Push index 
* TOFF dec: -59
166:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -58
167:     LD  4,-58(1)	Pop index 
168:    LDA  5,-15(1)	Load address of base of array d
169:    SUB  5,5,4	Compute offset of value 
170:     ST  3,0(5)	Store variable d
* EXPRESSION
171:    LDC  3,5(6)	Load integer constant 
172:     ST  3,-58(1)	Push index 
* TOFF dec: -59
173:    LDC  3,100(6)	Load integer constant 
* TOFF inc: -58
174:     LD  4,-58(1)	Pop index 
175:    LDA  5,-26(1)	Load address of base of array y
176:    SUB  5,5,4	Compute offset of value 
177:     ST  3,0(5)	Store variable y
* EXPRESSION
178:    LDC  3,9(6)	Load integer constant 
179:     ST  3,-58(1)	Push index 
* TOFF dec: -59
180:    LDC  3,50(6)	Load integer constant 
* TOFF inc: -58
181:     LD  4,-58(1)	Pop index 
182:    LDA  5,-48(1)	Load address of base of array w
183:    SUB  5,5,4	Compute offset of value 
184:     ST  3,0(5)	Store variable w
* EXPRESSION
* CALL dog
185:     ST  1,-58(1)	Store fp in ghost frame for dog
* TOFF dec: -59
* TOFF dec: -60
* Param 1
186:    LDA  3,-26(1)	Load address of base of array y
187:     ST  3,-60(1)	Push left side 
* TOFF dec: -61
188:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -60
189:     LD  4,-60(1)	Pop left into ac1 
190:    SUB  3,4,3	compute location from index 
191:     LD  3,0(3)	Load array element 
192:     ST  3,-60(1)	Push parameter 
* TOFF dec: -61
* Param 2
193:    LDA  3,-48(1)	Load address of base of array w
194:     ST  3,-61(1)	Push parameter 
* TOFF dec: -62
* Param end dog
195:    LDA  1,-58(1)	Ghost frame becomes new active frame 
196:    LDA  3,1(7)	Return address in ac 
197:    JMP  7,-121(7)	CALL dog
198:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -58
* EXPRESSION
199:    LDC  3,9(6)	Load integer constant 
200:     ST  3,-58(1)	Push index 
* TOFF dec: -59
201:    LDC  3,12(6)	Load integer constant 
* TOFF inc: -58
202:     LD  4,-58(1)	Pop index 
203:    LDA  5,-48(1)	Load address of base of array w
204:    SUB  5,5,4	Compute offset of value 
205:     ST  3,0(5)	Store variable w
* EXPRESSION
* CALL dog
206:     ST  1,-58(1)	Store fp in ghost frame for dog
* TOFF dec: -59
* TOFF dec: -60
* Param 1
207:    LDA  3,-26(1)	Load address of base of array y
208:     ST  3,-60(1)	Push left side 
* TOFF dec: -61
209:    LDA  3,-15(1)	Load address of base of array d
210:     ST  3,-61(1)	Push left side 
* TOFF dec: -62
211:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -61
212:     LD  4,-61(1)	Pop left into ac1 
213:    SUB  3,4,3	compute location from index 
214:     LD  3,0(3)	Load array element 
* TOFF inc: -60
215:     LD  4,-60(1)	Pop left into ac1 
216:    SUB  3,4,3	compute location from index 
217:     LD  3,0(3)	Load array element 
218:     ST  3,-60(1)	Push parameter 
* TOFF dec: -61
* Param 2
219:    LDA  3,-48(1)	Load address of base of array w
220:     ST  3,-61(1)	Push parameter 
* TOFF dec: -62
* Param end dog
221:    LDA  1,-58(1)	Ghost frame becomes new active frame 
222:    LDA  3,1(7)	Return address in ac 
223:    JMP  7,-147(7)	CALL dog
224:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -58
* EXPRESSION
225:    LDC  3,8(6)	Load integer constant 
226:     ST  3,-58(1)	Push index 
* TOFF dec: -59
227:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -58
228:     LD  4,-58(1)	Pop index 
229:    LDA  5,-4(1)	Load address of base of array c
230:    SUB  5,5,4	Compute offset of value 
231:     ST  3,0(5)	Store variable c
* EXPRESSION
232:    LDC  3,9(6)	Load integer constant 
233:     ST  3,-58(1)	Push index 
* TOFF dec: -59
234:    LDC  3,25(6)	Load integer constant 
* TOFF inc: -58
235:     LD  4,-58(1)	Pop index 
236:    LDA  5,-4(1)	Load address of base of array c
237:    SUB  5,5,4	Compute offset of value 
238:     ST  3,0(5)	Store variable c
* EXPRESSION
239:    LDC  3,9(6)	Load integer constant 
240:     ST  3,-58(1)	Push index 
* TOFF dec: -59
241:    LDC  3,66(6)	Load integer constant 
* TOFF inc: -58
242:     LD  4,-58(1)	Pop index 
243:    LDA  5,-26(1)	Load address of base of array y
244:    SUB  5,5,4	Compute offset of value 
245:     ST  3,0(5)	Store variable y
* EXPRESSION
* CALL dog
246:     ST  1,-58(1)	Store fp in ghost frame for dog
* TOFF dec: -59
* TOFF dec: -60
* Param 1
247:    LDA  3,-26(1)	Load address of base of array y
248:     ST  3,-60(1)	Push left side 
* TOFF dec: -61
249:    LDA  3,-15(1)	Load address of base of array d
250:     ST  3,-61(1)	Push left side 
* TOFF dec: -62
251:    LDA  3,-4(1)	Load address of base of array c
252:     ST  3,-62(1)	Push left side 
* TOFF dec: -63
253:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -62
254:     LD  4,-62(1)	Pop left into ac1 
255:    SUB  3,4,3	compute location from index 
256:     LD  3,0(3)	Load array element 
* TOFF inc: -61
257:     LD  4,-61(1)	Pop left into ac1 
258:    SUB  3,4,3	compute location from index 
259:     LD  3,0(3)	Load array element 
* TOFF inc: -60
260:     LD  4,-60(1)	Pop left into ac1 
261:    SUB  3,4,3	compute location from index 
262:     LD  3,0(3)	Load array element 
263:     ST  3,-60(1)	Push parameter 
* TOFF dec: -61
* Param 2
264:    LDA  3,-4(1)	Load address of base of array c
265:     ST  3,-61(1)	Push parameter 
* TOFF dec: -62
* Param end dog
266:    LDA  1,-58(1)	Ghost frame becomes new active frame 
267:    LDA  3,1(7)	Return address in ac 
268:    JMP  7,-192(7)	CALL dog
269:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -58
* EXPRESSION
270:    LDC  3,777(6)	Load integer constant 
271:     ST  3,-2(1)	Store variable x
* EXPRESSION
272:    LDC  3,7(6)	Load integer constant 
273:     ST  3,-58(1)	Push index 
* TOFF dec: -59
274:    LDC  3,123(6)	Load integer constant 
* TOFF inc: -58
275:     LD  4,-58(1)	Pop index 
276:    LDA  5,-26(1)	Load address of base of array y
277:    SUB  5,5,4	Compute offset of value 
278:     ST  3,0(5)	Store variable y
* EXPRESSION
279:    LDC  3,9(6)	Load integer constant 
280:     ST  3,-58(1)	Push index 
* TOFF dec: -59
281:    LDA  3,-26(1)	Load address of base of array y
282:     ST  3,-59(1)	Push left side 
* TOFF dec: -60
283:    LDC  3,7(6)	Load integer constant 
* TOFF inc: -59
284:     LD  4,-59(1)	Pop left into ac1 
285:    SUB  3,4,3	compute location from index 
286:     LD  3,0(3)	Load array element 
* TOFF inc: -58
287:     LD  4,-58(1)	Pop index 
288:    LDA  5,-26(1)	Load address of base of array y
289:    SUB  5,5,4	Compute offset of value 
290:     ST  3,0(5)	Store variable y
* EXPRESSION
* CALL dog
291:     ST  1,-58(1)	Store fp in ghost frame for dog
* TOFF dec: -59
* TOFF dec: -60
* Param 1
292:     LD  3,-2(1)	Load variable x
293:     ST  3,-60(1)	Push parameter 
* TOFF dec: -61
* Param 2
294:    LDA  3,-26(1)	Load address of base of array y
295:     ST  3,-61(1)	Push parameter 
* TOFF dec: -62
* Param end dog
296:    LDA  1,-58(1)	Ghost frame becomes new active frame 
297:    LDA  3,1(7)	Return address in ac 
298:    JMP  7,-222(7)	CALL dog
299:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -58
* EXPRESSION
300:     LD  3,-2(1)	Load variable x
301:     ST  3,-2(1)	Store variable x
* EXPRESSION
302:    LDC  3,9(6)	Load integer constant 
303:     ST  3,-58(1)	Push index 
* TOFF dec: -59
304:     LD  3,-2(1)	Load variable x
* TOFF inc: -58
305:     LD  4,-58(1)	Pop index 
306:    LDA  5,-4(1)	Load address of base of array c
307:    SUB  5,5,4	Compute offset of value 
308:     ST  3,0(5)	Store variable c
* EXPRESSION
309:    LDC  3,888(6)	Load integer constant 
310:     ST  3,-11(0)	Store variable glx
* EXPRESSION
311:    LDC  3,7(6)	Load integer constant 
312:     ST  3,-58(1)	Push index 
* TOFF dec: -59
313:     LD  3,-11(0)	Load variable glx
* TOFF inc: -58
314:     LD  4,-58(1)	Pop index 
315:    LDA  5,-26(1)	Load address of base of array y
316:    SUB  5,5,4	Compute offset of value 
317:     ST  3,0(5)	Store variable y
* EXPRESSION
318:    LDC  3,6(6)	Load integer constant 
319:     ST  3,-58(1)	Push index 
* TOFF dec: -59
320:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -58
321:     LD  4,-58(1)	Pop index 
322:    LDA  5,-15(1)	Load address of base of array d
323:    SUB  5,5,4	Compute offset of value 
324:     ST  3,0(5)	Store variable d
* EXPRESSION
325:    LDC  3,2(6)	Load integer constant 
326:     ST  3,-58(1)	Push index 
* TOFF dec: -59
327:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -58
328:     LD  4,-58(1)	Pop index 
329:    LDA  5,-4(1)	Load address of base of array c
330:    SUB  5,5,4	Compute offset of value 
331:     ST  3,0(5)	Store variable c
* EXPRESSION
332:    LDC  3,4(6)	Load integer constant 
333:     ST  3,-58(1)	Push index 
* TOFF dec: -59
334:    LDC  3,7(6)	Load integer constant 
* TOFF inc: -58
335:     LD  4,-58(1)	Pop index 
336:    LDA  5,-15(1)	Load address of base of array d
337:    SUB  5,5,4	Compute offset of value 
338:     ST  3,0(5)	Store variable d
* EXPRESSION
339:    LDC  3,2(6)	Load integer constant 
340:     ST  3,-58(1)	Push index 
* TOFF dec: -59
341:    LDA  3,-26(1)	Load address of base of array y
342:     ST  3,-59(1)	Push left side 
* TOFF dec: -60
343:    LDA  3,-15(1)	Load address of base of array d
344:     ST  3,-60(1)	Push left side 
* TOFF dec: -61
345:    LDA  3,-4(1)	Load address of base of array c
346:     ST  3,-61(1)	Push left side 
* TOFF dec: -62
347:    LDA  3,-15(1)	Load address of base of array d
348:     ST  3,-62(1)	Push left side 
* TOFF dec: -63
349:    LDC  3,6(6)	Load integer constant 
* TOFF inc: -62
350:     LD  4,-62(1)	Pop left into ac1 
351:    SUB  3,4,3	compute location from index 
352:     LD  3,0(3)	Load array element 
* TOFF inc: -61
353:     LD  4,-61(1)	Pop left into ac1 
354:    SUB  3,4,3	compute location from index 
355:     LD  3,0(3)	Load array element 
* TOFF inc: -60
356:     LD  4,-60(1)	Pop left into ac1 
357:    SUB  3,4,3	compute location from index 
358:     LD  3,0(3)	Load array element 
* TOFF inc: -59
359:     LD  4,-59(1)	Pop left into ac1 
360:    SUB  3,4,3	compute location from index 
361:     LD  3,0(3)	Load array element 
* TOFF inc: -58
362:     LD  4,-58(1)	Pop index 
363:    LDA  5,-15(1)	Load address of base of array d
364:    SUB  5,5,4	Compute offset of value 
365:     ST  3,0(5)	Store variable d
* EXPRESSION
* CALL dog
366:     ST  1,-58(1)	Store fp in ghost frame for dog
* TOFF dec: -59
* TOFF dec: -60
* Param 1
367:    LDA  3,-26(1)	Load address of base of array y
368:     ST  3,-60(1)	Push left side 
* TOFF dec: -61
369:    LDA  3,-15(1)	Load address of base of array d
370:     ST  3,-61(1)	Push left side 
* TOFF dec: -62
371:    LDA  3,-4(1)	Load address of base of array c
372:     ST  3,-62(1)	Push left side 
* TOFF dec: -63
373:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -62
374:     LD  4,-62(1)	Pop left into ac1 
375:    SUB  3,4,3	compute location from index 
376:     LD  3,0(3)	Load array element 
* TOFF inc: -61
377:     LD  4,-61(1)	Pop left into ac1 
378:    SUB  3,4,3	compute location from index 
379:     LD  3,0(3)	Load array element 
* TOFF inc: -60
380:     LD  4,-60(1)	Pop left into ac1 
381:    SUB  3,4,3	compute location from index 
382:     LD  3,0(3)	Load array element 
383:     ST  3,-60(1)	Push parameter 
* TOFF dec: -61
* Param 2
384:    LDA  3,-4(1)	Load address of base of array c
385:     ST  3,-61(1)	Push parameter 
* TOFF dec: -62
* Param end dog
386:    LDA  1,-58(1)	Ghost frame becomes new active frame 
387:    LDA  3,1(7)	Return address in ac 
388:    JMP  7,-312(7)	CALL dog
389:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -58
* EXPRESSION
390:    LDC  3,2(6)	Load integer constant 
391:     ST  3,-58(1)	Push index 
* TOFF dec: -59
392:    LDA  3,-4(1)	Load address of base of array c
393:     ST  3,-59(1)	Push left side 
* TOFF dec: -60
394:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -59
395:     LD  4,-59(1)	Pop left into ac1 
396:    SUB  3,4,3	compute location from index 
397:     LD  3,0(3)	Load array element 
* TOFF inc: -58
398:     LD  4,-58(1)	Pop index 
399:    LDA  5,-15(1)	Load address of base of array d
400:    SUB  5,5,4	Compute offset of value 
401:     ST  3,0(5)	Store variable d
* EXPRESSION
402:    LDC  3,7(6)	Load integer constant 
403:     ST  3,-58(1)	Push index 
* TOFF dec: -59
404:    LDA  3,-26(1)	Load address of base of array y
405:     ST  3,-59(1)	Push left side 
* TOFF dec: -60
406:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -59
407:     LD  4,-59(1)	Pop left into ac1 
408:    SUB  3,4,3	compute location from index 
409:     LD  3,0(3)	Load array element 
* TOFF inc: -58
410:     LD  4,-58(1)	Pop index 
411:    LDA  5,-26(1)	Load address of base of array y
412:    SUB  5,5,4	Compute offset of value 
413:     ST  3,0(5)	Store variable y
* EXPRESSION
414:    LDC  3,2(6)	Load integer constant 
415:     ST  3,-58(1)	Push index 
* TOFF dec: -59
416:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -58
417:     LD  4,-58(1)	Pop index 
418:    LDA  5,-1(0)	Load address of base of array gl
419:    SUB  5,5,4	Compute offset of value 
420:     ST  3,0(5)	Store variable gl
* EXPRESSION
421:    LDA  3,-1(0)	Load address of base of array gl
422:     ST  3,-58(1)	Push left side 
* TOFF dec: -59
423:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -58
424:     LD  4,-58(1)	Pop left into ac1 
425:    SUB  3,4,3	compute location from index 
426:     LD  3,0(3)	Load array element 
427:     ST  3,-2(1)	Store variable x
* EXPRESSION
428:    LDC  3,7(6)	Load integer constant 
429:     ST  3,-58(1)	Push index 
* TOFF dec: -59
430:    LDA  3,-1(0)	Load address of base of array gl
431:     ST  3,-59(1)	Push left side 
* TOFF dec: -60
432:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -59
433:     LD  4,-59(1)	Pop left into ac1 
434:    SUB  3,4,3	compute location from index 
435:     LD  3,0(3)	Load array element 
* TOFF inc: -58
436:     LD  4,-58(1)	Pop index 
437:    LDA  5,-26(1)	Load address of base of array y
438:    SUB  5,5,4	Compute offset of value 
439:     ST  3,0(5)	Store variable y
* EXPRESSION
440:    LDC  3,7(6)	Load integer constant 
441:     ST  3,-58(1)	Push index 
* TOFF dec: -59
442:    LDA  3,-26(1)	Load address of base of array y
443:     ST  3,-59(1)	Push left side 
* TOFF dec: -60
444:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -59
445:     LD  4,-59(1)	Pop left into ac1 
446:    SUB  3,4,3	compute location from index 
447:     LD  3,0(3)	Load array element 
* TOFF inc: -58
448:     LD  4,-58(1)	Pop index 
449:    LDA  5,-1(0)	Load address of base of array gl
450:    SUB  5,5,4	Compute offset of value 
451:     ST  3,0(5)	Store variable gl
* EXPRESSION
452:    LDC  3,0(6)	Load integer constant 
453:     ST  3,-58(1)	Push index 
* TOFF dec: -59
454:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -58
455:     LD  4,-58(1)	Pop index 
456:    LDA  5,-26(1)	Load address of base of array y
457:    SUB  5,5,4	Compute offset of value 
458:     ST  3,0(5)	Store variable y
* EXPRESSION
459:    LDC  3,5(6)	Load integer constant 
460:     ST  3,-58(1)	Push index 
* TOFF dec: -59
461:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -58
462:     LD  4,-58(1)	Pop index 
463:    LDA  5,-15(1)	Load address of base of array d
464:    SUB  5,5,4	Compute offset of value 
465:     ST  3,0(5)	Store variable d
* EXPRESSION
466:    LDC  3,8(6)	Load integer constant 
467:     ST  3,-58(1)	Push index 
* TOFF dec: -59
468:    LDA  3,-15(1)	Load address of base of array d
469:     ST  3,-59(1)	Push left side 
* TOFF dec: -60
470:    LDA  3,-26(1)	Load address of base of array y
471:     ST  3,-60(1)	Push left side 
* TOFF dec: -61
472:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -60
473:     LD  4,-60(1)	Pop left into ac1 
474:    SUB  3,4,3	compute location from index 
475:     LD  3,0(3)	Load array element 
* TOFF inc: -59
476:     LD  4,-59(1)	Pop left into ac1 
477:    SUB  3,4,3	compute location from index 
478:     LD  3,0(3)	Load array element 
* TOFF inc: -58
479:     LD  4,-58(1)	Pop index 
480:    LDA  5,-4(1)	Load address of base of array c
481:    SUB  5,5,4	Compute offset of value 
482:     ST  3,0(5)	Store variable c
* EXPRESSION
* CALL output
483:     ST  1,-58(1)	Store fp in ghost frame for output
* TOFF dec: -59
* TOFF dec: -60
* Param 1
484:    LDA  3,-4(1)	Load address of base of array c
485:     ST  3,-60(1)	Push left side 
* TOFF dec: -61
486:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -60
487:     LD  4,-60(1)	Pop left into ac1 
488:    SUB  3,4,3	compute location from index 
489:     LD  3,0(3)	Load array element 
490:     ST  3,-60(1)	Push parameter 
* TOFF dec: -61
* Param end output
491:    LDA  1,-58(1)	Ghost frame becomes new active frame 
492:    LDA  3,1(7)	Return address in ac 
493:    JMP  7,-488(7)	CALL output
494:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -58
* EXPRESSION
* CALL outnl
495:     ST  1,-58(1)	Store fp in ghost frame for outnl
* TOFF dec: -59
* TOFF dec: -60
* Param end outnl
496:    LDA  1,-58(1)	Ghost frame becomes new active frame 
497:    LDA  3,1(7)	Return address in ac 
498:    JMP  7,-465(7)	CALL outnl
499:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -58
* EXPRESSION
500:    LDC  3,3(6)	Load integer constant 
501:     ST  3,-58(1)	Push index 
* TOFF dec: -59
502:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -58
503:     LD  4,-58(1)	Pop index 
504:    LDA  5,-15(1)	Load address of base of array d
505:    SUB  5,5,4	Compute offset of value 
506:     ST  3,0(5)	Store variable d
* EXPRESSION
507:    LDC  3,4(6)	Load integer constant 
508:     ST  3,-58(1)	Push index 
* TOFF dec: -59
509:    LDC  3,987(6)	Load integer constant 
* TOFF inc: -58
510:     LD  4,-58(1)	Pop index 
511:    LDA  5,-26(1)	Load address of base of array y
512:    SUB  5,5,4	Compute offset of value 
513:     ST  3,0(5)	Store variable y
* EXPRESSION
514:    LDC  3,9(6)	Load integer constant 
515:     ST  3,-58(1)	Push index 
* TOFF dec: -59
516:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -58
517:     LD  4,-58(1)	Pop index 
518:    LDA  5,-4(1)	Load address of base of array c
519:    SUB  5,5,4	Compute offset of value 
520:     LD  4,0(5)	load lhs variable c
521:    SUB  3,4,3	op -= 
522:     ST  3,0(5)	Store variable c
* EXPRESSION
* CALL dog
523:     ST  1,-58(1)	Store fp in ghost frame for dog
* TOFF dec: -59
* TOFF dec: -60
* Param 1
524:    LDA  3,-26(1)	Load address of base of array y
525:     ST  3,-60(1)	Push left side 
* TOFF dec: -61
526:    LDA  3,-15(1)	Load address of base of array d
527:     ST  3,-61(1)	Push left side 
* TOFF dec: -62
528:    LDA  3,-4(1)	Load address of base of array c
529:     ST  3,-62(1)	Push left side 
* TOFF dec: -63
530:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -62
531:     LD  4,-62(1)	Pop left into ac1 
532:    SUB  3,4,3	compute location from index 
533:     LD  3,0(3)	Load array element 
* TOFF inc: -61
534:     LD  4,-61(1)	Pop left into ac1 
535:    SUB  3,4,3	compute location from index 
536:     LD  3,0(3)	Load array element 
* TOFF inc: -60
537:     LD  4,-60(1)	Pop left into ac1 
538:    SUB  3,4,3	compute location from index 
539:     LD  3,0(3)	Load array element 
540:     ST  3,-60(1)	Push parameter 
* TOFF dec: -61
* Param 2
541:    LDA  3,-4(1)	Load address of base of array c
542:     ST  3,-61(1)	Push parameter 
* TOFF dec: -62
* Param end dog
543:    LDA  1,-58(1)	Ghost frame becomes new active frame 
544:    LDA  3,1(7)	Return address in ac 
545:    JMP  7,-469(7)	CALL dog
546:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -58
* EXPRESSION
547:    LDA  3,-4(1)	Load address of base of array c
548:     ST  3,-58(1)	Push left side 
* TOFF dec: -59
549:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -58
550:     LD  4,-58(1)	Pop left into ac1 
551:    SUB  3,4,3	compute location from index 
552:     LD  3,0(3)	Load array element 
553:     LD  4,-2(1)	load lhs variable x
554:    ADD  3,4,3	op += 
555:     ST  3,-2(1)	Store variable x
* EXPRESSION
556:    LDA  3,-4(1)	Load address of base of array c
557:     ST  3,-58(1)	Push left side 
* TOFF dec: -59
558:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -58
559:     LD  4,-58(1)	Pop left into ac1 
560:    SUB  3,4,3	compute location from index 
561:     LD  3,0(3)	Load array element 
562:     LD  4,-2(1)	load lhs variable x
563:    SUB  3,4,3	op -= 
564:     ST  3,-2(1)	Store variable x
* EXPRESSION
565:    LDC  3,8(6)	Load integer constant 
566:     ST  3,-58(1)	Push index 
* TOFF dec: -59
567:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -58
568:     LD  4,-58(1)	Pop index 
569:    LDA  5,-26(1)	Load address of base of array y
570:    SUB  5,5,4	Compute offset of value 
571:     ST  3,0(5)	Store variable y
* EXPRESSION
572:    LDC  3,9(6)	Load integer constant 
573:     ST  3,-58(1)	Push index 
* TOFF dec: -59
574:    LDA  3,-26(1)	Load address of base of array y
575:     ST  3,-59(1)	Push left side 
* TOFF dec: -60
* CALL getnxtindex
576:     ST  1,-60(1)	Store fp in ghost frame for getnxtindex
* TOFF dec: -61
* TOFF dec: -62
* Param 1
577:    LDC  3,7(6)	Load integer constant 
578:     ST  3,-62(1)	Push parameter 
* TOFF dec: -63
* Param end getnxtindex
579:    LDA  1,-60(1)	Ghost frame becomes new active frame 
580:    LDA  3,1(7)	Return address in ac 
581:    JMP  7,-457(7)	CALL getnxtindex
582:    LDA  3,0(2)	Save the result in ac 
* Call end getnxtindex
* TOFF set: -60
* TOFF inc: -59
583:     LD  4,-59(1)	Pop left into ac1 
584:    SUB  3,4,3	compute location from index 
585:     LD  3,0(3)	Load array element 
586:     ST  3,-59(1)	Push left side 
* TOFF dec: -60
587:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -59
588:     LD  4,-59(1)	Pop left into ac1 
589:    ADD  3,4,3	Op + 
* TOFF inc: -58
590:     LD  4,-58(1)	Pop index 
591:    LDA  5,-26(1)	Load address of base of array y
592:    SUB  5,5,4	Compute offset of value 
593:     ST  3,0(5)	Store variable y
* EXPRESSION
* CALL dog
594:     ST  1,-58(1)	Store fp in ghost frame for dog
* TOFF dec: -59
* TOFF dec: -60
* Param 1
595:    LDA  3,-26(1)	Load address of base of array y
596:     ST  3,-60(1)	Push left side 
* TOFF dec: -61
597:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -60
598:     LD  4,-60(1)	Pop left into ac1 
599:    SUB  3,4,3	compute location from index 
600:     LD  3,0(3)	Load array element 
601:     ST  3,-60(1)	Push parameter 
* TOFF dec: -61
* Param 2
602:    LDA  3,-26(1)	Load address of base of array y
603:     ST  3,-61(1)	Push parameter 
* TOFF dec: -62
* Param end dog
604:    LDA  1,-58(1)	Ghost frame becomes new active frame 
605:    LDA  3,1(7)	Return address in ac 
606:    JMP  7,-530(7)	CALL dog
607:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -58
* EXPRESSION
608:    LDC  3,5(6)	Load integer constant 
609:     ST  3,-58(1)	Push index 
* TOFF dec: -59
610:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -58
611:     LD  4,-58(1)	Pop index 
612:    LDA  5,-4(1)	Load address of base of array c
613:    SUB  5,5,4	Compute offset of value 
614:     ST  3,0(5)	Store variable c
* EXPRESSION
615:    LDC  3,0(6)	Load integer constant 
616:     ST  3,-58(1)	Push index 
* TOFF dec: -59
617:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -58
618:     LD  4,-58(1)	Pop index 
619:    LDA  5,-48(1)	Load address of base of array w
620:    SUB  5,5,4	Compute offset of value 
621:     ST  3,0(5)	Store variable w
* EXPRESSION
622:    LDC  3,3(6)	Load integer constant 
623:     ST  3,-58(1)	Push index 
* TOFF dec: -59
624:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -58
625:     LD  4,-58(1)	Pop index 
626:    LDA  5,-37(1)	Load address of base of array z
627:    SUB  5,5,4	Compute offset of value 
628:     ST  3,0(5)	Store variable z
* EXPRESSION
629:    LDC  3,9(6)	Load integer constant 
630:     ST  3,-58(1)	Push index 
* TOFF dec: -59
631:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -58
632:     LD  4,-58(1)	Pop index 
633:    LDA  5,-26(1)	Load address of base of array y
634:    SUB  5,5,4	Compute offset of value 
635:     ST  3,0(5)	Store variable y
* EXPRESSION
636:    LDA  3,-26(1)	Load address of base of array y
637:     ST  3,-58(1)	Push left side 
* TOFF dec: -59
638:    LDA  3,-37(1)	Load address of base of array z
639:     ST  3,-59(1)	Push left side 
* TOFF dec: -60
640:    LDA  3,-48(1)	Load address of base of array w
641:     ST  3,-60(1)	Push left side 
* TOFF dec: -61
642:    LDA  3,-4(1)	Load address of base of array c
643:     ST  3,-61(1)	Push left side 
* TOFF dec: -62
644:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -61
645:     LD  4,-61(1)	Pop left into ac1 
646:    SUB  3,4,3	compute location from index 
647:     LD  3,0(3)	Load array element 
* TOFF inc: -60
648:     LD  4,-60(1)	Pop left into ac1 
649:    SUB  3,4,3	compute location from index 
650:     LD  3,0(3)	Load array element 
* TOFF inc: -59
651:     LD  4,-59(1)	Pop left into ac1 
652:    SUB  3,4,3	compute location from index 
653:     LD  3,0(3)	Load array element 
* TOFF inc: -58
654:     LD  4,-58(1)	Pop left into ac1 
655:    SUB  3,4,3	compute location from index 
656:     LD  3,0(3)	Load array element 
657:     ST  3,-58(1)	Push index 
* TOFF dec: -59
658:    LDC  3,77(6)	Load integer constant 
* TOFF inc: -58
659:     LD  4,-58(1)	Pop index 
660:    LDA  5,-15(1)	Load address of base of array d
661:    SUB  5,5,4	Compute offset of value 
662:     ST  3,0(5)	Store variable d
* EXPRESSION
663:    LDC  3,9(6)	Load integer constant 
664:     ST  3,-58(1)	Push index 
* TOFF dec: -59
665:    LDA  3,-15(1)	Load address of base of array d
666:     ST  3,-59(1)	Push left side 
* TOFF dec: -60
667:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -59
668:     LD  4,-59(1)	Pop left into ac1 
669:    SUB  3,4,3	compute location from index 
670:     LD  3,0(3)	Load array element 
* TOFF inc: -58
671:     LD  4,-58(1)	Pop index 
672:    LDA  5,-4(1)	Load address of base of array c
673:    SUB  5,5,4	Compute offset of value 
674:     ST  3,0(5)	Store variable c
* EXPRESSION
* CALL dog
675:     ST  1,-58(1)	Store fp in ghost frame for dog
* TOFF dec: -59
* TOFF dec: -60
* Param 1
676:    LDC  3,66(6)	Load integer constant 
677:     ST  3,-60(1)	Push parameter 
* TOFF dec: -61
* Param 2
678:    LDA  3,-4(1)	Load address of base of array c
679:     ST  3,-61(1)	Push parameter 
* TOFF dec: -62
* Param end dog
680:    LDA  1,-58(1)	Ghost frame becomes new active frame 
681:    LDA  3,1(7)	Return address in ac 
682:    JMP  7,-606(7)	CALL dog
683:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -58
* COMPOUND
* TOFF set: -60
* Compound Body
* EXPRESSION
684:    LDC  3,0(6)	Load integer constant 
685:     ST  3,-58(1)	Store variable p
* WHILE
686:     LD  3,-58(1)	Load variable p
687:     ST  3,-60(1)	Push left side 
* TOFF dec: -61
688:    LDC  3,10(6)	Load integer constant 
* TOFF inc: -60
689:     LD  4,-60(1)	Pop left into ac1 
690:    TLT  3,4,3	Op < 
691:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -60
* Compound Body
* EXPRESSION
693:     LD  3,-58(1)	Load variable p
694:     ST  3,-59(1)	Store variable q
* EXPRESSION
695:    LDC  3,9(6)	Load integer constant 
696:     ST  3,-60(1)	Push left side 
* TOFF dec: -61
697:     LD  3,-59(1)	Load variable q
* TOFF inc: -60
698:     LD  4,-60(1)	Pop left into ac1 
699:    SUB  3,4,3	Op - 
700:     ST  3,-60(1)	Push index 
* TOFF dec: -61
701:    LDC  3,1(6)	Load integer constant 
702:     LD  4,-58(1)	load lhs variable p
703:    ADD  3,4,3	op += 
704:     ST  3,-58(1)	Store variable p
* TOFF inc: -60
705:     LD  4,-60(1)	Pop index 
706:    LDA  5,-4(1)	Load address of base of array c
707:    SUB  5,5,4	Compute offset of value 
708:     ST  3,0(5)	Store variable c
* TOFF set: -60
* END COMPOUND
709:    JMP  7,-24(7)	go to beginning of loop 
692:    JMP  7,17(7)	Jump past loop [backpatch] 
* END WHILE
* TOFF set: -58
* END COMPOUND
* EXPRESSION
* CALL showIntArray
710:     ST  1,-58(1)	Store fp in ghost frame for showIntArray
* TOFF dec: -59
* TOFF dec: -60
* Param 1
711:    LDA  3,-4(1)	Load address of base of array c
712:     ST  3,-60(1)	Push parameter 
* TOFF dec: -61
* Param 2
713:    LDC  3,10(6)	Load integer constant 
714:     ST  3,-61(1)	Push parameter 
* TOFF dec: -62
* Param end showIntArray
715:    LDA  1,-58(1)	Ghost frame becomes new active frame 
716:    LDA  3,1(7)	Return address in ac 
717:    JMP  7,-679(7)	CALL showIntArray
718:    LDA  3,0(2)	Save the result in ac 
* Call end showIntArray
* TOFF set: -58
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
719:    LDC  2,0(6)	Set return value to 0 
720:     LD  3,-1(1)	Load return address 
721:     LD  1,0(1)	Adjust fp 
722:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,722(7)	Jump to init [backpatch] 
* INIT
723:    LDA  1,-12(0)	set first frame at end of globals 
724:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
725:    LDC  3,10(6)	load size of array gl
726:     ST  3,0(0)	save size of array gl
* END INIT GLOBALS AND STATICS
727:    LDA  3,1(7)	Return address in ac 
728:    JMP  7,-590(7)	Jump to main 
729:   HALT  0,0,0	DONE! 
* END INIT
