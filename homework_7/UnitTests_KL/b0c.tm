* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  b0c.c-
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
* TOFF set: -2
* Compound Body
* EXPRESSION
* CALL outputb
 40:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 41:    LDC  3,1(6)	Load integer constant 
 42:    RND  3,3,6	Op ? 
 43:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 44:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -4
 45:     LD  4,-4(1)	Pop left into ac1 
 46:    TEQ  3,4,3	Op = 
 47:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
 48:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 49:    LDA  3,1(7)	Return address in ac 
 50:    JMP  7,-34(7)	CALL outputb
 51:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outnl
 52:     ST  1,-2(1)	Store fp in ghost frame for outnl
* TOFF dec: -3
* TOFF dec: -4
* Param end outnl
 53:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 54:    LDA  3,1(7)	Return address in ac 
 55:    JMP  7,-22(7)	CALL outnl
 56:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -2
* EXPRESSION
* CALL outputb
 57:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 58:    LDC  3,100000(6)	Load integer constant 
 59:    RND  3,3,6	Op ? 
 60:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 61:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -4
 62:     LD  4,-4(1)	Pop left into ac1 
 63:    TGT  3,4,3	Op > 
 64:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
 65:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 66:    LDA  3,1(7)	Return address in ac 
 67:    JMP  7,-51(7)	CALL outputb
 68:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outputb
 69:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 70:    LDC  3,3(6)	Load integer constant 
 71:    RND  3,3,6	Op ? 
 72:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 73:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -4
 74:     LD  4,-4(1)	Pop left into ac1 
 75:    TGT  3,4,3	Op > 
 76:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 77:    LDC  3,3(6)	Load integer constant 
 78:    RND  3,3,6	Op ? 
 79:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 80:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -5
 81:     LD  4,-5(1)	Pop left into ac1 
 82:    TGT  3,4,3	Op > 
* TOFF inc: -4
 83:     LD  4,-4(1)	Pop left into ac1 
 84:    AND  3,4,3	Op AND 
 85:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 86:    LDC  3,3(6)	Load integer constant 
 87:    RND  3,3,6	Op ? 
 88:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 89:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -5
 90:     LD  4,-5(1)	Pop left into ac1 
 91:    TGT  3,4,3	Op > 
* TOFF inc: -4
 92:     LD  4,-4(1)	Pop left into ac1 
 93:    AND  3,4,3	Op AND 
 94:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 95:    LDC  3,3(6)	Load integer constant 
 96:    RND  3,3,6	Op ? 
 97:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 98:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -5
 99:     LD  4,-5(1)	Pop left into ac1 
100:    TGT  3,4,3	Op > 
* TOFF inc: -4
101:     LD  4,-4(1)	Pop left into ac1 
102:    AND  3,4,3	Op AND 
103:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
104:    LDC  3,3(6)	Load integer constant 
105:    RND  3,3,6	Op ? 
106:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
107:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -5
108:     LD  4,-5(1)	Pop left into ac1 
109:    TGT  3,4,3	Op > 
* TOFF inc: -4
110:     LD  4,-4(1)	Pop left into ac1 
111:    AND  3,4,3	Op AND 
112:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
113:    LDC  3,3(6)	Load integer constant 
114:    RND  3,3,6	Op ? 
115:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
116:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -5
117:     LD  4,-5(1)	Pop left into ac1 
118:    TGT  3,4,3	Op > 
* TOFF inc: -4
119:     LD  4,-4(1)	Pop left into ac1 
120:    AND  3,4,3	Op AND 
121:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
122:    LDC  3,3(6)	Load integer constant 
123:    RND  3,3,6	Op ? 
124:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
125:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -5
126:     LD  4,-5(1)	Pop left into ac1 
127:    TGT  3,4,3	Op > 
* TOFF inc: -4
128:     LD  4,-4(1)	Pop left into ac1 
129:    AND  3,4,3	Op AND 
130:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
131:    LDC  3,3(6)	Load integer constant 
132:    RND  3,3,6	Op ? 
133:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
134:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -5
135:     LD  4,-5(1)	Pop left into ac1 
136:    TGT  3,4,3	Op > 
* TOFF inc: -4
137:     LD  4,-4(1)	Pop left into ac1 
138:    AND  3,4,3	Op AND 
139:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
140:    LDC  3,3(6)	Load integer constant 
141:    RND  3,3,6	Op ? 
142:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
143:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -5
144:     LD  4,-5(1)	Pop left into ac1 
145:    TGT  3,4,3	Op > 
* TOFF inc: -4
146:     LD  4,-4(1)	Pop left into ac1 
147:    AND  3,4,3	Op AND 
148:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
149:    LDC  3,3(6)	Load integer constant 
150:    RND  3,3,6	Op ? 
151:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
152:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -5
153:     LD  4,-5(1)	Pop left into ac1 
154:    TGT  3,4,3	Op > 
* TOFF inc: -4
155:     LD  4,-4(1)	Pop left into ac1 
156:    AND  3,4,3	Op AND 
157:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
158:    LDC  3,3(6)	Load integer constant 
159:    RND  3,3,6	Op ? 
160:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
161:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -5
162:     LD  4,-5(1)	Pop left into ac1 
163:    TGT  3,4,3	Op > 
* TOFF inc: -4
164:     LD  4,-4(1)	Pop left into ac1 
165:    AND  3,4,3	Op AND 
166:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
167:    LDC  3,3(6)	Load integer constant 
168:    RND  3,3,6	Op ? 
169:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
170:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -5
171:     LD  4,-5(1)	Pop left into ac1 
172:    TGT  3,4,3	Op > 
* TOFF inc: -4
173:     LD  4,-4(1)	Pop left into ac1 
174:    AND  3,4,3	Op AND 
175:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
176:    LDC  3,3(6)	Load integer constant 
177:    RND  3,3,6	Op ? 
178:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
179:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -5
180:     LD  4,-5(1)	Pop left into ac1 
181:    TGT  3,4,3	Op > 
* TOFF inc: -4
182:     LD  4,-4(1)	Pop left into ac1 
183:    AND  3,4,3	Op AND 
184:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
185:    LDA  1,-2(1)	Ghost frame becomes new active frame 
186:    LDA  3,1(7)	Return address in ac 
187:    JMP  7,-171(7)	CALL outputb
188:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outputb
189:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
190:    LDC  3,3(6)	Load integer constant 
191:    RND  3,3,6	Op ? 
192:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
193:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -4
194:     LD  4,-4(1)	Pop left into ac1 
195:    TGT  3,4,3	Op > 
196:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
197:    LDC  3,3(6)	Load integer constant 
198:    RND  3,3,6	Op ? 
199:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
200:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -5
201:     LD  4,-5(1)	Pop left into ac1 
202:    TGT  3,4,3	Op > 
* TOFF inc: -4
203:     LD  4,-4(1)	Pop left into ac1 
204:     OR  3,4,3	Op OR 
205:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
206:    LDC  3,3(6)	Load integer constant 
207:    RND  3,3,6	Op ? 
208:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
209:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -5
210:     LD  4,-5(1)	Pop left into ac1 
211:    TGT  3,4,3	Op > 
* TOFF inc: -4
212:     LD  4,-4(1)	Pop left into ac1 
213:     OR  3,4,3	Op OR 
214:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
215:    LDC  3,3(6)	Load integer constant 
216:    RND  3,3,6	Op ? 
217:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
218:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -5
219:     LD  4,-5(1)	Pop left into ac1 
220:    TGT  3,4,3	Op > 
* TOFF inc: -4
221:     LD  4,-4(1)	Pop left into ac1 
222:     OR  3,4,3	Op OR 
223:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
224:    LDC  3,3(6)	Load integer constant 
225:    RND  3,3,6	Op ? 
226:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
227:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -5
228:     LD  4,-5(1)	Pop left into ac1 
229:    TGT  3,4,3	Op > 
* TOFF inc: -4
230:     LD  4,-4(1)	Pop left into ac1 
231:     OR  3,4,3	Op OR 
232:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
233:    LDC  3,3(6)	Load integer constant 
234:    RND  3,3,6	Op ? 
235:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
236:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -5
237:     LD  4,-5(1)	Pop left into ac1 
238:    TGT  3,4,3	Op > 
* TOFF inc: -4
239:     LD  4,-4(1)	Pop left into ac1 
240:     OR  3,4,3	Op OR 
241:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
242:    LDC  3,3(6)	Load integer constant 
243:    RND  3,3,6	Op ? 
244:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
245:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -5
246:     LD  4,-5(1)	Pop left into ac1 
247:    TGT  3,4,3	Op > 
* TOFF inc: -4
248:     LD  4,-4(1)	Pop left into ac1 
249:     OR  3,4,3	Op OR 
250:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
251:    LDC  3,3(6)	Load integer constant 
252:    RND  3,3,6	Op ? 
253:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
254:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -5
255:     LD  4,-5(1)	Pop left into ac1 
256:    TGT  3,4,3	Op > 
* TOFF inc: -4
257:     LD  4,-4(1)	Pop left into ac1 
258:     OR  3,4,3	Op OR 
259:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
260:    LDC  3,3(6)	Load integer constant 
261:    RND  3,3,6	Op ? 
262:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
263:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -5
264:     LD  4,-5(1)	Pop left into ac1 
265:    TGT  3,4,3	Op > 
* TOFF inc: -4
266:     LD  4,-4(1)	Pop left into ac1 
267:     OR  3,4,3	Op OR 
268:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
269:    LDC  3,3(6)	Load integer constant 
270:    RND  3,3,6	Op ? 
271:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
272:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -5
273:     LD  4,-5(1)	Pop left into ac1 
274:    TGT  3,4,3	Op > 
* TOFF inc: -4
275:     LD  4,-4(1)	Pop left into ac1 
276:     OR  3,4,3	Op OR 
277:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
278:    LDC  3,3(6)	Load integer constant 
279:    RND  3,3,6	Op ? 
280:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
281:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -5
282:     LD  4,-5(1)	Pop left into ac1 
283:    TGT  3,4,3	Op > 
* TOFF inc: -4
284:     LD  4,-4(1)	Pop left into ac1 
285:     OR  3,4,3	Op OR 
286:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
287:    LDC  3,3(6)	Load integer constant 
288:    RND  3,3,6	Op ? 
289:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
290:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -5
291:     LD  4,-5(1)	Pop left into ac1 
292:    TGT  3,4,3	Op > 
* TOFF inc: -4
293:     LD  4,-4(1)	Pop left into ac1 
294:     OR  3,4,3	Op OR 
295:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
296:    LDC  3,3(6)	Load integer constant 
297:    RND  3,3,6	Op ? 
298:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
299:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -5
300:     LD  4,-5(1)	Pop left into ac1 
301:    TGT  3,4,3	Op > 
* TOFF inc: -4
302:     LD  4,-4(1)	Pop left into ac1 
303:     OR  3,4,3	Op OR 
304:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
305:    LDA  1,-2(1)	Ghost frame becomes new active frame 
306:    LDA  3,1(7)	Return address in ac 
307:    JMP  7,-291(7)	CALL outputb
308:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outnl
309:     ST  1,-2(1)	Store fp in ghost frame for outnl
* TOFF dec: -3
* TOFF dec: -4
* Param end outnl
310:    LDA  1,-2(1)	Ghost frame becomes new active frame 
311:    LDA  3,1(7)	Return address in ac 
312:    JMP  7,-279(7)	CALL outnl
313:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -2
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
321:    JMP  7,-283(7)	Jump to main 
322:   HALT  0,0,0	DONE! 
* END INIT
