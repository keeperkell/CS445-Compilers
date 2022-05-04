* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  call.c-
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
* FUNCTION showInt
* TOFF set: -3
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
* CALL output
 40:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 41:     LD  3,-2(1)	Load variable x
 42:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 43:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 44:    LDA  3,1(7)	Return address in ac 
 45:    JMP  7,-40(7)	CALL output
 46:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL outnl
 47:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
 48:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 49:    LDA  3,1(7)	Return address in ac 
 50:    JMP  7,-17(7)	CALL outnl
 51:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
 52:    LDC  2,0(6)	Set return value to 0 
 53:     LD  3,-1(1)	Load return address 
 54:     LD  1,0(1)	Adjust fp 
 55:    JMP  7,0(3)	Return 
* END FUNCTION showInt
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION showIntArray
* TOFF set: -4
 56:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -5
* Compound Body
* EXPRESSION
 57:    LDC  3,0(6)	Load integer constant 
 58:     ST  3,-4(1)	Store variable i
* WHILE
 59:     LD  3,-4(1)	Load variable i
 60:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 61:     LD  3,-3(1)	Load variable size
* TOFF inc: -5
 62:     LD  4,-5(1)	Pop left into ac1 
 63:    TLT  3,4,3	Op < 
 64:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -5
* Compound Body
* EXPRESSION
* CALL output
 66:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 67:     LD  3,-2(1)	Load address of base of array x
 68:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
 69:     LD  3,-4(1)	Load variable i
* TOFF inc: -7
 70:     LD  4,-7(1)	Pop left into ac1 
 71:    SUB  3,4,3	compute location from index 
 72:     LD  3,0(3)	Load array element 
 73:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
 74:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 75:    LDA  3,1(7)	Return address in ac 
 76:    JMP  7,-71(7)	CALL output
 77:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
 78:     LD  3,-4(1)	Load variable i
 79:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 80:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -5
 81:     LD  4,-5(1)	Pop left into ac1 
 82:    ADD  3,4,3	Op + 
 83:     ST  3,-4(1)	Store variable i
* TOFF set: -5
* END COMPOUND
 84:    JMP  7,-26(7)	go to beginning of loop 
 65:    JMP  7,19(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
* CALL outnl
 85:     ST  1,-5(1)	Store fp in ghost frame for outnl
* TOFF dec: -6
* TOFF dec: -7
* Param end outnl
 86:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 87:    LDA  3,1(7)	Return address in ac 
 88:    JMP  7,-55(7)	CALL outnl
 89:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -5
* TOFF set: -4
* END COMPOUND
* Add standard closing in case there is no return statement
 90:    LDC  2,0(6)	Set return value to 0 
 91:     LD  3,-1(1)	Load return address 
 92:     LD  1,0(1)	Adjust fp 
 93:    JMP  7,0(3)	Return 
* END FUNCTION showIntArray
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION showBool
* TOFF set: -3
 94:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
* CALL outputb
 95:     ST  1,-3(1)	Store fp in ghost frame for outputb
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 96:     LD  3,-2(1)	Load variable x
 97:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end outputb
 98:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 99:    LDA  3,1(7)	Return address in ac 
100:    JMP  7,-84(7)	CALL outputb
101:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -3
* EXPRESSION
* CALL outnl
102:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
103:    LDA  1,-3(1)	Ghost frame becomes new active frame 
104:    LDA  3,1(7)	Return address in ac 
105:    JMP  7,-72(7)	CALL outnl
106:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
107:    LDC  2,0(6)	Set return value to 0 
108:     LD  3,-1(1)	Load return address 
109:     LD  1,0(1)	Adjust fp 
110:    JMP  7,0(3)	Return 
* END FUNCTION showBool
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION truth
* TOFF set: -2
111:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -2
* Compound Body
* RETURN
112:    LDC  3,1(6)	Load Boolean constant 
113:    LDA  2,0(3)	Copy result to return register 
114:     LD  3,-1(1)	Load return address 
115:     LD  1,0(1)	Adjust fp 
116:    JMP  7,0(3)	Return 
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
117:    LDC  2,0(6)	Set return value to 0 
118:     LD  3,-1(1)	Load return address 
119:     LD  1,0(1)	Adjust fp 
120:    JMP  7,0(3)	Return 
* END FUNCTION truth
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION magic
* TOFF set: -2
121:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -2
* Compound Body
* RETURN
122:    LDC  3,666(6)	Load integer constant 
123:    LDA  2,0(3)	Copy result to return register 
124:     LD  3,-1(1)	Load return address 
125:     LD  1,0(1)	Adjust fp 
126:    JMP  7,0(3)	Return 
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
127:    LDC  2,0(6)	Set return value to 0 
128:     LD  3,-1(1)	Load return address 
129:     LD  1,0(1)	Adjust fp 
130:    JMP  7,0(3)	Return 
* END FUNCTION magic
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION sqr
* TOFF set: -3
131:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* RETURN
132:     LD  3,-2(1)	Load variable x
133:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
134:     LD  3,-2(1)	Load variable x
* TOFF inc: -3
135:     LD  4,-3(1)	Pop left into ac1 
136:    MUL  3,4,3	Op * 
137:    LDA  2,0(3)	Copy result to return register 
138:     LD  3,-1(1)	Load return address 
139:     LD  1,0(1)	Adjust fp 
140:    JMP  7,0(3)	Return 
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
141:    LDC  2,0(6)	Set return value to 0 
142:     LD  3,-1(1)	Load return address 
143:     LD  1,0(1)	Adjust fp 
144:    JMP  7,0(3)	Return 
* END FUNCTION sqr
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION add
* TOFF set: -4
145:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -4
* Compound Body
* RETURN
146:     LD  3,-2(1)	Load variable x
147:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
148:     LD  3,-3(1)	Load variable y
* TOFF inc: -4
149:     LD  4,-4(1)	Pop left into ac1 
150:    ADD  3,4,3	Op + 
151:    LDA  2,0(3)	Copy result to return register 
152:     LD  3,-1(1)	Load return address 
153:     LD  1,0(1)	Adjust fp 
154:    JMP  7,0(3)	Return 
* TOFF set: -4
* END COMPOUND
* Add standard closing in case there is no return statement
155:    LDC  2,0(6)	Set return value to 0 
156:     LD  3,-1(1)	Load return address 
157:     LD  1,0(1)	Adjust fp 
158:    JMP  7,0(3)	Return 
* END FUNCTION add
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION mul
* TOFF set: -4
159:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -4
* Compound Body
* RETURN
160:     LD  3,-2(1)	Load variable x
161:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
162:     LD  3,-3(1)	Load variable y
* TOFF inc: -4
163:     LD  4,-4(1)	Pop left into ac1 
164:    MUL  3,4,3	Op * 
165:    LDA  2,0(3)	Copy result to return register 
166:     LD  3,-1(1)	Load return address 
167:     LD  1,0(1)	Adjust fp 
168:    JMP  7,0(3)	Return 
* TOFF set: -4
* END COMPOUND
* Add standard closing in case there is no return statement
169:    LDC  2,0(6)	Set return value to 0 
170:     LD  3,-1(1)	Load return address 
171:     LD  1,0(1)	Adjust fp 
172:    JMP  7,0(3)	Return 
* END FUNCTION mul
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION caller
* TOFF set: -4
173:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -6
* Compound Body
* EXPRESSION
174:    LDC  3,666(6)	Load integer constant 
175:     ST  3,-5(1)	Store variable a
* EXPRESSION
176:    LDC  3,777(6)	Load integer constant 
177:     ST  3,0(0)	Store variable g
* EXPRESSION
* CALL sqr
178:     ST  1,-6(1)	Store fp in ghost frame for sqr
* TOFF dec: -7
* TOFF dec: -8
* Param 1
179:     LD  3,-2(1)	Load variable x
180:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end sqr
181:    LDA  1,-6(1)	Ghost frame becomes new active frame 
182:    LDA  3,1(7)	Return address in ac 
183:    JMP  7,-53(7)	CALL sqr
184:    LDA  3,0(2)	Save the result in ac 
* Call end sqr
* TOFF set: -6
185:     ST  3,-4(1)	Store variable z
* EXPRESSION
* CALL output
186:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
187:     LD  3,-4(1)	Load variable z
188:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
189:    LDA  1,-6(1)	Ghost frame becomes new active frame 
190:    LDA  3,1(7)	Return address in ac 
191:    JMP  7,-186(7)	CALL output
192:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL outnl
193:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
194:    LDA  1,-6(1)	Ghost frame becomes new active frame 
195:    LDA  3,1(7)	Return address in ac 
196:    JMP  7,-163(7)	CALL outnl
197:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
* CALL sqr
198:     ST  1,-6(1)	Store fp in ghost frame for sqr
* TOFF dec: -7
* TOFF dec: -8
* Param 1
199:     LD  3,-3(1)	Load address of base of array y
200:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
201:    LDC  3,7(6)	Load integer constant 
* TOFF inc: -8
202:     LD  4,-8(1)	Pop left into ac1 
203:    SUB  3,4,3	compute location from index 
204:     LD  3,0(3)	Load array element 
205:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end sqr
206:    LDA  1,-6(1)	Ghost frame becomes new active frame 
207:    LDA  3,1(7)	Return address in ac 
208:    JMP  7,-78(7)	CALL sqr
209:    LDA  3,0(2)	Save the result in ac 
* Call end sqr
* TOFF set: -6
210:     ST  3,-4(1)	Store variable z
* EXPRESSION
* CALL output
211:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
212:     LD  3,-4(1)	Load variable z
213:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
214:    LDA  1,-6(1)	Ghost frame becomes new active frame 
215:    LDA  3,1(7)	Return address in ac 
216:    JMP  7,-211(7)	CALL output
217:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL outnl
218:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
219:    LDA  1,-6(1)	Ghost frame becomes new active frame 
220:    LDA  3,1(7)	Return address in ac 
221:    JMP  7,-188(7)	CALL outnl
222:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
* CALL sqr
223:     ST  1,-6(1)	Store fp in ghost frame for sqr
* TOFF dec: -7
* TOFF dec: -8
* Param 1
224:     LD  3,-5(1)	Load variable a
225:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end sqr
226:    LDA  1,-6(1)	Ghost frame becomes new active frame 
227:    LDA  3,1(7)	Return address in ac 
228:    JMP  7,-98(7)	CALL sqr
229:    LDA  3,0(2)	Save the result in ac 
* Call end sqr
* TOFF set: -6
230:     ST  3,-4(1)	Store variable z
* EXPRESSION
* CALL output
231:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
232:     LD  3,-4(1)	Load variable z
233:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
234:    LDA  1,-6(1)	Ghost frame becomes new active frame 
235:    LDA  3,1(7)	Return address in ac 
236:    JMP  7,-231(7)	CALL output
237:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL outnl
238:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
239:    LDA  1,-6(1)	Ghost frame becomes new active frame 
240:    LDA  3,1(7)	Return address in ac 
241:    JMP  7,-208(7)	CALL outnl
242:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
* CALL sqr
243:     ST  1,-6(1)	Store fp in ghost frame for sqr
* TOFF dec: -7
* TOFF dec: -8
* Param 1
244:     LD  3,0(0)	Load variable g
245:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end sqr
246:    LDA  1,-6(1)	Ghost frame becomes new active frame 
247:    LDA  3,1(7)	Return address in ac 
248:    JMP  7,-118(7)	CALL sqr
249:    LDA  3,0(2)	Save the result in ac 
* Call end sqr
* TOFF set: -6
250:     ST  3,-4(1)	Store variable z
* EXPRESSION
* CALL output
251:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
252:     LD  3,-4(1)	Load variable z
253:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
254:    LDA  1,-6(1)	Ghost frame becomes new active frame 
255:    LDA  3,1(7)	Return address in ac 
256:    JMP  7,-251(7)	CALL output
257:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL outnl
258:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
259:    LDA  1,-6(1)	Ghost frame becomes new active frame 
260:    LDA  3,1(7)	Return address in ac 
261:    JMP  7,-228(7)	CALL outnl
262:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* TOFF set: -4
* END COMPOUND
* Add standard closing in case there is no return statement
263:    LDC  2,0(6)	Set return value to 0 
264:     LD  3,-1(1)	Load return address 
265:     LD  1,0(1)	Adjust fp 
266:    JMP  7,0(3)	Return 
* END FUNCTION caller
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION swap
* TOFF set: -5
267:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -6
* Compound Body
* EXPRESSION
268:     LD  3,-2(1)	Load address of base of array x
269:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
270:     LD  3,-3(1)	Load variable z1
* TOFF inc: -6
271:     LD  4,-6(1)	Pop left into ac1 
272:    SUB  3,4,3	compute location from index 
273:     LD  3,0(3)	Load array element 
274:     ST  3,-5(1)	Store variable tmp
* EXPRESSION
275:     LD  3,-3(1)	Load variable z1
276:     ST  3,-6(1)	Push index 
* TOFF dec: -7
277:     LD  3,-2(1)	Load address of base of array x
278:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
279:     LD  3,-4(1)	Load variable z2
* TOFF inc: -7
280:     LD  4,-7(1)	Pop left into ac1 
281:    SUB  3,4,3	compute location from index 
282:     LD  3,0(3)	Load array element 
* TOFF inc: -6
283:     LD  4,-6(1)	Pop index 
284:     LD  5,-2(1)	Load address of base of array x
285:    SUB  5,5,4	Compute offset of value 
286:     ST  3,0(5)	Store variable x
* EXPRESSION
287:     LD  3,-4(1)	Load variable z2
288:     ST  3,-6(1)	Push index 
* TOFF dec: -7
289:     LD  3,-5(1)	Load variable tmp
* TOFF inc: -6
290:     LD  4,-6(1)	Pop index 
291:     LD  5,-2(1)	Load address of base of array x
292:    SUB  5,5,4	Compute offset of value 
293:     ST  3,0(5)	Store variable x
* TOFF set: -5
* END COMPOUND
* Add standard closing in case there is no return statement
294:    LDC  2,0(6)	Set return value to 0 
295:     LD  3,-1(1)	Load return address 
296:     LD  1,0(1)	Adjust fp 
297:    JMP  7,0(3)	Return 
* END FUNCTION swap
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
298:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -26
299:    LDC  3,10(6)	load size of array r
300:     ST  3,-4(1)	save size of array r
301:    LDC  3,10(6)	load size of array s
302:     ST  3,-15(1)	save size of array s
* Compound Body
* EXPRESSION
303:    LDC  3,0(6)	Load integer constant 
304:     ST  3,-2(1)	Store variable p
* WHILE
305:     LD  3,-2(1)	Load variable p
306:     ST  3,-26(1)	Push left side 
* TOFF dec: -27
307:    LDC  3,10(6)	Load integer constant 
* TOFF inc: -26
308:     LD  4,-26(1)	Pop left into ac1 
309:    TLT  3,4,3	Op < 
310:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -26
* Compound Body
* EXPRESSION
312:     LD  3,-2(1)	Load variable p
313:     ST  3,-26(1)	Push index 
* TOFF dec: -27
314:     LD  3,-2(1)	Load variable p
* TOFF inc: -26
315:     LD  4,-26(1)	Pop index 
316:    LDA  5,-5(1)	Load address of base of array r
317:    SUB  5,5,4	Compute offset of value 
318:     ST  3,0(5)	Store variable r
* EXPRESSION
319:     LD  3,-2(1)	load lhs variable p
320:    LDA  3,1(3)	increment value of p
321:     ST  3,-2(1)	Store variable p
* TOFF set: -26
* END COMPOUND
322:    JMP  7,-18(7)	go to beginning of loop 
311:    JMP  7,11(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
323:    LDC  3,111(6)	Load integer constant 
324:     ST  3,-2(1)	Store variable p
* EXPRESSION
325:    LDC  3,222(6)	Load integer constant 
326:     ST  3,-3(1)	Store variable q
* EXPRESSION
327:    LDC  3,7(6)	Load integer constant 
328:     ST  3,-26(1)	Push index 
* TOFF dec: -27
329:    LDC  3,333(6)	Load integer constant 
* TOFF inc: -26
330:     LD  4,-26(1)	Pop index 
331:    LDA  5,-5(1)	Load address of base of array r
332:    SUB  5,5,4	Compute offset of value 
333:     ST  3,0(5)	Store variable r
* EXPRESSION
334:    LDC  3,7(6)	Load integer constant 
335:     ST  3,-26(1)	Push index 
* TOFF dec: -27
336:    LDC  3,444(6)	Load integer constant 
* TOFF inc: -26
337:     LD  4,-26(1)	Pop index 
338:    LDA  5,-16(1)	Load address of base of array s
339:    SUB  5,5,4	Compute offset of value 
340:     ST  3,0(5)	Store variable s
* EXPRESSION
* CALL showInt
341:     ST  1,-26(1)	Store fp in ghost frame for showInt
* TOFF dec: -27
* TOFF dec: -28
* Param 1
342:     LD  3,-2(1)	Load variable p
343:     ST  3,-28(1)	Push parameter 
* TOFF dec: -29
* Param end showInt
344:    LDA  1,-26(1)	Ghost frame becomes new active frame 
345:    LDA  3,1(7)	Return address in ac 
346:    JMP  7,-308(7)	CALL showInt
347:    LDA  3,0(2)	Save the result in ac 
* Call end showInt
* TOFF set: -26
* EXPRESSION
* CALL showIntArray
348:     ST  1,-26(1)	Store fp in ghost frame for showIntArray
* TOFF dec: -27
* TOFF dec: -28
* Param 1
349:    LDA  3,-5(1)	Load address of base of array r
350:     ST  3,-28(1)	Push parameter 
* TOFF dec: -29
* Param 2
351:    LDC  3,10(6)	Load integer constant 
352:     ST  3,-29(1)	Push parameter 
* TOFF dec: -30
* Param end showIntArray
353:    LDA  1,-26(1)	Ghost frame becomes new active frame 
354:    LDA  3,1(7)	Return address in ac 
355:    JMP  7,-300(7)	CALL showIntArray
356:    LDA  3,0(2)	Save the result in ac 
* Call end showIntArray
* TOFF set: -26
* EXPRESSION
* CALL showBool
357:     ST  1,-26(1)	Store fp in ghost frame for showBool
* TOFF dec: -27
* TOFF dec: -28
* Param 1
* CALL truth
358:     ST  1,-28(1)	Store fp in ghost frame for truth
* TOFF dec: -29
* TOFF dec: -30
* Param end truth
359:    LDA  1,-28(1)	Ghost frame becomes new active frame 
360:    LDA  3,1(7)	Return address in ac 
361:    JMP  7,-251(7)	CALL truth
362:    LDA  3,0(2)	Save the result in ac 
* Call end truth
* TOFF set: -28
363:     ST  3,-28(1)	Push parameter 
* TOFF dec: -29
* Param end showBool
364:    LDA  1,-26(1)	Ghost frame becomes new active frame 
365:    LDA  3,1(7)	Return address in ac 
366:    JMP  7,-273(7)	CALL showBool
367:    LDA  3,0(2)	Save the result in ac 
* Call end showBool
* TOFF set: -26
* EXPRESSION
* CALL caller
368:     ST  1,-26(1)	Store fp in ghost frame for caller
* TOFF dec: -27
* TOFF dec: -28
* Param 1
369:     LD  3,-2(1)	Load variable p
370:     ST  3,-28(1)	Push parameter 
* TOFF dec: -29
* Param 2
371:    LDA  3,-5(1)	Load address of base of array r
372:     ST  3,-29(1)	Push parameter 
* TOFF dec: -30
* Param end caller
373:    LDA  1,-26(1)	Ghost frame becomes new active frame 
374:    LDA  3,1(7)	Return address in ac 
375:    JMP  7,-203(7)	CALL caller
376:    LDA  3,0(2)	Save the result in ac 
* Call end caller
* TOFF set: -26
* EXPRESSION
* CALL output
377:     ST  1,-26(1)	Store fp in ghost frame for output
* TOFF dec: -27
* TOFF dec: -28
* Param 1
* CALL add
378:     ST  1,-28(1)	Store fp in ghost frame for add
* TOFF dec: -29
* TOFF dec: -30
* Param 1
* CALL add
379:     ST  1,-30(1)	Store fp in ghost frame for add
* TOFF dec: -31
* TOFF dec: -32
* Param 1
380:     LD  3,-2(1)	Load variable p
381:     ST  3,-32(1)	Push parameter 
* TOFF dec: -33
* Param 2
382:     LD  3,-3(1)	Load variable q
383:     ST  3,-33(1)	Push parameter 
* TOFF dec: -34
* Param end add
384:    LDA  1,-30(1)	Ghost frame becomes new active frame 
385:    LDA  3,1(7)	Return address in ac 
386:    JMP  7,-242(7)	CALL add
387:    LDA  3,0(2)	Save the result in ac 
* Call end add
* TOFF set: -30
388:     ST  3,-30(1)	Push parameter 
* TOFF dec: -31
* Param 2
* CALL mul
389:     ST  1,-31(1)	Store fp in ghost frame for mul
* TOFF dec: -32
* TOFF dec: -33
* Param 1
390:     LD  3,-2(1)	Load variable p
391:     ST  3,-33(1)	Push parameter 
* TOFF dec: -34
* Param 2
392:     LD  3,-3(1)	Load variable q
393:     ST  3,-34(1)	Push parameter 
* TOFF dec: -35
* Param end mul
394:    LDA  1,-31(1)	Ghost frame becomes new active frame 
395:    LDA  3,1(7)	Return address in ac 
396:    JMP  7,-238(7)	CALL mul
397:    LDA  3,0(2)	Save the result in ac 
* Call end mul
* TOFF set: -31
398:     ST  3,-31(1)	Push parameter 
* TOFF dec: -32
* Param end add
399:    LDA  1,-28(1)	Ghost frame becomes new active frame 
400:    LDA  3,1(7)	Return address in ac 
401:    JMP  7,-257(7)	CALL add
402:    LDA  3,0(2)	Save the result in ac 
* Call end add
* TOFF set: -28
403:     ST  3,-28(1)	Push parameter 
* TOFF dec: -29
* Param end output
404:    LDA  1,-26(1)	Ghost frame becomes new active frame 
405:    LDA  3,1(7)	Return address in ac 
406:    JMP  7,-401(7)	CALL output
407:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -26
* EXPRESSION
* CALL outnl
408:     ST  1,-26(1)	Store fp in ghost frame for outnl
* TOFF dec: -27
* TOFF dec: -28
* Param end outnl
409:    LDA  1,-26(1)	Ghost frame becomes new active frame 
410:    LDA  3,1(7)	Return address in ac 
411:    JMP  7,-378(7)	CALL outnl
412:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -26
* EXPRESSION
413:    LDC  3,9(6)	Load integer constant 
414:     ST  3,-26(1)	Push index 
* TOFF dec: -27
415:    LDC  3,555(6)	Load integer constant 
* TOFF inc: -26
416:     LD  4,-26(1)	Pop index 
417:    LDA  5,-5(1)	Load address of base of array r
418:    SUB  5,5,4	Compute offset of value 
419:     ST  3,0(5)	Store variable r
* EXPRESSION
* CALL swap
420:     ST  1,-26(1)	Store fp in ghost frame for swap
* TOFF dec: -27
* TOFF dec: -28
* Param 1
421:    LDA  3,-5(1)	Load address of base of array r
422:     ST  3,-28(1)	Push parameter 
* TOFF dec: -29
* Param 2
423:    LDC  3,7(6)	Load integer constant 
424:     ST  3,-29(1)	Push parameter 
* TOFF dec: -30
* Param 3
425:    LDC  3,9(6)	Load integer constant 
426:     ST  3,-30(1)	Push parameter 
* TOFF dec: -31
* Param end swap
427:    LDA  1,-26(1)	Ghost frame becomes new active frame 
428:    LDA  3,1(7)	Return address in ac 
429:    JMP  7,-163(7)	CALL swap
430:    LDA  3,0(2)	Save the result in ac 
* Call end swap
* TOFF set: -26
* EXPRESSION
* CALL output
431:     ST  1,-26(1)	Store fp in ghost frame for output
* TOFF dec: -27
* TOFF dec: -28
* Param 1
432:    LDA  3,-5(1)	Load address of base of array r
433:     ST  3,-28(1)	Push left side 
* TOFF dec: -29
434:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -28
435:     LD  4,-28(1)	Pop left into ac1 
436:    SUB  3,4,3	compute location from index 
437:     LD  3,0(3)	Load array element 
438:     ST  3,-28(1)	Push parameter 
* TOFF dec: -29
* Param end output
439:    LDA  1,-26(1)	Ghost frame becomes new active frame 
440:    LDA  3,1(7)	Return address in ac 
441:    JMP  7,-436(7)	CALL output
442:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -26
* EXPRESSION
* CALL outnl
443:     ST  1,-26(1)	Store fp in ghost frame for outnl
* TOFF dec: -27
* TOFF dec: -28
* Param end outnl
444:    LDA  1,-26(1)	Ghost frame becomes new active frame 
445:    LDA  3,1(7)	Return address in ac 
446:    JMP  7,-413(7)	CALL outnl
447:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -26
* EXPRESSION
* CALL output
448:     ST  1,-26(1)	Store fp in ghost frame for output
* TOFF dec: -27
* TOFF dec: -28
* Param 1
449:    LDC  3,2(6)	Load integer constant 
450:     ST  3,-28(1)	Push left side 
* TOFF dec: -29
* CALL add
451:     ST  1,-29(1)	Store fp in ghost frame for add
* TOFF dec: -30
* TOFF dec: -31
* Param 1
* CALL add
452:     ST  1,-31(1)	Store fp in ghost frame for add
* TOFF dec: -32
* TOFF dec: -33
* Param 1
453:    LDC  3,3(6)	Load integer constant 
454:     ST  3,-33(1)	Push left side 
* TOFF dec: -34
455:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -33
456:     LD  4,-33(1)	Pop left into ac1 
457:    MUL  3,4,3	Op * 
458:     ST  3,-33(1)	Push parameter 
* TOFF dec: -34
* Param 2
459:    LDC  3,5(6)	Load integer constant 
460:     ST  3,-34(1)	Push left side 
* TOFF dec: -35
461:    LDC  3,6(6)	Load integer constant 
* TOFF inc: -34
462:     LD  4,-34(1)	Pop left into ac1 
463:    MUL  3,4,3	Op * 
464:     ST  3,-34(1)	Push parameter 
* TOFF dec: -35
* Param end add
465:    LDA  1,-31(1)	Ghost frame becomes new active frame 
466:    LDA  3,1(7)	Return address in ac 
467:    JMP  7,-323(7)	CALL add
468:    LDA  3,0(2)	Save the result in ac 
* Call end add
* TOFF set: -31
469:     ST  3,-31(1)	Push left side 
* TOFF dec: -32
470:    LDC  3,7(6)	Load integer constant 
* TOFF inc: -31
471:     LD  4,-31(1)	Pop left into ac1 
472:    MUL  3,4,3	Op * 
473:     ST  3,-31(1)	Push parameter 
* TOFF dec: -32
* Param 2
* CALL add
474:     ST  1,-32(1)	Store fp in ghost frame for add
* TOFF dec: -33
* TOFF dec: -34
* Param 1
475:    LDC  3,9(6)	Load integer constant 
476:     ST  3,-34(1)	Push left side 
* TOFF dec: -35
477:    LDC  3,10(6)	Load integer constant 
* TOFF inc: -34
478:     LD  4,-34(1)	Pop left into ac1 
479:    MUL  3,4,3	Op * 
480:     ST  3,-34(1)	Push parameter 
* TOFF dec: -35
* Param 2
481:    LDC  3,11(6)	Load integer constant 
482:     ST  3,-35(1)	Push left side 
* TOFF dec: -36
483:    LDC  3,12(6)	Load integer constant 
* TOFF inc: -35
484:     LD  4,-35(1)	Pop left into ac1 
485:    MUL  3,4,3	Op * 
486:     ST  3,-35(1)	Push parameter 
* TOFF dec: -36
* Param end add
487:    LDA  1,-32(1)	Ghost frame becomes new active frame 
488:    LDA  3,1(7)	Return address in ac 
489:    JMP  7,-345(7)	CALL add
490:    LDA  3,0(2)	Save the result in ac 
* Call end add
* TOFF set: -32
491:     ST  3,-32(1)	Push left side 
* TOFF dec: -33
492:    LDC  3,13(6)	Load integer constant 
* TOFF inc: -32
493:     LD  4,-32(1)	Pop left into ac1 
494:    MUL  3,4,3	Op * 
495:     ST  3,-32(1)	Push parameter 
* TOFF dec: -33
* Param end add
496:    LDA  1,-29(1)	Ghost frame becomes new active frame 
497:    LDA  3,1(7)	Return address in ac 
498:    JMP  7,-354(7)	CALL add
499:    LDA  3,0(2)	Save the result in ac 
* Call end add
* TOFF set: -29
* TOFF inc: -28
500:     LD  4,-28(1)	Pop left into ac1 
501:    MUL  3,4,3	Op * 
502:     ST  3,-28(1)	Push parameter 
* TOFF dec: -29
* Param end output
503:    LDA  1,-26(1)	Ghost frame becomes new active frame 
504:    LDA  3,1(7)	Return address in ac 
505:    JMP  7,-500(7)	CALL output
506:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -26
* EXPRESSION
* CALL outnl
507:     ST  1,-26(1)	Store fp in ghost frame for outnl
* TOFF dec: -27
* TOFF dec: -28
* Param end outnl
508:    LDA  1,-26(1)	Ghost frame becomes new active frame 
509:    LDA  3,1(7)	Return address in ac 
510:    JMP  7,-477(7)	CALL outnl
511:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -26
* EXPRESSION
* CALL output
512:     ST  1,-26(1)	Store fp in ghost frame for output
* TOFF dec: -27
* TOFF dec: -28
* Param 1
* CALL magic
513:     ST  1,-28(1)	Store fp in ghost frame for magic
* TOFF dec: -29
* TOFF dec: -30
* Param end magic
514:    LDA  1,-28(1)	Ghost frame becomes new active frame 
515:    LDA  3,1(7)	Return address in ac 
516:    JMP  7,-396(7)	CALL magic
517:    LDA  3,0(2)	Save the result in ac 
* Call end magic
* TOFF set: -28
518:     ST  3,-28(1)	Push left side 
* TOFF dec: -29
* CALL magic
519:     ST  1,-29(1)	Store fp in ghost frame for magic
* TOFF dec: -30
* TOFF dec: -31
* Param end magic
520:    LDA  1,-29(1)	Ghost frame becomes new active frame 
521:    LDA  3,1(7)	Return address in ac 
522:    JMP  7,-402(7)	CALL magic
523:    LDA  3,0(2)	Save the result in ac 
* Call end magic
* TOFF set: -29
* TOFF inc: -28
524:     LD  4,-28(1)	Pop left into ac1 
525:    MUL  3,4,3	Op * 
526:     ST  3,-28(1)	Push parameter 
* TOFF dec: -29
* Param end output
527:    LDA  1,-26(1)	Ghost frame becomes new active frame 
528:    LDA  3,1(7)	Return address in ac 
529:    JMP  7,-524(7)	CALL output
530:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -26
* EXPRESSION
* CALL outnl
531:     ST  1,-26(1)	Store fp in ghost frame for outnl
* TOFF dec: -27
* TOFF dec: -28
* Param end outnl
532:    LDA  1,-26(1)	Ghost frame becomes new active frame 
533:    LDA  3,1(7)	Return address in ac 
534:    JMP  7,-501(7)	CALL outnl
535:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -26
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
536:    LDC  2,0(6)	Set return value to 0 
537:     LD  3,-1(1)	Load return address 
538:     LD  1,0(1)	Adjust fp 
539:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,539(7)	Jump to init [backpatch] 
* INIT
540:    LDA  1,-1(0)	set first frame at end of globals 
541:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
542:    LDA  3,1(7)	Return address in ac 
543:    JMP  7,-246(7)	Jump to main 
544:   HALT  0,0,0	DONE! 
* END INIT
