* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  array.c-
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
* FUNCTION get
* TOFF set: -4
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -4
* Compound Body
* EXPRESSION
* CALL output
 40:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 41:     LD  3,-2(1)	Load address of base of array x
 42:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
 43:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -6
 44:     LD  4,-6(1)	Pop left into ac1 
 45:    SUB  3,4,3	compute location from index 
 46:     LD  3,0(3)	Load array element 
 47:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
 48:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 49:    LDA  3,1(7)	Return address in ac 
 50:    JMP  7,-45(7)	CALL output
 51:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
* CALL outnl
 52:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
 53:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 54:    LDA  3,1(7)	Return address in ac 
 55:    JMP  7,-22(7)	CALL outnl
 56:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
* EXPRESSION
 57:    LDC  3,1(6)	Load integer constant 
 58:     ST  3,-4(1)	Push index 
* TOFF dec: -5
 59:    LDC  3,666(6)	Load integer constant 
* TOFF inc: -4
 60:     LD  4,-4(1)	Pop index 
 61:     LD  5,-2(1)	Load address of base of array x
 62:    SUB  5,5,4	Compute offset of value 
 63:     ST  3,0(5)	Store variable x
* RETURN
 64:     LD  3,-2(1)	Load address of base of array x
 65:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 66:     LD  3,-3(1)	Load variable i
* TOFF inc: -4
 67:     LD  4,-4(1)	Pop left into ac1 
 68:    SUB  3,4,3	compute location from index 
 69:     LD  3,0(3)	Load array element 
 70:    LDA  2,0(3)	Copy result to return register 
 71:     LD  3,-1(1)	Load return address 
 72:     LD  1,0(1)	Adjust fp 
 73:    JMP  7,0(3)	Return 
* TOFF set: -4
* END COMPOUND
* Add standard closing in case there is no return statement
 74:    LDC  2,0(6)	Set return value to 0 
 75:     LD  3,-1(1)	Load return address 
 76:     LD  1,0(1)	Adjust fp 
 77:    JMP  7,0(3)	Return 
* END FUNCTION get
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
 78:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -9
 79:    LDC  3,5(6)	load size of array x
 80:     ST  3,-2(1)	save size of array x
* Compound Body
* EXPRESSION
 81:    LDC  3,2(6)	Load integer constant 
 82:     ST  3,-8(1)	Store variable dog
* EXPRESSION
 83:    LDC  3,0(6)	Load integer constant 
 84:     ST  3,-9(1)	Push index 
* TOFF dec: -10
 85:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -9
 86:     LD  4,-9(1)	Pop index 
 87:    LDA  5,-3(1)	Load address of base of array x
 88:    SUB  5,5,4	Compute offset of value 
 89:     ST  3,0(5)	Store variable x
* EXPRESSION
* CALL output
 90:     ST  1,-9(1)	Store fp in ghost frame for output
* TOFF dec: -10
* TOFF dec: -11
* Param 1
 91:    LDA  3,-3(1)	Load address of base of array x
 92:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
 93:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -11
 94:     LD  4,-11(1)	Pop left into ac1 
 95:    SUB  3,4,3	compute location from index 
 96:     LD  3,0(3)	Load array element 
 97:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param end output
 98:    LDA  1,-9(1)	Ghost frame becomes new active frame 
 99:    LDA  3,1(7)	Return address in ac 
100:    JMP  7,-95(7)	CALL output
101:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -9
* EXPRESSION
102:    LDC  3,1(6)	Load integer constant 
103:     ST  3,-9(1)	Push index 
* TOFF dec: -10
104:    LDA  3,-3(1)	Load address of base of array x
105:     ST  3,-10(1)	Push left side 
* TOFF dec: -11
106:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -10
107:     LD  4,-10(1)	Pop left into ac1 
108:    SUB  3,4,3	compute location from index 
109:     LD  3,0(3)	Load array element 
* TOFF inc: -9
110:     LD  4,-9(1)	Pop index 
111:    LDA  5,-3(1)	Load address of base of array x
112:    SUB  5,5,4	Compute offset of value 
113:     ST  3,0(5)	Store variable x
* EXPRESSION
* CALL output
114:     ST  1,-9(1)	Store fp in ghost frame for output
* TOFF dec: -10
* TOFF dec: -11
* Param 1
115:    LDA  3,-3(1)	Load address of base of array x
116:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
117:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -11
118:     LD  4,-11(1)	Pop left into ac1 
119:    SUB  3,4,3	compute location from index 
120:     LD  3,0(3)	Load array element 
121:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param end output
122:    LDA  1,-9(1)	Ghost frame becomes new active frame 
123:    LDA  3,1(7)	Return address in ac 
124:    JMP  7,-119(7)	CALL output
125:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -9
* EXPRESSION
126:    LDC  3,2(6)	Load integer constant 
127:     ST  3,-9(1)	Push index 
* TOFF dec: -10
128:    LDA  3,-3(1)	Load address of base of array x
129:     ST  3,-10(1)	Push left side 
* TOFF dec: -11
130:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -10
131:     LD  4,-10(1)	Pop left into ac1 
132:    SUB  3,4,3	compute location from index 
133:     LD  3,0(3)	Load array element 
134:     ST  3,-10(1)	Push left side 
* TOFF dec: -11
135:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -10
136:     LD  4,-10(1)	Pop left into ac1 
137:    ADD  3,4,3	Op + 
* TOFF inc: -9
138:     LD  4,-9(1)	Pop index 
139:    LDA  5,-3(1)	Load address of base of array x
140:    SUB  5,5,4	Compute offset of value 
141:     ST  3,0(5)	Store variable x
* EXPRESSION
* CALL output
142:     ST  1,-9(1)	Store fp in ghost frame for output
* TOFF dec: -10
* TOFF dec: -11
* Param 1
143:    LDA  3,-3(1)	Load address of base of array x
144:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
145:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -11
146:     LD  4,-11(1)	Pop left into ac1 
147:    SUB  3,4,3	compute location from index 
148:     LD  3,0(3)	Load array element 
149:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param end output
150:    LDA  1,-9(1)	Ghost frame becomes new active frame 
151:    LDA  3,1(7)	Return address in ac 
152:    JMP  7,-147(7)	CALL output
153:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -9
* EXPRESSION
154:     LD  3,-8(1)	Load variable dog
155:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
156:     LD  3,-8(1)	Load variable dog
* TOFF inc: -9
157:     LD  4,-9(1)	Pop left into ac1 
158:    ADD  3,4,3	Op + 
159:     ST  3,-9(1)	Push index 
* TOFF dec: -10
160:    LDC  3,496(6)	Load integer constant 
* TOFF inc: -9
161:     LD  4,-9(1)	Pop index 
162:    LDA  5,-3(1)	Load address of base of array x
163:    SUB  5,5,4	Compute offset of value 
164:     ST  3,0(5)	Store variable x
* EXPRESSION
* CALL output
165:     ST  1,-9(1)	Store fp in ghost frame for output
* TOFF dec: -10
* TOFF dec: -11
* Param 1
166:    LDA  3,-3(1)	Load address of base of array x
167:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
168:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -11
169:     LD  4,-11(1)	Pop left into ac1 
170:    SUB  3,4,3	compute location from index 
171:     LD  3,0(3)	Load array element 
172:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param end output
173:    LDA  1,-9(1)	Ghost frame becomes new active frame 
174:    LDA  3,1(7)	Return address in ac 
175:    JMP  7,-170(7)	CALL output
176:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -9
* EXPRESSION
* CALL outnl
177:     ST  1,-9(1)	Store fp in ghost frame for outnl
* TOFF dec: -10
* TOFF dec: -11
* Param end outnl
178:    LDA  1,-9(1)	Ghost frame becomes new active frame 
179:    LDA  3,1(7)	Return address in ac 
180:    JMP  7,-147(7)	CALL outnl
181:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -9
* EXPRESSION
182:    LDC  3,2(6)	Load integer constant 
183:     ST  3,-8(1)	Store variable dog
* EXPRESSION
184:    LDC  3,0(6)	Load integer constant 
185:     ST  3,-9(1)	Push index 
* TOFF dec: -10
186:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -9
187:     LD  4,-9(1)	Pop index 
188:    LDA  5,-1(0)	Load address of base of array y
189:    SUB  5,5,4	Compute offset of value 
190:     ST  3,0(5)	Store variable y
* EXPRESSION
* CALL output
191:     ST  1,-9(1)	Store fp in ghost frame for output
* TOFF dec: -10
* TOFF dec: -11
* Param 1
192:    LDA  3,-1(0)	Load address of base of array y
193:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
194:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -11
195:     LD  4,-11(1)	Pop left into ac1 
196:    SUB  3,4,3	compute location from index 
197:     LD  3,0(3)	Load array element 
198:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param end output
199:    LDA  1,-9(1)	Ghost frame becomes new active frame 
200:    LDA  3,1(7)	Return address in ac 
201:    JMP  7,-196(7)	CALL output
202:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -9
* EXPRESSION
203:    LDC  3,1(6)	Load integer constant 
204:     ST  3,-9(1)	Push index 
* TOFF dec: -10
205:    LDA  3,-1(0)	Load address of base of array y
206:     ST  3,-10(1)	Push left side 
* TOFF dec: -11
207:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -10
208:     LD  4,-10(1)	Pop left into ac1 
209:    SUB  3,4,3	compute location from index 
210:     LD  3,0(3)	Load array element 
* TOFF inc: -9
211:     LD  4,-9(1)	Pop index 
212:    LDA  5,-1(0)	Load address of base of array y
213:    SUB  5,5,4	Compute offset of value 
214:     ST  3,0(5)	Store variable y
* EXPRESSION
* CALL output
215:     ST  1,-9(1)	Store fp in ghost frame for output
* TOFF dec: -10
* TOFF dec: -11
* Param 1
216:    LDA  3,-1(0)	Load address of base of array y
217:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
218:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -11
219:     LD  4,-11(1)	Pop left into ac1 
220:    SUB  3,4,3	compute location from index 
221:     LD  3,0(3)	Load array element 
222:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param end output
223:    LDA  1,-9(1)	Ghost frame becomes new active frame 
224:    LDA  3,1(7)	Return address in ac 
225:    JMP  7,-220(7)	CALL output
226:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -9
* EXPRESSION
227:    LDC  3,2(6)	Load integer constant 
228:     ST  3,-9(1)	Push index 
* TOFF dec: -10
229:    LDA  3,-1(0)	Load address of base of array y
230:     ST  3,-10(1)	Push left side 
* TOFF dec: -11
231:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -10
232:     LD  4,-10(1)	Pop left into ac1 
233:    SUB  3,4,3	compute location from index 
234:     LD  3,0(3)	Load array element 
235:     ST  3,-10(1)	Push left side 
* TOFF dec: -11
236:    LDC  3,311(6)	Load integer constant 
* TOFF inc: -10
237:     LD  4,-10(1)	Pop left into ac1 
238:    ADD  3,4,3	Op + 
* TOFF inc: -9
239:     LD  4,-9(1)	Pop index 
240:    LDA  5,-1(0)	Load address of base of array y
241:    SUB  5,5,4	Compute offset of value 
242:     ST  3,0(5)	Store variable y
* EXPRESSION
* CALL output
243:     ST  1,-9(1)	Store fp in ghost frame for output
* TOFF dec: -10
* TOFF dec: -11
* Param 1
244:    LDA  3,-1(0)	Load address of base of array y
245:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
246:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -11
247:     LD  4,-11(1)	Pop left into ac1 
248:    SUB  3,4,3	compute location from index 
249:     LD  3,0(3)	Load array element 
250:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param end output
251:    LDA  1,-9(1)	Ghost frame becomes new active frame 
252:    LDA  3,1(7)	Return address in ac 
253:    JMP  7,-248(7)	CALL output
254:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -9
* EXPRESSION
255:     LD  3,-8(1)	Load variable dog
256:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
257:     LD  3,-8(1)	Load variable dog
* TOFF inc: -9
258:     LD  4,-9(1)	Pop left into ac1 
259:    ADD  3,4,3	Op + 
260:     ST  3,-9(1)	Push index 
* TOFF dec: -10
261:    LDC  3,496(6)	Load integer constant 
* TOFF inc: -9
262:     LD  4,-9(1)	Pop index 
263:    LDA  5,-1(0)	Load address of base of array y
264:    SUB  5,5,4	Compute offset of value 
265:     ST  3,0(5)	Store variable y
* EXPRESSION
* CALL output
266:     ST  1,-9(1)	Store fp in ghost frame for output
* TOFF dec: -10
* TOFF dec: -11
* Param 1
267:    LDA  3,-1(0)	Load address of base of array y
268:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
269:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -11
270:     LD  4,-11(1)	Pop left into ac1 
271:    SUB  3,4,3	compute location from index 
272:     LD  3,0(3)	Load array element 
273:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param end output
274:    LDA  1,-9(1)	Ghost frame becomes new active frame 
275:    LDA  3,1(7)	Return address in ac 
276:    JMP  7,-271(7)	CALL output
277:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -9
* EXPRESSION
* CALL outnl
278:     ST  1,-9(1)	Store fp in ghost frame for outnl
* TOFF dec: -10
* TOFF dec: -11
* Param end outnl
279:    LDA  1,-9(1)	Ghost frame becomes new active frame 
280:    LDA  3,1(7)	Return address in ac 
281:    JMP  7,-248(7)	CALL outnl
282:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -9
* EXPRESSION
* CALL get
283:     ST  1,-9(1)	Store fp in ghost frame for get
* TOFF dec: -10
* TOFF dec: -11
* Param 1
284:    LDA  3,-1(0)	Load address of base of array y
285:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param 2
286:    LDC  3,2(6)	Load integer constant 
287:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param end get
288:    LDA  1,-9(1)	Ghost frame becomes new active frame 
289:    LDA  3,1(7)	Return address in ac 
290:    JMP  7,-252(7)	CALL get
291:    LDA  3,0(2)	Save the result in ac 
* Call end get
* TOFF set: -9
292:     ST  3,-8(1)	Store variable dog
* EXPRESSION
* CALL output
293:     ST  1,-9(1)	Store fp in ghost frame for output
* TOFF dec: -10
* TOFF dec: -11
* Param 1
294:     LD  3,-8(1)	Load variable dog
295:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param end output
296:    LDA  1,-9(1)	Ghost frame becomes new active frame 
297:    LDA  3,1(7)	Return address in ac 
298:    JMP  7,-293(7)	CALL output
299:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -9
* EXPRESSION
* CALL output
300:     ST  1,-9(1)	Store fp in ghost frame for output
* TOFF dec: -10
* TOFF dec: -11
* Param 1
* CALL get
301:     ST  1,-11(1)	Store fp in ghost frame for get
* TOFF dec: -12
* TOFF dec: -13
* Param 1
302:    LDA  3,-1(0)	Load address of base of array y
303:     ST  3,-13(1)	Push parameter 
* TOFF dec: -14
* Param 2
304:    LDC  3,2(6)	Load integer constant 
305:     ST  3,-14(1)	Push parameter 
* TOFF dec: -15
* Param end get
306:    LDA  1,-11(1)	Ghost frame becomes new active frame 
307:    LDA  3,1(7)	Return address in ac 
308:    JMP  7,-270(7)	CALL get
309:    LDA  3,0(2)	Save the result in ac 
* Call end get
* TOFF set: -11
310:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param end output
311:    LDA  1,-9(1)	Ghost frame becomes new active frame 
312:    LDA  3,1(7)	Return address in ac 
313:    JMP  7,-308(7)	CALL output
314:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -9
* EXPRESSION
* CALL output
315:     ST  1,-9(1)	Store fp in ghost frame for output
* TOFF dec: -10
* TOFF dec: -11
* Param 1
316:    LDA  3,-3(1)	Load address of base of array x
317:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
318:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -11
319:     LD  4,-11(1)	Pop left into ac1 
320:    SUB  3,4,3	compute location from index 
321:     LD  3,0(3)	Load array element 
322:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param end output
323:    LDA  1,-9(1)	Ghost frame becomes new active frame 
324:    LDA  3,1(7)	Return address in ac 
325:    JMP  7,-320(7)	CALL output
326:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -9
* EXPRESSION
* CALL outnl
327:     ST  1,-9(1)	Store fp in ghost frame for outnl
* TOFF dec: -10
* TOFF dec: -11
* Param end outnl
328:    LDA  1,-9(1)	Ghost frame becomes new active frame 
329:    LDA  3,1(7)	Return address in ac 
330:    JMP  7,-297(7)	CALL outnl
331:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -9
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
332:    LDC  2,0(6)	Set return value to 0 
333:     LD  3,-1(1)	Load return address 
334:     LD  1,0(1)	Adjust fp 
335:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,335(7)	Jump to init [backpatch] 
* INIT
336:    LDA  1,-6(0)	set first frame at end of globals 
337:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
338:    LDC  3,5(6)	load size of array y
339:     ST  3,0(0)	save size of array y
* END INIT GLOBALS AND STATICS
340:    LDA  3,1(7)	Return address in ac 
341:    JMP  7,-264(7)	Jump to main 
342:   HALT  0,0,0	DONE! 
* END INIT
