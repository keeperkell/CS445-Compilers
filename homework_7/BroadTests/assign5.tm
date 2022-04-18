* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  assign5.c-
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
* TOFF set: -5
* Compound Body
* EXPRESSION
 40:    LDC  3,333(6)	Load integer constant 
 41:     ST  3,-2(1)	Store variable x
* EXPRESSION
 42:    LDC  3,444(6)	Load integer constant 
 43:     ST  3,-3(1)	Store variable y
* EXPRESSION
 44:    LDC  3,666(6)	Load integer constant 
 45:     ST  3,-4(1)	Store variable z
* EXPRESSION
 46:     LD  3,-4(1)	Load variable z
 47:     ST  3,-3(1)	Store variable y
 48:     ST  3,-2(1)	Store variable x
* EXPRESSION
* CALL output
 49:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 50:     LD  3,-2(1)	Load variable x
 51:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
 52:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 53:    LDA  3,1(7)	Return address in ac 
 54:    JMP  7,-49(7)	CALL output
 55:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
 56:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 57:     LD  3,-3(1)	Load variable y
 58:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
 59:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 60:    LDA  3,1(7)	Return address in ac 
 61:    JMP  7,-56(7)	CALL output
 62:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
 63:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 64:     LD  3,-4(1)	Load variable z
 65:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
 66:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 67:    LDA  3,1(7)	Return address in ac 
 68:    JMP  7,-63(7)	CALL output
 69:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL outnl
 70:     ST  1,-5(1)	Store fp in ghost frame for outnl
* TOFF dec: -6
* TOFF dec: -7
* Param end outnl
 71:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 72:    LDA  3,1(7)	Return address in ac 
 73:    JMP  7,-40(7)	CALL outnl
 74:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -5
* EXPRESSION
 75:     LD  3,-4(1)	Load variable z
 76:     ST  3,-3(1)	Store variable y
 77:     LD  4,-2(1)	load lhs variable x
 78:    ADD  3,4,3	op += 
 79:     ST  3,-2(1)	Store variable x
* EXPRESSION
* CALL output
 80:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 81:     LD  3,-2(1)	Load variable x
 82:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
 83:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 84:    LDA  3,1(7)	Return address in ac 
 85:    JMP  7,-80(7)	CALL output
 86:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
 87:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 88:     LD  3,-3(1)	Load variable y
 89:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
 90:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 91:    LDA  3,1(7)	Return address in ac 
 92:    JMP  7,-87(7)	CALL output
 93:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
 94:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 95:     LD  3,-4(1)	Load variable z
 96:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
 97:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 98:    LDA  3,1(7)	Return address in ac 
 99:    JMP  7,-94(7)	CALL output
100:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL outnl
101:     ST  1,-5(1)	Store fp in ghost frame for outnl
* TOFF dec: -6
* TOFF dec: -7
* Param end outnl
102:    LDA  1,-5(1)	Ghost frame becomes new active frame 
103:    LDA  3,1(7)	Return address in ac 
104:    JMP  7,-71(7)	CALL outnl
105:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -5
* EXPRESSION
106:     LD  3,-4(1)	Load variable z
107:     LD  4,-3(1)	load lhs variable y
108:    ADD  3,4,3	op += 
109:     ST  3,-3(1)	Store variable y
110:     ST  3,-2(1)	Store variable x
* EXPRESSION
* CALL output
111:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
112:     LD  3,-2(1)	Load variable x
113:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
114:    LDA  1,-5(1)	Ghost frame becomes new active frame 
115:    LDA  3,1(7)	Return address in ac 
116:    JMP  7,-111(7)	CALL output
117:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
118:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
119:     LD  3,-3(1)	Load variable y
120:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
121:    LDA  1,-5(1)	Ghost frame becomes new active frame 
122:    LDA  3,1(7)	Return address in ac 
123:    JMP  7,-118(7)	CALL output
124:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
125:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
126:     LD  3,-4(1)	Load variable z
127:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
128:    LDA  1,-5(1)	Ghost frame becomes new active frame 
129:    LDA  3,1(7)	Return address in ac 
130:    JMP  7,-125(7)	CALL output
131:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL outnl
132:     ST  1,-5(1)	Store fp in ghost frame for outnl
* TOFF dec: -6
* TOFF dec: -7
* Param end outnl
133:    LDA  1,-5(1)	Ghost frame becomes new active frame 
134:    LDA  3,1(7)	Return address in ac 
135:    JMP  7,-102(7)	CALL outnl
136:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -5
* EXPRESSION
137:     LD  3,-4(1)	Load variable z
138:     LD  4,-3(1)	load lhs variable y
139:    ADD  3,4,3	op += 
140:     ST  3,-3(1)	Store variable y
141:     LD  4,-2(1)	load lhs variable x
142:    ADD  3,4,3	op += 
143:     ST  3,-2(1)	Store variable x
* EXPRESSION
* CALL output
144:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
145:     LD  3,-2(1)	Load variable x
146:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
147:    LDA  1,-5(1)	Ghost frame becomes new active frame 
148:    LDA  3,1(7)	Return address in ac 
149:    JMP  7,-144(7)	CALL output
150:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
151:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
152:     LD  3,-3(1)	Load variable y
153:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
154:    LDA  1,-5(1)	Ghost frame becomes new active frame 
155:    LDA  3,1(7)	Return address in ac 
156:    JMP  7,-151(7)	CALL output
157:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
158:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
159:     LD  3,-4(1)	Load variable z
160:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
161:    LDA  1,-5(1)	Ghost frame becomes new active frame 
162:    LDA  3,1(7)	Return address in ac 
163:    JMP  7,-158(7)	CALL output
164:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL outnl
165:     ST  1,-5(1)	Store fp in ghost frame for outnl
* TOFF dec: -6
* TOFF dec: -7
* Param end outnl
166:    LDA  1,-5(1)	Ghost frame becomes new active frame 
167:    LDA  3,1(7)	Return address in ac 
168:    JMP  7,-135(7)	CALL outnl
169:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -5
* EXPRESSION
170:     LD  3,-4(1)	Load variable z
171:     ST  3,-3(1)	Store variable y
172:     ST  3,-2(1)	Store variable x
* EXPRESSION
* CALL output
173:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
174:     LD  3,-2(1)	Load variable x
175:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
176:    LDA  1,-5(1)	Ghost frame becomes new active frame 
177:    LDA  3,1(7)	Return address in ac 
178:    JMP  7,-173(7)	CALL output
179:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
180:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
181:     LD  3,-3(1)	Load variable y
182:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
183:    LDA  1,-5(1)	Ghost frame becomes new active frame 
184:    LDA  3,1(7)	Return address in ac 
185:    JMP  7,-180(7)	CALL output
186:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
187:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
188:     LD  3,-4(1)	Load variable z
189:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
190:    LDA  1,-5(1)	Ghost frame becomes new active frame 
191:    LDA  3,1(7)	Return address in ac 
192:    JMP  7,-187(7)	CALL output
193:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL outnl
194:     ST  1,-5(1)	Store fp in ghost frame for outnl
* TOFF dec: -6
* TOFF dec: -7
* Param end outnl
195:    LDA  1,-5(1)	Ghost frame becomes new active frame 
196:    LDA  3,1(7)	Return address in ac 
197:    JMP  7,-164(7)	CALL outnl
198:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -5
* EXPRESSION
199:     LD  3,-4(1)	Load variable z
200:     ST  3,-3(1)	Store variable y
201:     LD  4,-2(1)	load lhs variable x
202:    SUB  3,4,3	op -= 
203:     ST  3,-2(1)	Store variable x
* EXPRESSION
* CALL output
204:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
205:     LD  3,-2(1)	Load variable x
206:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
207:    LDA  1,-5(1)	Ghost frame becomes new active frame 
208:    LDA  3,1(7)	Return address in ac 
209:    JMP  7,-204(7)	CALL output
210:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
211:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
212:     LD  3,-3(1)	Load variable y
213:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
214:    LDA  1,-5(1)	Ghost frame becomes new active frame 
215:    LDA  3,1(7)	Return address in ac 
216:    JMP  7,-211(7)	CALL output
217:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
218:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
219:     LD  3,-4(1)	Load variable z
220:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
221:    LDA  1,-5(1)	Ghost frame becomes new active frame 
222:    LDA  3,1(7)	Return address in ac 
223:    JMP  7,-218(7)	CALL output
224:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL outnl
225:     ST  1,-5(1)	Store fp in ghost frame for outnl
* TOFF dec: -6
* TOFF dec: -7
* Param end outnl
226:    LDA  1,-5(1)	Ghost frame becomes new active frame 
227:    LDA  3,1(7)	Return address in ac 
228:    JMP  7,-195(7)	CALL outnl
229:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -5
* EXPRESSION
230:     LD  3,-4(1)	Load variable z
231:     LD  4,-3(1)	load lhs variable y
232:    SUB  3,4,3	op -= 
233:     ST  3,-3(1)	Store variable y
234:     ST  3,-2(1)	Store variable x
* EXPRESSION
* CALL output
235:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
236:     LD  3,-2(1)	Load variable x
237:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
238:    LDA  1,-5(1)	Ghost frame becomes new active frame 
239:    LDA  3,1(7)	Return address in ac 
240:    JMP  7,-235(7)	CALL output
241:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
242:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
243:     LD  3,-3(1)	Load variable y
244:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
245:    LDA  1,-5(1)	Ghost frame becomes new active frame 
246:    LDA  3,1(7)	Return address in ac 
247:    JMP  7,-242(7)	CALL output
248:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
249:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
250:     LD  3,-4(1)	Load variable z
251:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
252:    LDA  1,-5(1)	Ghost frame becomes new active frame 
253:    LDA  3,1(7)	Return address in ac 
254:    JMP  7,-249(7)	CALL output
255:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL outnl
256:     ST  1,-5(1)	Store fp in ghost frame for outnl
* TOFF dec: -6
* TOFF dec: -7
* Param end outnl
257:    LDA  1,-5(1)	Ghost frame becomes new active frame 
258:    LDA  3,1(7)	Return address in ac 
259:    JMP  7,-226(7)	CALL outnl
260:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -5
* EXPRESSION
261:     LD  3,-4(1)	Load variable z
262:     LD  4,-3(1)	load lhs variable y
263:    SUB  3,4,3	op -= 
264:     ST  3,-3(1)	Store variable y
265:     LD  4,-2(1)	load lhs variable x
266:    SUB  3,4,3	op -= 
267:     ST  3,-2(1)	Store variable x
* EXPRESSION
* CALL output
268:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
269:     LD  3,-2(1)	Load variable x
270:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
271:    LDA  1,-5(1)	Ghost frame becomes new active frame 
272:    LDA  3,1(7)	Return address in ac 
273:    JMP  7,-268(7)	CALL output
274:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
275:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
276:     LD  3,-3(1)	Load variable y
277:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
278:    LDA  1,-5(1)	Ghost frame becomes new active frame 
279:    LDA  3,1(7)	Return address in ac 
280:    JMP  7,-275(7)	CALL output
281:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
282:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
283:     LD  3,-4(1)	Load variable z
284:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
285:    LDA  1,-5(1)	Ghost frame becomes new active frame 
286:    LDA  3,1(7)	Return address in ac 
287:    JMP  7,-282(7)	CALL output
288:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL outnl
289:     ST  1,-5(1)	Store fp in ghost frame for outnl
* TOFF dec: -6
* TOFF dec: -7
* Param end outnl
290:    LDA  1,-5(1)	Ghost frame becomes new active frame 
291:    LDA  3,1(7)	Return address in ac 
292:    JMP  7,-259(7)	CALL outnl
293:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -5
* RETURN
294:     LD  3,-1(1)	Load return address 
295:     LD  1,0(1)	Adjust fp 
296:    JMP  7,0(3)	Return 
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
297:    LDC  2,0(6)	Set return value to 0 
298:     LD  3,-1(1)	Load return address 
299:     LD  1,0(1)	Adjust fp 
300:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,300(7)	Jump to init [backpatch] 
* INIT
301:    LDA  1,0(0)	set first frame at end of globals 
302:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
303:    LDA  3,1(7)	Return address in ac 
304:    JMP  7,-266(7)	Jump to main 
305:   HALT  0,0,0	DONE! 
* END INIT
