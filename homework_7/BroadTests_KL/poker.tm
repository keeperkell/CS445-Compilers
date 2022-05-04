* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  poker.c-
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
* FUNCTION suit
* TOFF set: -3
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* RETURN
 40:     LD  3,-2(1)	Load variable c
 41:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 42:     LD  3,0(0)	Load variable numSuits
* TOFF inc: -3
 43:     LD  4,-3(1)	Pop left into ac1 
 44:    MOD  3,4,3	Op % 
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
* END FUNCTION suit
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION pips
* TOFF set: -3
 53:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* RETURN
 54:     LD  3,-2(1)	Load variable c
 55:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 56:     LD  3,0(0)	Load variable numSuits
* TOFF inc: -3
 57:     LD  4,-3(1)	Pop left into ac1 
 58:    DIV  3,4,3	Op / 
 59:    LDA  2,0(3)	Copy result to return register 
 60:     LD  3,-1(1)	Load return address 
 61:     LD  1,0(1)	Adjust fp 
 62:    JMP  7,0(3)	Return 
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
 63:    LDC  2,0(6)	Set return value to 0 
 64:     LD  3,-1(1)	Load return address 
 65:     LD  1,0(1)	Adjust fp 
 66:    JMP  7,0(3)	Return 
* END FUNCTION pips
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION p
* TOFF set: -4
 67:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -4
* Compound Body
* RETURN
* CALL pips
 68:     ST  1,-4(1)	Store fp in ghost frame for pips
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 69:     LD  3,-2(1)	Load variable a
 70:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end pips
 71:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 72:    LDA  3,1(7)	Return address in ac 
 73:    JMP  7,-21(7)	CALL pips
 74:    LDA  3,0(2)	Save the result in ac 
* Call end pips
* TOFF set: -4
 75:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
* CALL pips
 76:     ST  1,-5(1)	Store fp in ghost frame for pips
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 77:     LD  3,-3(1)	Load variable b
 78:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end pips
 79:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 80:    LDA  3,1(7)	Return address in ac 
 81:    JMP  7,-29(7)	CALL pips
 82:    LDA  3,0(2)	Save the result in ac 
* Call end pips
* TOFF set: -5
* TOFF inc: -4
 83:     LD  4,-4(1)	Pop left into ac1 
 84:    TEQ  3,4,3	Op = 
 85:    LDA  2,0(3)	Copy result to return register 
 86:     LD  3,-1(1)	Load return address 
 87:     LD  1,0(1)	Adjust fp 
 88:    JMP  7,0(3)	Return 
* TOFF set: -4
* END COMPOUND
* Add standard closing in case there is no return statement
 89:    LDC  2,0(6)	Set return value to 0 
 90:     LD  3,-1(1)	Load return address 
 91:     LD  1,0(1)	Adjust fp 
 92:    JMP  7,0(3)	Return 
* END FUNCTION p
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION ppp
* TOFF set: -5
 93:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -5
* Compound Body
* RETURN
* CALL p
 94:     ST  1,-5(1)	Store fp in ghost frame for p
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 95:     LD  3,-2(1)	Load variable a
 96:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param 2
 97:     LD  3,-3(1)	Load variable b
 98:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end p
 99:    LDA  1,-5(1)	Ghost frame becomes new active frame 
100:    LDA  3,1(7)	Return address in ac 
101:    JMP  7,-35(7)	CALL p
102:    LDA  3,0(2)	Save the result in ac 
* Call end p
* TOFF set: -5
103:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
* CALL p
104:     ST  1,-6(1)	Store fp in ghost frame for p
* TOFF dec: -7
* TOFF dec: -8
* Param 1
105:     LD  3,-3(1)	Load variable b
106:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param 2
107:     LD  3,-4(1)	Load variable c
108:     ST  3,-9(1)	Push parameter 
* TOFF dec: -10
* Param end p
109:    LDA  1,-6(1)	Ghost frame becomes new active frame 
110:    LDA  3,1(7)	Return address in ac 
111:    JMP  7,-45(7)	CALL p
112:    LDA  3,0(2)	Save the result in ac 
* Call end p
* TOFF set: -6
* TOFF inc: -5
113:     LD  4,-5(1)	Pop left into ac1 
114:    AND  3,4,3	Op AND 
115:    LDA  2,0(3)	Copy result to return register 
116:     LD  3,-1(1)	Load return address 
117:     LD  1,0(1)	Adjust fp 
118:    JMP  7,0(3)	Return 
* TOFF set: -5
* END COMPOUND
* Add standard closing in case there is no return statement
119:    LDC  2,0(6)	Set return value to 0 
120:     LD  3,-1(1)	Load return address 
121:     LD  1,0(1)	Adjust fp 
122:    JMP  7,0(3)	Return 
* END FUNCTION ppp
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION pppp
* TOFF set: -6
123:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -6
* Compound Body
* RETURN
* CALL p
124:     ST  1,-6(1)	Store fp in ghost frame for p
* TOFF dec: -7
* TOFF dec: -8
* Param 1
125:     LD  3,-2(1)	Load variable a
126:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param 2
127:     LD  3,-3(1)	Load variable b
128:     ST  3,-9(1)	Push parameter 
* TOFF dec: -10
* Param end p
129:    LDA  1,-6(1)	Ghost frame becomes new active frame 
130:    LDA  3,1(7)	Return address in ac 
131:    JMP  7,-65(7)	CALL p
132:    LDA  3,0(2)	Save the result in ac 
* Call end p
* TOFF set: -6
133:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
* CALL p
134:     ST  1,-7(1)	Store fp in ghost frame for p
* TOFF dec: -8
* TOFF dec: -9
* Param 1
135:     LD  3,-3(1)	Load variable b
136:     ST  3,-9(1)	Push parameter 
* TOFF dec: -10
* Param 2
137:     LD  3,-4(1)	Load variable c
138:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end p
139:    LDA  1,-7(1)	Ghost frame becomes new active frame 
140:    LDA  3,1(7)	Return address in ac 
141:    JMP  7,-75(7)	CALL p
142:    LDA  3,0(2)	Save the result in ac 
* Call end p
* TOFF set: -7
* TOFF inc: -6
143:     LD  4,-6(1)	Pop left into ac1 
144:    AND  3,4,3	Op AND 
145:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
* CALL p
146:     ST  1,-7(1)	Store fp in ghost frame for p
* TOFF dec: -8
* TOFF dec: -9
* Param 1
147:     LD  3,-4(1)	Load variable c
148:     ST  3,-9(1)	Push parameter 
* TOFF dec: -10
* Param 2
149:     LD  3,-5(1)	Load variable d
150:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end p
151:    LDA  1,-7(1)	Ghost frame becomes new active frame 
152:    LDA  3,1(7)	Return address in ac 
153:    JMP  7,-87(7)	CALL p
154:    LDA  3,0(2)	Save the result in ac 
* Call end p
* TOFF set: -7
* TOFF inc: -6
155:     LD  4,-6(1)	Pop left into ac1 
156:    AND  3,4,3	Op AND 
157:    LDA  2,0(3)	Copy result to return register 
158:     LD  3,-1(1)	Load return address 
159:     LD  1,0(1)	Adjust fp 
160:    JMP  7,0(3)	Return 
* TOFF set: -6
* END COMPOUND
* Add standard closing in case there is no return statement
161:    LDC  2,0(6)	Set return value to 0 
162:     LD  3,-1(1)	Load return address 
163:     LD  1,0(1)	Adjust fp 
164:    JMP  7,0(3)	Return 
* END FUNCTION pppp
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION handtype
* TOFF set: -7
165:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -8
* Compound Body
* EXPRESSION
* CALL suit
166:     ST  1,-8(1)	Store fp in ghost frame for suit
* TOFF dec: -9
* TOFF dec: -10
* Param 1
167:     LD  3,-2(1)	Load variable a
168:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end suit
169:    LDA  1,-8(1)	Ghost frame becomes new active frame 
170:    LDA  3,1(7)	Return address in ac 
171:    JMP  7,-133(7)	CALL suit
172:    LDA  3,0(2)	Save the result in ac 
* Call end suit
* TOFF set: -8
173:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
* CALL suit
174:     ST  1,-9(1)	Store fp in ghost frame for suit
* TOFF dec: -10
* TOFF dec: -11
* Param 1
175:     LD  3,-3(1)	Load variable b
176:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param end suit
177:    LDA  1,-9(1)	Ghost frame becomes new active frame 
178:    LDA  3,1(7)	Return address in ac 
179:    JMP  7,-141(7)	CALL suit
180:    LDA  3,0(2)	Save the result in ac 
* Call end suit
* TOFF set: -9
* TOFF inc: -8
181:     LD  4,-8(1)	Pop left into ac1 
182:    TEQ  3,4,3	Op = 
183:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
* CALL suit
184:     ST  1,-9(1)	Store fp in ghost frame for suit
* TOFF dec: -10
* TOFF dec: -11
* Param 1
185:     LD  3,-2(1)	Load variable a
186:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param end suit
187:    LDA  1,-9(1)	Ghost frame becomes new active frame 
188:    LDA  3,1(7)	Return address in ac 
189:    JMP  7,-151(7)	CALL suit
190:    LDA  3,0(2)	Save the result in ac 
* Call end suit
* TOFF set: -9
191:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
* CALL suit
192:     ST  1,-10(1)	Store fp in ghost frame for suit
* TOFF dec: -11
* TOFF dec: -12
* Param 1
193:     LD  3,-4(1)	Load variable c
194:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param end suit
195:    LDA  1,-10(1)	Ghost frame becomes new active frame 
196:    LDA  3,1(7)	Return address in ac 
197:    JMP  7,-159(7)	CALL suit
198:    LDA  3,0(2)	Save the result in ac 
* Call end suit
* TOFF set: -10
* TOFF inc: -9
199:     LD  4,-9(1)	Pop left into ac1 
200:    TEQ  3,4,3	Op = 
* TOFF inc: -8
201:     LD  4,-8(1)	Pop left into ac1 
202:    AND  3,4,3	Op AND 
203:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
* CALL suit
204:     ST  1,-9(1)	Store fp in ghost frame for suit
* TOFF dec: -10
* TOFF dec: -11
* Param 1
205:     LD  3,-2(1)	Load variable a
206:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param end suit
207:    LDA  1,-9(1)	Ghost frame becomes new active frame 
208:    LDA  3,1(7)	Return address in ac 
209:    JMP  7,-171(7)	CALL suit
210:    LDA  3,0(2)	Save the result in ac 
* Call end suit
* TOFF set: -9
211:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
* CALL suit
212:     ST  1,-10(1)	Store fp in ghost frame for suit
* TOFF dec: -11
* TOFF dec: -12
* Param 1
213:     LD  3,-5(1)	Load variable d
214:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param end suit
215:    LDA  1,-10(1)	Ghost frame becomes new active frame 
216:    LDA  3,1(7)	Return address in ac 
217:    JMP  7,-179(7)	CALL suit
218:    LDA  3,0(2)	Save the result in ac 
* Call end suit
* TOFF set: -10
* TOFF inc: -9
219:     LD  4,-9(1)	Pop left into ac1 
220:    TEQ  3,4,3	Op = 
* TOFF inc: -8
221:     LD  4,-8(1)	Pop left into ac1 
222:    AND  3,4,3	Op AND 
223:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
* CALL suit
224:     ST  1,-9(1)	Store fp in ghost frame for suit
* TOFF dec: -10
* TOFF dec: -11
* Param 1
225:     LD  3,-2(1)	Load variable a
226:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param end suit
227:    LDA  1,-9(1)	Ghost frame becomes new active frame 
228:    LDA  3,1(7)	Return address in ac 
229:    JMP  7,-191(7)	CALL suit
230:    LDA  3,0(2)	Save the result in ac 
* Call end suit
* TOFF set: -9
231:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
* CALL suit
232:     ST  1,-10(1)	Store fp in ghost frame for suit
* TOFF dec: -11
* TOFF dec: -12
* Param 1
233:     LD  3,-6(1)	Load variable e
234:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param end suit
235:    LDA  1,-10(1)	Ghost frame becomes new active frame 
236:    LDA  3,1(7)	Return address in ac 
237:    JMP  7,-199(7)	CALL suit
238:    LDA  3,0(2)	Save the result in ac 
* Call end suit
* TOFF set: -10
* TOFF inc: -9
239:     LD  4,-9(1)	Pop left into ac1 
240:    TEQ  3,4,3	Op = 
* TOFF inc: -8
241:     LD  4,-8(1)	Pop left into ac1 
242:    AND  3,4,3	Op AND 
243:     ST  3,-7(1)	Store variable isflush
* IF
244:     LD  3,-7(1)	Load variable isflush
245:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
* CALL pips
246:     ST  1,-9(1)	Store fp in ghost frame for pips
* TOFF dec: -10
* TOFF dec: -11
* Param 1
247:     LD  3,-2(1)	Load variable a
248:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param end pips
249:    LDA  1,-9(1)	Ghost frame becomes new active frame 
250:    LDA  3,1(7)	Return address in ac 
251:    JMP  7,-199(7)	CALL pips
252:    LDA  3,0(2)	Save the result in ac 
* Call end pips
* TOFF set: -9
253:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
254:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -9
255:     LD  4,-9(1)	Pop left into ac1 
256:    TEQ  3,4,3	Op = 
* TOFF inc: -8
257:     LD  4,-8(1)	Pop left into ac1 
258:    AND  3,4,3	Op AND 
259:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
* CALL pips
260:     ST  1,-9(1)	Store fp in ghost frame for pips
* TOFF dec: -10
* TOFF dec: -11
* Param 1
261:     LD  3,-3(1)	Load variable b
262:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param end pips
263:    LDA  1,-9(1)	Ghost frame becomes new active frame 
264:    LDA  3,1(7)	Return address in ac 
265:    JMP  7,-213(7)	CALL pips
266:    LDA  3,0(2)	Save the result in ac 
* Call end pips
* TOFF set: -9
267:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
268:     LD  3,-1(0)	Load variable numPips
269:     ST  3,-10(1)	Push left side 
* TOFF dec: -11
270:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -10
271:     LD  4,-10(1)	Pop left into ac1 
272:    SUB  3,4,3	Op - 
* TOFF inc: -9
273:     LD  4,-9(1)	Pop left into ac1 
274:    TEQ  3,4,3	Op = 
* TOFF inc: -8
275:     LD  4,-8(1)	Pop left into ac1 
276:    AND  3,4,3	Op AND 
277:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
* CALL pips
278:     ST  1,-9(1)	Store fp in ghost frame for pips
* TOFF dec: -10
* TOFF dec: -11
* Param 1
279:     LD  3,-6(1)	Load variable e
280:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param end pips
281:    LDA  1,-9(1)	Ghost frame becomes new active frame 
282:    LDA  3,1(7)	Return address in ac 
283:    JMP  7,-231(7)	CALL pips
284:    LDA  3,0(2)	Save the result in ac 
* Call end pips
* TOFF set: -9
285:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
286:     LD  3,-1(0)	Load variable numPips
287:     ST  3,-10(1)	Push left side 
* TOFF dec: -11
288:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -10
289:     LD  4,-10(1)	Pop left into ac1 
290:    SUB  3,4,3	Op - 
* TOFF inc: -9
291:     LD  4,-9(1)	Pop left into ac1 
292:    TEQ  3,4,3	Op = 
* TOFF inc: -8
293:     LD  4,-8(1)	Pop left into ac1 
294:    AND  3,4,3	Op AND 
* THEN
* RETURN
296:    LDC  3,0(6)	Load integer constant 
297:    LDA  2,0(3)	Copy result to return register 
298:     LD  3,-1(1)	Load return address 
299:     LD  1,0(1)	Adjust fp 
300:    JMP  7,0(3)	Return 
295:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
302:     LD  3,-7(1)	Load variable isflush
303:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
* CALL pips
304:     ST  1,-9(1)	Store fp in ghost frame for pips
* TOFF dec: -10
* TOFF dec: -11
* Param 1
305:     LD  3,-2(1)	Load variable a
306:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param end pips
307:    LDA  1,-9(1)	Ghost frame becomes new active frame 
308:    LDA  3,1(7)	Return address in ac 
309:    JMP  7,-257(7)	CALL pips
310:    LDA  3,0(2)	Save the result in ac 
* Call end pips
* TOFF set: -9
311:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
* CALL pips
312:     ST  1,-10(1)	Store fp in ghost frame for pips
* TOFF dec: -11
* TOFF dec: -12
* Param 1
313:     LD  3,-6(1)	Load variable e
314:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param end pips
315:    LDA  1,-10(1)	Ghost frame becomes new active frame 
316:    LDA  3,1(7)	Return address in ac 
317:    JMP  7,-265(7)	CALL pips
318:    LDA  3,0(2)	Save the result in ac 
* Call end pips
* TOFF set: -10
319:     ST  3,-10(1)	Push left side 
* TOFF dec: -11
320:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -10
321:     LD  4,-10(1)	Pop left into ac1 
322:    SUB  3,4,3	Op - 
* TOFF inc: -9
323:     LD  4,-9(1)	Pop left into ac1 
324:    TEQ  3,4,3	Op = 
* TOFF inc: -8
325:     LD  4,-8(1)	Pop left into ac1 
326:    AND  3,4,3	Op AND 
* THEN
* RETURN
328:    LDC  3,1(6)	Load integer constant 
329:    LDA  2,0(3)	Copy result to return register 
330:     LD  3,-1(1)	Load return address 
331:     LD  1,0(1)	Adjust fp 
332:    JMP  7,0(3)	Return 
327:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
* CALL pppp
334:     ST  1,-8(1)	Store fp in ghost frame for pppp
* TOFF dec: -9
* TOFF dec: -10
* Param 1
335:     LD  3,-2(1)	Load variable a
336:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param 2
337:     LD  3,-3(1)	Load variable b
338:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param 3
339:     LD  3,-4(1)	Load variable c
340:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param 4
341:     LD  3,-5(1)	Load variable d
342:     ST  3,-13(1)	Push parameter 
* TOFF dec: -14
* Param end pppp
343:    LDA  1,-8(1)	Ghost frame becomes new active frame 
344:    LDA  3,1(7)	Return address in ac 
345:    JMP  7,-223(7)	CALL pppp
346:    LDA  3,0(2)	Save the result in ac 
* Call end pppp
* TOFF set: -8
347:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
* CALL pppp
348:     ST  1,-9(1)	Store fp in ghost frame for pppp
* TOFF dec: -10
* TOFF dec: -11
* Param 1
349:     LD  3,-3(1)	Load variable b
350:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param 2
351:     LD  3,-4(1)	Load variable c
352:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param 3
353:     LD  3,-5(1)	Load variable d
354:     ST  3,-13(1)	Push parameter 
* TOFF dec: -14
* Param 4
355:     LD  3,-6(1)	Load variable e
356:     ST  3,-14(1)	Push parameter 
* TOFF dec: -15
* Param end pppp
357:    LDA  1,-9(1)	Ghost frame becomes new active frame 
358:    LDA  3,1(7)	Return address in ac 
359:    JMP  7,-237(7)	CALL pppp
360:    LDA  3,0(2)	Save the result in ac 
* Call end pppp
* TOFF set: -9
* TOFF inc: -8
361:     LD  4,-8(1)	Pop left into ac1 
362:     OR  3,4,3	Op OR 
* THEN
* RETURN
364:    LDC  3,2(6)	Load integer constant 
365:    LDA  2,0(3)	Copy result to return register 
366:     LD  3,-1(1)	Load return address 
367:     LD  1,0(1)	Adjust fp 
368:    JMP  7,0(3)	Return 
363:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
* CALL ppp
370:     ST  1,-8(1)	Store fp in ghost frame for ppp
* TOFF dec: -9
* TOFF dec: -10
* Param 1
371:     LD  3,-2(1)	Load variable a
372:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param 2
373:     LD  3,-3(1)	Load variable b
374:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param 3
375:     LD  3,-4(1)	Load variable c
376:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param end ppp
377:    LDA  1,-8(1)	Ghost frame becomes new active frame 
378:    LDA  3,1(7)	Return address in ac 
379:    JMP  7,-287(7)	CALL ppp
380:    LDA  3,0(2)	Save the result in ac 
* Call end ppp
* TOFF set: -8
381:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
* CALL p
382:     ST  1,-9(1)	Store fp in ghost frame for p
* TOFF dec: -10
* TOFF dec: -11
* Param 1
383:     LD  3,-5(1)	Load variable d
384:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param 2
385:     LD  3,-6(1)	Load variable e
386:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param end p
387:    LDA  1,-9(1)	Ghost frame becomes new active frame 
388:    LDA  3,1(7)	Return address in ac 
389:    JMP  7,-323(7)	CALL p
390:    LDA  3,0(2)	Save the result in ac 
* Call end p
* TOFF set: -9
* TOFF inc: -8
391:     LD  4,-8(1)	Pop left into ac1 
392:    AND  3,4,3	Op AND 
393:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
* CALL p
394:     ST  1,-9(1)	Store fp in ghost frame for p
* TOFF dec: -10
* TOFF dec: -11
* Param 1
395:     LD  3,-2(1)	Load variable a
396:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param 2
397:     LD  3,-3(1)	Load variable b
398:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param end p
399:    LDA  1,-9(1)	Ghost frame becomes new active frame 
400:    LDA  3,1(7)	Return address in ac 
401:    JMP  7,-335(7)	CALL p
402:    LDA  3,0(2)	Save the result in ac 
* Call end p
* TOFF set: -9
403:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
* CALL ppp
404:     ST  1,-10(1)	Store fp in ghost frame for ppp
* TOFF dec: -11
* TOFF dec: -12
* Param 1
405:     LD  3,-4(1)	Load variable c
406:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param 2
407:     LD  3,-5(1)	Load variable d
408:     ST  3,-13(1)	Push parameter 
* TOFF dec: -14
* Param 3
409:     LD  3,-6(1)	Load variable e
410:     ST  3,-14(1)	Push parameter 
* TOFF dec: -15
* Param end ppp
411:    LDA  1,-10(1)	Ghost frame becomes new active frame 
412:    LDA  3,1(7)	Return address in ac 
413:    JMP  7,-321(7)	CALL ppp
414:    LDA  3,0(2)	Save the result in ac 
* Call end ppp
* TOFF set: -10
* TOFF inc: -9
415:     LD  4,-9(1)	Pop left into ac1 
416:    AND  3,4,3	Op AND 
* TOFF inc: -8
417:     LD  4,-8(1)	Pop left into ac1 
418:     OR  3,4,3	Op OR 
* THEN
* RETURN
420:    LDC  3,3(6)	Load integer constant 
421:    LDA  2,0(3)	Copy result to return register 
422:     LD  3,-1(1)	Load return address 
423:     LD  1,0(1)	Adjust fp 
424:    JMP  7,0(3)	Return 
419:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
426:     LD  3,-7(1)	Load variable isflush
* THEN
* RETURN
428:    LDC  3,4(6)	Load integer constant 
429:    LDA  2,0(3)	Copy result to return register 
430:     LD  3,-1(1)	Load return address 
431:     LD  1,0(1)	Adjust fp 
432:    JMP  7,0(3)	Return 
427:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
* CALL pips
434:     ST  1,-8(1)	Store fp in ghost frame for pips
* TOFF dec: -9
* TOFF dec: -10
* Param 1
435:     LD  3,-2(1)	Load variable a
436:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end pips
437:    LDA  1,-8(1)	Ghost frame becomes new active frame 
438:    LDA  3,1(7)	Return address in ac 
439:    JMP  7,-387(7)	CALL pips
440:    LDA  3,0(2)	Save the result in ac 
* Call end pips
* TOFF set: -8
441:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
* CALL pips
442:     ST  1,-9(1)	Store fp in ghost frame for pips
* TOFF dec: -10
* TOFF dec: -11
* Param 1
443:     LD  3,-3(1)	Load variable b
444:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param end pips
445:    LDA  1,-9(1)	Ghost frame becomes new active frame 
446:    LDA  3,1(7)	Return address in ac 
447:    JMP  7,-395(7)	CALL pips
448:    LDA  3,0(2)	Save the result in ac 
* Call end pips
* TOFF set: -9
449:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
450:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -9
451:     LD  4,-9(1)	Pop left into ac1 
452:    SUB  3,4,3	Op - 
* TOFF inc: -8
453:     LD  4,-8(1)	Pop left into ac1 
454:    TEQ  3,4,3	Op = 
455:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
* CALL pips
456:     ST  1,-9(1)	Store fp in ghost frame for pips
* TOFF dec: -10
* TOFF dec: -11
* Param 1
457:     LD  3,-3(1)	Load variable b
458:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param end pips
459:    LDA  1,-9(1)	Ghost frame becomes new active frame 
460:    LDA  3,1(7)	Return address in ac 
461:    JMP  7,-409(7)	CALL pips
462:    LDA  3,0(2)	Save the result in ac 
* Call end pips
* TOFF set: -9
463:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
* CALL pips
464:     ST  1,-10(1)	Store fp in ghost frame for pips
* TOFF dec: -11
* TOFF dec: -12
* Param 1
465:     LD  3,-4(1)	Load variable c
466:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param end pips
467:    LDA  1,-10(1)	Ghost frame becomes new active frame 
468:    LDA  3,1(7)	Return address in ac 
469:    JMP  7,-417(7)	CALL pips
470:    LDA  3,0(2)	Save the result in ac 
* Call end pips
* TOFF set: -10
471:     ST  3,-10(1)	Push left side 
* TOFF dec: -11
472:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -10
473:     LD  4,-10(1)	Pop left into ac1 
474:    SUB  3,4,3	Op - 
* TOFF inc: -9
475:     LD  4,-9(1)	Pop left into ac1 
476:    TEQ  3,4,3	Op = 
* TOFF inc: -8
477:     LD  4,-8(1)	Pop left into ac1 
478:    AND  3,4,3	Op AND 
479:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
* CALL pips
480:     ST  1,-9(1)	Store fp in ghost frame for pips
* TOFF dec: -10
* TOFF dec: -11
* Param 1
481:     LD  3,-4(1)	Load variable c
482:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param end pips
483:    LDA  1,-9(1)	Ghost frame becomes new active frame 
484:    LDA  3,1(7)	Return address in ac 
485:    JMP  7,-433(7)	CALL pips
486:    LDA  3,0(2)	Save the result in ac 
* Call end pips
* TOFF set: -9
487:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
* CALL pips
488:     ST  1,-10(1)	Store fp in ghost frame for pips
* TOFF dec: -11
* TOFF dec: -12
* Param 1
489:     LD  3,-5(1)	Load variable d
490:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param end pips
491:    LDA  1,-10(1)	Ghost frame becomes new active frame 
492:    LDA  3,1(7)	Return address in ac 
493:    JMP  7,-441(7)	CALL pips
494:    LDA  3,0(2)	Save the result in ac 
* Call end pips
* TOFF set: -10
495:     ST  3,-10(1)	Push left side 
* TOFF dec: -11
496:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -10
497:     LD  4,-10(1)	Pop left into ac1 
498:    SUB  3,4,3	Op - 
* TOFF inc: -9
499:     LD  4,-9(1)	Pop left into ac1 
500:    TEQ  3,4,3	Op = 
* TOFF inc: -8
501:     LD  4,-8(1)	Pop left into ac1 
502:    AND  3,4,3	Op AND 
503:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
* CALL pips
504:     ST  1,-9(1)	Store fp in ghost frame for pips
* TOFF dec: -10
* TOFF dec: -11
* Param 1
505:     LD  3,-5(1)	Load variable d
506:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param end pips
507:    LDA  1,-9(1)	Ghost frame becomes new active frame 
508:    LDA  3,1(7)	Return address in ac 
509:    JMP  7,-457(7)	CALL pips
510:    LDA  3,0(2)	Save the result in ac 
* Call end pips
* TOFF set: -9
511:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
* CALL pips
512:     ST  1,-10(1)	Store fp in ghost frame for pips
* TOFF dec: -11
* TOFF dec: -12
* Param 1
513:     LD  3,-6(1)	Load variable e
514:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param end pips
515:    LDA  1,-10(1)	Ghost frame becomes new active frame 
516:    LDA  3,1(7)	Return address in ac 
517:    JMP  7,-465(7)	CALL pips
518:    LDA  3,0(2)	Save the result in ac 
* Call end pips
* TOFF set: -10
519:     ST  3,-10(1)	Push left side 
* TOFF dec: -11
520:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -10
521:     LD  4,-10(1)	Pop left into ac1 
522:    SUB  3,4,3	Op - 
* TOFF inc: -9
523:     LD  4,-9(1)	Pop left into ac1 
524:    TEQ  3,4,3	Op = 
* TOFF inc: -8
525:     LD  4,-8(1)	Pop left into ac1 
526:    AND  3,4,3	Op AND 
527:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
* CALL pips
528:     ST  1,-9(1)	Store fp in ghost frame for pips
* TOFF dec: -10
* TOFF dec: -11
* Param 1
529:     LD  3,-2(1)	Load variable a
530:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param end pips
531:    LDA  1,-9(1)	Ghost frame becomes new active frame 
532:    LDA  3,1(7)	Return address in ac 
533:    JMP  7,-481(7)	CALL pips
534:    LDA  3,0(2)	Save the result in ac 
* Call end pips
* TOFF set: -9
535:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
536:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -9
537:     LD  4,-9(1)	Pop left into ac1 
538:    TEQ  3,4,3	Op = 
539:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
* CALL pips
540:     ST  1,-10(1)	Store fp in ghost frame for pips
* TOFF dec: -11
* TOFF dec: -12
* Param 1
541:     LD  3,-3(1)	Load variable b
542:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param end pips
543:    LDA  1,-10(1)	Ghost frame becomes new active frame 
544:    LDA  3,1(7)	Return address in ac 
545:    JMP  7,-493(7)	CALL pips
546:    LDA  3,0(2)	Save the result in ac 
* Call end pips
* TOFF set: -10
547:     ST  3,-10(1)	Push left side 
* TOFF dec: -11
548:     LD  3,-1(0)	Load variable numPips
549:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
550:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -11
551:     LD  4,-11(1)	Pop left into ac1 
552:    SUB  3,4,3	Op - 
* TOFF inc: -10
553:     LD  4,-10(1)	Pop left into ac1 
554:    TEQ  3,4,3	Op = 
* TOFF inc: -9
555:     LD  4,-9(1)	Pop left into ac1 
556:    AND  3,4,3	Op AND 
557:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
* CALL pips
558:     ST  1,-10(1)	Store fp in ghost frame for pips
* TOFF dec: -11
* TOFF dec: -12
* Param 1
559:     LD  3,-4(1)	Load variable c
560:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param end pips
561:    LDA  1,-10(1)	Ghost frame becomes new active frame 
562:    LDA  3,1(7)	Return address in ac 
563:    JMP  7,-511(7)	CALL pips
564:    LDA  3,0(2)	Save the result in ac 
* Call end pips
* TOFF set: -10
565:     ST  3,-10(1)	Push left side 
* TOFF dec: -11
566:     LD  3,-1(0)	Load variable numPips
567:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
568:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -11
569:     LD  4,-11(1)	Pop left into ac1 
570:    SUB  3,4,3	Op - 
* TOFF inc: -10
571:     LD  4,-10(1)	Pop left into ac1 
572:    TEQ  3,4,3	Op = 
* TOFF inc: -9
573:     LD  4,-9(1)	Pop left into ac1 
574:    AND  3,4,3	Op AND 
575:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
* CALL pips
576:     ST  1,-10(1)	Store fp in ghost frame for pips
* TOFF dec: -11
* TOFF dec: -12
* Param 1
577:     LD  3,-5(1)	Load variable d
578:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param end pips
579:    LDA  1,-10(1)	Ghost frame becomes new active frame 
580:    LDA  3,1(7)	Return address in ac 
581:    JMP  7,-529(7)	CALL pips
582:    LDA  3,0(2)	Save the result in ac 
* Call end pips
* TOFF set: -10
583:     ST  3,-10(1)	Push left side 
* TOFF dec: -11
584:     LD  3,-1(0)	Load variable numPips
585:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
586:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -11
587:     LD  4,-11(1)	Pop left into ac1 
588:    SUB  3,4,3	Op - 
* TOFF inc: -10
589:     LD  4,-10(1)	Pop left into ac1 
590:    TEQ  3,4,3	Op = 
* TOFF inc: -9
591:     LD  4,-9(1)	Pop left into ac1 
592:    AND  3,4,3	Op AND 
593:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
* CALL pips
594:     ST  1,-10(1)	Store fp in ghost frame for pips
* TOFF dec: -11
* TOFF dec: -12
* Param 1
595:     LD  3,-6(1)	Load variable e
596:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param end pips
597:    LDA  1,-10(1)	Ghost frame becomes new active frame 
598:    LDA  3,1(7)	Return address in ac 
599:    JMP  7,-547(7)	CALL pips
600:    LDA  3,0(2)	Save the result in ac 
* Call end pips
* TOFF set: -10
601:     ST  3,-10(1)	Push left side 
* TOFF dec: -11
602:     LD  3,-1(0)	Load variable numPips
603:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
604:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -11
605:     LD  4,-11(1)	Pop left into ac1 
606:    SUB  3,4,3	Op - 
* TOFF inc: -10
607:     LD  4,-10(1)	Pop left into ac1 
608:    TEQ  3,4,3	Op = 
* TOFF inc: -9
609:     LD  4,-9(1)	Pop left into ac1 
610:    AND  3,4,3	Op AND 
* TOFF inc: -8
611:     LD  4,-8(1)	Pop left into ac1 
612:     OR  3,4,3	Op OR 
* THEN
* RETURN
614:    LDC  3,5(6)	Load integer constant 
615:    LDA  2,0(3)	Copy result to return register 
616:     LD  3,-1(1)	Load return address 
617:     LD  1,0(1)	Adjust fp 
618:    JMP  7,0(3)	Return 
613:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
* CALL ppp
620:     ST  1,-8(1)	Store fp in ghost frame for ppp
* TOFF dec: -9
* TOFF dec: -10
* Param 1
621:     LD  3,-2(1)	Load variable a
622:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param 2
623:     LD  3,-3(1)	Load variable b
624:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param 3
625:     LD  3,-4(1)	Load variable c
626:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param end ppp
627:    LDA  1,-8(1)	Ghost frame becomes new active frame 
628:    LDA  3,1(7)	Return address in ac 
629:    JMP  7,-537(7)	CALL ppp
630:    LDA  3,0(2)	Save the result in ac 
* Call end ppp
* TOFF set: -8
631:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
* CALL ppp
632:     ST  1,-9(1)	Store fp in ghost frame for ppp
* TOFF dec: -10
* TOFF dec: -11
* Param 1
633:     LD  3,-3(1)	Load variable b
634:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param 2
635:     LD  3,-4(1)	Load variable c
636:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param 3
637:     LD  3,-5(1)	Load variable d
638:     ST  3,-13(1)	Push parameter 
* TOFF dec: -14
* Param end ppp
639:    LDA  1,-9(1)	Ghost frame becomes new active frame 
640:    LDA  3,1(7)	Return address in ac 
641:    JMP  7,-549(7)	CALL ppp
642:    LDA  3,0(2)	Save the result in ac 
* Call end ppp
* TOFF set: -9
* TOFF inc: -8
643:     LD  4,-8(1)	Pop left into ac1 
644:     OR  3,4,3	Op OR 
645:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
* CALL ppp
646:     ST  1,-9(1)	Store fp in ghost frame for ppp
* TOFF dec: -10
* TOFF dec: -11
* Param 1
647:     LD  3,-4(1)	Load variable c
648:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param 2
649:     LD  3,-5(1)	Load variable d
650:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param 3
651:     LD  3,-6(1)	Load variable e
652:     ST  3,-13(1)	Push parameter 
* TOFF dec: -14
* Param end ppp
653:    LDA  1,-9(1)	Ghost frame becomes new active frame 
654:    LDA  3,1(7)	Return address in ac 
655:    JMP  7,-563(7)	CALL ppp
656:    LDA  3,0(2)	Save the result in ac 
* Call end ppp
* TOFF set: -9
* TOFF inc: -8
657:     LD  4,-8(1)	Pop left into ac1 
658:     OR  3,4,3	Op OR 
* THEN
* RETURN
660:    LDC  3,6(6)	Load integer constant 
661:    LDA  2,0(3)	Copy result to return register 
662:     LD  3,-1(1)	Load return address 
663:     LD  1,0(1)	Adjust fp 
664:    JMP  7,0(3)	Return 
659:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
* CALL p
666:     ST  1,-8(1)	Store fp in ghost frame for p
* TOFF dec: -9
* TOFF dec: -10
* Param 1
667:     LD  3,-2(1)	Load variable a
668:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param 2
669:     LD  3,-3(1)	Load variable b
670:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param end p
671:    LDA  1,-8(1)	Ghost frame becomes new active frame 
672:    LDA  3,1(7)	Return address in ac 
673:    JMP  7,-607(7)	CALL p
674:    LDA  3,0(2)	Save the result in ac 
* Call end p
* TOFF set: -8
675:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
* CALL p
676:     ST  1,-9(1)	Store fp in ghost frame for p
* TOFF dec: -10
* TOFF dec: -11
* Param 1
677:     LD  3,-4(1)	Load variable c
678:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param 2
679:     LD  3,-5(1)	Load variable d
680:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param end p
681:    LDA  1,-9(1)	Ghost frame becomes new active frame 
682:    LDA  3,1(7)	Return address in ac 
683:    JMP  7,-617(7)	CALL p
684:    LDA  3,0(2)	Save the result in ac 
* Call end p
* TOFF set: -9
* TOFF inc: -8
685:     LD  4,-8(1)	Pop left into ac1 
686:    AND  3,4,3	Op AND 
687:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
* CALL p
688:     ST  1,-9(1)	Store fp in ghost frame for p
* TOFF dec: -10
* TOFF dec: -11
* Param 1
689:     LD  3,-2(1)	Load variable a
690:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param 2
691:     LD  3,-3(1)	Load variable b
692:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param end p
693:    LDA  1,-9(1)	Ghost frame becomes new active frame 
694:    LDA  3,1(7)	Return address in ac 
695:    JMP  7,-629(7)	CALL p
696:    LDA  3,0(2)	Save the result in ac 
* Call end p
* TOFF set: -9
697:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
* CALL p
698:     ST  1,-10(1)	Store fp in ghost frame for p
* TOFF dec: -11
* TOFF dec: -12
* Param 1
699:     LD  3,-5(1)	Load variable d
700:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param 2
701:     LD  3,-6(1)	Load variable e
702:     ST  3,-13(1)	Push parameter 
* TOFF dec: -14
* Param end p
703:    LDA  1,-10(1)	Ghost frame becomes new active frame 
704:    LDA  3,1(7)	Return address in ac 
705:    JMP  7,-639(7)	CALL p
706:    LDA  3,0(2)	Save the result in ac 
* Call end p
* TOFF set: -10
* TOFF inc: -9
707:     LD  4,-9(1)	Pop left into ac1 
708:    AND  3,4,3	Op AND 
* TOFF inc: -8
709:     LD  4,-8(1)	Pop left into ac1 
710:     OR  3,4,3	Op OR 
711:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
* CALL p
712:     ST  1,-9(1)	Store fp in ghost frame for p
* TOFF dec: -10
* TOFF dec: -11
* Param 1
713:     LD  3,-3(1)	Load variable b
714:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param 2
715:     LD  3,-4(1)	Load variable c
716:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param end p
717:    LDA  1,-9(1)	Ghost frame becomes new active frame 
718:    LDA  3,1(7)	Return address in ac 
719:    JMP  7,-653(7)	CALL p
720:    LDA  3,0(2)	Save the result in ac 
* Call end p
* TOFF set: -9
721:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
* CALL p
722:     ST  1,-10(1)	Store fp in ghost frame for p
* TOFF dec: -11
* TOFF dec: -12
* Param 1
723:     LD  3,-5(1)	Load variable d
724:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param 2
725:     LD  3,-6(1)	Load variable e
726:     ST  3,-13(1)	Push parameter 
* TOFF dec: -14
* Param end p
727:    LDA  1,-10(1)	Ghost frame becomes new active frame 
728:    LDA  3,1(7)	Return address in ac 
729:    JMP  7,-663(7)	CALL p
730:    LDA  3,0(2)	Save the result in ac 
* Call end p
* TOFF set: -10
* TOFF inc: -9
731:     LD  4,-9(1)	Pop left into ac1 
732:    AND  3,4,3	Op AND 
* TOFF inc: -8
733:     LD  4,-8(1)	Pop left into ac1 
734:     OR  3,4,3	Op OR 
* THEN
* RETURN
736:    LDC  3,7(6)	Load integer constant 
737:    LDA  2,0(3)	Copy result to return register 
738:     LD  3,-1(1)	Load return address 
739:     LD  1,0(1)	Adjust fp 
740:    JMP  7,0(3)	Return 
735:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
* CALL p
742:     ST  1,-8(1)	Store fp in ghost frame for p
* TOFF dec: -9
* TOFF dec: -10
* Param 1
743:     LD  3,-2(1)	Load variable a
744:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param 2
745:     LD  3,-3(1)	Load variable b
746:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param end p
747:    LDA  1,-8(1)	Ghost frame becomes new active frame 
748:    LDA  3,1(7)	Return address in ac 
749:    JMP  7,-683(7)	CALL p
750:    LDA  3,0(2)	Save the result in ac 
* Call end p
* TOFF set: -8
751:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
* CALL p
752:     ST  1,-9(1)	Store fp in ghost frame for p
* TOFF dec: -10
* TOFF dec: -11
* Param 1
753:     LD  3,-3(1)	Load variable b
754:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param 2
755:     LD  3,-4(1)	Load variable c
756:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param end p
757:    LDA  1,-9(1)	Ghost frame becomes new active frame 
758:    LDA  3,1(7)	Return address in ac 
759:    JMP  7,-693(7)	CALL p
760:    LDA  3,0(2)	Save the result in ac 
* Call end p
* TOFF set: -9
* TOFF inc: -8
761:     LD  4,-8(1)	Pop left into ac1 
762:     OR  3,4,3	Op OR 
763:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
* CALL p
764:     ST  1,-9(1)	Store fp in ghost frame for p
* TOFF dec: -10
* TOFF dec: -11
* Param 1
765:     LD  3,-4(1)	Load variable c
766:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param 2
767:     LD  3,-5(1)	Load variable d
768:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param end p
769:    LDA  1,-9(1)	Ghost frame becomes new active frame 
770:    LDA  3,1(7)	Return address in ac 
771:    JMP  7,-705(7)	CALL p
772:    LDA  3,0(2)	Save the result in ac 
* Call end p
* TOFF set: -9
* TOFF inc: -8
773:     LD  4,-8(1)	Pop left into ac1 
774:     OR  3,4,3	Op OR 
775:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
* CALL p
776:     ST  1,-9(1)	Store fp in ghost frame for p
* TOFF dec: -10
* TOFF dec: -11
* Param 1
777:     LD  3,-5(1)	Load variable d
778:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param 2
779:     LD  3,-6(1)	Load variable e
780:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param end p
781:    LDA  1,-9(1)	Ghost frame becomes new active frame 
782:    LDA  3,1(7)	Return address in ac 
783:    JMP  7,-717(7)	CALL p
784:    LDA  3,0(2)	Save the result in ac 
* Call end p
* TOFF set: -9
* TOFF inc: -8
785:     LD  4,-8(1)	Pop left into ac1 
786:     OR  3,4,3	Op OR 
* THEN
* RETURN
788:    LDC  3,8(6)	Load integer constant 
789:    LDA  2,0(3)	Copy result to return register 
790:     LD  3,-1(1)	Load return address 
791:     LD  1,0(1)	Adjust fp 
792:    JMP  7,0(3)	Return 
787:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* RETURN
794:    LDC  3,9(6)	Load integer constant 
795:    LDA  2,0(3)	Copy result to return register 
796:     LD  3,-1(1)	Load return address 
797:     LD  1,0(1)	Adjust fp 
798:    JMP  7,0(3)	Return 
793:    JMP  7,5(7)	Jump around the ELSE [backpatch] 
* END IF
741:    JMP  7,57(7)	Jump around the ELSE [backpatch] 
* END IF
665:    JMP  7,133(7)	Jump around the ELSE [backpatch] 
* END IF
619:    JMP  7,179(7)	Jump around the ELSE [backpatch] 
* END IF
433:    JMP  7,365(7)	Jump around the ELSE [backpatch] 
* END IF
425:    JMP  7,373(7)	Jump around the ELSE [backpatch] 
* END IF
369:    JMP  7,429(7)	Jump around the ELSE [backpatch] 
* END IF
333:    JMP  7,465(7)	Jump around the ELSE [backpatch] 
* END IF
301:    JMP  7,497(7)	Jump around the ELSE [backpatch] 
* END IF
* TOFF set: -7
* END COMPOUND
* Add standard closing in case there is no return statement
799:    LDC  2,0(6)	Set return value to 0 
800:     LD  3,-1(1)	Load return address 
801:     LD  1,0(1)	Adjust fp 
802:    JMP  7,0(3)	Return 
* END FUNCTION handtype
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
803:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -21
804:    LDC  3,10(6)	load size of array hands
805:     ST  3,-2(1)	save size of array hands
* Compound Body
* EXPRESSION
806:    LDC  3,0(6)	Load integer constant 
807:     ST  3,-20(1)	Store variable i
* WHILE
808:     LD  3,-20(1)	Load variable i
809:     ST  3,-21(1)	Push left side 
* TOFF dec: -22
810:    LDC  3,10(6)	Load integer constant 
* TOFF inc: -21
811:     LD  4,-21(1)	Pop left into ac1 
812:    TLT  3,4,3	Op < 
813:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -21
* Compound Body
* EXPRESSION
815:     LD  3,-20(1)	Load variable i
816:     ST  3,-21(1)	Push index 
* TOFF dec: -22
817:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -21
818:     LD  4,-21(1)	Pop index 
819:    LDA  5,-3(1)	Load address of base of array hands
820:    SUB  5,5,4	Compute offset of value 
821:     ST  3,0(5)	Store variable hands
* EXPRESSION
822:     LD  3,-20(1)	Load variable i
823:     ST  3,-21(1)	Push left side 
* TOFF dec: -22
824:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -21
825:     LD  4,-21(1)	Pop left into ac1 
826:    ADD  3,4,3	Op + 
827:     ST  3,-20(1)	Store variable i
* TOFF set: -21
* END COMPOUND
828:    JMP  7,-21(7)	go to beginning of loop 
814:    JMP  7,14(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
829:    LDC  3,4(6)	Load integer constant 
830:     ST  3,0(0)	Store variable numSuits
* EXPRESSION
831:    LDC  3,6(6)	Load integer constant 
832:     ST  3,-1(0)	Store variable numPips
* EXPRESSION
833:     LD  3,-1(0)	Load variable numPips
834:     ST  3,-21(1)	Push left side 
* TOFF dec: -22
835:     LD  3,0(0)	Load variable numSuits
* TOFF inc: -21
836:     LD  4,-21(1)	Pop left into ac1 
837:    MUL  3,4,3	Op * 
838:     ST  3,-21(1)	Push left side 
* TOFF dec: -22
839:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -21
840:     LD  4,-21(1)	Pop left into ac1 
841:    SUB  3,4,3	Op - 
842:     ST  3,-2(0)	Store variable numCards
* EXPRESSION
843:    LDC  3,0(6)	Load integer constant 
844:     ST  3,-19(1)	Store variable possible
* EXPRESSION
845:    LDC  3,0(6)	Load integer constant 
846:     ST  3,-13(1)	Store variable a
* WHILE
847:     LD  3,-13(1)	Load variable a
848:     ST  3,-21(1)	Push left side 
* TOFF dec: -22
849:     LD  3,-2(0)	Load variable numCards
* TOFF inc: -21
850:     LD  4,-21(1)	Pop left into ac1 
851:    TLE  3,4,3	Op <= 
852:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -21
* Compound Body
* EXPRESSION
* CALL output
854:     ST  1,-21(1)	Store fp in ghost frame for output
* TOFF dec: -22
* TOFF dec: -23
* Param 1
855:     LD  3,-13(1)	Load variable a
856:     ST  3,-23(1)	Push parameter 
* TOFF dec: -24
* Param end output
857:    LDA  1,-21(1)	Ghost frame becomes new active frame 
858:    LDA  3,1(7)	Return address in ac 
859:    JMP  7,-854(7)	CALL output
860:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -21
* EXPRESSION
* CALL outnl
861:     ST  1,-21(1)	Store fp in ghost frame for outnl
* TOFF dec: -22
* TOFF dec: -23
* Param end outnl
862:    LDA  1,-21(1)	Ghost frame becomes new active frame 
863:    LDA  3,1(7)	Return address in ac 
864:    JMP  7,-831(7)	CALL outnl
865:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -21
* EXPRESSION
866:     LD  3,-13(1)	Load variable a
867:     ST  3,-21(1)	Push left side 
* TOFF dec: -22
868:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -21
869:     LD  4,-21(1)	Pop left into ac1 
870:    ADD  3,4,3	Op + 
871:     ST  3,-14(1)	Store variable b
* WHILE
872:     LD  3,-14(1)	Load variable b
873:     ST  3,-21(1)	Push left side 
* TOFF dec: -22
874:     LD  3,-2(0)	Load variable numCards
* TOFF inc: -21
875:     LD  4,-21(1)	Pop left into ac1 
876:    TLE  3,4,3	Op <= 
877:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -21
* Compound Body
* EXPRESSION
879:     LD  3,-14(1)	Load variable b
880:     ST  3,-21(1)	Push left side 
* TOFF dec: -22
881:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -21
882:     LD  4,-21(1)	Pop left into ac1 
883:    ADD  3,4,3	Op + 
884:     ST  3,-15(1)	Store variable c
* WHILE
885:     LD  3,-15(1)	Load variable c
886:     ST  3,-21(1)	Push left side 
* TOFF dec: -22
887:     LD  3,-2(0)	Load variable numCards
* TOFF inc: -21
888:     LD  4,-21(1)	Pop left into ac1 
889:    TLE  3,4,3	Op <= 
890:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -21
* Compound Body
* EXPRESSION
892:     LD  3,-15(1)	Load variable c
893:     ST  3,-21(1)	Push left side 
* TOFF dec: -22
894:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -21
895:     LD  4,-21(1)	Pop left into ac1 
896:    ADD  3,4,3	Op + 
897:     ST  3,-16(1)	Store variable d
* WHILE
898:     LD  3,-16(1)	Load variable d
899:     ST  3,-21(1)	Push left side 
* TOFF dec: -22
900:     LD  3,-2(0)	Load variable numCards
* TOFF inc: -21
901:     LD  4,-21(1)	Pop left into ac1 
902:    TLE  3,4,3	Op <= 
903:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -21
* Compound Body
* EXPRESSION
905:     LD  3,-16(1)	Load variable d
906:     ST  3,-21(1)	Push left side 
* TOFF dec: -22
907:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -21
908:     LD  4,-21(1)	Pop left into ac1 
909:    ADD  3,4,3	Op + 
910:     ST  3,-17(1)	Store variable e
* WHILE
911:     LD  3,-17(1)	Load variable e
912:     ST  3,-21(1)	Push left side 
* TOFF dec: -22
913:     LD  3,-2(0)	Load variable numCards
* TOFF inc: -21
914:     LD  4,-21(1)	Pop left into ac1 
915:    TLE  3,4,3	Op <= 
916:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -21
* Compound Body
* EXPRESSION
918:     LD  3,-19(1)	Load variable possible
919:     ST  3,-21(1)	Push left side 
* TOFF dec: -22
920:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -21
921:     LD  4,-21(1)	Pop left into ac1 
922:    ADD  3,4,3	Op + 
923:     ST  3,-19(1)	Store variable possible
* EXPRESSION
* CALL handtype
924:     ST  1,-21(1)	Store fp in ghost frame for handtype
* TOFF dec: -22
* TOFF dec: -23
* Param 1
925:     LD  3,-13(1)	Load variable a
926:     ST  3,-23(1)	Push parameter 
* TOFF dec: -24
* Param 2
927:     LD  3,-14(1)	Load variable b
928:     ST  3,-24(1)	Push parameter 
* TOFF dec: -25
* Param 3
929:     LD  3,-15(1)	Load variable c
930:     ST  3,-25(1)	Push parameter 
* TOFF dec: -26
* Param 4
931:     LD  3,-16(1)	Load variable d
932:     ST  3,-26(1)	Push parameter 
* TOFF dec: -27
* Param 5
933:     LD  3,-17(1)	Load variable e
934:     ST  3,-27(1)	Push parameter 
* TOFF dec: -28
* Param end handtype
935:    LDA  1,-21(1)	Ghost frame becomes new active frame 
936:    LDA  3,1(7)	Return address in ac 
937:    JMP  7,-773(7)	CALL handtype
938:    LDA  3,0(2)	Save the result in ac 
* Call end handtype
* TOFF set: -21
939:     ST  3,-18(1)	Store variable h
* EXPRESSION
940:     LD  3,-18(1)	Load variable h
941:     ST  3,-21(1)	Push index 
* TOFF dec: -22
942:    LDA  3,-3(1)	Load address of base of array hands
943:     ST  3,-22(1)	Push left side 
* TOFF dec: -23
944:     LD  3,-18(1)	Load variable h
* TOFF inc: -22
945:     LD  4,-22(1)	Pop left into ac1 
946:    SUB  3,4,3	compute location from index 
947:     LD  3,0(3)	Load array element 
948:     ST  3,-22(1)	Push left side 
* TOFF dec: -23
949:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -22
950:     LD  4,-22(1)	Pop left into ac1 
951:    ADD  3,4,3	Op + 
* TOFF inc: -21
952:     LD  4,-21(1)	Pop index 
953:    LDA  5,-3(1)	Load address of base of array hands
954:    SUB  5,5,4	Compute offset of value 
955:     ST  3,0(5)	Store variable hands
* EXPRESSION
956:     LD  3,-17(1)	load lhs variable e
957:    LDA  3,1(3)	increment value of e
958:     ST  3,-17(1)	Store variable e
* TOFF set: -21
* END COMPOUND
959:    JMP  7,-49(7)	go to beginning of loop 
917:    JMP  7,42(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
960:     LD  3,-16(1)	load lhs variable d
961:    LDA  3,1(3)	increment value of d
962:     ST  3,-16(1)	Store variable d
* TOFF set: -21
* END COMPOUND
963:    JMP  7,-66(7)	go to beginning of loop 
904:    JMP  7,59(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
964:     LD  3,-15(1)	load lhs variable c
965:    LDA  3,1(3)	increment value of c
966:     ST  3,-15(1)	Store variable c
* TOFF set: -21
* END COMPOUND
967:    JMP  7,-83(7)	go to beginning of loop 
891:    JMP  7,76(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
968:     LD  3,-14(1)	load lhs variable b
969:    LDA  3,1(3)	increment value of b
970:     ST  3,-14(1)	Store variable b
* TOFF set: -21
* END COMPOUND
971:    JMP  7,-100(7)	go to beginning of loop 
878:    JMP  7,93(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
972:     LD  3,-13(1)	load lhs variable a
973:    LDA  3,1(3)	increment value of a
974:     ST  3,-13(1)	Store variable a
* TOFF set: -21
* END COMPOUND
975:    JMP  7,-129(7)	go to beginning of loop 
853:    JMP  7,122(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
976:    LDC  3,0(6)	Load integer constant 
977:     ST  3,-18(1)	Store variable h
* WHILE
978:     LD  3,-18(1)	Load variable h
979:     ST  3,-21(1)	Push left side 
* TOFF dec: -22
980:    LDC  3,10(6)	Load integer constant 
* TOFF inc: -21
981:     LD  4,-21(1)	Pop left into ac1 
982:    TLT  3,4,3	Op < 
983:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -21
* Compound Body
* EXPRESSION
* CALL output
985:     ST  1,-21(1)	Store fp in ghost frame for output
* TOFF dec: -22
* TOFF dec: -23
* Param 1
986:     LD  3,-18(1)	Load variable h
987:     ST  3,-23(1)	Push parameter 
* TOFF dec: -24
* Param end output
988:    LDA  1,-21(1)	Ghost frame becomes new active frame 
989:    LDA  3,1(7)	Return address in ac 
990:    JMP  7,-985(7)	CALL output
991:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -21
* EXPRESSION
* CALL output
992:     ST  1,-21(1)	Store fp in ghost frame for output
* TOFF dec: -22
* TOFF dec: -23
* Param 1
993:    LDA  3,-3(1)	Load address of base of array hands
994:     ST  3,-23(1)	Push left side 
* TOFF dec: -24
995:     LD  3,-18(1)	Load variable h
* TOFF inc: -23
996:     LD  4,-23(1)	Pop left into ac1 
997:    SUB  3,4,3	compute location from index 
998:     LD  3,0(3)	Load array element 
999:     ST  3,-23(1)	Push parameter 
* TOFF dec: -24
* Param end output
1000:    LDA  1,-21(1)	Ghost frame becomes new active frame 
1001:    LDA  3,1(7)	Return address in ac 
1002:    JMP  7,-997(7)	CALL output
1003:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -21
* EXPRESSION
* CALL outnl
1004:     ST  1,-21(1)	Store fp in ghost frame for outnl
* TOFF dec: -22
* TOFF dec: -23
* Param end outnl
1005:    LDA  1,-21(1)	Ghost frame becomes new active frame 
1006:    LDA  3,1(7)	Return address in ac 
1007:    JMP  7,-974(7)	CALL outnl
1008:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -21
* EXPRESSION
1009:     LD  3,-18(1)	Load variable h
1010:     ST  3,-21(1)	Push left side 
* TOFF dec: -22
1011:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -21
1012:     LD  4,-21(1)	Pop left into ac1 
1013:    ADD  3,4,3	Op + 
1014:     ST  3,-18(1)	Store variable h
* TOFF set: -21
* END COMPOUND
1015:    JMP  7,-38(7)	go to beginning of loop 
984:    JMP  7,31(7)	Jump past loop [backpatch] 
* END WHILE
* RETURN
1016:    LDC  3,0(6)	Load integer constant 
1017:    LDA  2,0(3)	Copy result to return register 
1018:     LD  3,-1(1)	Load return address 
1019:     LD  1,0(1)	Adjust fp 
1020:    JMP  7,0(3)	Return 
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
1021:    LDC  2,0(6)	Set return value to 0 
1022:     LD  3,-1(1)	Load return address 
1023:     LD  1,0(1)	Adjust fp 
1024:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,1024(7)	Jump to init [backpatch] 
* INIT
1025:    LDA  1,-3(0)	set first frame at end of globals 
1026:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
1027:    LDA  3,1(7)	Return address in ac 
1028:    JMP  7,-226(7)	Jump to main 
1029:   HALT  0,0,0	DONE! 
* END INIT
