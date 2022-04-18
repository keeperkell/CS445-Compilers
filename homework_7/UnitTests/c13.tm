* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  c13.c-
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
* TOFF set: -304
 40:    LDC  3,300(6)	load size of array x
 41:     ST  3,-2(1)	save size of array x
* Compound Body
* EXPRESSION
 42:    LDC  3,5(6)	Load integer constant 
 43:     ST  3,-303(1)	Store variable z
* EXPRESSION
 44:     LD  3,-303(1)	Load variable z
 45:     ST  3,-304(1)	Push index 
* TOFF dec: -305
 46:    LDC  3,73(6)	Load integer constant 
* TOFF inc: -304
 47:     LD  4,-304(1)	Pop index 
 48:    LDA  5,-3(1)	Load address of base of array x
 49:    SUB  5,5,4	Compute offset of value 
 50:     ST  3,0(5)	Store variable x
* EXPRESSION
* CALL output
 51:     ST  1,-304(1)	Store fp in ghost frame for output
* TOFF dec: -305
* TOFF dec: -306
* Param 1
 52:    LDA  3,-3(1)	Load address of base of array x
 53:     ST  3,-306(1)	Push left side 
* TOFF dec: -307
 54:     LD  3,-303(1)	Load variable z
* TOFF inc: -306
 55:     LD  4,-306(1)	Pop left into ac1 
 56:    SUB  3,4,3	compute location from index 
 57:     LD  3,0(3)	Load array element 
 58:     ST  3,-306(1)	Push parameter 
* TOFF dec: -307
* Param end output
 59:    LDA  1,-304(1)	Ghost frame becomes new active frame 
 60:    LDA  3,1(7)	Return address in ac 
 61:    JMP  7,-56(7)	CALL output
 62:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -304
* EXPRESSION
* CALL outnl
 63:     ST  1,-304(1)	Store fp in ghost frame for outnl
* TOFF dec: -305
* TOFF dec: -306
* Param end outnl
 64:    LDA  1,-304(1)	Ghost frame becomes new active frame 
 65:    LDA  3,1(7)	Return address in ac 
 66:    JMP  7,-33(7)	CALL outnl
 67:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -304
* EXPRESSION
 68:    LDC  3,5(6)	Load integer constant 
 69:     ST  3,-303(1)	Store variable z
* EXPRESSION
 70:     LD  3,-303(1)	Load variable z
 71:     ST  3,-304(1)	Push index 
* TOFF dec: -305
 72:    LDC  3,17(6)	Load integer constant 
* TOFF inc: -304
 73:     LD  4,-304(1)	Pop index 
 74:    LDA  5,-3(1)	Load address of base of array x
 75:    SUB  5,5,4	Compute offset of value 
 76:     ST  3,0(5)	Store variable x
* EXPRESSION
 77:    LDC  3,17(6)	Load integer constant 
 78:     ST  3,-303(1)	Store variable z
* EXPRESSION
 79:     LD  3,-303(1)	Load variable z
 80:     ST  3,-304(1)	Push index 
* TOFF dec: -305
 81:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -304
 82:     LD  4,-304(1)	Pop index 
 83:    LDA  5,-3(1)	Load address of base of array x
 84:    SUB  5,5,4	Compute offset of value 
 85:     ST  3,0(5)	Store variable x
* EXPRESSION
* CALL output
 86:     ST  1,-304(1)	Store fp in ghost frame for output
* TOFF dec: -305
* TOFF dec: -306
* Param 1
 87:    LDA  3,-3(1)	Load address of base of array x
 88:     ST  3,-306(1)	Push left side 
* TOFF dec: -307
 89:     LD  3,-303(1)	Load variable z
* TOFF inc: -306
 90:     LD  4,-306(1)	Pop left into ac1 
 91:    SUB  3,4,3	compute location from index 
 92:     LD  3,0(3)	Load array element 
 93:     ST  3,-306(1)	Push parameter 
* TOFF dec: -307
* Param end output
 94:    LDA  1,-304(1)	Ghost frame becomes new active frame 
 95:    LDA  3,1(7)	Return address in ac 
 96:    JMP  7,-91(7)	CALL output
 97:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -304
* EXPRESSION
* CALL outnl
 98:     ST  1,-304(1)	Store fp in ghost frame for outnl
* TOFF dec: -305
* TOFF dec: -306
* Param end outnl
 99:    LDA  1,-304(1)	Ghost frame becomes new active frame 
100:    LDA  3,1(7)	Return address in ac 
101:    JMP  7,-68(7)	CALL outnl
102:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -304
* EXPRESSION
* CALL output
103:     ST  1,-304(1)	Store fp in ghost frame for output
* TOFF dec: -305
* TOFF dec: -306
* Param 1
104:    LDA  3,-3(1)	Load address of base of array x
105:     ST  3,-306(1)	Push left side 
* TOFF dec: -307
106:    LDA  3,-3(1)	Load address of base of array x
107:     ST  3,-307(1)	Push left side 
* TOFF dec: -308
108:     LD  3,-303(1)	Load variable z
* TOFF inc: -307
109:     LD  4,-307(1)	Pop left into ac1 
110:    SUB  3,4,3	compute location from index 
111:     LD  3,0(3)	Load array element 
* TOFF inc: -306
112:     LD  4,-306(1)	Pop left into ac1 
113:    SUB  3,4,3	compute location from index 
114:     LD  3,0(3)	Load array element 
115:     ST  3,-306(1)	Push parameter 
* TOFF dec: -307
* Param end output
116:    LDA  1,-304(1)	Ghost frame becomes new active frame 
117:    LDA  3,1(7)	Return address in ac 
118:    JMP  7,-113(7)	CALL output
119:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -304
* EXPRESSION
* CALL outnl
120:     ST  1,-304(1)	Store fp in ghost frame for outnl
* TOFF dec: -305
* TOFF dec: -306
* Param end outnl
121:    LDA  1,-304(1)	Ghost frame becomes new active frame 
122:    LDA  3,1(7)	Return address in ac 
123:    JMP  7,-90(7)	CALL outnl
124:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -304
* EXPRESSION
* CALL output
125:     ST  1,-304(1)	Store fp in ghost frame for output
* TOFF dec: -305
* TOFF dec: -306
* Param 1
126:    LDA  3,-3(1)	Load address of base of array x
127:     ST  3,-306(1)	Push left side 
* TOFF dec: -307
128:    LDA  3,-3(1)	Load address of base of array x
129:     ST  3,-307(1)	Push left side 
* TOFF dec: -308
130:    LDA  3,-3(1)	Load address of base of array x
131:     ST  3,-308(1)	Push left side 
* TOFF dec: -309
132:     LD  3,-303(1)	Load variable z
* TOFF inc: -308
133:     LD  4,-308(1)	Pop left into ac1 
134:    SUB  3,4,3	compute location from index 
135:     LD  3,0(3)	Load array element 
* TOFF inc: -307
136:     LD  4,-307(1)	Pop left into ac1 
137:    SUB  3,4,3	compute location from index 
138:     LD  3,0(3)	Load array element 
* TOFF inc: -306
139:     LD  4,-306(1)	Pop left into ac1 
140:    SUB  3,4,3	compute location from index 
141:     LD  3,0(3)	Load array element 
142:     ST  3,-306(1)	Push parameter 
* TOFF dec: -307
* Param end output
143:    LDA  1,-304(1)	Ghost frame becomes new active frame 
144:    LDA  3,1(7)	Return address in ac 
145:    JMP  7,-140(7)	CALL output
146:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -304
* EXPRESSION
* CALL outnl
147:     ST  1,-304(1)	Store fp in ghost frame for outnl
* TOFF dec: -305
* TOFF dec: -306
* Param end outnl
148:    LDA  1,-304(1)	Ghost frame becomes new active frame 
149:    LDA  3,1(7)	Return address in ac 
150:    JMP  7,-117(7)	CALL outnl
151:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -304
* EXPRESSION
* CALL output
152:     ST  1,-304(1)	Store fp in ghost frame for output
* TOFF dec: -305
* TOFF dec: -306
* Param 1
153:    LDA  3,-3(1)	Load address of base of array x
154:     ST  3,-306(1)	Push left side 
* TOFF dec: -307
155:    LDA  3,-3(1)	Load address of base of array x
156:     ST  3,-307(1)	Push left side 
* TOFF dec: -308
157:    LDA  3,-3(1)	Load address of base of array x
158:     ST  3,-308(1)	Push left side 
* TOFF dec: -309
159:    LDA  3,-3(1)	Load address of base of array x
160:     ST  3,-309(1)	Push left side 
* TOFF dec: -310
161:     LD  3,-303(1)	Load variable z
* TOFF inc: -309
162:     LD  4,-309(1)	Pop left into ac1 
163:    SUB  3,4,3	compute location from index 
164:     LD  3,0(3)	Load array element 
* TOFF inc: -308
165:     LD  4,-308(1)	Pop left into ac1 
166:    SUB  3,4,3	compute location from index 
167:     LD  3,0(3)	Load array element 
* TOFF inc: -307
168:     LD  4,-307(1)	Pop left into ac1 
169:    SUB  3,4,3	compute location from index 
170:     LD  3,0(3)	Load array element 
* TOFF inc: -306
171:     LD  4,-306(1)	Pop left into ac1 
172:    SUB  3,4,3	compute location from index 
173:     LD  3,0(3)	Load array element 
174:     ST  3,-306(1)	Push parameter 
* TOFF dec: -307
* Param end output
175:    LDA  1,-304(1)	Ghost frame becomes new active frame 
176:    LDA  3,1(7)	Return address in ac 
177:    JMP  7,-172(7)	CALL output
178:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -304
* EXPRESSION
* CALL outnl
179:     ST  1,-304(1)	Store fp in ghost frame for outnl
* TOFF dec: -305
* TOFF dec: -306
* Param end outnl
180:    LDA  1,-304(1)	Ghost frame becomes new active frame 
181:    LDA  3,1(7)	Return address in ac 
182:    JMP  7,-149(7)	CALL outnl
183:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -304
* EXPRESSION
* CALL output
184:     ST  1,-304(1)	Store fp in ghost frame for output
* TOFF dec: -305
* TOFF dec: -306
* Param 1
185:    LDA  3,-3(1)	Load address of base of array x
186:     ST  3,-306(1)	Push left side 
* TOFF dec: -307
187:    LDA  3,-3(1)	Load address of base of array x
188:     ST  3,-307(1)	Push left side 
* TOFF dec: -308
189:    LDA  3,-3(1)	Load address of base of array x
190:     ST  3,-308(1)	Push left side 
* TOFF dec: -309
191:    LDA  3,-3(1)	Load address of base of array x
192:     ST  3,-309(1)	Push left side 
* TOFF dec: -310
193:    LDA  3,-3(1)	Load address of base of array x
194:     ST  3,-310(1)	Push left side 
* TOFF dec: -311
195:     LD  3,-303(1)	Load variable z
* TOFF inc: -310
196:     LD  4,-310(1)	Pop left into ac1 
197:    SUB  3,4,3	compute location from index 
198:     LD  3,0(3)	Load array element 
* TOFF inc: -309
199:     LD  4,-309(1)	Pop left into ac1 
200:    SUB  3,4,3	compute location from index 
201:     LD  3,0(3)	Load array element 
* TOFF inc: -308
202:     LD  4,-308(1)	Pop left into ac1 
203:    SUB  3,4,3	compute location from index 
204:     LD  3,0(3)	Load array element 
* TOFF inc: -307
205:     LD  4,-307(1)	Pop left into ac1 
206:    SUB  3,4,3	compute location from index 
207:     LD  3,0(3)	Load array element 
* TOFF inc: -306
208:     LD  4,-306(1)	Pop left into ac1 
209:    SUB  3,4,3	compute location from index 
210:     LD  3,0(3)	Load array element 
211:     ST  3,-306(1)	Push parameter 
* TOFF dec: -307
* Param end output
212:    LDA  1,-304(1)	Ghost frame becomes new active frame 
213:    LDA  3,1(7)	Return address in ac 
214:    JMP  7,-209(7)	CALL output
215:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -304
* EXPRESSION
* CALL outnl
216:     ST  1,-304(1)	Store fp in ghost frame for outnl
* TOFF dec: -305
* TOFF dec: -306
* Param end outnl
217:    LDA  1,-304(1)	Ghost frame becomes new active frame 
218:    LDA  3,1(7)	Return address in ac 
219:    JMP  7,-186(7)	CALL outnl
220:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -304
* EXPRESSION
* CALL output
221:     ST  1,-304(1)	Store fp in ghost frame for output
* TOFF dec: -305
* TOFF dec: -306
* Param 1
222:    LDA  3,-3(1)	Load address of base of array x
223:     ST  3,-306(1)	Push left side 
* TOFF dec: -307
224:    LDA  3,-3(1)	Load address of base of array x
225:     ST  3,-307(1)	Push left side 
* TOFF dec: -308
226:    LDA  3,-3(1)	Load address of base of array x
227:     ST  3,-308(1)	Push left side 
* TOFF dec: -309
228:    LDA  3,-3(1)	Load address of base of array x
229:     ST  3,-309(1)	Push left side 
* TOFF dec: -310
230:    LDA  3,-3(1)	Load address of base of array x
231:     ST  3,-310(1)	Push left side 
* TOFF dec: -311
232:    LDA  3,-3(1)	Load address of base of array x
233:     ST  3,-311(1)	Push left side 
* TOFF dec: -312
234:     LD  3,-303(1)	Load variable z
* TOFF inc: -311
235:     LD  4,-311(1)	Pop left into ac1 
236:    SUB  3,4,3	compute location from index 
237:     LD  3,0(3)	Load array element 
* TOFF inc: -310
238:     LD  4,-310(1)	Pop left into ac1 
239:    SUB  3,4,3	compute location from index 
240:     LD  3,0(3)	Load array element 
* TOFF inc: -309
241:     LD  4,-309(1)	Pop left into ac1 
242:    SUB  3,4,3	compute location from index 
243:     LD  3,0(3)	Load array element 
* TOFF inc: -308
244:     LD  4,-308(1)	Pop left into ac1 
245:    SUB  3,4,3	compute location from index 
246:     LD  3,0(3)	Load array element 
* TOFF inc: -307
247:     LD  4,-307(1)	Pop left into ac1 
248:    SUB  3,4,3	compute location from index 
249:     LD  3,0(3)	Load array element 
* TOFF inc: -306
250:     LD  4,-306(1)	Pop left into ac1 
251:    SUB  3,4,3	compute location from index 
252:     LD  3,0(3)	Load array element 
253:     ST  3,-306(1)	Push parameter 
* TOFF dec: -307
* Param end output
254:    LDA  1,-304(1)	Ghost frame becomes new active frame 
255:    LDA  3,1(7)	Return address in ac 
256:    JMP  7,-251(7)	CALL output
257:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -304
* EXPRESSION
* CALL outnl
258:     ST  1,-304(1)	Store fp in ghost frame for outnl
* TOFF dec: -305
* TOFF dec: -306
* Param end outnl
259:    LDA  1,-304(1)	Ghost frame becomes new active frame 
260:    LDA  3,1(7)	Return address in ac 
261:    JMP  7,-228(7)	CALL outnl
262:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -304
* EXPRESSION
* CALL output
263:     ST  1,-304(1)	Store fp in ghost frame for output
* TOFF dec: -305
* TOFF dec: -306
* Param 1
264:    LDA  3,-3(1)	Load address of base of array x
265:     ST  3,-306(1)	Push left side 
* TOFF dec: -307
266:    LDA  3,-3(1)	Load address of base of array x
267:     ST  3,-307(1)	Push left side 
* TOFF dec: -308
268:    LDA  3,-3(1)	Load address of base of array x
269:     ST  3,-308(1)	Push left side 
* TOFF dec: -309
270:    LDA  3,-3(1)	Load address of base of array x
271:     ST  3,-309(1)	Push left side 
* TOFF dec: -310
272:    LDA  3,-3(1)	Load address of base of array x
273:     ST  3,-310(1)	Push left side 
* TOFF dec: -311
274:    LDA  3,-3(1)	Load address of base of array x
275:     ST  3,-311(1)	Push left side 
* TOFF dec: -312
276:    LDA  3,-3(1)	Load address of base of array x
277:     ST  3,-312(1)	Push left side 
* TOFF dec: -313
278:     LD  3,-303(1)	Load variable z
* TOFF inc: -312
279:     LD  4,-312(1)	Pop left into ac1 
280:    SUB  3,4,3	compute location from index 
281:     LD  3,0(3)	Load array element 
* TOFF inc: -311
282:     LD  4,-311(1)	Pop left into ac1 
283:    SUB  3,4,3	compute location from index 
284:     LD  3,0(3)	Load array element 
* TOFF inc: -310
285:     LD  4,-310(1)	Pop left into ac1 
286:    SUB  3,4,3	compute location from index 
287:     LD  3,0(3)	Load array element 
* TOFF inc: -309
288:     LD  4,-309(1)	Pop left into ac1 
289:    SUB  3,4,3	compute location from index 
290:     LD  3,0(3)	Load array element 
* TOFF inc: -308
291:     LD  4,-308(1)	Pop left into ac1 
292:    SUB  3,4,3	compute location from index 
293:     LD  3,0(3)	Load array element 
* TOFF inc: -307
294:     LD  4,-307(1)	Pop left into ac1 
295:    SUB  3,4,3	compute location from index 
296:     LD  3,0(3)	Load array element 
* TOFF inc: -306
297:     LD  4,-306(1)	Pop left into ac1 
298:    SUB  3,4,3	compute location from index 
299:     LD  3,0(3)	Load array element 
300:     ST  3,-306(1)	Push parameter 
* TOFF dec: -307
* Param end output
301:    LDA  1,-304(1)	Ghost frame becomes new active frame 
302:    LDA  3,1(7)	Return address in ac 
303:    JMP  7,-298(7)	CALL output
304:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -304
* EXPRESSION
* CALL outnl
305:     ST  1,-304(1)	Store fp in ghost frame for outnl
* TOFF dec: -305
* TOFF dec: -306
* Param end outnl
306:    LDA  1,-304(1)	Ghost frame becomes new active frame 
307:    LDA  3,1(7)	Return address in ac 
308:    JMP  7,-275(7)	CALL outnl
309:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -304
* EXPRESSION
* CALL output
310:     ST  1,-304(1)	Store fp in ghost frame for output
* TOFF dec: -305
* TOFF dec: -306
* Param 1
311:    LDA  3,-3(1)	Load address of base of array x
312:     ST  3,-306(1)	Push left side 
* TOFF dec: -307
313:    LDA  3,-3(1)	Load address of base of array x
314:     ST  3,-307(1)	Push left side 
* TOFF dec: -308
315:    LDA  3,-3(1)	Load address of base of array x
316:     ST  3,-308(1)	Push left side 
* TOFF dec: -309
317:    LDA  3,-3(1)	Load address of base of array x
318:     ST  3,-309(1)	Push left side 
* TOFF dec: -310
319:    LDA  3,-3(1)	Load address of base of array x
320:     ST  3,-310(1)	Push left side 
* TOFF dec: -311
321:    LDA  3,-3(1)	Load address of base of array x
322:     ST  3,-311(1)	Push left side 
* TOFF dec: -312
323:    LDA  3,-3(1)	Load address of base of array x
324:     ST  3,-312(1)	Push left side 
* TOFF dec: -313
325:    LDA  3,-3(1)	Load address of base of array x
326:     ST  3,-313(1)	Push left side 
* TOFF dec: -314
327:     LD  3,-303(1)	Load variable z
* TOFF inc: -313
328:     LD  4,-313(1)	Pop left into ac1 
329:    SUB  3,4,3	compute location from index 
330:     LD  3,0(3)	Load array element 
* TOFF inc: -312
331:     LD  4,-312(1)	Pop left into ac1 
332:    SUB  3,4,3	compute location from index 
333:     LD  3,0(3)	Load array element 
* TOFF inc: -311
334:     LD  4,-311(1)	Pop left into ac1 
335:    SUB  3,4,3	compute location from index 
336:     LD  3,0(3)	Load array element 
* TOFF inc: -310
337:     LD  4,-310(1)	Pop left into ac1 
338:    SUB  3,4,3	compute location from index 
339:     LD  3,0(3)	Load array element 
* TOFF inc: -309
340:     LD  4,-309(1)	Pop left into ac1 
341:    SUB  3,4,3	compute location from index 
342:     LD  3,0(3)	Load array element 
* TOFF inc: -308
343:     LD  4,-308(1)	Pop left into ac1 
344:    SUB  3,4,3	compute location from index 
345:     LD  3,0(3)	Load array element 
* TOFF inc: -307
346:     LD  4,-307(1)	Pop left into ac1 
347:    SUB  3,4,3	compute location from index 
348:     LD  3,0(3)	Load array element 
* TOFF inc: -306
349:     LD  4,-306(1)	Pop left into ac1 
350:    SUB  3,4,3	compute location from index 
351:     LD  3,0(3)	Load array element 
352:     ST  3,-306(1)	Push parameter 
* TOFF dec: -307
* Param end output
353:    LDA  1,-304(1)	Ghost frame becomes new active frame 
354:    LDA  3,1(7)	Return address in ac 
355:    JMP  7,-350(7)	CALL output
356:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -304
* EXPRESSION
* CALL outnl
357:     ST  1,-304(1)	Store fp in ghost frame for outnl
* TOFF dec: -305
* TOFF dec: -306
* Param end outnl
358:    LDA  1,-304(1)	Ghost frame becomes new active frame 
359:    LDA  3,1(7)	Return address in ac 
360:    JMP  7,-327(7)	CALL outnl
361:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -304
* EXPRESSION
* CALL output
362:     ST  1,-304(1)	Store fp in ghost frame for output
* TOFF dec: -305
* TOFF dec: -306
* Param 1
363:    LDA  3,-3(1)	Load address of base of array x
364:     ST  3,-306(1)	Push left side 
* TOFF dec: -307
365:    LDA  3,-3(1)	Load address of base of array x
366:     ST  3,-307(1)	Push left side 
* TOFF dec: -308
367:    LDA  3,-3(1)	Load address of base of array x
368:     ST  3,-308(1)	Push left side 
* TOFF dec: -309
369:    LDA  3,-3(1)	Load address of base of array x
370:     ST  3,-309(1)	Push left side 
* TOFF dec: -310
371:    LDA  3,-3(1)	Load address of base of array x
372:     ST  3,-310(1)	Push left side 
* TOFF dec: -311
373:    LDA  3,-3(1)	Load address of base of array x
374:     ST  3,-311(1)	Push left side 
* TOFF dec: -312
375:    LDA  3,-3(1)	Load address of base of array x
376:     ST  3,-312(1)	Push left side 
* TOFF dec: -313
377:    LDA  3,-3(1)	Load address of base of array x
378:     ST  3,-313(1)	Push left side 
* TOFF dec: -314
379:    LDA  3,-3(1)	Load address of base of array x
380:     ST  3,-314(1)	Push left side 
* TOFF dec: -315
381:     LD  3,-303(1)	Load variable z
* TOFF inc: -314
382:     LD  4,-314(1)	Pop left into ac1 
383:    SUB  3,4,3	compute location from index 
384:     LD  3,0(3)	Load array element 
* TOFF inc: -313
385:     LD  4,-313(1)	Pop left into ac1 
386:    SUB  3,4,3	compute location from index 
387:     LD  3,0(3)	Load array element 
* TOFF inc: -312
388:     LD  4,-312(1)	Pop left into ac1 
389:    SUB  3,4,3	compute location from index 
390:     LD  3,0(3)	Load array element 
* TOFF inc: -311
391:     LD  4,-311(1)	Pop left into ac1 
392:    SUB  3,4,3	compute location from index 
393:     LD  3,0(3)	Load array element 
* TOFF inc: -310
394:     LD  4,-310(1)	Pop left into ac1 
395:    SUB  3,4,3	compute location from index 
396:     LD  3,0(3)	Load array element 
* TOFF inc: -309
397:     LD  4,-309(1)	Pop left into ac1 
398:    SUB  3,4,3	compute location from index 
399:     LD  3,0(3)	Load array element 
* TOFF inc: -308
400:     LD  4,-308(1)	Pop left into ac1 
401:    SUB  3,4,3	compute location from index 
402:     LD  3,0(3)	Load array element 
* TOFF inc: -307
403:     LD  4,-307(1)	Pop left into ac1 
404:    SUB  3,4,3	compute location from index 
405:     LD  3,0(3)	Load array element 
* TOFF inc: -306
406:     LD  4,-306(1)	Pop left into ac1 
407:    SUB  3,4,3	compute location from index 
408:     LD  3,0(3)	Load array element 
409:     ST  3,-306(1)	Push parameter 
* TOFF dec: -307
* Param end output
410:    LDA  1,-304(1)	Ghost frame becomes new active frame 
411:    LDA  3,1(7)	Return address in ac 
412:    JMP  7,-407(7)	CALL output
413:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -304
* EXPRESSION
* CALL outnl
414:     ST  1,-304(1)	Store fp in ghost frame for outnl
* TOFF dec: -305
* TOFF dec: -306
* Param end outnl
415:    LDA  1,-304(1)	Ghost frame becomes new active frame 
416:    LDA  3,1(7)	Return address in ac 
417:    JMP  7,-384(7)	CALL outnl
418:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -304
* EXPRESSION
* CALL output
419:     ST  1,-304(1)	Store fp in ghost frame for output
* TOFF dec: -305
* TOFF dec: -306
* Param 1
420:    LDA  3,-3(1)	Load address of base of array x
421:     ST  3,-306(1)	Push left side 
* TOFF dec: -307
422:    LDA  3,-3(1)	Load address of base of array x
423:     ST  3,-307(1)	Push left side 
* TOFF dec: -308
424:    LDA  3,-3(1)	Load address of base of array x
425:     ST  3,-308(1)	Push left side 
* TOFF dec: -309
426:    LDA  3,-3(1)	Load address of base of array x
427:     ST  3,-309(1)	Push left side 
* TOFF dec: -310
428:    LDA  3,-3(1)	Load address of base of array x
429:     ST  3,-310(1)	Push left side 
* TOFF dec: -311
430:    LDA  3,-3(1)	Load address of base of array x
431:     ST  3,-311(1)	Push left side 
* TOFF dec: -312
432:    LDA  3,-3(1)	Load address of base of array x
433:     ST  3,-312(1)	Push left side 
* TOFF dec: -313
434:    LDA  3,-3(1)	Load address of base of array x
435:     ST  3,-313(1)	Push left side 
* TOFF dec: -314
436:    LDA  3,-3(1)	Load address of base of array x
437:     ST  3,-314(1)	Push left side 
* TOFF dec: -315
438:    LDA  3,-3(1)	Load address of base of array x
439:     ST  3,-315(1)	Push left side 
* TOFF dec: -316
440:     LD  3,-303(1)	Load variable z
* TOFF inc: -315
441:     LD  4,-315(1)	Pop left into ac1 
442:    SUB  3,4,3	compute location from index 
443:     LD  3,0(3)	Load array element 
* TOFF inc: -314
444:     LD  4,-314(1)	Pop left into ac1 
445:    SUB  3,4,3	compute location from index 
446:     LD  3,0(3)	Load array element 
* TOFF inc: -313
447:     LD  4,-313(1)	Pop left into ac1 
448:    SUB  3,4,3	compute location from index 
449:     LD  3,0(3)	Load array element 
* TOFF inc: -312
450:     LD  4,-312(1)	Pop left into ac1 
451:    SUB  3,4,3	compute location from index 
452:     LD  3,0(3)	Load array element 
* TOFF inc: -311
453:     LD  4,-311(1)	Pop left into ac1 
454:    SUB  3,4,3	compute location from index 
455:     LD  3,0(3)	Load array element 
* TOFF inc: -310
456:     LD  4,-310(1)	Pop left into ac1 
457:    SUB  3,4,3	compute location from index 
458:     LD  3,0(3)	Load array element 
* TOFF inc: -309
459:     LD  4,-309(1)	Pop left into ac1 
460:    SUB  3,4,3	compute location from index 
461:     LD  3,0(3)	Load array element 
* TOFF inc: -308
462:     LD  4,-308(1)	Pop left into ac1 
463:    SUB  3,4,3	compute location from index 
464:     LD  3,0(3)	Load array element 
* TOFF inc: -307
465:     LD  4,-307(1)	Pop left into ac1 
466:    SUB  3,4,3	compute location from index 
467:     LD  3,0(3)	Load array element 
* TOFF inc: -306
468:     LD  4,-306(1)	Pop left into ac1 
469:    SUB  3,4,3	compute location from index 
470:     LD  3,0(3)	Load array element 
471:     ST  3,-306(1)	Push parameter 
* TOFF dec: -307
* Param end output
472:    LDA  1,-304(1)	Ghost frame becomes new active frame 
473:    LDA  3,1(7)	Return address in ac 
474:    JMP  7,-469(7)	CALL output
475:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -304
* EXPRESSION
* CALL outnl
476:     ST  1,-304(1)	Store fp in ghost frame for outnl
* TOFF dec: -305
* TOFF dec: -306
* Param end outnl
477:    LDA  1,-304(1)	Ghost frame becomes new active frame 
478:    LDA  3,1(7)	Return address in ac 
479:    JMP  7,-446(7)	CALL outnl
480:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -304
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
481:    LDC  2,0(6)	Set return value to 0 
482:     LD  3,-1(1)	Load return address 
483:     LD  1,0(1)	Adjust fp 
484:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,484(7)	Jump to init [backpatch] 
* INIT
485:    LDA  1,0(0)	set first frame at end of globals 
486:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
487:    LDA  3,1(7)	Return address in ac 
488:    JMP  7,-450(7)	Jump to main 
489:   HALT  0,0,0	DONE! 
* END INIT
