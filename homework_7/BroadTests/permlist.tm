* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  permlist.c-
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
* FUNCTION put
* TOFF set: -3
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -5
* Compound Body
* EXPRESSION
 40:     LD  3,-2(1)	Load address of base of array p
 41:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 42:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -5
 43:     LD  4,-5(1)	Pop left into ac1 
 44:    SUB  3,4,3	compute location from index 
 45:     LD  3,0(3)	Load array element 
 46:     ST  3,-4(1)	Store variable sum
* EXPRESSION
 47:    LDC  3,2(6)	Load integer constant 
 48:     ST  3,-3(1)	Store variable j
* WHILE
 49:     LD  3,-3(1)	Load variable j
 50:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 51:     LD  3,0(0)	Load variable n
* TOFF inc: -5
 52:     LD  4,-5(1)	Pop left into ac1 
 53:    TLE  3,4,3	Op <= 
 54:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -5
* Compound Body
* EXPRESSION
 56:     LD  3,-4(1)	Load variable sum
 57:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 58:    LDC  3,10(6)	Load integer constant 
* TOFF inc: -5
 59:     LD  4,-5(1)	Pop left into ac1 
 60:    MUL  3,4,3	Op * 
 61:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 62:     LD  3,-2(1)	Load address of base of array p
 63:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
 64:     LD  3,-3(1)	Load variable j
* TOFF inc: -6
 65:     LD  4,-6(1)	Pop left into ac1 
 66:    SUB  3,4,3	compute location from index 
 67:     LD  3,0(3)	Load array element 
* TOFF inc: -5
 68:     LD  4,-5(1)	Pop left into ac1 
 69:    ADD  3,4,3	Op + 
 70:     ST  3,-4(1)	Store variable sum
* EXPRESSION
 71:     LD  3,-3(1)	Load variable j
 72:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 73:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -5
 74:     LD  4,-5(1)	Pop left into ac1 
 75:    ADD  3,4,3	Op + 
 76:     ST  3,-3(1)	Store variable j
* TOFF set: -5
* END COMPOUND
 77:    JMP  7,-29(7)	go to beginning of loop 
 55:    JMP  7,22(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
* CALL output
 78:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 79:     LD  3,-4(1)	Load variable sum
 80:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
 81:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 82:    LDA  3,1(7)	Return address in ac 
 83:    JMP  7,-78(7)	CALL output
 84:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
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
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
 90:    LDC  2,0(6)	Set return value to 0 
 91:     LD  3,-1(1)	Load return address 
 92:     LD  1,0(1)	Adjust fp 
 93:    JMP  7,0(3)	Return 
* END FUNCTION put
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
 94:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -25
 95:    LDC  3,20(6)	load size of array p
 96:     ST  3,-2(1)	save size of array p
* Compound Body
* EXPRESSION
* CALL input
 97:     ST  1,-25(1)	Store fp in ghost frame for input
* TOFF dec: -26
* TOFF dec: -27
* Param end input
 98:    LDA  1,-25(1)	Ghost frame becomes new active frame 
 99:    LDA  3,1(7)	Return address in ac 
100:    JMP  7,-100(7)	CALL input
101:    LDA  3,0(2)	Save the result in ac 
* Call end input
* TOFF set: -25
102:     ST  3,0(0)	Store variable n
* EXPRESSION
103:    LDC  3,0(6)	Load integer constant 
104:     ST  3,-24(1)	Store variable j
* WHILE
105:     LD  3,-24(1)	Load variable j
106:     ST  3,-25(1)	Push left side 
* TOFF dec: -26
107:     LD  3,0(0)	Load variable n
* TOFF inc: -25
108:     LD  4,-25(1)	Pop left into ac1 
109:    TLE  3,4,3	Op <= 
110:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -25
* Compound Body
* EXPRESSION
112:     LD  3,-24(1)	Load variable j
113:     ST  3,-25(1)	Push index 
* TOFF dec: -26
114:     LD  3,-24(1)	Load variable j
* TOFF inc: -25
115:     LD  4,-25(1)	Pop index 
116:    LDA  5,-3(1)	Load address of base of array p
117:    SUB  5,5,4	Compute offset of value 
118:     ST  3,0(5)	Store variable p
* EXPRESSION
119:     LD  3,-24(1)	Load variable j
120:     ST  3,-25(1)	Push left side 
* TOFF dec: -26
121:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -25
122:     LD  4,-25(1)	Pop left into ac1 
123:    ADD  3,4,3	Op + 
124:     ST  3,-24(1)	Store variable j
* TOFF set: -25
* END COMPOUND
125:    JMP  7,-21(7)	go to beginning of loop 
111:    JMP  7,14(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
126:    LDC  3,1(6)	Load integer constant 
127:     ST  3,-23(1)	Store variable i
* WHILE
128:     LD  3,-23(1)	Load variable i
129:     ST  3,-25(1)	Push left side 
* TOFF dec: -26
130:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -25
131:     LD  4,-25(1)	Pop left into ac1 
132:    TGT  3,4,3	Op > 
133:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -28
* Compound Body
* EXPRESSION
* CALL put
135:     ST  1,-28(1)	Store fp in ghost frame for put
* TOFF dec: -29
* TOFF dec: -30
* Param 1
136:    LDA  3,-3(1)	Load address of base of array p
137:     ST  3,-30(1)	Push parameter 
* TOFF dec: -31
* Param end put
138:    LDA  1,-28(1)	Ghost frame becomes new active frame 
139:    LDA  3,1(7)	Return address in ac 
140:    JMP  7,-102(7)	CALL put
141:    LDA  3,0(2)	Save the result in ac 
* Call end put
* TOFF set: -28
* EXPRESSION
142:     LD  3,0(0)	Load variable n
143:     ST  3,-28(1)	Push left side 
* TOFF dec: -29
144:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -28
145:     LD  4,-28(1)	Pop left into ac1 
146:    SUB  3,4,3	Op - 
147:     ST  3,-23(1)	Store variable i
* WHILE
148:    LDA  3,-3(1)	Load address of base of array p
149:     ST  3,-28(1)	Push left side 
* TOFF dec: -29
150:     LD  3,-23(1)	Load variable i
* TOFF inc: -28
151:     LD  4,-28(1)	Pop left into ac1 
152:    SUB  3,4,3	compute location from index 
153:     LD  3,0(3)	Load array element 
154:     ST  3,-28(1)	Push left side 
* TOFF dec: -29
155:    LDA  3,-3(1)	Load address of base of array p
156:     ST  3,-29(1)	Push left side 
* TOFF dec: -30
157:     LD  3,-23(1)	Load variable i
158:     ST  3,-30(1)	Push left side 
* TOFF dec: -31
159:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -30
160:     LD  4,-30(1)	Pop left into ac1 
161:    ADD  3,4,3	Op + 
* TOFF inc: -29
162:     LD  4,-29(1)	Pop left into ac1 
163:    SUB  3,4,3	compute location from index 
164:     LD  3,0(3)	Load array element 
* TOFF inc: -28
165:     LD  4,-28(1)	Pop left into ac1 
166:    TGT  3,4,3	Op > 
167:    JNZ  3,1(7)	Jump to while part 
* DO
* EXPRESSION
169:     LD  3,-23(1)	Load variable i
170:     ST  3,-28(1)	Push left side 
* TOFF dec: -29
171:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -28
172:     LD  4,-28(1)	Pop left into ac1 
173:    SUB  3,4,3	Op - 
174:     ST  3,-23(1)	Store variable i
175:    JMP  7,-28(7)	go to beginning of loop 
168:    JMP  7,7(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
176:     LD  3,0(0)	Load variable n
177:     ST  3,-24(1)	Store variable j
* WHILE
178:    LDA  3,-3(1)	Load address of base of array p
179:     ST  3,-28(1)	Push left side 
* TOFF dec: -29
180:     LD  3,-23(1)	Load variable i
* TOFF inc: -28
181:     LD  4,-28(1)	Pop left into ac1 
182:    SUB  3,4,3	compute location from index 
183:     LD  3,0(3)	Load array element 
184:     ST  3,-28(1)	Push left side 
* TOFF dec: -29
185:    LDA  3,-3(1)	Load address of base of array p
186:     ST  3,-29(1)	Push left side 
* TOFF dec: -30
187:     LD  3,-24(1)	Load variable j
* TOFF inc: -29
188:     LD  4,-29(1)	Pop left into ac1 
189:    SUB  3,4,3	compute location from index 
190:     LD  3,0(3)	Load array element 
* TOFF inc: -28
191:     LD  4,-28(1)	Pop left into ac1 
192:    TGT  3,4,3	Op > 
193:    JNZ  3,1(7)	Jump to while part 
* DO
* EXPRESSION
195:     LD  3,-24(1)	Load variable j
196:     ST  3,-28(1)	Push left side 
* TOFF dec: -29
197:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -28
198:     LD  4,-28(1)	Pop left into ac1 
199:    SUB  3,4,3	Op - 
200:     ST  3,-24(1)	Store variable j
201:    JMP  7,-24(7)	go to beginning of loop 
194:    JMP  7,7(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
202:    LDA  3,-3(1)	Load address of base of array p
203:     ST  3,-28(1)	Push left side 
* TOFF dec: -29
204:     LD  3,-23(1)	Load variable i
* TOFF inc: -28
205:     LD  4,-28(1)	Pop left into ac1 
206:    SUB  3,4,3	compute location from index 
207:     LD  3,0(3)	Load array element 
208:     ST  3,-27(1)	Store variable tmp
* EXPRESSION
209:     LD  3,-23(1)	Load variable i
210:     ST  3,-28(1)	Push index 
* TOFF dec: -29
211:    LDA  3,-3(1)	Load address of base of array p
212:     ST  3,-29(1)	Push left side 
* TOFF dec: -30
213:     LD  3,-24(1)	Load variable j
* TOFF inc: -29
214:     LD  4,-29(1)	Pop left into ac1 
215:    SUB  3,4,3	compute location from index 
216:     LD  3,0(3)	Load array element 
* TOFF inc: -28
217:     LD  4,-28(1)	Pop index 
218:    LDA  5,-3(1)	Load address of base of array p
219:    SUB  5,5,4	Compute offset of value 
220:     ST  3,0(5)	Store variable p
* EXPRESSION
221:     LD  3,-24(1)	Load variable j
222:     ST  3,-28(1)	Push index 
* TOFF dec: -29
223:     LD  3,-27(1)	Load variable tmp
* TOFF inc: -28
224:     LD  4,-28(1)	Pop index 
225:    LDA  5,-3(1)	Load address of base of array p
226:    SUB  5,5,4	Compute offset of value 
227:     ST  3,0(5)	Store variable p
* EXPRESSION
228:     LD  3,0(0)	Load variable n
229:     ST  3,-25(1)	Store variable r
* EXPRESSION
230:     LD  3,-23(1)	Load variable i
231:     ST  3,-28(1)	Push left side 
* TOFF dec: -29
232:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -28
233:     LD  4,-28(1)	Pop left into ac1 
234:    ADD  3,4,3	Op + 
235:     ST  3,-26(1)	Store variable s
* WHILE
236:     LD  3,-25(1)	Load variable r
237:     ST  3,-28(1)	Push left side 
* TOFF dec: -29
238:     LD  3,-26(1)	Load variable s
* TOFF inc: -28
239:     LD  4,-28(1)	Pop left into ac1 
240:    TGT  3,4,3	Op > 
241:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -28
* Compound Body
* EXPRESSION
243:    LDA  3,-3(1)	Load address of base of array p
244:     ST  3,-28(1)	Push left side 
* TOFF dec: -29
245:     LD  3,-25(1)	Load variable r
* TOFF inc: -28
246:     LD  4,-28(1)	Pop left into ac1 
247:    SUB  3,4,3	compute location from index 
248:     LD  3,0(3)	Load array element 
249:     ST  3,-27(1)	Store variable tmp
* EXPRESSION
250:     LD  3,-25(1)	Load variable r
251:     ST  3,-28(1)	Push index 
* TOFF dec: -29
252:    LDA  3,-3(1)	Load address of base of array p
253:     ST  3,-29(1)	Push left side 
* TOFF dec: -30
254:     LD  3,-26(1)	Load variable s
* TOFF inc: -29
255:     LD  4,-29(1)	Pop left into ac1 
256:    SUB  3,4,3	compute location from index 
257:     LD  3,0(3)	Load array element 
* TOFF inc: -28
258:     LD  4,-28(1)	Pop index 
259:    LDA  5,-3(1)	Load address of base of array p
260:    SUB  5,5,4	Compute offset of value 
261:     ST  3,0(5)	Store variable p
* EXPRESSION
262:     LD  3,-26(1)	Load variable s
263:     ST  3,-28(1)	Push index 
* TOFF dec: -29
264:     LD  3,-27(1)	Load variable tmp
* TOFF inc: -28
265:     LD  4,-28(1)	Pop index 
266:    LDA  5,-3(1)	Load address of base of array p
267:    SUB  5,5,4	Compute offset of value 
268:     ST  3,0(5)	Store variable p
* EXPRESSION
269:     LD  3,-25(1)	Load variable r
270:     ST  3,-28(1)	Push left side 
* TOFF dec: -29
271:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -28
272:     LD  4,-28(1)	Pop left into ac1 
273:    SUB  3,4,3	Op - 
274:     ST  3,-25(1)	Store variable r
* EXPRESSION
275:     LD  3,-26(1)	Load variable s
276:     ST  3,-28(1)	Push left side 
* TOFF dec: -29
277:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -28
278:     LD  4,-28(1)	Pop left into ac1 
279:    ADD  3,4,3	Op + 
280:     ST  3,-26(1)	Store variable s
* TOFF set: -28
* END COMPOUND
281:    JMP  7,-46(7)	go to beginning of loop 
242:    JMP  7,39(7)	Jump past loop [backpatch] 
* END WHILE
* TOFF set: -25
* END COMPOUND
282:    JMP  7,-155(7)	go to beginning of loop 
134:    JMP  7,148(7)	Jump past loop [backpatch] 
* END WHILE
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
283:    LDC  2,0(6)	Set return value to 0 
284:     LD  3,-1(1)	Load return address 
285:     LD  1,0(1)	Adjust fp 
286:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,286(7)	Jump to init [backpatch] 
* INIT
287:    LDA  1,-1(0)	set first frame at end of globals 
288:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
289:    LDA  3,1(7)	Return address in ac 
290:    JMP  7,-197(7)	Jump to main 
291:   HALT  0,0,0	DONE! 
* END INIT
