* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  ops.c-
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
* TOFF set: -6
* Compound Body
* EXPRESSION
 40:    LDC  3,0(6)	Load integer constant 
 41:     ST  3,-6(1)	Push index 
* TOFF dec: -7
 42:    LDC  3,50(6)	Load integer constant 
* TOFF inc: -6
 43:     LD  4,-6(1)	Pop index 
 44:    LDA  5,-1(0)	Load address of base of array y
 45:    SUB  5,5,4	Compute offset of value 
 46:     ST  3,0(5)	Store variable y
* EXPRESSION
 47:    LDC  3,5(6)	Load integer constant 
 48:     ST  3,-6(1)	Push index 
* TOFF dec: -7
 49:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -6
 50:     LD  4,-6(1)	Pop index 
 51:    LDA  5,-1(0)	Load address of base of array y
 52:    SUB  5,5,4	Compute offset of value 
 53:     ST  3,0(5)	Store variable y
* EXPRESSION
 54:    LDC  3,8(6)	Load integer constant 
 55:     ST  3,-6(1)	Push index 
* TOFF dec: -7
 56:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -6
 57:     LD  4,-6(1)	Pop index 
 58:    LDA  5,-1(0)	Load address of base of array y
 59:    SUB  5,5,4	Compute offset of value 
 60:     ST  3,0(5)	Store variable y
* EXPRESSION
 61:    LDC  3,50(6)	Load integer constant 
 62:     ST  3,-2(1)	Store variable a
* EXPRESSION
 63:    LDC  3,1(6)	Load integer constant 
 64:     ST  3,-3(1)	Store variable b
* EXPRESSION
 65:    LDC  3,8(6)	Load integer constant 
 66:     ST  3,-4(1)	Store variable c
* EXPRESSION
 67:    LDC  3,0(6)	Load Boolean constant 
 68:     ST  3,-11(0)	Store variable x
* EXPRESSION
 69:    LDC  3,1(6)	Load Boolean constant 
 70:     ST  3,-5(1)	Store variable z
* EXPRESSION
* CALL outputb
 71:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
 72:     LD  3,-2(1)	Load variable a
 73:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
 74:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -8
 75:     LD  4,-8(1)	Pop left into ac1 
 76:    TLE  3,4,3	Op <= 
 77:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
 78:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 79:    LDA  3,1(7)	Return address in ac 
 80:    JMP  7,-64(7)	CALL outputb
 81:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
 82:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
 83:     LD  3,-3(1)	Load variable b
 84:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
 85:    LDC  3,50(6)	Load integer constant 
* TOFF inc: -8
 86:     LD  4,-8(1)	Pop left into ac1 
 87:    TLE  3,4,3	Op <= 
 88:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
 89:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 90:    LDA  3,1(7)	Return address in ac 
 91:    JMP  7,-75(7)	CALL outputb
 92:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
 93:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
 94:    LDC  3,50(6)	Load integer constant 
 95:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
 96:    LDC  3,50(6)	Load integer constant 
* TOFF inc: -8
 97:     LD  4,-8(1)	Pop left into ac1 
 98:    TLE  3,4,3	Op <= 
 99:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
100:    LDA  1,-6(1)	Ghost frame becomes new active frame 
101:    LDA  3,1(7)	Return address in ac 
102:    JMP  7,-86(7)	CALL outputb
103:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outnl
104:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
105:    LDA  1,-6(1)	Ghost frame becomes new active frame 
106:    LDA  3,1(7)	Return address in ac 
107:    JMP  7,-74(7)	CALL outnl
108:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
* CALL outputb
109:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
110:    LDC  3,50(6)	Load integer constant 
111:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
112:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -8
113:     LD  4,-8(1)	Pop left into ac1 
114:    TLT  3,4,3	Op < 
115:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
116:    LDA  1,-6(1)	Ghost frame becomes new active frame 
117:    LDA  3,1(7)	Return address in ac 
118:    JMP  7,-102(7)	CALL outputb
119:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
120:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
121:     LD  3,-3(1)	Load variable b
122:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
123:     LD  3,-2(1)	Load variable a
* TOFF inc: -8
124:     LD  4,-8(1)	Pop left into ac1 
125:    TLT  3,4,3	Op < 
126:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
127:    LDA  1,-6(1)	Ghost frame becomes new active frame 
128:    LDA  3,1(7)	Return address in ac 
129:    JMP  7,-113(7)	CALL outputb
130:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
131:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
132:     LD  3,-2(1)	Load variable a
133:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
134:     LD  3,-2(1)	Load variable a
* TOFF inc: -8
135:     LD  4,-8(1)	Pop left into ac1 
136:    TLT  3,4,3	Op < 
137:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
138:    LDA  1,-6(1)	Ghost frame becomes new active frame 
139:    LDA  3,1(7)	Return address in ac 
140:    JMP  7,-124(7)	CALL outputb
141:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outnl
142:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
143:    LDA  1,-6(1)	Ghost frame becomes new active frame 
144:    LDA  3,1(7)	Return address in ac 
145:    JMP  7,-112(7)	CALL outnl
146:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
* CALL outputb
147:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
148:    LDC  3,50(6)	Load integer constant 
149:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
150:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -8
151:     LD  4,-8(1)	Pop left into ac1 
152:    TGT  3,4,3	Op > 
153:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
154:    LDA  1,-6(1)	Ghost frame becomes new active frame 
155:    LDA  3,1(7)	Return address in ac 
156:    JMP  7,-140(7)	CALL outputb
157:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
158:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
159:    LDC  3,1(6)	Load integer constant 
160:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
161:    LDC  3,50(6)	Load integer constant 
* TOFF inc: -8
162:     LD  4,-8(1)	Pop left into ac1 
163:    TGT  3,4,3	Op > 
164:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
165:    LDA  1,-6(1)	Ghost frame becomes new active frame 
166:    LDA  3,1(7)	Return address in ac 
167:    JMP  7,-151(7)	CALL outputb
168:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
169:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
170:    LDC  3,50(6)	Load integer constant 
171:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
172:    LDC  3,50(6)	Load integer constant 
* TOFF inc: -8
173:     LD  4,-8(1)	Pop left into ac1 
174:    TGT  3,4,3	Op > 
175:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
176:    LDA  1,-6(1)	Ghost frame becomes new active frame 
177:    LDA  3,1(7)	Return address in ac 
178:    JMP  7,-162(7)	CALL outputb
179:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outnl
180:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
181:    LDA  1,-6(1)	Ghost frame becomes new active frame 
182:    LDA  3,1(7)	Return address in ac 
183:    JMP  7,-150(7)	CALL outnl
184:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
* CALL outputb
185:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
186:    LDC  3,50(6)	Load integer constant 
187:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
188:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -8
189:     LD  4,-8(1)	Pop left into ac1 
190:    TGE  3,4,3	Op >= 
191:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
192:    LDA  1,-6(1)	Ghost frame becomes new active frame 
193:    LDA  3,1(7)	Return address in ac 
194:    JMP  7,-178(7)	CALL outputb
195:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
196:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
197:    LDC  3,1(6)	Load integer constant 
198:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
199:    LDC  3,50(6)	Load integer constant 
* TOFF inc: -8
200:     LD  4,-8(1)	Pop left into ac1 
201:    TGE  3,4,3	Op >= 
202:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
203:    LDA  1,-6(1)	Ghost frame becomes new active frame 
204:    LDA  3,1(7)	Return address in ac 
205:    JMP  7,-189(7)	CALL outputb
206:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
207:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
208:    LDC  3,50(6)	Load integer constant 
209:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
210:    LDC  3,50(6)	Load integer constant 
* TOFF inc: -8
211:     LD  4,-8(1)	Pop left into ac1 
212:    TGE  3,4,3	Op >= 
213:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
214:    LDA  1,-6(1)	Ghost frame becomes new active frame 
215:    LDA  3,1(7)	Return address in ac 
216:    JMP  7,-200(7)	CALL outputb
217:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
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
* CALL outputb
223:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
224:    LDA  3,-1(0)	Load address of base of array y
225:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
226:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -8
227:     LD  4,-8(1)	Pop left into ac1 
228:    SUB  3,4,3	compute location from index 
229:     LD  3,0(3)	Load array element 
230:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
231:     LD  3,-3(1)	Load variable b
* TOFF inc: -8
232:     LD  4,-8(1)	Pop left into ac1 
233:    TEQ  3,4,3	Op = 
234:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
235:    LDA  1,-6(1)	Ghost frame becomes new active frame 
236:    LDA  3,1(7)	Return address in ac 
237:    JMP  7,-221(7)	CALL outputb
238:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
239:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
240:     LD  3,-2(1)	Load variable a
241:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
242:     LD  3,-3(1)	Load variable b
* TOFF inc: -8
243:     LD  4,-8(1)	Pop left into ac1 
244:    TEQ  3,4,3	Op = 
245:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
246:    LDA  1,-6(1)	Ghost frame becomes new active frame 
247:    LDA  3,1(7)	Return address in ac 
248:    JMP  7,-232(7)	CALL outputb
249:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
250:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
251:     LD  3,-3(1)	Load variable b
252:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
253:     LD  3,-3(1)	Load variable b
* TOFF inc: -8
254:     LD  4,-8(1)	Pop left into ac1 
255:    TEQ  3,4,3	Op = 
256:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
257:    LDA  1,-6(1)	Ghost frame becomes new active frame 
258:    LDA  3,1(7)	Return address in ac 
259:    JMP  7,-243(7)	CALL outputb
260:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outnl
261:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
262:    LDA  1,-6(1)	Ghost frame becomes new active frame 
263:    LDA  3,1(7)	Return address in ac 
264:    JMP  7,-231(7)	CALL outnl
265:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
* CALL outputb
266:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
267:    LDA  3,-1(0)	Load address of base of array y
268:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
269:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -8
270:     LD  4,-8(1)	Pop left into ac1 
271:    SUB  3,4,3	compute location from index 
272:     LD  3,0(3)	Load array element 
273:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
274:     LD  3,-2(1)	Load variable a
* TOFF inc: -8
275:     LD  4,-8(1)	Pop left into ac1 
276:    TNE  3,4,3	Op >< 
277:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
278:    LDA  1,-6(1)	Ghost frame becomes new active frame 
279:    LDA  3,1(7)	Return address in ac 
280:    JMP  7,-264(7)	CALL outputb
281:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
282:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
283:    LDA  3,-1(0)	Load address of base of array y
284:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
285:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -8
286:     LD  4,-8(1)	Pop left into ac1 
287:    SUB  3,4,3	compute location from index 
288:     LD  3,0(3)	Load array element 
289:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
290:     LD  3,-3(1)	Load variable b
* TOFF inc: -8
291:     LD  4,-8(1)	Pop left into ac1 
292:    TNE  3,4,3	Op >< 
293:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
294:    LDA  1,-6(1)	Ghost frame becomes new active frame 
295:    LDA  3,1(7)	Return address in ac 
296:    JMP  7,-280(7)	CALL outputb
297:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
298:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
299:     LD  3,-2(1)	Load variable a
300:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
301:     LD  3,-3(1)	Load variable b
* TOFF inc: -8
302:     LD  4,-8(1)	Pop left into ac1 
303:    TNE  3,4,3	Op >< 
304:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
305:    LDA  1,-6(1)	Ghost frame becomes new active frame 
306:    LDA  3,1(7)	Return address in ac 
307:    JMP  7,-291(7)	CALL outputb
308:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
309:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
310:     LD  3,-3(1)	Load variable b
311:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
312:     LD  3,-3(1)	Load variable b
* TOFF inc: -8
313:     LD  4,-8(1)	Pop left into ac1 
314:    TNE  3,4,3	Op >< 
315:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
316:    LDA  1,-6(1)	Ghost frame becomes new active frame 
317:    LDA  3,1(7)	Return address in ac 
318:    JMP  7,-302(7)	CALL outputb
319:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outnl
320:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
321:    LDA  1,-6(1)	Ghost frame becomes new active frame 
322:    LDA  3,1(7)	Return address in ac 
323:    JMP  7,-290(7)	CALL outnl
324:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
* CALL outputb
325:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
326:    LDC  3,1(6)	Load Boolean constant 
327:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
328:    LDC  3,1(6)	Load Boolean constant 
* TOFF inc: -8
329:     LD  4,-8(1)	Pop left into ac1 
330:    AND  3,4,3	Op AND 
331:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
332:    LDA  1,-6(1)	Ghost frame becomes new active frame 
333:    LDA  3,1(7)	Return address in ac 
334:    JMP  7,-318(7)	CALL outputb
335:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
336:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
337:    LDC  3,1(6)	Load Boolean constant 
338:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
339:    LDC  3,0(6)	Load Boolean constant 
* TOFF inc: -8
340:     LD  4,-8(1)	Pop left into ac1 
341:    AND  3,4,3	Op AND 
342:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
343:    LDA  1,-6(1)	Ghost frame becomes new active frame 
344:    LDA  3,1(7)	Return address in ac 
345:    JMP  7,-329(7)	CALL outputb
346:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
347:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
348:    LDC  3,0(6)	Load Boolean constant 
349:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
350:    LDC  3,1(6)	Load Boolean constant 
* TOFF inc: -8
351:     LD  4,-8(1)	Pop left into ac1 
352:    AND  3,4,3	Op AND 
353:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
354:    LDA  1,-6(1)	Ghost frame becomes new active frame 
355:    LDA  3,1(7)	Return address in ac 
356:    JMP  7,-340(7)	CALL outputb
357:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
358:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
359:    LDC  3,0(6)	Load Boolean constant 
360:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
361:    LDC  3,0(6)	Load Boolean constant 
* TOFF inc: -8
362:     LD  4,-8(1)	Pop left into ac1 
363:    AND  3,4,3	Op AND 
364:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
365:    LDA  1,-6(1)	Ghost frame becomes new active frame 
366:    LDA  3,1(7)	Return address in ac 
367:    JMP  7,-351(7)	CALL outputb
368:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outnl
369:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
370:    LDA  1,-6(1)	Ghost frame becomes new active frame 
371:    LDA  3,1(7)	Return address in ac 
372:    JMP  7,-339(7)	CALL outnl
373:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
* CALL outputb
374:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
375:    LDC  3,1(6)	Load Boolean constant 
376:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
377:    LDC  3,1(6)	Load Boolean constant 
* TOFF inc: -8
378:     LD  4,-8(1)	Pop left into ac1 
379:     OR  3,4,3	Op OR 
380:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
381:    LDA  1,-6(1)	Ghost frame becomes new active frame 
382:    LDA  3,1(7)	Return address in ac 
383:    JMP  7,-367(7)	CALL outputb
384:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
385:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
386:     LD  3,-5(1)	Load variable z
387:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
388:    LDC  3,0(6)	Load Boolean constant 
* TOFF inc: -8
389:     LD  4,-8(1)	Pop left into ac1 
390:     OR  3,4,3	Op OR 
391:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
392:    LDA  1,-6(1)	Ghost frame becomes new active frame 
393:    LDA  3,1(7)	Return address in ac 
394:    JMP  7,-378(7)	CALL outputb
395:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
396:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
397:    LDC  3,0(6)	Load Boolean constant 
398:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
399:    LDC  3,1(6)	Load Boolean constant 
* TOFF inc: -8
400:     LD  4,-8(1)	Pop left into ac1 
401:     OR  3,4,3	Op OR 
402:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
403:    LDA  1,-6(1)	Ghost frame becomes new active frame 
404:    LDA  3,1(7)	Return address in ac 
405:    JMP  7,-389(7)	CALL outputb
406:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
407:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
408:    LDC  3,0(6)	Load Boolean constant 
409:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
410:    LDC  3,0(6)	Load Boolean constant 
* TOFF inc: -8
411:     LD  4,-8(1)	Pop left into ac1 
412:     OR  3,4,3	Op OR 
413:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
414:    LDA  1,-6(1)	Ghost frame becomes new active frame 
415:    LDA  3,1(7)	Return address in ac 
416:    JMP  7,-400(7)	CALL outputb
417:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outnl
418:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
419:    LDA  1,-6(1)	Ghost frame becomes new active frame 
420:    LDA  3,1(7)	Return address in ac 
421:    JMP  7,-388(7)	CALL outnl
422:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
* CALL outputb
423:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
424:    LDC  3,1(6)	Load Boolean constant 
425:    LDC  4,1(6)	Load 1 
426:    XOR  3,3,4	Op XOR to get logical not 
427:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
428:    LDA  1,-6(1)	Ghost frame becomes new active frame 
429:    LDA  3,1(7)	Return address in ac 
430:    JMP  7,-414(7)	CALL outputb
431:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
432:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
433:     LD  3,-11(0)	Load variable x
434:    LDC  4,1(6)	Load 1 
435:    XOR  3,3,4	Op XOR to get logical not 
436:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
437:    LDA  1,-6(1)	Ghost frame becomes new active frame 
438:    LDA  3,1(7)	Return address in ac 
439:    JMP  7,-423(7)	CALL outputb
440:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outnl
441:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
442:    LDA  1,-6(1)	Ghost frame becomes new active frame 
443:    LDA  3,1(7)	Return address in ac 
444:    JMP  7,-411(7)	CALL outnl
445:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
* CALL output
446:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
447:    LDC  3,5(6)	Load integer constant 
448:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
449:    LDC  3,50(6)	Load integer constant 
* TOFF inc: -8
450:     LD  4,-8(1)	Pop left into ac1 
451:    ADD  3,4,3	Op + 
452:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
453:    LDA  1,-6(1)	Ghost frame becomes new active frame 
454:    LDA  3,1(7)	Return address in ac 
455:    JMP  7,-450(7)	CALL output
456:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
457:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
458:    LDA  3,-1(0)	Load address of base of array y
459:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
460:     LD  3,-4(1)	Load variable c
* TOFF inc: -8
461:     LD  4,-8(1)	Pop left into ac1 
462:    SUB  3,4,3	compute location from index 
463:     LD  3,0(3)	Load array element 
464:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
465:    LDC  3,50(6)	Load integer constant 
* TOFF inc: -8
466:     LD  4,-8(1)	Pop left into ac1 
467:    ADD  3,4,3	Op + 
468:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
469:    LDA  1,-6(1)	Ghost frame becomes new active frame 
470:    LDA  3,1(7)	Return address in ac 
471:    JMP  7,-466(7)	CALL output
472:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL outnl
473:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
474:    LDA  1,-6(1)	Ghost frame becomes new active frame 
475:    LDA  3,1(7)	Return address in ac 
476:    JMP  7,-443(7)	CALL outnl
477:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
* CALL output
478:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
479:    LDC  3,5(6)	Load integer constant 
480:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
481:    LDC  3,50(6)	Load integer constant 
* TOFF inc: -8
482:     LD  4,-8(1)	Pop left into ac1 
483:    SUB  3,4,3	Op - 
484:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
485:    LDA  1,-6(1)	Ghost frame becomes new active frame 
486:    LDA  3,1(7)	Return address in ac 
487:    JMP  7,-482(7)	CALL output
488:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
489:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
490:    LDC  3,30(6)	Load integer constant 
491:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
492:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -8
493:     LD  4,-8(1)	Pop left into ac1 
494:    SUB  3,4,3	Op - 
495:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
496:    LDC  3,50(6)	Load integer constant 
* TOFF inc: -8
497:     LD  4,-8(1)	Pop left into ac1 
498:    SUB  3,4,3	Op - 
499:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
500:    LDA  1,-6(1)	Ghost frame becomes new active frame 
501:    LDA  3,1(7)	Return address in ac 
502:    JMP  7,-497(7)	CALL output
503:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL outnl
504:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
505:    LDA  1,-6(1)	Ghost frame becomes new active frame 
506:    LDA  3,1(7)	Return address in ac 
507:    JMP  7,-474(7)	CALL outnl
508:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
* CALL output
509:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
510:     LD  3,-2(1)	Load variable a
511:    NEG  3,3,3	Op unary - 
512:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
513:    LDA  1,-6(1)	Ghost frame becomes new active frame 
514:    LDA  3,1(7)	Return address in ac 
515:    JMP  7,-510(7)	CALL output
516:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
517:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
518:    LDC  3,0(6)	Load integer constant 
519:    NEG  3,3,3	Op unary - 
520:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
521:    LDA  1,-6(1)	Ghost frame becomes new active frame 
522:    LDA  3,1(7)	Return address in ac 
523:    JMP  7,-518(7)	CALL output
524:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
525:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
526:    LDC  3,1(6)	Load integer constant 
527:    NEG  3,3,3	Op unary - 
528:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
529:    LDA  1,-6(1)	Ghost frame becomes new active frame 
530:    LDA  3,1(7)	Return address in ac 
531:    JMP  7,-526(7)	CALL output
532:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL outnl
533:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
534:    LDA  1,-6(1)	Ghost frame becomes new active frame 
535:    LDA  3,1(7)	Return address in ac 
536:    JMP  7,-503(7)	CALL outnl
537:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
* CALL output
538:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
539:    LDC  3,2(6)	Load integer constant 
540:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
541:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -8
542:     LD  4,-8(1)	Pop left into ac1 
543:    MUL  3,4,3	Op * 
544:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
545:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -8
546:     LD  4,-8(1)	Pop left into ac1 
547:    MUL  3,4,3	Op * 
548:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
549:    LDC  3,7(6)	Load integer constant 
* TOFF inc: -8
550:     LD  4,-8(1)	Pop left into ac1 
551:    MUL  3,4,3	Op * 
552:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
553:    LDC  3,11(6)	Load integer constant 
* TOFF inc: -8
554:     LD  4,-8(1)	Pop left into ac1 
555:    MUL  3,4,3	Op * 
556:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
557:    LDA  1,-6(1)	Ghost frame becomes new active frame 
558:    LDA  3,1(7)	Return address in ac 
559:    JMP  7,-554(7)	CALL output
560:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
561:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
562:    LDC  3,50(6)	Load integer constant 
563:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
564:    LDA  3,-1(0)	Load address of base of array y
565:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
566:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -9
567:     LD  4,-9(1)	Pop left into ac1 
568:    SUB  3,4,3	compute location from index 
569:     LD  3,0(3)	Load array element 
* TOFF inc: -8
570:     LD  4,-8(1)	Pop left into ac1 
571:    MUL  3,4,3	Op * 
572:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
573:    LDA  1,-6(1)	Ghost frame becomes new active frame 
574:    LDA  3,1(7)	Return address in ac 
575:    JMP  7,-570(7)	CALL output
576:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
577:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
578:    LDA  3,-1(0)	Load address of base of array y
579:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
580:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -8
581:     LD  4,-8(1)	Pop left into ac1 
582:    SUB  3,4,3	compute location from index 
583:     LD  3,0(3)	Load array element 
584:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
585:    LDC  3,50(6)	Load integer constant 
* TOFF inc: -8
586:     LD  4,-8(1)	Pop left into ac1 
587:    MUL  3,4,3	Op * 
588:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
589:    LDA  1,-6(1)	Ghost frame becomes new active frame 
590:    LDA  3,1(7)	Return address in ac 
591:    JMP  7,-586(7)	CALL output
592:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL outnl
593:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
594:    LDA  1,-6(1)	Ghost frame becomes new active frame 
595:    LDA  3,1(7)	Return address in ac 
596:    JMP  7,-563(7)	CALL outnl
597:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
* CALL output
598:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
599:    LDC  3,50(6)	Load integer constant 
600:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
601:    LDA  3,-1(0)	Load address of base of array y
602:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
603:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -9
604:     LD  4,-9(1)	Pop left into ac1 
605:    SUB  3,4,3	compute location from index 
606:     LD  3,0(3)	Load array element 
* TOFF inc: -8
607:     LD  4,-8(1)	Pop left into ac1 
608:    DIV  3,4,3	Op / 
609:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
610:    LDA  1,-6(1)	Ghost frame becomes new active frame 
611:    LDA  3,1(7)	Return address in ac 
612:    JMP  7,-607(7)	CALL output
613:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
614:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
615:    LDA  3,-1(0)	Load address of base of array y
616:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
617:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -8
618:     LD  4,-8(1)	Pop left into ac1 
619:    SUB  3,4,3	compute location from index 
620:     LD  3,0(3)	Load array element 
621:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
622:    LDC  3,50(6)	Load integer constant 
* TOFF inc: -8
623:     LD  4,-8(1)	Pop left into ac1 
624:    DIV  3,4,3	Op / 
625:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
626:    LDA  1,-6(1)	Ghost frame becomes new active frame 
627:    LDA  3,1(7)	Return address in ac 
628:    JMP  7,-623(7)	CALL output
629:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
630:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
631:    LDA  3,-1(0)	Load address of base of array y
632:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
633:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -8
634:     LD  4,-8(1)	Pop left into ac1 
635:    SUB  3,4,3	compute location from index 
636:     LD  3,0(3)	Load array element 
637:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
638:     LD  3,-3(1)	Load variable b
* TOFF inc: -8
639:     LD  4,-8(1)	Pop left into ac1 
640:    DIV  3,4,3	Op / 
641:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
642:    LDA  1,-6(1)	Ghost frame becomes new active frame 
643:    LDA  3,1(7)	Return address in ac 
644:    JMP  7,-639(7)	CALL output
645:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
646:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
647:    LDC  3,210(6)	Load integer constant 
648:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
649:    LDC  3,7(6)	Load integer constant 
* TOFF inc: -8
650:     LD  4,-8(1)	Pop left into ac1 
651:    DIV  3,4,3	Op / 
652:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
653:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -8
654:     LD  4,-8(1)	Pop left into ac1 
655:    DIV  3,4,3	Op / 
656:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
657:    LDA  1,-6(1)	Ghost frame becomes new active frame 
658:    LDA  3,1(7)	Return address in ac 
659:    JMP  7,-654(7)	CALL output
660:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL outnl
661:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
662:    LDA  1,-6(1)	Ghost frame becomes new active frame 
663:    LDA  3,1(7)	Return address in ac 
664:    JMP  7,-631(7)	CALL outnl
665:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
* CALL output
666:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
667:    LDC  3,211(6)	Load integer constant 
668:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
669:    LDC  3,7(6)	Load integer constant 
* TOFF inc: -8
670:     LD  4,-8(1)	Pop left into ac1 
671:    MOD  3,4,3	Op % 
672:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
673:    LDA  1,-6(1)	Ghost frame becomes new active frame 
674:    LDA  3,1(7)	Return address in ac 
675:    JMP  7,-670(7)	CALL output
676:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
677:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
678:    LDC  3,211(6)	Load integer constant 
679:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
680:    LDC  3,6(6)	Load integer constant 
* TOFF inc: -8
681:     LD  4,-8(1)	Pop left into ac1 
682:    MOD  3,4,3	Op % 
683:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
684:    LDA  1,-6(1)	Ghost frame becomes new active frame 
685:    LDA  3,1(7)	Return address in ac 
686:    JMP  7,-681(7)	CALL output
687:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
688:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
689:    LDC  3,211(6)	Load integer constant 
690:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
691:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -8
692:     LD  4,-8(1)	Pop left into ac1 
693:    MOD  3,4,3	Op % 
694:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
695:    LDA  1,-6(1)	Ghost frame becomes new active frame 
696:    LDA  3,1(7)	Return address in ac 
697:    JMP  7,-692(7)	CALL output
698:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
699:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
700:    LDC  3,211(6)	Load integer constant 
701:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
702:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -8
703:     LD  4,-8(1)	Pop left into ac1 
704:    MOD  3,4,3	Op % 
705:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
706:    LDA  1,-6(1)	Ghost frame becomes new active frame 
707:    LDA  3,1(7)	Return address in ac 
708:    JMP  7,-703(7)	CALL output
709:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
710:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
711:    LDC  3,211(6)	Load integer constant 
712:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
713:    LDC  3,100(6)	Load integer constant 
* TOFF inc: -8
714:     LD  4,-8(1)	Pop left into ac1 
715:    MOD  3,4,3	Op % 
716:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
717:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -8
718:     LD  4,-8(1)	Pop left into ac1 
719:    MOD  3,4,3	Op % 
720:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
721:    LDA  1,-6(1)	Ghost frame becomes new active frame 
722:    LDA  3,1(7)	Return address in ac 
723:    JMP  7,-718(7)	CALL output
724:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL outnl
725:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
726:    LDA  1,-6(1)	Ghost frame becomes new active frame 
727:    LDA  3,1(7)	Return address in ac 
728:    JMP  7,-695(7)	CALL outnl
729:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
* CALL output
730:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
731:    LDC  3,43(6)	Load integer constant 
732:     ST  3,-4(1)	Store variable c
733:     ST  3,-3(1)	Store variable b
734:     ST  3,-2(1)	Store variable a
735:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
736:    LDA  1,-6(1)	Ghost frame becomes new active frame 
737:    LDA  3,1(7)	Return address in ac 
738:    JMP  7,-733(7)	CALL output
739:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
740:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
741:     LD  3,-2(1)	Load variable a
742:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
743:    LDA  1,-6(1)	Ghost frame becomes new active frame 
744:    LDA  3,1(7)	Return address in ac 
745:    JMP  7,-740(7)	CALL output
746:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
747:    LDC  3,3(6)	Load integer constant 
748:     ST  3,-3(1)	Store variable b
749:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
750:    LDC  3,4(6)	Load integer constant 
751:     ST  3,-4(1)	Store variable c
* TOFF inc: -6
752:     LD  4,-6(1)	Pop left into ac1 
753:    MUL  3,4,3	Op * 
754:     ST  3,-2(1)	Store variable a
* EXPRESSION
* CALL output
755:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
756:     LD  3,-2(1)	Load variable a
757:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
758:    LDA  1,-6(1)	Ghost frame becomes new active frame 
759:    LDA  3,1(7)	Return address in ac 
760:    JMP  7,-755(7)	CALL output
761:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL outnl
762:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
763:    LDA  1,-6(1)	Ghost frame becomes new active frame 
764:    LDA  3,1(7)	Return address in ac 
765:    JMP  7,-732(7)	CALL outnl
766:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
767:    LDC  3,44(6)	Load integer constant 
768:     ST  3,-2(1)	Store variable a
* EXPRESSION
769:    LDC  3,2(6)	Load integer constant 
770:     ST  3,-3(1)	Store variable b
* EXPRESSION
* CALL output
771:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
772:     LD  3,-3(1)	Load variable b
773:     LD  4,-2(1)	load lhs variable a
774:    ADD  3,4,3	op += 
775:     ST  3,-2(1)	Store variable a
776:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
777:    LDA  1,-6(1)	Ghost frame becomes new active frame 
778:    LDA  3,1(7)	Return address in ac 
779:    JMP  7,-774(7)	CALL output
780:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
781:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
782:     LD  3,-3(1)	Load variable b
783:     LD  4,-2(1)	load lhs variable a
784:    SUB  3,4,3	op -= 
785:     ST  3,-2(1)	Store variable a
786:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
787:    LDA  1,-6(1)	Ghost frame becomes new active frame 
788:    LDA  3,1(7)	Return address in ac 
789:    JMP  7,-784(7)	CALL output
790:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
791:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
792:     LD  3,-2(1)	Load variable a
793:     LD  4,-2(1)	load lhs variable a
794:    SUB  3,4,3	op -= 
795:     ST  3,-2(1)	Store variable a
796:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
797:    LDA  1,-6(1)	Ghost frame becomes new active frame 
798:    LDA  3,1(7)	Return address in ac 
799:    JMP  7,-794(7)	CALL output
800:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
801:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
802:    LDC  3,10(6)	Load integer constant 
803:     LD  4,-3(1)	load lhs variable b
804:    ADD  3,4,3	op += 
805:     ST  3,-3(1)	Store variable b
806:     LD  4,-2(1)	load lhs variable a
807:    ADD  3,4,3	op += 
808:     ST  3,-2(1)	Store variable a
809:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
810:    LDA  1,-6(1)	Ghost frame becomes new active frame 
811:    LDA  3,1(7)	Return address in ac 
812:    JMP  7,-807(7)	CALL output
813:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL outnl
814:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
815:    LDA  1,-6(1)	Ghost frame becomes new active frame 
816:    LDA  3,1(7)	Return address in ac 
817:    JMP  7,-784(7)	CALL outnl
818:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
* CALL output
819:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
820:    LDC  3,3(6)	Load integer constant 
821:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
822:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -8
823:     LD  4,-8(1)	Pop left into ac1 
824:    SUB  3,4,3	Op - 
825:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
826:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -8
827:     LD  4,-8(1)	Pop left into ac1 
828:    SUB  3,4,3	Op - 
829:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
830:    LDA  1,-6(1)	Ghost frame becomes new active frame 
831:    LDA  3,1(7)	Return address in ac 
832:    JMP  7,-827(7)	CALL output
833:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
834:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
835:    LDC  3,211(6)	Load integer constant 
836:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
837:    LDC  3,17(6)	Load integer constant 
* TOFF inc: -8
838:     LD  4,-8(1)	Pop left into ac1 
839:    DIV  3,4,3	Op / 
840:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
841:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -8
842:     LD  4,-8(1)	Pop left into ac1 
843:    DIV  3,4,3	Op / 
844:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
845:    LDA  1,-6(1)	Ghost frame becomes new active frame 
846:    LDA  3,1(7)	Return address in ac 
847:    JMP  7,-842(7)	CALL output
848:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
849:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
850:    LDC  3,211(6)	Load integer constant 
851:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
852:    LDC  3,17(6)	Load integer constant 
853:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
854:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -9
855:     LD  4,-9(1)	Pop left into ac1 
856:    DIV  3,4,3	Op / 
* TOFF inc: -8
857:     LD  4,-8(1)	Pop left into ac1 
858:    DIV  3,4,3	Op / 
859:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
860:    LDA  1,-6(1)	Ghost frame becomes new active frame 
861:    LDA  3,1(7)	Return address in ac 
862:    JMP  7,-857(7)	CALL output
863:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL outputb
864:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
865:    LDC  3,1(6)	Load Boolean constant 
866:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
867:    LDC  3,0(6)	Load Boolean constant 
* TOFF inc: -8
868:     LD  4,-8(1)	Pop left into ac1 
869:     OR  3,4,3	Op OR 
870:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
871:    LDC  3,0(6)	Load Boolean constant 
* TOFF inc: -8
872:     LD  4,-8(1)	Pop left into ac1 
873:    AND  3,4,3	Op AND 
874:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
875:    LDA  1,-6(1)	Ghost frame becomes new active frame 
876:    LDA  3,1(7)	Return address in ac 
877:    JMP  7,-861(7)	CALL outputb
878:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
879:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
880:    LDC  3,1(6)	Load Boolean constant 
881:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
882:    LDC  3,0(6)	Load Boolean constant 
883:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
884:    LDC  3,0(6)	Load Boolean constant 
* TOFF inc: -9
885:     LD  4,-9(1)	Pop left into ac1 
886:    AND  3,4,3	Op AND 
* TOFF inc: -8
887:     LD  4,-8(1)	Pop left into ac1 
888:     OR  3,4,3	Op OR 
889:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
890:    LDA  1,-6(1)	Ghost frame becomes new active frame 
891:    LDA  3,1(7)	Return address in ac 
892:    JMP  7,-876(7)	CALL outputb
893:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
894:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
895:    LDC  3,1(6)	Load Boolean constant 
896:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
897:    LDC  3,0(6)	Load Boolean constant 
898:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
899:    LDC  3,0(6)	Load Boolean constant 
* TOFF inc: -9
900:     LD  4,-9(1)	Pop left into ac1 
901:    AND  3,4,3	Op AND 
* TOFF inc: -8
902:     LD  4,-8(1)	Pop left into ac1 
903:     OR  3,4,3	Op OR 
904:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
905:    LDA  1,-6(1)	Ghost frame becomes new active frame 
906:    LDA  3,1(7)	Return address in ac 
907:    JMP  7,-891(7)	CALL outputb
908:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outnl
909:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
910:    LDA  1,-6(1)	Ghost frame becomes new active frame 
911:    LDA  3,1(7)	Return address in ac 
912:    JMP  7,-879(7)	CALL outnl
913:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
914:    LDC  2,0(6)	Set return value to 0 
915:     LD  3,-1(1)	Load return address 
916:     LD  1,0(1)	Adjust fp 
917:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,917(7)	Jump to init [backpatch] 
* INIT
918:    LDA  1,-12(0)	set first frame at end of globals 
919:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
920:    LDC  3,10(6)	load size of array y
921:     ST  3,0(0)	save size of array y
* END INIT GLOBALS AND STATICS
922:    LDA  3,1(7)	Return address in ac 
923:    JMP  7,-885(7)	Jump to main 
924:   HALT  0,0,0	DONE! 
* END INIT
