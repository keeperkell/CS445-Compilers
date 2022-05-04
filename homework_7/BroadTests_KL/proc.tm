* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  proc.c-
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
* FUNCTION square
* TOFF set: -3
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* RETURN
 40:     LD  3,-2(1)	Load variable x
 41:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 42:     LD  3,-2(1)	Load variable x
* TOFF inc: -3
 43:     LD  4,-3(1)	Pop left into ac1 
 44:    MUL  3,4,3	Op * 
 45:    LDA  2,0(3)	Copy result to return register 
 46:     LD  3,-1(1)	Load return address 
 47:     LD  1,0(1)	Adjust fp 
 48:    JMP  7,0(3)	Return 
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
 49:    LDC  2,0(6)	Set return value to 0 
 50:     LD  3,-1(1)	Load return address 
 51:     LD  1,0(1)	Adjust fp 
 52:    JMP  7,0(3)	Return 
* END FUNCTION square
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION max
* TOFF set: -4
 53:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -4
* Compound Body
* IF
 54:     LD  3,-2(1)	Load variable x
 55:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 56:     LD  3,-3(1)	Load variable y
* TOFF inc: -4
 57:     LD  4,-4(1)	Pop left into ac1 
 58:    TGT  3,4,3	Op > 
* THEN
* RETURN
 60:     LD  3,-2(1)	Load variable x
 61:    LDA  2,0(3)	Copy result to return register 
 62:     LD  3,-1(1)	Load return address 
 63:     LD  1,0(1)	Adjust fp 
 64:    JMP  7,0(3)	Return 
 59:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* RETURN
 66:     LD  3,-3(1)	Load variable y
 67:    LDA  2,0(3)	Copy result to return register 
 68:     LD  3,-1(1)	Load return address 
 69:     LD  1,0(1)	Adjust fp 
 70:    JMP  7,0(3)	Return 
 65:    JMP  7,5(7)	Jump around the ELSE [backpatch] 
* END IF
* TOFF set: -4
* END COMPOUND
* Add standard closing in case there is no return statement
 71:    LDC  2,0(6)	Set return value to 0 
 72:     LD  3,-1(1)	Load return address 
 73:     LD  1,0(1)	Adjust fp 
 74:    JMP  7,0(3)	Return 
* END FUNCTION max
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION toInt
* TOFF set: -3
 75:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* IF
 76:     LD  3,-2(1)	Load variable b
* THEN
* RETURN
 78:    LDC  3,1(6)	Load integer constant 
 79:    LDA  2,0(3)	Copy result to return register 
 80:     LD  3,-1(1)	Load return address 
 81:     LD  1,0(1)	Adjust fp 
 82:    JMP  7,0(3)	Return 
 77:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* RETURN
 84:    LDC  3,0(6)	Load integer constant 
 85:    LDA  2,0(3)	Copy result to return register 
 86:     LD  3,-1(1)	Load return address 
 87:     LD  1,0(1)	Adjust fp 
 88:    JMP  7,0(3)	Return 
 83:    JMP  7,5(7)	Jump around the ELSE [backpatch] 
* END IF
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
 89:    LDC  2,0(6)	Set return value to 0 
 90:     LD  3,-1(1)	Load return address 
 91:     LD  1,0(1)	Adjust fp 
 92:    JMP  7,0(3)	Return 
* END FUNCTION toInt
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION toBool
* TOFF set: -3
 93:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* IF
 94:     LD  3,-2(1)	Load variable x
 95:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 96:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -3
 97:     LD  4,-3(1)	Pop left into ac1 
 98:    TEQ  3,4,3	Op = 
* THEN
* RETURN
100:    LDC  3,0(6)	Load Boolean constant 
101:    LDA  2,0(3)	Copy result to return register 
102:     LD  3,-1(1)	Load return address 
103:     LD  1,0(1)	Adjust fp 
104:    JMP  7,0(3)	Return 
 99:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* RETURN
106:    LDC  3,1(6)	Load Boolean constant 
107:    LDA  2,0(3)	Copy result to return register 
108:     LD  3,-1(1)	Load return address 
109:     LD  1,0(1)	Adjust fp 
110:    JMP  7,0(3)	Return 
105:    JMP  7,5(7)	Jump around the ELSE [backpatch] 
* END IF
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
111:    LDC  2,0(6)	Set return value to 0 
112:     LD  3,-1(1)	Load return address 
113:     LD  1,0(1)	Adjust fp 
114:    JMP  7,0(3)	Return 
* END FUNCTION toBool
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
115:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -6
* Compound Body
* EXPRESSION
* CALL output
116:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
* CALL square
117:     ST  1,-8(1)	Store fp in ghost frame for square
* TOFF dec: -9
* TOFF dec: -10
* Param 1
118:    LDC  3,31(6)	Load integer constant 
119:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end square
120:    LDA  1,-8(1)	Ghost frame becomes new active frame 
121:    LDA  3,1(7)	Return address in ac 
122:    JMP  7,-84(7)	CALL square
123:    LDA  3,0(2)	Save the result in ac 
* Call end square
* TOFF set: -8
124:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
125:    LDA  1,-6(1)	Ghost frame becomes new active frame 
126:    LDA  3,1(7)	Return address in ac 
127:    JMP  7,-122(7)	CALL output
128:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL outnl
129:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
130:    LDA  1,-6(1)	Ghost frame becomes new active frame 
131:    LDA  3,1(7)	Return address in ac 
132:    JMP  7,-99(7)	CALL outnl
133:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
* CALL output
134:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
* CALL max
135:     ST  1,-8(1)	Store fp in ghost frame for max
* TOFF dec: -9
* TOFF dec: -10
* Param 1
136:    LDC  3,131(6)	Load integer constant 
137:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param 2
138:    LDC  3,42(6)	Load integer constant 
139:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param end max
140:    LDA  1,-8(1)	Ghost frame becomes new active frame 
141:    LDA  3,1(7)	Return address in ac 
142:    JMP  7,-90(7)	CALL max
143:    LDA  3,0(2)	Save the result in ac 
* Call end max
* TOFF set: -8
144:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
145:    LDA  1,-6(1)	Ghost frame becomes new active frame 
146:    LDA  3,1(7)	Return address in ac 
147:    JMP  7,-142(7)	CALL output
148:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL outnl
149:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
150:    LDA  1,-6(1)	Ghost frame becomes new active frame 
151:    LDA  3,1(7)	Return address in ac 
152:    JMP  7,-119(7)	CALL outnl
153:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
* CALL toBool
154:     ST  1,-6(1)	Store fp in ghost frame for toBool
* TOFF dec: -7
* TOFF dec: -8
* Param 1
155:    LDC  3,42(6)	Load integer constant 
156:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end toBool
157:    LDA  1,-6(1)	Ghost frame becomes new active frame 
158:    LDA  3,1(7)	Return address in ac 
159:    JMP  7,-67(7)	CALL toBool
160:    LDA  3,0(2)	Save the result in ac 
* Call end toBool
* TOFF set: -6
161:     ST  3,-2(1)	Store variable a
* EXPRESSION
* CALL toInt
162:     ST  1,-6(1)	Store fp in ghost frame for toInt
* TOFF dec: -7
* TOFF dec: -8
* Param 1
163:    LDC  3,1(6)	Load Boolean constant 
164:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end toInt
165:    LDA  1,-6(1)	Ghost frame becomes new active frame 
166:    LDA  3,1(7)	Return address in ac 
167:    JMP  7,-93(7)	CALL toInt
168:    LDA  3,0(2)	Save the result in ac 
* Call end toInt
* TOFF set: -6
169:     ST  3,-4(1)	Store variable x
* EXPRESSION
* CALL output
170:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
171:     LD  3,-4(1)	Load variable x
172:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
173:    LDA  1,-6(1)	Ghost frame becomes new active frame 
174:    LDA  3,1(7)	Return address in ac 
175:    JMP  7,-170(7)	CALL output
176:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL outputb
177:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
178:     LD  3,-2(1)	Load variable a
179:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
180:    LDA  1,-6(1)	Ghost frame becomes new active frame 
181:    LDA  3,1(7)	Return address in ac 
182:    JMP  7,-166(7)	CALL outputb
183:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* IF
184:    LDC  3,666(6)	Load integer constant 
185:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
186:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -6
187:     LD  4,-6(1)	Pop left into ac1 
188:    ADD  3,4,3	Op + 
189:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
190:    LDC  3,13(6)	Load integer constant 
* TOFF inc: -6
191:     LD  4,-6(1)	Pop left into ac1 
192:    TGT  3,4,3	Op > 
193:    LDC  4,1(6)	Load 1 
194:    XOR  3,3,4	Op XOR to get logical not 
* THEN
* EXPRESSION
* CALL output
196:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
197:    LDC  3,0(6)	Load integer constant 
198:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
199:    LDA  1,-6(1)	Ghost frame becomes new active frame 
200:    LDA  3,1(7)	Return address in ac 
201:    JMP  7,-196(7)	CALL output
202:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
195:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
* CALL output
204:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
205:    LDC  3,666(6)	Load integer constant 
206:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
207:    LDA  1,-6(1)	Ghost frame becomes new active frame 
208:    LDA  3,1(7)	Return address in ac 
209:    JMP  7,-204(7)	CALL output
210:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
203:    JMP  7,7(7)	Jump around the ELSE [backpatch] 
* END IF
* IF
211:    LDC  3,666(6)	Load integer constant 
212:    NEG  3,3,3	Op unary - 
213:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
214:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -6
215:     LD  4,-6(1)	Pop left into ac1 
216:    ADD  3,4,3	Op + 
217:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
218:    LDC  3,13(6)	Load integer constant 
219:    NEG  3,3,3	Op unary - 
* TOFF inc: -6
220:     LD  4,-6(1)	Pop left into ac1 
221:    TGT  3,4,3	Op > 
222:    LDC  4,1(6)	Load 1 
223:    XOR  3,3,4	Op XOR to get logical not 
* THEN
* EXPRESSION
* CALL output
225:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
226:    LDC  3,0(6)	Load integer constant 
227:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
228:    LDA  1,-6(1)	Ghost frame becomes new active frame 
229:    LDA  3,1(7)	Return address in ac 
230:    JMP  7,-225(7)	CALL output
231:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
224:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
* CALL output
233:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
234:    LDC  3,666(6)	Load integer constant 
235:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
236:    LDA  1,-6(1)	Ghost frame becomes new active frame 
237:    LDA  3,1(7)	Return address in ac 
238:    JMP  7,-233(7)	CALL output
239:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
232:    JMP  7,7(7)	Jump around the ELSE [backpatch] 
* END IF
* IF
240:    LDC  3,666(6)	Load integer constant 
241:    NEG  3,3,3	Op unary - 
242:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
243:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -6
244:     LD  4,-6(1)	Pop left into ac1 
245:    ADD  3,4,3	Op + 
246:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
247:    LDC  3,13(6)	Load integer constant 
248:    NEG  3,3,3	Op unary - 
* TOFF inc: -6
249:     LD  4,-6(1)	Pop left into ac1 
250:    TGT  3,4,3	Op > 
251:    LDC  4,1(6)	Load 1 
252:    XOR  3,3,4	Op XOR to get logical not 
253:    LDC  4,1(6)	Load 1 
254:    XOR  3,3,4	Op XOR to get logical not 
* THEN
* EXPRESSION
* CALL output
256:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
257:    LDC  3,0(6)	Load integer constant 
258:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
259:    LDA  1,-6(1)	Ghost frame becomes new active frame 
260:    LDA  3,1(7)	Return address in ac 
261:    JMP  7,-256(7)	CALL output
262:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
255:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
* CALL output
264:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
265:    LDC  3,666(6)	Load integer constant 
266:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
267:    LDA  1,-6(1)	Ghost frame becomes new active frame 
268:    LDA  3,1(7)	Return address in ac 
269:    JMP  7,-264(7)	CALL output
270:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
263:    JMP  7,7(7)	Jump around the ELSE [backpatch] 
* END IF
* IF
271:    LDC  3,0(6)	Load Boolean constant 
272:    LDC  4,1(6)	Load 1 
273:    XOR  3,3,4	Op XOR to get logical not 
274:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
275:    LDC  3,1(6)	Load Boolean constant 
* TOFF inc: -6
276:     LD  4,-6(1)	Pop left into ac1 
277:    AND  3,4,3	Op AND 
* THEN
* EXPRESSION
* CALL output
279:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
280:    LDC  3,7(6)	Load integer constant 
281:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
282:    LDA  1,-6(1)	Ghost frame becomes new active frame 
283:    LDA  3,1(7)	Return address in ac 
284:    JMP  7,-279(7)	CALL output
285:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
278:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* END IF
* IF
286:    LDC  3,4(6)	Load integer constant 
287:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
288:    LDC  3,6(6)	Load integer constant 
* TOFF inc: -6
289:     LD  4,-6(1)	Pop left into ac1 
290:    TGT  3,4,3	Op > 
291:    LDC  4,1(6)	Load 1 
292:    XOR  3,3,4	Op XOR to get logical not 
293:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
294:    LDC  3,6(6)	Load integer constant 
295:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
296:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -7
297:     LD  4,-7(1)	Pop left into ac1 
298:    TGT  3,4,3	Op > 
* TOFF inc: -6
299:     LD  4,-6(1)	Pop left into ac1 
300:    AND  3,4,3	Op AND 
* THEN
* EXPRESSION
* CALL output
302:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
303:    LDC  3,7(6)	Load integer constant 
304:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
305:    LDA  1,-6(1)	Ghost frame becomes new active frame 
306:    LDA  3,1(7)	Return address in ac 
307:    JMP  7,-302(7)	CALL output
308:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
301:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* END IF
* EXPRESSION
* CALL outnl
309:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
310:    LDA  1,-6(1)	Ghost frame becomes new active frame 
311:    LDA  3,1(7)	Return address in ac 
312:    JMP  7,-279(7)	CALL outnl
313:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
314:    LDC  2,0(6)	Set return value to 0 
315:     LD  3,-1(1)	Load return address 
316:     LD  1,0(1)	Adjust fp 
317:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,317(7)	Jump to init [backpatch] 
* INIT
318:    LDA  1,0(0)	set first frame at end of globals 
319:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
320:    LDA  3,1(7)	Return address in ac 
321:    JMP  7,-207(7)	Jump to main 
322:   HALT  0,0,0	DONE! 
* END INIT
