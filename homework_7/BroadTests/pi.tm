* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  pi.c-
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
* TOFF set: -352
 40:    LDC  3,340(6)	load size of array a
 41:     ST  3,-11(1)	save size of array a
* Compound Body
* EXPRESSION
 42:    LDC  3,100(6)	Load integer constant 
 43:     ST  3,-2(1)	Store variable N
* EXPRESSION
 44:     LD  3,-2(1)	Load variable N
 45:     ST  3,-352(1)	Push left side 
* TOFF dec: -353
 46:    LDC  3,10(6)	Load integer constant 
* TOFF inc: -352
 47:     LD  4,-352(1)	Pop left into ac1 
 48:    MUL  3,4,3	Op * 
 49:     ST  3,-352(1)	Push left side 
* TOFF dec: -353
 50:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -352
 51:     LD  4,-352(1)	Pop left into ac1 
 52:    DIV  3,4,3	Op / 
 53:     ST  3,-3(1)	Store variable LEN
* EXPRESSION
 54:    LDC  3,0(6)	Load integer constant 
 55:     ST  3,-5(1)	Store variable j
* WHILE
 56:     LD  3,-5(1)	Load variable j
 57:     ST  3,-352(1)	Push left side 
* TOFF dec: -353
 58:     LD  3,-3(1)	Load variable LEN
* TOFF inc: -352
 59:     LD  4,-352(1)	Pop left into ac1 
 60:    TLT  3,4,3	Op < 
 61:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -352
* Compound Body
* EXPRESSION
 63:     LD  3,-5(1)	Load variable j
 64:     ST  3,-352(1)	Push index 
* TOFF dec: -353
 65:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -352
 66:     LD  4,-352(1)	Pop index 
 67:    LDA  5,-12(1)	Load address of base of array a
 68:    SUB  5,5,4	Compute offset of value 
 69:     ST  3,0(5)	Store variable a
* EXPRESSION
 70:     LD  3,-5(1)	load lhs variable j
 71:    LDA  3,1(3)	increment value of j
 72:     ST  3,-5(1)	Store variable j
* TOFF set: -352
* END COMPOUND
 73:    JMP  7,-18(7)	go to beginning of loop 
 62:    JMP  7,11(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
 74:    LDC  3,0(6)	Load integer constant 
 75:     ST  3,-9(1)	Store variable nines
* EXPRESSION
 76:    LDC  3,0(6)	Load integer constant 
 77:     ST  3,-10(1)	Store variable predigit
* EXPRESSION
 78:    LDC  3,0(6)	Load integer constant 
 79:     ST  3,-5(1)	Store variable j
* WHILE
 80:     LD  3,-5(1)	Load variable j
 81:     ST  3,-352(1)	Push left side 
* TOFF dec: -353
 82:     LD  3,-2(1)	Load variable N
* TOFF inc: -352
 83:     LD  4,-352(1)	Pop left into ac1 
 84:    TLT  3,4,3	Op < 
 85:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -352
* Compound Body
* EXPRESSION
 87:    LDC  3,0(6)	Load integer constant 
 88:     ST  3,-7(1)	Store variable q
* EXPRESSION
 89:     LD  3,-3(1)	Load variable LEN
 90:     ST  3,-4(1)	Store variable i
* WHILE
 91:     LD  3,-4(1)	Load variable i
 92:     ST  3,-352(1)	Push left side 
* TOFF dec: -353
 93:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -352
 94:     LD  4,-352(1)	Pop left into ac1 
 95:    TGT  3,4,3	Op > 
 96:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -352
* Compound Body
* EXPRESSION
 98:    LDC  3,10(6)	Load integer constant 
 99:     ST  3,-352(1)	Push left side 
* TOFF dec: -353
100:    LDA  3,-12(1)	Load address of base of array a
101:     ST  3,-353(1)	Push left side 
* TOFF dec: -354
102:     LD  3,-4(1)	Load variable i
103:     ST  3,-354(1)	Push left side 
* TOFF dec: -355
104:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -354
105:     LD  4,-354(1)	Pop left into ac1 
106:    SUB  3,4,3	Op - 
* TOFF inc: -353
107:     LD  4,-353(1)	Pop left into ac1 
108:    SUB  3,4,3	compute location from index 
109:     LD  3,0(3)	Load array element 
* TOFF inc: -352
110:     LD  4,-352(1)	Pop left into ac1 
111:    MUL  3,4,3	Op * 
112:     ST  3,-352(1)	Push left side 
* TOFF dec: -353
113:     LD  3,-7(1)	Load variable q
114:     ST  3,-353(1)	Push left side 
* TOFF dec: -354
115:     LD  3,-4(1)	Load variable i
* TOFF inc: -353
116:     LD  4,-353(1)	Pop left into ac1 
117:    MUL  3,4,3	Op * 
* TOFF inc: -352
118:     LD  4,-352(1)	Pop left into ac1 
119:    ADD  3,4,3	Op + 
120:     ST  3,-8(1)	Store variable x
* EXPRESSION
121:     LD  3,-4(1)	Load variable i
122:     ST  3,-352(1)	Push left side 
* TOFF dec: -353
123:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -352
124:     LD  4,-352(1)	Pop left into ac1 
125:    SUB  3,4,3	Op - 
126:     ST  3,-352(1)	Push index 
* TOFF dec: -353
127:     LD  3,-8(1)	Load variable x
128:     ST  3,-353(1)	Push left side 
* TOFF dec: -354
129:    LDC  3,2(6)	Load integer constant 
130:     ST  3,-354(1)	Push left side 
* TOFF dec: -355
131:     LD  3,-4(1)	Load variable i
* TOFF inc: -354
132:     LD  4,-354(1)	Pop left into ac1 
133:    MUL  3,4,3	Op * 
134:     ST  3,-354(1)	Push left side 
* TOFF dec: -355
135:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -354
136:     LD  4,-354(1)	Pop left into ac1 
137:    SUB  3,4,3	Op - 
* TOFF inc: -353
138:     LD  4,-353(1)	Pop left into ac1 
139:    MOD  3,4,3	Op % 
* TOFF inc: -352
140:     LD  4,-352(1)	Pop index 
141:    LDA  5,-12(1)	Load address of base of array a
142:    SUB  5,5,4	Compute offset of value 
143:     ST  3,0(5)	Store variable a
* EXPRESSION
144:     LD  3,-8(1)	Load variable x
145:     ST  3,-352(1)	Push left side 
* TOFF dec: -353
146:    LDC  3,2(6)	Load integer constant 
147:     ST  3,-353(1)	Push left side 
* TOFF dec: -354
148:     LD  3,-4(1)	Load variable i
* TOFF inc: -353
149:     LD  4,-353(1)	Pop left into ac1 
150:    MUL  3,4,3	Op * 
151:     ST  3,-353(1)	Push left side 
* TOFF dec: -354
152:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -353
153:     LD  4,-353(1)	Pop left into ac1 
154:    SUB  3,4,3	Op - 
* TOFF inc: -352
155:     LD  4,-352(1)	Pop left into ac1 
156:    DIV  3,4,3	Op / 
157:     ST  3,-7(1)	Store variable q
* EXPRESSION
158:    LDC  3,1(6)	Load integer constant 
159:     LD  4,-4(1)	load lhs variable i
160:    SUB  3,4,3	op -= 
161:     ST  3,-4(1)	Store variable i
* TOFF set: -352
* END COMPOUND
162:    JMP  7,-72(7)	go to beginning of loop 
 97:    JMP  7,65(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
163:    LDC  3,0(6)	Load integer constant 
164:     ST  3,-352(1)	Push index 
* TOFF dec: -353
165:     LD  3,-7(1)	Load variable q
166:     ST  3,-353(1)	Push left side 
* TOFF dec: -354
167:    LDC  3,10(6)	Load integer constant 
* TOFF inc: -353
168:     LD  4,-353(1)	Pop left into ac1 
169:    MOD  3,4,3	Op % 
* TOFF inc: -352
170:     LD  4,-352(1)	Pop index 
171:    LDA  5,-12(1)	Load address of base of array a
172:    SUB  5,5,4	Compute offset of value 
173:     ST  3,0(5)	Store variable a
* EXPRESSION
174:     LD  3,-7(1)	Load variable q
175:     ST  3,-352(1)	Push left side 
* TOFF dec: -353
176:    LDC  3,10(6)	Load integer constant 
* TOFF inc: -352
177:     LD  4,-352(1)	Pop left into ac1 
178:    DIV  3,4,3	Op / 
179:     ST  3,-7(1)	Store variable q
* IF
180:     LD  3,-7(1)	Load variable q
181:     ST  3,-352(1)	Push left side 
* TOFF dec: -353
182:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -352
183:     LD  4,-352(1)	Pop left into ac1 
184:    TEQ  3,4,3	Op = 
* THEN
* COMPOUND
* TOFF set: -352
* Compound Body
* EXPRESSION
186:     LD  3,-9(1)	load lhs variable nines
187:    LDA  3,1(3)	increment value of nines
188:     ST  3,-9(1)	Store variable nines
* TOFF set: -352
* END COMPOUND
185:    JZR  3,4(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* TOFF set: -352
* Compound Body
* IF
190:     LD  3,-7(1)	Load variable q
191:     ST  3,-352(1)	Push left side 
* TOFF dec: -353
192:    LDC  3,10(6)	Load integer constant 
* TOFF inc: -352
193:     LD  4,-352(1)	Pop left into ac1 
194:    TEQ  3,4,3	Op = 
* THEN
* COMPOUND
* TOFF set: -352
* Compound Body
* EXPRESSION
* CALL output
196:     ST  1,-352(1)	Store fp in ghost frame for output
* TOFF dec: -353
* TOFF dec: -354
* Param 1
197:     LD  3,-10(1)	Load variable predigit
198:     ST  3,-354(1)	Push left side 
* TOFF dec: -355
199:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -354
200:     LD  4,-354(1)	Pop left into ac1 
201:    ADD  3,4,3	Op + 
202:     ST  3,-354(1)	Push parameter 
* TOFF dec: -355
* Param end output
203:    LDA  1,-352(1)	Ghost frame becomes new active frame 
204:    LDA  3,1(7)	Return address in ac 
205:    JMP  7,-200(7)	CALL output
206:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -352
* EXPRESSION
* CALL outnl
207:     ST  1,-352(1)	Store fp in ghost frame for outnl
* TOFF dec: -353
* TOFF dec: -354
* Param end outnl
208:    LDA  1,-352(1)	Ghost frame becomes new active frame 
209:    LDA  3,1(7)	Return address in ac 
210:    JMP  7,-177(7)	CALL outnl
211:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -352
* EXPRESSION
212:    LDC  3,0(6)	Load integer constant 
213:     ST  3,-10(1)	Store variable predigit
* WHILE
214:     LD  3,-9(1)	Load variable nines
215:     ST  3,-352(1)	Push left side 
* TOFF dec: -353
216:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -352
217:     LD  4,-352(1)	Pop left into ac1 
218:    TGT  3,4,3	Op > 
219:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -352
* Compound Body
* EXPRESSION
* CALL output
221:     ST  1,-352(1)	Store fp in ghost frame for output
* TOFF dec: -353
* TOFF dec: -354
* Param 1
222:    LDC  3,0(6)	Load integer constant 
223:     ST  3,-354(1)	Push parameter 
* TOFF dec: -355
* Param end output
224:    LDA  1,-352(1)	Ghost frame becomes new active frame 
225:    LDA  3,1(7)	Return address in ac 
226:    JMP  7,-221(7)	CALL output
227:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -352
* EXPRESSION
* CALL outnl
228:     ST  1,-352(1)	Store fp in ghost frame for outnl
* TOFF dec: -353
* TOFF dec: -354
* Param end outnl
229:    LDA  1,-352(1)	Ghost frame becomes new active frame 
230:    LDA  3,1(7)	Return address in ac 
231:    JMP  7,-198(7)	CALL outnl
232:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -352
* EXPRESSION
233:     LD  3,-9(1)	load lhs variable nines
234:    LDA  3,-1(3)	decrement value of nines
235:     ST  3,-9(1)	Store variable nines
* TOFF set: -352
* END COMPOUND
236:    JMP  7,-23(7)	go to beginning of loop 
220:    JMP  7,16(7)	Jump past loop [backpatch] 
* END WHILE
* TOFF set: -352
* END COMPOUND
195:    JZR  3,42(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* TOFF set: -352
* Compound Body
* EXPRESSION
* CALL output
238:     ST  1,-352(1)	Store fp in ghost frame for output
* TOFF dec: -353
* TOFF dec: -354
* Param 1
239:     LD  3,-10(1)	Load variable predigit
240:     ST  3,-354(1)	Push parameter 
* TOFF dec: -355
* Param end output
241:    LDA  1,-352(1)	Ghost frame becomes new active frame 
242:    LDA  3,1(7)	Return address in ac 
243:    JMP  7,-238(7)	CALL output
244:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -352
* EXPRESSION
* CALL outnl
245:     ST  1,-352(1)	Store fp in ghost frame for outnl
* TOFF dec: -353
* TOFF dec: -354
* Param end outnl
246:    LDA  1,-352(1)	Ghost frame becomes new active frame 
247:    LDA  3,1(7)	Return address in ac 
248:    JMP  7,-215(7)	CALL outnl
249:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -352
* EXPRESSION
250:     LD  3,-7(1)	Load variable q
251:     ST  3,-10(1)	Store variable predigit
* WHILE
252:     LD  3,-9(1)	Load variable nines
253:     ST  3,-352(1)	Push left side 
* TOFF dec: -353
254:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -352
255:     LD  4,-352(1)	Pop left into ac1 
256:    TGT  3,4,3	Op > 
257:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -352
* Compound Body
* EXPRESSION
* CALL output
259:     ST  1,-352(1)	Store fp in ghost frame for output
* TOFF dec: -353
* TOFF dec: -354
* Param 1
260:    LDC  3,9(6)	Load integer constant 
261:     ST  3,-354(1)	Push parameter 
* TOFF dec: -355
* Param end output
262:    LDA  1,-352(1)	Ghost frame becomes new active frame 
263:    LDA  3,1(7)	Return address in ac 
264:    JMP  7,-259(7)	CALL output
265:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -352
* EXPRESSION
* CALL outnl
266:     ST  1,-352(1)	Store fp in ghost frame for outnl
* TOFF dec: -353
* TOFF dec: -354
* Param end outnl
267:    LDA  1,-352(1)	Ghost frame becomes new active frame 
268:    LDA  3,1(7)	Return address in ac 
269:    JMP  7,-236(7)	CALL outnl
270:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -352
* EXPRESSION
271:     LD  3,-9(1)	load lhs variable nines
272:    LDA  3,-1(3)	decrement value of nines
273:     ST  3,-9(1)	Store variable nines
* TOFF set: -352
* END COMPOUND
274:    JMP  7,-23(7)	go to beginning of loop 
258:    JMP  7,16(7)	Jump past loop [backpatch] 
* END WHILE
* TOFF set: -352
* END COMPOUND
237:    JMP  7,37(7)	Jump around the ELSE [backpatch] 
* END IF
* TOFF set: -352
* END COMPOUND
189:    JMP  7,85(7)	Jump around the ELSE [backpatch] 
* END IF
* EXPRESSION
275:     LD  3,-5(1)	load lhs variable j
276:    LDA  3,1(3)	increment value of j
277:     ST  3,-5(1)	Store variable j
* TOFF set: -352
* END COMPOUND
278:    JMP  7,-199(7)	go to beginning of loop 
 86:    JMP  7,192(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
* CALL output
279:     ST  1,-352(1)	Store fp in ghost frame for output
* TOFF dec: -353
* TOFF dec: -354
* Param 1
280:     LD  3,-10(1)	Load variable predigit
281:     ST  3,-354(1)	Push parameter 
* TOFF dec: -355
* Param end output
282:    LDA  1,-352(1)	Ghost frame becomes new active frame 
283:    LDA  3,1(7)	Return address in ac 
284:    JMP  7,-279(7)	CALL output
285:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -352
* EXPRESSION
* CALL outnl
286:     ST  1,-352(1)	Store fp in ghost frame for outnl
* TOFF dec: -353
* TOFF dec: -354
* Param end outnl
287:    LDA  1,-352(1)	Ghost frame becomes new active frame 
288:    LDA  3,1(7)	Return address in ac 
289:    JMP  7,-256(7)	CALL outnl
290:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -352
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
291:    LDC  2,0(6)	Set return value to 0 
292:     LD  3,-1(1)	Load return address 
293:     LD  1,0(1)	Adjust fp 
294:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,294(7)	Jump to init [backpatch] 
* INIT
295:    LDA  1,0(0)	set first frame at end of globals 
296:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
297:    LDA  3,1(7)	Return address in ac 
298:    JMP  7,-260(7)	Jump to main 
299:   HALT  0,0,0	DONE! 
* END INIT
