* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  toroman.c-
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
* FUNCTION roman
* TOFF set: -3
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -149
 40:    LDC  3,13(6)	load size of array value
 41:     ST  3,-6(1)	save size of array value
 42:    LDC  3,26(6)	load size of array letters
 43:     ST  3,-20(1)	save size of array letters
  1:    LIT  "M CMD CDC XCL XLX IXV IVI "
 44:    LDA  3,-1(0)	Load address of char array 
 45:    LDA  4,-21(1)	address of lhs 
 46:     LD  5,1(3)	size of rhs 
 47:     LD  6,1(4)	size of lhs 
 48:    SWP  5,6,6	pick smallest size 
 49:    MOV  4,3,5	array op = 
 50:    LDC  3,100(6)	load size of array s
 51:     ST  3,-47(1)	save size of array s
* Compound Body
* EXPRESSION
 52:    LDC  3,100(6)	Load integer constant 
 53:     ST  3,-3(1)	Store variable b
* EXPRESSION
 54:    LDC  3,0(6)	Load integer constant 
 55:     ST  3,-4(1)	Store variable j
 56:     ST  3,-149(1)	Push index 
* TOFF dec: -150
 57:    LDC  3,1000(6)	Load integer constant 
* TOFF inc: -149
 58:     LD  4,-149(1)	Pop index 
 59:    LDA  5,-7(1)	Load address of base of array value
 60:    SUB  5,5,4	Compute offset of value 
 61:     ST  3,0(5)	Store variable value
* TOFF set: -152
* FOR
 62:    LDC  3,0(6)	Load integer constant 
 63:     ST  3,-149(1)	save starting value in index variable 
 64:    LDC  3,3(6)	Load integer constant 
 65:     ST  3,-150(1)	save stop value 
 66:    LDC  3,1(6)	default increment by 1 
 67:     ST  3,-151(1)	save step value 
 68:     LD  4,-149(1)	loop index 
 69:     LD  5,-150(1)	stop value 
 70:     LD  3,-151(1)	step value 
 71:    SLT  3,4,5	Op < 
 72:    JNZ  3,1(7)	Jump to loop body 
* COMPOUND
* TOFF set: -152
* Compound Body
* EXPRESSION
 74:     LD  3,-4(1)	load lhs variable j
 75:    LDA  3,1(3)	increment value of j
 76:     ST  3,-4(1)	Store variable j
 77:     ST  3,-152(1)	Push index 
* TOFF dec: -153
 78:    LDC  3,9(6)	Load integer constant 
 79:     ST  3,-153(1)	Push left side 
* TOFF dec: -154
 80:     LD  3,-3(1)	Load variable b
* TOFF inc: -153
 81:     LD  4,-153(1)	Pop left into ac1 
 82:    MUL  3,4,3	Op * 
* TOFF inc: -152
 83:     LD  4,-152(1)	Pop index 
 84:    LDA  5,-7(1)	Load address of base of array value
 85:    SUB  5,5,4	Compute offset of value 
 86:     ST  3,0(5)	Store variable value
* EXPRESSION
 87:     LD  3,-4(1)	load lhs variable j
 88:    LDA  3,1(3)	increment value of j
 89:     ST  3,-4(1)	Store variable j
 90:     ST  3,-152(1)	Push index 
* TOFF dec: -153
 91:    LDC  3,5(6)	Load integer constant 
 92:     ST  3,-153(1)	Push left side 
* TOFF dec: -154
 93:     LD  3,-3(1)	Load variable b
* TOFF inc: -153
 94:     LD  4,-153(1)	Pop left into ac1 
 95:    MUL  3,4,3	Op * 
* TOFF inc: -152
 96:     LD  4,-152(1)	Pop index 
 97:    LDA  5,-7(1)	Load address of base of array value
 98:    SUB  5,5,4	Compute offset of value 
 99:     ST  3,0(5)	Store variable value
* EXPRESSION
100:     LD  3,-4(1)	load lhs variable j
101:    LDA  3,1(3)	increment value of j
102:     ST  3,-4(1)	Store variable j
103:     ST  3,-152(1)	Push index 
* TOFF dec: -153
104:    LDC  3,4(6)	Load integer constant 
105:     ST  3,-153(1)	Push left side 
* TOFF dec: -154
106:     LD  3,-3(1)	Load variable b
* TOFF inc: -153
107:     LD  4,-153(1)	Pop left into ac1 
108:    MUL  3,4,3	Op * 
* TOFF inc: -152
109:     LD  4,-152(1)	Pop index 
110:    LDA  5,-7(1)	Load address of base of array value
111:    SUB  5,5,4	Compute offset of value 
112:     ST  3,0(5)	Store variable value
* EXPRESSION
113:     LD  3,-4(1)	load lhs variable j
114:    LDA  3,1(3)	increment value of j
115:     ST  3,-4(1)	Store variable j
116:     ST  3,-152(1)	Push index 
* TOFF dec: -153
117:     LD  3,-3(1)	Load variable b
* TOFF inc: -152
118:     LD  4,-152(1)	Pop index 
119:    LDA  5,-7(1)	Load address of base of array value
120:    SUB  5,5,4	Compute offset of value 
121:     ST  3,0(5)	Store variable value
* EXPRESSION
122:    LDC  3,10(6)	Load integer constant 
123:     LD  4,-3(1)	load lhs variable b
124:    DIV  3,4,3	op /= 
125:     ST  3,-3(1)	Store variable b
* TOFF set: -152
* END COMPOUND
* Bottom of loop increment and jump
126:     LD  3,-149(1)	Load index 
127:     LD  5,-151(1)	Load step 
128:    ADD  3,3,5	increment 
129:     ST  3,-149(1)	store back to index 
130:    JMP  7,-63(7)	go to beginning of loop 
 73:    JMP  7,57(7)	Jump past loop [backpatch] 
* END LOOP
* EXPRESSION
131:    LDC  3,0(6)	Load integer constant 
132:     ST  3,-5(1)	Store variable i
* EXPRESSION
133:    LDC  3,0(6)	Load integer constant 
134:     ST  3,-148(1)	Store variable sloc
* WHILE
135:    LDA  3,-7(1)	Load address of base of array value
136:     ST  3,-152(1)	Push left side 
* TOFF dec: -153
137:     LD  3,-5(1)	Load variable i
* TOFF inc: -152
138:     LD  4,-152(1)	Pop left into ac1 
139:    SUB  3,4,3	compute location from index 
140:     LD  3,0(3)	Load array element 
141:     ST  3,-152(1)	Push left side 
* TOFF dec: -153
142:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -152
143:     LD  4,-152(1)	Pop left into ac1 
144:    TGT  3,4,3	Op > 
145:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -149
* Compound Body
* WHILE
147:     LD  3,-2(1)	Load variable n
148:     ST  3,-149(1)	Push left side 
* TOFF dec: -150
149:    LDA  3,-7(1)	Load address of base of array value
150:     ST  3,-150(1)	Push left side 
* TOFF dec: -151
151:     LD  3,-5(1)	Load variable i
* TOFF inc: -150
152:     LD  4,-150(1)	Pop left into ac1 
153:    SUB  3,4,3	compute location from index 
154:     LD  3,0(3)	Load array element 
* TOFF inc: -149
155:     LD  4,-149(1)	Pop left into ac1 
156:    TGE  3,4,3	Op >= 
157:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -149
* Compound Body
* EXPRESSION
159:    LDA  3,-7(1)	Load address of base of array value
160:     ST  3,-149(1)	Push left side 
* TOFF dec: -150
161:     LD  3,-5(1)	Load variable i
* TOFF inc: -149
162:     LD  4,-149(1)	Pop left into ac1 
163:    SUB  3,4,3	compute location from index 
164:     LD  3,0(3)	Load array element 
165:     LD  4,-2(1)	load lhs variable n
166:    SUB  3,4,3	op -= 
167:     ST  3,-2(1)	Store variable n
* EXPRESSION
168:     LD  3,-148(1)	Load variable sloc
169:     ST  3,-149(1)	Push index 
* TOFF dec: -150
170:    LDA  3,-21(1)	Load address of base of array letters
171:     ST  3,-150(1)	Push left side 
* TOFF dec: -151
172:    LDC  3,2(6)	Load integer constant 
173:     ST  3,-151(1)	Push left side 
* TOFF dec: -152
174:     LD  3,-5(1)	Load variable i
* TOFF inc: -151
175:     LD  4,-151(1)	Pop left into ac1 
176:    MUL  3,4,3	Op * 
* TOFF inc: -150
177:     LD  4,-150(1)	Pop left into ac1 
178:    SUB  3,4,3	compute location from index 
179:     LD  3,0(3)	Load array element 
* TOFF inc: -149
180:     LD  4,-149(1)	Pop index 
181:    LDA  5,-48(1)	Load address of base of array s
182:    SUB  5,5,4	Compute offset of value 
183:     ST  3,0(5)	Store variable s
* EXPRESSION
184:     LD  3,-148(1)	load lhs variable sloc
185:    LDA  3,1(3)	increment value of sloc
186:     ST  3,-148(1)	Store variable sloc
* IF
187:    LDA  3,-21(1)	Load address of base of array letters
188:     ST  3,-149(1)	Push left side 
* TOFF dec: -150
189:    LDC  3,2(6)	Load integer constant 
190:     ST  3,-150(1)	Push left side 
* TOFF dec: -151
191:     LD  3,-5(1)	Load variable i
* TOFF inc: -150
192:     LD  4,-150(1)	Pop left into ac1 
193:    MUL  3,4,3	Op * 
194:     ST  3,-150(1)	Push left side 
* TOFF dec: -151
195:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -150
196:     LD  4,-150(1)	Pop left into ac1 
197:    ADD  3,4,3	Op + 
* TOFF inc: -149
198:     LD  4,-149(1)	Pop left into ac1 
199:    SUB  3,4,3	compute location from index 
200:     LD  3,0(3)	Load array element 
201:     ST  3,-149(1)	Push left side 
* TOFF dec: -150
202:    LDC  3,32(6)	Load char constant 
* TOFF inc: -149
203:     LD  4,-149(1)	Pop left into ac1 
204:    TNE  3,4,3	Op >< 
* THEN
* COMPOUND
* TOFF set: -149
* Compound Body
* EXPRESSION
206:     LD  3,-148(1)	Load variable sloc
207:     ST  3,-149(1)	Push index 
* TOFF dec: -150
208:    LDA  3,-21(1)	Load address of base of array letters
209:     ST  3,-150(1)	Push left side 
* TOFF dec: -151
210:    LDC  3,2(6)	Load integer constant 
211:     ST  3,-151(1)	Push left side 
* TOFF dec: -152
212:     LD  3,-5(1)	Load variable i
* TOFF inc: -151
213:     LD  4,-151(1)	Pop left into ac1 
214:    MUL  3,4,3	Op * 
215:     ST  3,-151(1)	Push left side 
* TOFF dec: -152
216:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -151
217:     LD  4,-151(1)	Pop left into ac1 
218:    ADD  3,4,3	Op + 
* TOFF inc: -150
219:     LD  4,-150(1)	Pop left into ac1 
220:    SUB  3,4,3	compute location from index 
221:     LD  3,0(3)	Load array element 
* TOFF inc: -149
222:     LD  4,-149(1)	Pop index 
223:    LDA  5,-48(1)	Load address of base of array s
224:    SUB  5,5,4	Compute offset of value 
225:     ST  3,0(5)	Store variable s
* EXPRESSION
226:     LD  3,-148(1)	load lhs variable sloc
227:    LDA  3,1(3)	increment value of sloc
228:     ST  3,-148(1)	Store variable sloc
* TOFF set: -149
* END COMPOUND
205:    JZR  3,23(7)	Jump around the THEN if false [backpatch] 
* END IF
* TOFF set: -149
* END COMPOUND
229:    JMP  7,-83(7)	go to beginning of loop 
158:    JMP  7,71(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
230:     LD  3,-5(1)	load lhs variable i
231:    LDA  3,1(3)	increment value of i
232:     ST  3,-5(1)	Store variable i
* TOFF set: -152
* END COMPOUND
233:    JMP  7,-99(7)	go to beginning of loop 
146:    JMP  7,87(7)	Jump past loop [backpatch] 
* END WHILE
* TOFF set: -152
* FOR
234:    LDC  3,0(6)	Load integer constant 
235:     ST  3,-149(1)	save starting value in index variable 
236:     LD  3,-148(1)	Load variable sloc
237:     ST  3,-150(1)	save stop value 
238:    LDC  3,1(6)	default increment by 1 
239:     ST  3,-151(1)	save step value 
240:     LD  4,-149(1)	loop index 
241:     LD  5,-150(1)	stop value 
242:     LD  3,-151(1)	step value 
243:    SLT  3,4,5	Op < 
244:    JNZ  3,1(7)	Jump to loop body 
* EXPRESSION
* CALL outputc
246:     ST  1,-152(1)	Store fp in ghost frame for outputc
* TOFF dec: -153
* TOFF dec: -154
* Param 1
247:    LDA  3,-48(1)	Load address of base of array s
248:     ST  3,-154(1)	Push left side 
* TOFF dec: -155
249:     LD  3,-149(1)	Load variable i
* TOFF inc: -154
250:     LD  4,-154(1)	Pop left into ac1 
251:    SUB  3,4,3	compute location from index 
252:     LD  3,0(3)	Load array element 
253:     ST  3,-154(1)	Push parameter 
* TOFF dec: -155
* Param end outputc
254:    LDA  1,-152(1)	Ghost frame becomes new active frame 
255:    LDA  3,1(7)	Return address in ac 
256:    JMP  7,-229(7)	CALL outputc
257:    LDA  3,0(2)	Save the result in ac 
* Call end outputc
* TOFF set: -152
* Bottom of loop increment and jump
258:     LD  3,-149(1)	Load index 
259:     LD  5,-151(1)	Load step 
260:    ADD  3,3,5	increment 
261:     ST  3,-149(1)	store back to index 
262:    JMP  7,-23(7)	go to beginning of loop 
245:    JMP  7,17(7)	Jump past loop [backpatch] 
* END LOOP
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
263:    LDC  2,0(6)	Set return value to 0 
264:     LD  3,-1(1)	Load return address 
265:     LD  1,0(1)	Adjust fp 
266:    JMP  7,0(3)	Return 
* END FUNCTION roman
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
267:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* WHILE
268:    LDC  3,1(6)	Load Boolean constant 
269:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
* CALL input
271:     ST  1,-3(1)	Store fp in ghost frame for input
* TOFF dec: -4
* TOFF dec: -5
* Param end input
272:    LDA  1,-3(1)	Ghost frame becomes new active frame 
273:    LDA  3,1(7)	Return address in ac 
274:    JMP  7,-274(7)	CALL input
275:    LDA  3,0(2)	Save the result in ac 
* Call end input
* TOFF set: -3
276:     ST  3,-2(1)	Store variable n
* IF
277:     LD  3,-2(1)	Load variable n
278:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
279:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -3
280:     LD  4,-3(1)	Pop left into ac1 
281:    TEQ  3,4,3	Op = 
* THEN
* BREAK
283:    JMP  7,-14(7)	break 
282:    JZR  3,1(7)	Jump around the THEN if false [backpatch] 
* END IF
* EXPRESSION
* CALL roman
284:     ST  1,-3(1)	Store fp in ghost frame for roman
* TOFF dec: -4
* TOFF dec: -5
* Param 1
285:     LD  3,-2(1)	Load variable n
286:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end roman
287:    LDA  1,-3(1)	Ghost frame becomes new active frame 
288:    LDA  3,1(7)	Return address in ac 
289:    JMP  7,-251(7)	CALL roman
290:    LDA  3,0(2)	Save the result in ac 
* Call end roman
* TOFF set: -3
* EXPRESSION
* CALL outnl
291:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
292:    LDA  1,-3(1)	Ghost frame becomes new active frame 
293:    LDA  3,1(7)	Return address in ac 
294:    JMP  7,-261(7)	CALL outnl
295:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* TOFF set: -3
* END COMPOUND
296:    JMP  7,-29(7)	go to beginning of loop 
270:    JMP  7,26(7)	Jump past loop [backpatch] 
* END WHILE
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
301:    LDA  1,-27(0)	set first frame at end of globals 
302:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
303:    LDA  3,1(7)	Return address in ac 
304:    JMP  7,-38(7)	Jump to main 
305:   HALT  0,0,0	DONE! 
* END INIT
