* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  nest.c-
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
* FUNCTION agamemnon
* TOFF set: -2
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -5
* Compound Body
* EXPRESSION
 40:    LDC  3,666(6)	Load integer constant 
 41:     ST  3,-2(1)	Store variable a
* EXPRESSION
 42:    LDC  3,666(6)	Load integer constant 
 43:     ST  3,-3(1)	Store variable b
* EXPRESSION
 44:    LDC  3,666(6)	Load integer constant 
 45:     ST  3,-4(1)	Store variable x
* EXPRESSION
 46:    LDC  3,666(6)	Load integer constant 
 47:     ST  3,-2(0)	Store variable z
* EXPRESSION
* CALL output
 48:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 49:     LD  3,-2(1)	Load variable a
 50:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
 51:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 52:    LDA  3,1(7)	Return address in ac 
 53:    JMP  7,-48(7)	CALL output
 54:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
 55:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 56:     LD  3,-3(1)	Load variable b
 57:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
 58:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 59:    LDA  3,1(7)	Return address in ac 
 60:    JMP  7,-55(7)	CALL output
 61:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
 62:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 63:     LD  3,-4(1)	Load variable x
 64:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
 65:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 66:    LDA  3,1(7)	Return address in ac 
 67:    JMP  7,-62(7)	CALL output
 68:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
 69:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 70:     LD  3,-1(0)	Load variable y
 71:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
 72:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 73:    LDA  3,1(7)	Return address in ac 
 74:    JMP  7,-69(7)	CALL output
 75:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
 76:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 77:     LD  3,-2(0)	Load variable z
 78:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
 79:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 80:    LDA  3,1(7)	Return address in ac 
 81:    JMP  7,-76(7)	CALL output
 82:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
 83:    LDC  3,1(6)	Load integer constant 
 84:     ST  3,-2(1)	Store variable a
* EXPRESSION
 85:    LDC  3,2(6)	Load integer constant 
 86:     ST  3,-3(1)	Store variable b
* EXPRESSION
 87:    LDC  3,3(6)	Load integer constant 
 88:     ST  3,-4(1)	Store variable x
* EXPRESSION
 89:    LDC  3,4(6)	Load integer constant 
 90:     ST  3,-1(0)	Store variable y
* EXPRESSION
 91:    LDC  3,5(6)	Load integer constant 
 92:     ST  3,-2(0)	Store variable z
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
 93:    LDC  2,0(6)	Set return value to 0 
 94:     LD  3,-1(1)	Load return address 
 95:     LD  1,0(1)	Adjust fp 
 96:    JMP  7,0(3)	Return 
* END FUNCTION agamemnon
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
 97:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -5
* Compound Body
* EXPRESSION
 98:    LDC  3,6(6)	Load integer constant 
 99:     ST  3,-2(1)	Store variable a
* EXPRESSION
100:    LDC  3,7(6)	Load integer constant 
101:     ST  3,-3(1)	Store variable b
* EXPRESSION
102:    LDC  3,8(6)	Load integer constant 
103:     ST  3,0(0)	Store variable x
* EXPRESSION
104:    LDC  3,9(6)	Load integer constant 
105:     ST  3,-1(0)	Store variable y
* EXPRESSION
106:    LDC  3,10(6)	Load integer constant 
107:     ST  3,-4(1)	Store variable z
* EXPRESSION
* CALL output
108:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
109:     LD  3,-2(1)	Load variable a
110:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
111:    LDA  1,-5(1)	Ghost frame becomes new active frame 
112:    LDA  3,1(7)	Return address in ac 
113:    JMP  7,-108(7)	CALL output
114:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
115:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
116:     LD  3,-3(1)	Load variable b
117:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
118:    LDA  1,-5(1)	Ghost frame becomes new active frame 
119:    LDA  3,1(7)	Return address in ac 
120:    JMP  7,-115(7)	CALL output
121:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
122:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
123:     LD  3,0(0)	Load variable x
124:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
125:    LDA  1,-5(1)	Ghost frame becomes new active frame 
126:    LDA  3,1(7)	Return address in ac 
127:    JMP  7,-122(7)	CALL output
128:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
129:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
130:     LD  3,-1(0)	Load variable y
131:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
132:    LDA  1,-5(1)	Ghost frame becomes new active frame 
133:    LDA  3,1(7)	Return address in ac 
134:    JMP  7,-129(7)	CALL output
135:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
136:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
137:     LD  3,-4(1)	Load variable z
138:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
139:    LDA  1,-5(1)	Ghost frame becomes new active frame 
140:    LDA  3,1(7)	Return address in ac 
141:    JMP  7,-136(7)	CALL output
142:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* COMPOUND
* TOFF set: -8
* Compound Body
* EXPRESSION
143:    LDC  3,666(6)	Load integer constant 
144:     ST  3,-5(1)	Store variable a
* EXPRESSION
145:    LDC  3,666(6)	Load integer constant 
146:     ST  3,-6(1)	Store variable b
* EXPRESSION
147:    LDC  3,666(6)	Load integer constant 
148:     ST  3,-7(1)	Store variable z
* EXPRESSION
* CALL output
149:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
150:     LD  3,-5(1)	Load variable a
151:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
152:    LDA  1,-8(1)	Ghost frame becomes new active frame 
153:    LDA  3,1(7)	Return address in ac 
154:    JMP  7,-149(7)	CALL output
155:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
156:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
157:     LD  3,-6(1)	Load variable b
158:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
159:    LDA  1,-8(1)	Ghost frame becomes new active frame 
160:    LDA  3,1(7)	Return address in ac 
161:    JMP  7,-156(7)	CALL output
162:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
163:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
164:     LD  3,0(0)	Load variable x
165:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
166:    LDA  1,-8(1)	Ghost frame becomes new active frame 
167:    LDA  3,1(7)	Return address in ac 
168:    JMP  7,-163(7)	CALL output
169:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
170:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
171:     LD  3,-1(0)	Load variable y
172:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
173:    LDA  1,-8(1)	Ghost frame becomes new active frame 
174:    LDA  3,1(7)	Return address in ac 
175:    JMP  7,-170(7)	CALL output
176:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
177:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
178:     LD  3,-7(1)	Load variable z
179:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
180:    LDA  1,-8(1)	Ghost frame becomes new active frame 
181:    LDA  3,1(7)	Return address in ac 
182:    JMP  7,-177(7)	CALL output
183:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
184:    LDC  3,11(6)	Load integer constant 
185:     ST  3,-5(1)	Store variable a
* EXPRESSION
186:    LDC  3,12(6)	Load integer constant 
187:     ST  3,-6(1)	Store variable b
* EXPRESSION
188:    LDC  3,13(6)	Load integer constant 
189:     ST  3,0(0)	Store variable x
* EXPRESSION
190:    LDC  3,14(6)	Load integer constant 
191:     ST  3,-1(0)	Store variable y
* EXPRESSION
192:    LDC  3,15(6)	Load integer constant 
193:     ST  3,-7(1)	Store variable z
* EXPRESSION
* CALL output
194:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
195:     LD  3,-5(1)	Load variable a
196:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
197:    LDA  1,-8(1)	Ghost frame becomes new active frame 
198:    LDA  3,1(7)	Return address in ac 
199:    JMP  7,-194(7)	CALL output
200:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
201:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
202:     LD  3,-6(1)	Load variable b
203:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
204:    LDA  1,-8(1)	Ghost frame becomes new active frame 
205:    LDA  3,1(7)	Return address in ac 
206:    JMP  7,-201(7)	CALL output
207:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
208:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
209:     LD  3,0(0)	Load variable x
210:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
211:    LDA  1,-8(1)	Ghost frame becomes new active frame 
212:    LDA  3,1(7)	Return address in ac 
213:    JMP  7,-208(7)	CALL output
214:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
215:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
216:     LD  3,-1(0)	Load variable y
217:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
218:    LDA  1,-8(1)	Ghost frame becomes new active frame 
219:    LDA  3,1(7)	Return address in ac 
220:    JMP  7,-215(7)	CALL output
221:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
222:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
223:     LD  3,-7(1)	Load variable z
224:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
225:    LDA  1,-8(1)	Ghost frame becomes new active frame 
226:    LDA  3,1(7)	Return address in ac 
227:    JMP  7,-222(7)	CALL output
228:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* COMPOUND
* TOFF set: -8
* Compound Body
* EXPRESSION
* CALL output
229:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
230:     LD  3,-5(1)	Load variable a
231:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
232:    LDA  1,-8(1)	Ghost frame becomes new active frame 
233:    LDA  3,1(7)	Return address in ac 
234:    JMP  7,-229(7)	CALL output
235:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
236:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
237:     LD  3,-6(1)	Load variable b
238:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
239:    LDA  1,-8(1)	Ghost frame becomes new active frame 
240:    LDA  3,1(7)	Return address in ac 
241:    JMP  7,-236(7)	CALL output
242:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
243:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
244:     LD  3,0(0)	Load variable x
245:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
246:    LDA  1,-8(1)	Ghost frame becomes new active frame 
247:    LDA  3,1(7)	Return address in ac 
248:    JMP  7,-243(7)	CALL output
249:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
250:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
251:     LD  3,-1(0)	Load variable y
252:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
253:    LDA  1,-8(1)	Ghost frame becomes new active frame 
254:    LDA  3,1(7)	Return address in ac 
255:    JMP  7,-250(7)	CALL output
256:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
257:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
258:     LD  3,-7(1)	Load variable z
259:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
260:    LDA  1,-8(1)	Ghost frame becomes new active frame 
261:    LDA  3,1(7)	Return address in ac 
262:    JMP  7,-257(7)	CALL output
263:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
264:    LDC  3,16(6)	Load integer constant 
265:     ST  3,-5(1)	Store variable a
* EXPRESSION
266:    LDC  3,17(6)	Load integer constant 
267:     ST  3,-6(1)	Store variable b
* EXPRESSION
268:    LDC  3,18(6)	Load integer constant 
269:     ST  3,0(0)	Store variable x
* EXPRESSION
270:    LDC  3,19(6)	Load integer constant 
271:     ST  3,-1(0)	Store variable y
* EXPRESSION
272:    LDC  3,20(6)	Load integer constant 
273:     ST  3,-7(1)	Store variable z
* EXPRESSION
* CALL output
274:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
275:     LD  3,-5(1)	Load variable a
276:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
277:    LDA  1,-8(1)	Ghost frame becomes new active frame 
278:    LDA  3,1(7)	Return address in ac 
279:    JMP  7,-274(7)	CALL output
280:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
281:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
282:     LD  3,-6(1)	Load variable b
283:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
284:    LDA  1,-8(1)	Ghost frame becomes new active frame 
285:    LDA  3,1(7)	Return address in ac 
286:    JMP  7,-281(7)	CALL output
287:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
288:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
289:     LD  3,0(0)	Load variable x
290:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
291:    LDA  1,-8(1)	Ghost frame becomes new active frame 
292:    LDA  3,1(7)	Return address in ac 
293:    JMP  7,-288(7)	CALL output
294:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
295:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
296:     LD  3,-1(0)	Load variable y
297:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
298:    LDA  1,-8(1)	Ghost frame becomes new active frame 
299:    LDA  3,1(7)	Return address in ac 
300:    JMP  7,-295(7)	CALL output
301:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
302:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
303:     LD  3,-7(1)	Load variable z
304:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
305:    LDA  1,-8(1)	Ghost frame becomes new active frame 
306:    LDA  3,1(7)	Return address in ac 
307:    JMP  7,-302(7)	CALL output
308:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* TOFF set: -8
* END COMPOUND
* EXPRESSION
* CALL output
309:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
310:     LD  3,-5(1)	Load variable a
311:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
312:    LDA  1,-8(1)	Ghost frame becomes new active frame 
313:    LDA  3,1(7)	Return address in ac 
314:    JMP  7,-309(7)	CALL output
315:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
316:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
317:     LD  3,-6(1)	Load variable b
318:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
319:    LDA  1,-8(1)	Ghost frame becomes new active frame 
320:    LDA  3,1(7)	Return address in ac 
321:    JMP  7,-316(7)	CALL output
322:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
323:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
324:     LD  3,0(0)	Load variable x
325:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
326:    LDA  1,-8(1)	Ghost frame becomes new active frame 
327:    LDA  3,1(7)	Return address in ac 
328:    JMP  7,-323(7)	CALL output
329:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
330:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
331:     LD  3,-1(0)	Load variable y
332:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
333:    LDA  1,-8(1)	Ghost frame becomes new active frame 
334:    LDA  3,1(7)	Return address in ac 
335:    JMP  7,-330(7)	CALL output
336:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
337:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
338:     LD  3,-7(1)	Load variable z
339:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
340:    LDA  1,-8(1)	Ghost frame becomes new active frame 
341:    LDA  3,1(7)	Return address in ac 
342:    JMP  7,-337(7)	CALL output
343:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL agamemnon
344:     ST  1,-8(1)	Store fp in ghost frame for agamemnon
* TOFF dec: -9
* TOFF dec: -10
* Param end agamemnon
345:    LDA  1,-8(1)	Ghost frame becomes new active frame 
346:    LDA  3,1(7)	Return address in ac 
347:    JMP  7,-309(7)	CALL agamemnon
348:    LDA  3,0(2)	Save the result in ac 
* Call end agamemnon
* TOFF set: -8
* EXPRESSION
* CALL output
349:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
350:     LD  3,-5(1)	Load variable a
351:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
352:    LDA  1,-8(1)	Ghost frame becomes new active frame 
353:    LDA  3,1(7)	Return address in ac 
354:    JMP  7,-349(7)	CALL output
355:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
356:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
357:     LD  3,-6(1)	Load variable b
358:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
359:    LDA  1,-8(1)	Ghost frame becomes new active frame 
360:    LDA  3,1(7)	Return address in ac 
361:    JMP  7,-356(7)	CALL output
362:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
363:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
364:     LD  3,0(0)	Load variable x
365:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
366:    LDA  1,-8(1)	Ghost frame becomes new active frame 
367:    LDA  3,1(7)	Return address in ac 
368:    JMP  7,-363(7)	CALL output
369:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
370:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
371:     LD  3,-1(0)	Load variable y
372:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
373:    LDA  1,-8(1)	Ghost frame becomes new active frame 
374:    LDA  3,1(7)	Return address in ac 
375:    JMP  7,-370(7)	CALL output
376:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
377:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
378:     LD  3,-7(1)	Load variable z
379:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
380:    LDA  1,-8(1)	Ghost frame becomes new active frame 
381:    LDA  3,1(7)	Return address in ac 
382:    JMP  7,-377(7)	CALL output
383:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* TOFF set: -5
* END COMPOUND
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
384:    LDC  2,0(6)	Set return value to 0 
385:     LD  3,-1(1)	Load return address 
386:     LD  1,0(1)	Adjust fp 
387:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,387(7)	Jump to init [backpatch] 
* INIT
388:    LDA  1,-3(0)	set first frame at end of globals 
389:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
390:    LDA  3,1(7)	Return address in ac 
391:    JMP  7,-295(7)	Jump to main 
392:   HALT  0,0,0	DONE! 
* END INIT
