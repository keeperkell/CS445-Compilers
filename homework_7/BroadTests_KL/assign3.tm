* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  assign3.c-
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
* TOFF set: -19
 40:    LDC  3,8(6)	load size of array x
 41:     ST  3,-2(1)	save size of array x
 42:    LDC  3,7(6)	load size of array y
 43:     ST  3,-11(1)	save size of array y
* Compound Body
* EXPRESSION
 44:    LDC  3,5(6)	Load integer constant 
 45:     ST  3,-19(1)	Push index 
* TOFF dec: -20
 46:    LDC  3,111(6)	Load integer constant 
* TOFF inc: -19
 47:     LD  4,-19(1)	Pop index 
 48:    LDA  5,-3(1)	Load address of base of array x
 49:    SUB  5,5,4	Compute offset of value 
 50:     LD  4,0(5)	load lhs variable x
 51:    ADD  3,4,3	op += 
 52:     ST  3,0(5)	Store variable x
* EXPRESSION
* CALL output
 53:     ST  1,-19(1)	Store fp in ghost frame for output
* TOFF dec: -20
* TOFF dec: -21
* Param 1
 54:    LDA  3,-3(1)	Load address of base of array x
 55:     ST  3,-21(1)	Push left side 
* TOFF dec: -22
 56:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -21
 57:     LD  4,-21(1)	Pop left into ac1 
 58:    SUB  3,4,3	compute location from index 
 59:     LD  3,0(3)	Load array element 
 60:     ST  3,-21(1)	Push parameter 
* TOFF dec: -22
* Param end output
 61:    LDA  1,-19(1)	Ghost frame becomes new active frame 
 62:    LDA  3,1(7)	Return address in ac 
 63:    JMP  7,-58(7)	CALL output
 64:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -19
* EXPRESSION
 65:    LDC  3,4(6)	Load integer constant 
 66:     ST  3,-19(1)	Push index 
* TOFF dec: -20
 67:    LDC  3,222(6)	Load integer constant 
* TOFF inc: -19
 68:     LD  4,-19(1)	Pop index 
 69:    LDA  5,-12(1)	Load address of base of array y
 70:    SUB  5,5,4	Compute offset of value 
 71:     LD  4,0(5)	load lhs variable y
 72:    ADD  3,4,3	op += 
 73:     ST  3,0(5)	Store variable y
* EXPRESSION
* CALL output
 74:     ST  1,-19(1)	Store fp in ghost frame for output
* TOFF dec: -20
* TOFF dec: -21
* Param 1
 75:    LDA  3,-12(1)	Load address of base of array y
 76:     ST  3,-21(1)	Push left side 
* TOFF dec: -22
 77:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -21
 78:     LD  4,-21(1)	Pop left into ac1 
 79:    SUB  3,4,3	compute location from index 
 80:     LD  3,0(3)	Load array element 
 81:     ST  3,-21(1)	Push parameter 
* TOFF dec: -22
* Param end output
 82:    LDA  1,-19(1)	Ghost frame becomes new active frame 
 83:    LDA  3,1(7)	Return address in ac 
 84:    JMP  7,-79(7)	CALL output
 85:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -19
* EXPRESSION
* CALL outnl
 86:     ST  1,-19(1)	Store fp in ghost frame for outnl
* TOFF dec: -20
* TOFF dec: -21
* Param end outnl
 87:    LDA  1,-19(1)	Ghost frame becomes new active frame 
 88:    LDA  3,1(7)	Return address in ac 
 89:    JMP  7,-56(7)	CALL outnl
 90:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -19
* EXPRESSION
 91:    LDC  3,5(6)	Load integer constant 
 92:     ST  3,-19(1)	Push index 
* TOFF dec: -20
 93:    LDC  3,333(6)	Load integer constant 
* TOFF inc: -19
 94:     LD  4,-19(1)	Pop index 
 95:    LDA  5,-1(0)	Load address of base of array gx
 96:    SUB  5,5,4	Compute offset of value 
 97:     LD  4,0(5)	load lhs variable gx
 98:    ADD  3,4,3	op += 
 99:     ST  3,0(5)	Store variable gx
* EXPRESSION
* CALL output
100:     ST  1,-19(1)	Store fp in ghost frame for output
* TOFF dec: -20
* TOFF dec: -21
* Param 1
101:    LDA  3,-1(0)	Load address of base of array gx
102:     ST  3,-21(1)	Push left side 
* TOFF dec: -22
103:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -21
104:     LD  4,-21(1)	Pop left into ac1 
105:    SUB  3,4,3	compute location from index 
106:     LD  3,0(3)	Load array element 
107:     ST  3,-21(1)	Push parameter 
* TOFF dec: -22
* Param end output
108:    LDA  1,-19(1)	Ghost frame becomes new active frame 
109:    LDA  3,1(7)	Return address in ac 
110:    JMP  7,-105(7)	CALL output
111:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -19
* EXPRESSION
112:    LDC  3,4(6)	Load integer constant 
113:     ST  3,-19(1)	Push index 
* TOFF dec: -20
114:    LDC  3,444(6)	Load integer constant 
* TOFF inc: -19
115:     LD  4,-19(1)	Pop index 
116:    LDA  5,-9(0)	Load address of base of array gy
117:    SUB  5,5,4	Compute offset of value 
118:     LD  4,0(5)	load lhs variable gy
119:    ADD  3,4,3	op += 
120:     ST  3,0(5)	Store variable gy
* EXPRESSION
* CALL output
121:     ST  1,-19(1)	Store fp in ghost frame for output
* TOFF dec: -20
* TOFF dec: -21
* Param 1
122:    LDA  3,-9(0)	Load address of base of array gy
123:     ST  3,-21(1)	Push left side 
* TOFF dec: -22
124:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -21
125:     LD  4,-21(1)	Pop left into ac1 
126:    SUB  3,4,3	compute location from index 
127:     LD  3,0(3)	Load array element 
128:     ST  3,-21(1)	Push parameter 
* TOFF dec: -22
* Param end output
129:    LDA  1,-19(1)	Ghost frame becomes new active frame 
130:    LDA  3,1(7)	Return address in ac 
131:    JMP  7,-126(7)	CALL output
132:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -19
* EXPRESSION
* CALL outnl
133:     ST  1,-19(1)	Store fp in ghost frame for outnl
* TOFF dec: -20
* TOFF dec: -21
* Param end outnl
134:    LDA  1,-19(1)	Ghost frame becomes new active frame 
135:    LDA  3,1(7)	Return address in ac 
136:    JMP  7,-103(7)	CALL outnl
137:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -19
* EXPRESSION
138:    LDC  3,5(6)	Load integer constant 
139:     ST  3,-19(1)	Push index 
* TOFF dec: -20
140:    LDA  3,-12(1)	Load address of base of array y
141:     ST  3,-20(1)	Push left side 
* TOFF dec: -21
142:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -20
143:     LD  4,-20(1)	Pop left into ac1 
144:    SUB  3,4,3	compute location from index 
145:     LD  3,0(3)	Load array element 
* TOFF inc: -19
146:     LD  4,-19(1)	Pop index 
147:    LDA  5,-3(1)	Load address of base of array x
148:    SUB  5,5,4	Compute offset of value 
149:     LD  4,0(5)	load lhs variable x
150:    ADD  3,4,3	op += 
151:     ST  3,0(5)	Store variable x
* EXPRESSION
* CALL output
152:     ST  1,-19(1)	Store fp in ghost frame for output
* TOFF dec: -20
* TOFF dec: -21
* Param 1
153:    LDA  3,-3(1)	Load address of base of array x
154:     ST  3,-21(1)	Push left side 
* TOFF dec: -22
155:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -21
156:     LD  4,-21(1)	Pop left into ac1 
157:    SUB  3,4,3	compute location from index 
158:     LD  3,0(3)	Load array element 
159:     ST  3,-21(1)	Push parameter 
* TOFF dec: -22
* Param end output
160:    LDA  1,-19(1)	Ghost frame becomes new active frame 
161:    LDA  3,1(7)	Return address in ac 
162:    JMP  7,-157(7)	CALL output
163:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -19
* EXPRESSION
* CALL outnl
164:     ST  1,-19(1)	Store fp in ghost frame for outnl
* TOFF dec: -20
* TOFF dec: -21
* Param end outnl
165:    LDA  1,-19(1)	Ghost frame becomes new active frame 
166:    LDA  3,1(7)	Return address in ac 
167:    JMP  7,-134(7)	CALL outnl
168:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -19
* EXPRESSION
169:    LDC  3,5(6)	Load integer constant 
170:     ST  3,-19(1)	Push index 
* TOFF dec: -20
171:    LDA  3,-9(0)	Load address of base of array gy
172:     ST  3,-20(1)	Push left side 
* TOFF dec: -21
173:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -20
174:     LD  4,-20(1)	Pop left into ac1 
175:    SUB  3,4,3	compute location from index 
176:     LD  3,0(3)	Load array element 
* TOFF inc: -19
177:     LD  4,-19(1)	Pop index 
178:    LDA  5,-1(0)	Load address of base of array gx
179:    SUB  5,5,4	Compute offset of value 
180:     LD  4,0(5)	load lhs variable gx
181:    ADD  3,4,3	op += 
182:     ST  3,0(5)	Store variable gx
* EXPRESSION
* CALL output
183:     ST  1,-19(1)	Store fp in ghost frame for output
* TOFF dec: -20
* TOFF dec: -21
* Param 1
184:    LDA  3,-1(0)	Load address of base of array gx
185:     ST  3,-21(1)	Push left side 
* TOFF dec: -22
186:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -21
187:     LD  4,-21(1)	Pop left into ac1 
188:    SUB  3,4,3	compute location from index 
189:     LD  3,0(3)	Load array element 
190:     ST  3,-21(1)	Push parameter 
* TOFF dec: -22
* Param end output
191:    LDA  1,-19(1)	Ghost frame becomes new active frame 
192:    LDA  3,1(7)	Return address in ac 
193:    JMP  7,-188(7)	CALL output
194:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -19
* EXPRESSION
* CALL outnl
195:     ST  1,-19(1)	Store fp in ghost frame for outnl
* TOFF dec: -20
* TOFF dec: -21
* Param end outnl
196:    LDA  1,-19(1)	Ghost frame becomes new active frame 
197:    LDA  3,1(7)	Return address in ac 
198:    JMP  7,-165(7)	CALL outnl
199:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -19
* EXPRESSION
200:    LDC  3,5(6)	Load integer constant 
201:     ST  3,-19(1)	Push index 
* TOFF dec: -20
202:    LDC  3,111(6)	Load integer constant 
* TOFF inc: -19
203:     LD  4,-19(1)	Pop index 
204:    LDA  5,-3(1)	Load address of base of array x
205:    SUB  5,5,4	Compute offset of value 
206:     LD  4,0(5)	load lhs variable x
207:    SUB  3,4,3	op -= 
208:     ST  3,0(5)	Store variable x
* EXPRESSION
* CALL output
209:     ST  1,-19(1)	Store fp in ghost frame for output
* TOFF dec: -20
* TOFF dec: -21
* Param 1
210:    LDA  3,-3(1)	Load address of base of array x
211:     ST  3,-21(1)	Push left side 
* TOFF dec: -22
212:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -21
213:     LD  4,-21(1)	Pop left into ac1 
214:    SUB  3,4,3	compute location from index 
215:     LD  3,0(3)	Load array element 
216:     ST  3,-21(1)	Push parameter 
* TOFF dec: -22
* Param end output
217:    LDA  1,-19(1)	Ghost frame becomes new active frame 
218:    LDA  3,1(7)	Return address in ac 
219:    JMP  7,-214(7)	CALL output
220:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -19
* EXPRESSION
221:    LDC  3,4(6)	Load integer constant 
222:     ST  3,-19(1)	Push index 
* TOFF dec: -20
223:    LDC  3,222(6)	Load integer constant 
* TOFF inc: -19
224:     LD  4,-19(1)	Pop index 
225:    LDA  5,-12(1)	Load address of base of array y
226:    SUB  5,5,4	Compute offset of value 
227:     LD  4,0(5)	load lhs variable y
228:    SUB  3,4,3	op -= 
229:     ST  3,0(5)	Store variable y
* EXPRESSION
* CALL output
230:     ST  1,-19(1)	Store fp in ghost frame for output
* TOFF dec: -20
* TOFF dec: -21
* Param 1
231:    LDA  3,-12(1)	Load address of base of array y
232:     ST  3,-21(1)	Push left side 
* TOFF dec: -22
233:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -21
234:     LD  4,-21(1)	Pop left into ac1 
235:    SUB  3,4,3	compute location from index 
236:     LD  3,0(3)	Load array element 
237:     ST  3,-21(1)	Push parameter 
* TOFF dec: -22
* Param end output
238:    LDA  1,-19(1)	Ghost frame becomes new active frame 
239:    LDA  3,1(7)	Return address in ac 
240:    JMP  7,-235(7)	CALL output
241:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -19
* EXPRESSION
* CALL outnl
242:     ST  1,-19(1)	Store fp in ghost frame for outnl
* TOFF dec: -20
* TOFF dec: -21
* Param end outnl
243:    LDA  1,-19(1)	Ghost frame becomes new active frame 
244:    LDA  3,1(7)	Return address in ac 
245:    JMP  7,-212(7)	CALL outnl
246:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -19
* EXPRESSION
247:    LDC  3,5(6)	Load integer constant 
248:     ST  3,-19(1)	Push index 
* TOFF dec: -20
249:    LDC  3,333(6)	Load integer constant 
* TOFF inc: -19
250:     LD  4,-19(1)	Pop index 
251:    LDA  5,-1(0)	Load address of base of array gx
252:    SUB  5,5,4	Compute offset of value 
253:     LD  4,0(5)	load lhs variable gx
254:    SUB  3,4,3	op -= 
255:     ST  3,0(5)	Store variable gx
* EXPRESSION
* CALL output
256:     ST  1,-19(1)	Store fp in ghost frame for output
* TOFF dec: -20
* TOFF dec: -21
* Param 1
257:    LDA  3,-1(0)	Load address of base of array gx
258:     ST  3,-21(1)	Push left side 
* TOFF dec: -22
259:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -21
260:     LD  4,-21(1)	Pop left into ac1 
261:    SUB  3,4,3	compute location from index 
262:     LD  3,0(3)	Load array element 
263:     ST  3,-21(1)	Push parameter 
* TOFF dec: -22
* Param end output
264:    LDA  1,-19(1)	Ghost frame becomes new active frame 
265:    LDA  3,1(7)	Return address in ac 
266:    JMP  7,-261(7)	CALL output
267:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -19
* EXPRESSION
268:    LDC  3,4(6)	Load integer constant 
269:     ST  3,-19(1)	Push index 
* TOFF dec: -20
270:    LDC  3,444(6)	Load integer constant 
* TOFF inc: -19
271:     LD  4,-19(1)	Pop index 
272:    LDA  5,-9(0)	Load address of base of array gy
273:    SUB  5,5,4	Compute offset of value 
274:     LD  4,0(5)	load lhs variable gy
275:    SUB  3,4,3	op -= 
276:     ST  3,0(5)	Store variable gy
* EXPRESSION
* CALL output
277:     ST  1,-19(1)	Store fp in ghost frame for output
* TOFF dec: -20
* TOFF dec: -21
* Param 1
278:    LDA  3,-9(0)	Load address of base of array gy
279:     ST  3,-21(1)	Push left side 
* TOFF dec: -22
280:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -21
281:     LD  4,-21(1)	Pop left into ac1 
282:    SUB  3,4,3	compute location from index 
283:     LD  3,0(3)	Load array element 
284:     ST  3,-21(1)	Push parameter 
* TOFF dec: -22
* Param end output
285:    LDA  1,-19(1)	Ghost frame becomes new active frame 
286:    LDA  3,1(7)	Return address in ac 
287:    JMP  7,-282(7)	CALL output
288:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -19
* EXPRESSION
* CALL outnl
289:     ST  1,-19(1)	Store fp in ghost frame for outnl
* TOFF dec: -20
* TOFF dec: -21
* Param end outnl
290:    LDA  1,-19(1)	Ghost frame becomes new active frame 
291:    LDA  3,1(7)	Return address in ac 
292:    JMP  7,-259(7)	CALL outnl
293:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -19
* EXPRESSION
294:    LDC  3,5(6)	Load integer constant 
295:     ST  3,-19(1)	Push index 
* TOFF dec: -20
296:    LDA  3,-12(1)	Load address of base of array y
297:     ST  3,-20(1)	Push left side 
* TOFF dec: -21
298:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -20
299:     LD  4,-20(1)	Pop left into ac1 
300:    SUB  3,4,3	compute location from index 
301:     LD  3,0(3)	Load array element 
* TOFF inc: -19
302:     LD  4,-19(1)	Pop index 
303:    LDA  5,-3(1)	Load address of base of array x
304:    SUB  5,5,4	Compute offset of value 
305:     LD  4,0(5)	load lhs variable x
306:    SUB  3,4,3	op -= 
307:     ST  3,0(5)	Store variable x
* EXPRESSION
* CALL output
308:     ST  1,-19(1)	Store fp in ghost frame for output
* TOFF dec: -20
* TOFF dec: -21
* Param 1
309:    LDA  3,-3(1)	Load address of base of array x
310:     ST  3,-21(1)	Push left side 
* TOFF dec: -22
311:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -21
312:     LD  4,-21(1)	Pop left into ac1 
313:    SUB  3,4,3	compute location from index 
314:     LD  3,0(3)	Load array element 
315:     ST  3,-21(1)	Push parameter 
* TOFF dec: -22
* Param end output
316:    LDA  1,-19(1)	Ghost frame becomes new active frame 
317:    LDA  3,1(7)	Return address in ac 
318:    JMP  7,-313(7)	CALL output
319:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -19
* EXPRESSION
* CALL outnl
320:     ST  1,-19(1)	Store fp in ghost frame for outnl
* TOFF dec: -20
* TOFF dec: -21
* Param end outnl
321:    LDA  1,-19(1)	Ghost frame becomes new active frame 
322:    LDA  3,1(7)	Return address in ac 
323:    JMP  7,-290(7)	CALL outnl
324:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -19
* EXPRESSION
325:    LDC  3,5(6)	Load integer constant 
326:     ST  3,-19(1)	Push index 
* TOFF dec: -20
327:    LDA  3,-9(0)	Load address of base of array gy
328:     ST  3,-20(1)	Push left side 
* TOFF dec: -21
329:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -20
330:     LD  4,-20(1)	Pop left into ac1 
331:    SUB  3,4,3	compute location from index 
332:     LD  3,0(3)	Load array element 
* TOFF inc: -19
333:     LD  4,-19(1)	Pop index 
334:    LDA  5,-1(0)	Load address of base of array gx
335:    SUB  5,5,4	Compute offset of value 
336:     LD  4,0(5)	load lhs variable gx
337:    SUB  3,4,3	op -= 
338:     ST  3,0(5)	Store variable gx
* EXPRESSION
* CALL output
339:     ST  1,-19(1)	Store fp in ghost frame for output
* TOFF dec: -20
* TOFF dec: -21
* Param 1
340:    LDA  3,-1(0)	Load address of base of array gx
341:     ST  3,-21(1)	Push left side 
* TOFF dec: -22
342:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -21
343:     LD  4,-21(1)	Pop left into ac1 
344:    SUB  3,4,3	compute location from index 
345:     LD  3,0(3)	Load array element 
346:     ST  3,-21(1)	Push parameter 
* TOFF dec: -22
* Param end output
347:    LDA  1,-19(1)	Ghost frame becomes new active frame 
348:    LDA  3,1(7)	Return address in ac 
349:    JMP  7,-344(7)	CALL output
350:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -19
* EXPRESSION
* CALL outnl
351:     ST  1,-19(1)	Store fp in ghost frame for outnl
* TOFF dec: -20
* TOFF dec: -21
* Param end outnl
352:    LDA  1,-19(1)	Ghost frame becomes new active frame 
353:    LDA  3,1(7)	Return address in ac 
354:    JMP  7,-321(7)	CALL outnl
355:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -19
* RETURN
356:     LD  3,-1(1)	Load return address 
357:     LD  1,0(1)	Adjust fp 
358:    JMP  7,0(3)	Return 
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
359:    LDC  2,0(6)	Set return value to 0 
360:     LD  3,-1(1)	Load return address 
361:     LD  1,0(1)	Adjust fp 
362:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,362(7)	Jump to init [backpatch] 
* INIT
363:    LDA  1,-15(0)	set first frame at end of globals 
364:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
365:    LDC  3,7(6)	load size of array gx
366:     ST  3,0(0)	save size of array gx
367:    LDC  3,6(6)	load size of array gy
368:     ST  3,-8(0)	save size of array gy
* END INIT GLOBALS AND STATICS
369:    LDA  3,1(7)	Return address in ac 
370:    JMP  7,-332(7)	Jump to main 
371:   HALT  0,0,0	DONE! 
* END INIT
