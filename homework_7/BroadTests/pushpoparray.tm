* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  pushpoparray.c-
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
* TOFF set: -3
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
 40:     LD  3,-2(1)	Load address of base of array pa
 41:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 42:    LDC  3,66(6)	Load integer constant 
* TOFF inc: -3
 43:     LD  4,-3(1)	Pop left into ac1 
 44:    SUB  3,4,3	compute location from index 
 45:     LD  3,0(3)	Load array element 
* EXPRESSION
 46:     LD  3,-2(1)	Load address of base of array pa
 47:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 48:    LDC  3,22(6)	Load integer constant 
* TOFF inc: -3
 49:     LD  4,-3(1)	Pop left into ac1 
 50:    SUB  3,4,3	compute location from index 
 51:     LD  3,0(3)	Load array element 
 52:     ST  3,0(0)	Store variable a
* EXPRESSION
 53:    LDC  3,88(6)	Load integer constant 
 54:     LD  5,-2(1)	Load address of base of array pa
 55:    SUB  5,5,3	Compute offset of value 
 56:     LD  3,0(5)	load lhs variable pa
 57:    LDA  3,1(3)	increment value of pa
 58:     ST  3,0(5)	Store variable pa
* EXPRESSION
* CALL output
 59:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 60:     LD  3,0(0)	Load variable a
 61:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 62:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 63:    LDA  3,1(7)	Return address in ac 
 64:    JMP  7,-59(7)	CALL output
 65:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL output
 66:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 67:     LD  3,-2(1)	Load address of base of array pa
 68:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 69:    LDC  3,88(6)	Load integer constant 
* TOFF inc: -5
 70:     LD  4,-5(1)	Pop left into ac1 
 71:    SUB  3,4,3	compute location from index 
 72:     LD  3,0(3)	Load array element 
 73:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 74:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 75:    LDA  3,1(7)	Return address in ac 
 76:    JMP  7,-71(7)	CALL output
 77:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* RETURN
 78:     LD  3,-2(1)	Load address of base of array pa
 79:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 80:    LDC  3,22(6)	Load integer constant 
* TOFF inc: -3
 81:     LD  4,-3(1)	Pop left into ac1 
 82:    SUB  3,4,3	compute location from index 
 83:     LD  3,0(3)	Load array element 
 84:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 85:     LD  3,-2(1)	Load address of base of array pa
 86:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 87:    LDC  3,44(6)	Load integer constant 
* TOFF inc: -4
 88:     LD  4,-4(1)	Pop left into ac1 
 89:    SUB  3,4,3	compute location from index 
 90:     LD  3,0(3)	Load array element 
* TOFF inc: -3
 91:     LD  4,-3(1)	Pop left into ac1 
 92:    ADD  3,4,3	Op + 
 93:    LDA  2,0(3)	Copy result to return register 
 94:     LD  3,-1(1)	Load return address 
 95:     LD  1,0(1)	Adjust fp 
 96:    JMP  7,0(3)	Return 
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
 97:    LDC  2,0(6)	Set return value to 0 
 98:     LD  3,-1(1)	Load return address 
 99:     LD  1,0(1)	Adjust fp 
100:    JMP  7,0(3)	Return 
* END FUNCTION dog
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
101:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -104
102:    LDC  3,100(6)	load size of array bb
103:     ST  3,-3(1)	save size of array bb
* Compound Body
* EXPRESSION
104:    LDC  3,11(6)	Load integer constant 
105:     ST  3,-104(1)	Push index 
* TOFF dec: -105
106:    LDC  3,11(6)	Load integer constant 
* TOFF inc: -104
107:     LD  4,-104(1)	Pop index 
108:    LDA  5,-2(0)	Load address of base of array aa
109:    SUB  5,5,4	Compute offset of value 
110:     ST  3,0(5)	Store variable aa
* EXPRESSION
111:    LDC  3,22(6)	Load integer constant 
112:     ST  3,-104(1)	Push index 
* TOFF dec: -105
113:    LDC  3,22(6)	Load integer constant 
* TOFF inc: -104
114:     LD  4,-104(1)	Pop index 
115:    LDA  5,-4(1)	Load address of base of array bb
116:    SUB  5,5,4	Compute offset of value 
117:     ST  3,0(5)	Store variable bb
* EXPRESSION
118:    LDC  3,33(6)	Load integer constant 
119:     ST  3,-104(1)	Push index 
* TOFF dec: -105
120:    LDC  3,33(6)	Load integer constant 
* TOFF inc: -104
121:     LD  4,-104(1)	Pop index 
122:    LDA  5,-2(0)	Load address of base of array aa
123:    SUB  5,5,4	Compute offset of value 
124:     ST  3,0(5)	Store variable aa
* EXPRESSION
125:    LDC  3,44(6)	Load integer constant 
126:     ST  3,-104(1)	Push index 
* TOFF dec: -105
127:    LDC  3,44(6)	Load integer constant 
* TOFF inc: -104
128:     LD  4,-104(1)	Pop index 
129:    LDA  5,-4(1)	Load address of base of array bb
130:    SUB  5,5,4	Compute offset of value 
131:     ST  3,0(5)	Store variable bb
* EXPRESSION
132:    LDC  3,55(6)	Load integer constant 
133:     ST  3,-104(1)	Push index 
* TOFF dec: -105
134:    LDC  3,55(6)	Load integer constant 
* TOFF inc: -104
135:     LD  4,-104(1)	Pop index 
136:    LDA  5,-2(0)	Load address of base of array aa
137:    SUB  5,5,4	Compute offset of value 
138:     ST  3,0(5)	Store variable aa
* EXPRESSION
139:    LDC  3,66(6)	Load integer constant 
140:     ST  3,-104(1)	Push index 
* TOFF dec: -105
141:    LDC  3,66(6)	Load integer constant 
* TOFF inc: -104
142:     LD  4,-104(1)	Pop index 
143:    LDA  5,-4(1)	Load address of base of array bb
144:    SUB  5,5,4	Compute offset of value 
145:     ST  3,0(5)	Store variable bb
* EXPRESSION
146:    LDC  3,77(6)	Load integer constant 
147:     ST  3,-104(1)	Push index 
* TOFF dec: -105
148:    LDC  3,77(6)	Load integer constant 
* TOFF inc: -104
149:     LD  4,-104(1)	Pop index 
150:    LDA  5,-2(0)	Load address of base of array aa
151:    SUB  5,5,4	Compute offset of value 
152:     ST  3,0(5)	Store variable aa
* EXPRESSION
153:    LDC  3,88(6)	Load integer constant 
154:     ST  3,-104(1)	Push index 
* TOFF dec: -105
155:    LDC  3,88(6)	Load integer constant 
* TOFF inc: -104
156:     LD  4,-104(1)	Pop index 
157:    LDA  5,-4(1)	Load address of base of array bb
158:    SUB  5,5,4	Compute offset of value 
159:     ST  3,0(5)	Store variable bb
* EXPRESSION
160:    LDC  3,99(6)	Load integer constant 
161:     ST  3,-104(1)	Push index 
* TOFF dec: -105
162:    LDC  3,99(6)	Load integer constant 
* TOFF inc: -104
163:     LD  4,-104(1)	Pop index 
164:    LDA  5,-2(0)	Load address of base of array aa
165:    SUB  5,5,4	Compute offset of value 
166:     ST  3,0(5)	Store variable aa
* EXPRESSION
* CALL output
167:     ST  1,-104(1)	Store fp in ghost frame for output
* TOFF dec: -105
* TOFF dec: -106
* Param 1
168:    LDA  3,-2(0)	Load address of base of array aa
169:     ST  3,-106(1)	Push left side 
* TOFF dec: -107
170:    LDC  3,11(6)	Load integer constant 
* TOFF inc: -106
171:     LD  4,-106(1)	Pop left into ac1 
172:    SUB  3,4,3	compute location from index 
173:     LD  3,0(3)	Load array element 
174:     ST  3,-106(1)	Push parameter 
* TOFF dec: -107
* Param end output
175:    LDA  1,-104(1)	Ghost frame becomes new active frame 
176:    LDA  3,1(7)	Return address in ac 
177:    JMP  7,-172(7)	CALL output
178:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -104
* EXPRESSION
* CALL output
179:     ST  1,-104(1)	Store fp in ghost frame for output
* TOFF dec: -105
* TOFF dec: -106
* Param 1
180:    LDA  3,-4(1)	Load address of base of array bb
181:     ST  3,-106(1)	Push left side 
* TOFF dec: -107
182:    LDC  3,22(6)	Load integer constant 
* TOFF inc: -106
183:     LD  4,-106(1)	Pop left into ac1 
184:    SUB  3,4,3	compute location from index 
185:     LD  3,0(3)	Load array element 
186:     ST  3,-106(1)	Push parameter 
* TOFF dec: -107
* Param end output
187:    LDA  1,-104(1)	Ghost frame becomes new active frame 
188:    LDA  3,1(7)	Return address in ac 
189:    JMP  7,-184(7)	CALL output
190:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -104
* EXPRESSION
* CALL output
191:     ST  1,-104(1)	Store fp in ghost frame for output
* TOFF dec: -105
* TOFF dec: -106
* Param 1
192:    LDC  3,99(6)	Load integer constant 
193:    LDA  5,-2(0)	Load address of base of array aa
194:    SUB  5,5,3	Compute offset of value 
195:     LD  3,0(5)	load lhs variable aa
196:    LDA  3,1(3)	increment value of aa
197:     ST  3,0(5)	Store variable aa
198:     ST  3,-106(1)	Push parameter 
* TOFF dec: -107
* Param end output
199:    LDA  1,-104(1)	Ghost frame becomes new active frame 
200:    LDA  3,1(7)	Return address in ac 
201:    JMP  7,-196(7)	CALL output
202:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -104
* EXPRESSION
* CALL output
203:     ST  1,-104(1)	Store fp in ghost frame for output
* TOFF dec: -105
* TOFF dec: -106
* Param 1
204:    LDA  3,-2(0)	Load address of base of array aa
205:     ST  3,-106(1)	Push left side 
* TOFF dec: -107
206:    LDC  3,99(6)	Load integer constant 
* TOFF inc: -106
207:     LD  4,-106(1)	Pop left into ac1 
208:    SUB  3,4,3	compute location from index 
209:     LD  3,0(3)	Load array element 
210:     ST  3,-106(1)	Push parameter 
* TOFF dec: -107
* Param end output
211:    LDA  1,-104(1)	Ghost frame becomes new active frame 
212:    LDA  3,1(7)	Return address in ac 
213:    JMP  7,-208(7)	CALL output
214:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -104
* EXPRESSION
* CALL outnl
215:     ST  1,-104(1)	Store fp in ghost frame for outnl
* TOFF dec: -105
* TOFF dec: -106
* Param end outnl
216:    LDA  1,-104(1)	Ghost frame becomes new active frame 
217:    LDA  3,1(7)	Return address in ac 
218:    JMP  7,-185(7)	CALL outnl
219:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -104
* EXPRESSION
* CALL output
220:     ST  1,-104(1)	Store fp in ghost frame for output
* TOFF dec: -105
* TOFF dec: -106
* Param 1
221:    LDA  3,-2(0)	Load address of base of array aa
222:     ST  3,-106(1)	Push left side 
* TOFF dec: -107
223:    LDC  3,33(6)	Load integer constant 
* TOFF inc: -106
224:     LD  4,-106(1)	Pop left into ac1 
225:    SUB  3,4,3	compute location from index 
226:     LD  3,0(3)	Load array element 
227:     ST  3,0(0)	Store variable a
228:     ST  3,-106(1)	Push parameter 
* TOFF dec: -107
* Param end output
229:    LDA  1,-104(1)	Ghost frame becomes new active frame 
230:    LDA  3,1(7)	Return address in ac 
231:    JMP  7,-226(7)	CALL output
232:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -104
* EXPRESSION
* CALL output
233:     ST  1,-104(1)	Store fp in ghost frame for output
* TOFF dec: -105
* TOFF dec: -106
* Param 1
234:     LD  3,0(0)	Load variable a
235:     ST  3,-106(1)	Push parameter 
* TOFF dec: -107
* Param end output
236:    LDA  1,-104(1)	Ghost frame becomes new active frame 
237:    LDA  3,1(7)	Return address in ac 
238:    JMP  7,-233(7)	CALL output
239:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -104
* EXPRESSION
* CALL outnl
240:     ST  1,-104(1)	Store fp in ghost frame for outnl
* TOFF dec: -105
* TOFF dec: -106
* Param end outnl
241:    LDA  1,-104(1)	Ghost frame becomes new active frame 
242:    LDA  3,1(7)	Return address in ac 
243:    JMP  7,-210(7)	CALL outnl
244:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -104
* EXPRESSION
* CALL output
245:     ST  1,-104(1)	Store fp in ghost frame for output
* TOFF dec: -105
* TOFF dec: -106
* Param 1
246:    LDA  3,-4(1)	Load address of base of array bb
247:     ST  3,-106(1)	Push left side 
* TOFF dec: -107
248:    LDC  3,66(6)	Load integer constant 
249:     ST  3,-107(1)	Push left side 
* TOFF dec: -108
250:    LDC  3,44(6)	Load integer constant 
* TOFF inc: -107
251:     LD  4,-107(1)	Pop left into ac1 
252:    SUB  3,4,3	Op - 
* TOFF inc: -106
253:     LD  4,-106(1)	Pop left into ac1 
254:    SUB  3,4,3	compute location from index 
255:     LD  3,0(3)	Load array element 
256:     ST  3,-106(1)	Push parameter 
* TOFF dec: -107
* Param end output
257:    LDA  1,-104(1)	Ghost frame becomes new active frame 
258:    LDA  3,1(7)	Return address in ac 
259:    JMP  7,-254(7)	CALL output
260:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -104
* EXPRESSION
* CALL output
261:     ST  1,-104(1)	Store fp in ghost frame for output
* TOFF dec: -105
* TOFF dec: -106
* Param 1
262:    LDA  3,-2(0)	Load address of base of array aa
263:     ST  3,-106(1)	Push left side 
* TOFF dec: -107
264:    LDC  3,77(6)	Load integer constant 
* TOFF inc: -106
265:     LD  4,-106(1)	Pop left into ac1 
266:    SUB  3,4,3	compute location from index 
267:     LD  3,0(3)	Load array element 
268:     ST  3,-106(1)	Push left side 
* TOFF dec: -107
269:    LDA  3,-4(1)	Load address of base of array bb
270:     ST  3,-107(1)	Push left side 
* TOFF dec: -108
271:    LDC  3,88(6)	Load integer constant 
* TOFF inc: -107
272:     LD  4,-107(1)	Pop left into ac1 
273:    SUB  3,4,3	compute location from index 
274:     LD  3,0(3)	Load array element 
* TOFF inc: -106
275:     LD  4,-106(1)	Pop left into ac1 
276:    MUL  3,4,3	Op * 
277:     ST  3,-106(1)	Push parameter 
* TOFF dec: -107
* Param end output
278:    LDA  1,-104(1)	Ghost frame becomes new active frame 
279:    LDA  3,1(7)	Return address in ac 
280:    JMP  7,-275(7)	CALL output
281:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -104
* EXPRESSION
* CALL outnl
282:     ST  1,-104(1)	Store fp in ghost frame for outnl
* TOFF dec: -105
* TOFF dec: -106
* Param end outnl
283:    LDA  1,-104(1)	Ghost frame becomes new active frame 
284:    LDA  3,1(7)	Return address in ac 
285:    JMP  7,-252(7)	CALL outnl
286:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -104
* EXPRESSION
* CALL output
287:     ST  1,-104(1)	Store fp in ghost frame for output
* TOFF dec: -105
* TOFF dec: -106
* Param 1
* CALL dog
288:     ST  1,-106(1)	Store fp in ghost frame for dog
* TOFF dec: -107
* TOFF dec: -108
* Param 1
289:    LDA  3,-4(1)	Load address of base of array bb
290:     ST  3,-108(1)	Push parameter 
* TOFF dec: -109
* Param end dog
291:    LDA  1,-106(1)	Ghost frame becomes new active frame 
292:    LDA  3,1(7)	Return address in ac 
293:    JMP  7,-255(7)	CALL dog
294:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -106
295:     ST  3,-106(1)	Push parameter 
* TOFF dec: -107
* Param end output
296:    LDA  1,-104(1)	Ghost frame becomes new active frame 
297:    LDA  3,1(7)	Return address in ac 
298:    JMP  7,-293(7)	CALL output
299:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -104
* EXPRESSION
* CALL output
300:     ST  1,-104(1)	Store fp in ghost frame for output
* TOFF dec: -105
* TOFF dec: -106
* Param 1
301:    LDA  3,-4(1)	Load address of base of array bb
302:     ST  3,-106(1)	Push left side 
* TOFF dec: -107
303:    LDC  3,88(6)	Load integer constant 
* TOFF inc: -106
304:     LD  4,-106(1)	Pop left into ac1 
305:    SUB  3,4,3	compute location from index 
306:     LD  3,0(3)	Load array element 
307:     ST  3,-106(1)	Push parameter 
* TOFF dec: -107
* Param end output
308:    LDA  1,-104(1)	Ghost frame becomes new active frame 
309:    LDA  3,1(7)	Return address in ac 
310:    JMP  7,-305(7)	CALL output
311:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -104
* EXPRESSION
* CALL output
312:     ST  1,-104(1)	Store fp in ghost frame for output
* TOFF dec: -105
* TOFF dec: -106
* Param 1
313:    LDA  3,-4(1)	Load address of base of array bb
314:     ST  3,-106(1)	Push left side 
* TOFF dec: -107
* CALL dog
315:     ST  1,-107(1)	Store fp in ghost frame for dog
* TOFF dec: -108
* TOFF dec: -109
* Param 1
316:    LDA  3,-4(1)	Load address of base of array bb
317:     ST  3,-109(1)	Push parameter 
* TOFF dec: -110
* Param end dog
318:    LDA  1,-107(1)	Ghost frame becomes new active frame 
319:    LDA  3,1(7)	Return address in ac 
320:    JMP  7,-282(7)	CALL dog
321:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -107
* TOFF inc: -106
322:     LD  4,-106(1)	Pop left into ac1 
323:    SUB  3,4,3	compute location from index 
324:     LD  3,0(3)	Load array element 
325:     ST  3,-106(1)	Push parameter 
* TOFF dec: -107
* Param end output
326:    LDA  1,-104(1)	Ghost frame becomes new active frame 
327:    LDA  3,1(7)	Return address in ac 
328:    JMP  7,-323(7)	CALL output
329:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -104
* EXPRESSION
* CALL outnl
330:     ST  1,-104(1)	Store fp in ghost frame for outnl
* TOFF dec: -105
* TOFF dec: -106
* Param end outnl
331:    LDA  1,-104(1)	Ghost frame becomes new active frame 
332:    LDA  3,1(7)	Return address in ac 
333:    JMP  7,-300(7)	CALL outnl
334:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -104
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
335:    LDC  2,0(6)	Set return value to 0 
336:     LD  3,-1(1)	Load return address 
337:     LD  1,0(1)	Adjust fp 
338:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,338(7)	Jump to init [backpatch] 
* INIT
339:    LDA  1,-102(0)	set first frame at end of globals 
340:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
341:    LDC  3,100(6)	load size of array aa
342:     ST  3,-1(0)	save size of array aa
* END INIT GLOBALS AND STATICS
343:    LDA  3,1(7)	Return address in ac 
344:    JMP  7,-244(7)	Jump to main 
345:   HALT  0,0,0	DONE! 
* END INIT
