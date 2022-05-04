* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  initbig.c-
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
* TOFF set: -20
 40:    LDC  3,666(6)	Load integer constant 
 41:     ST  3,-2(1)	Store variable i
 42:    LDC  3,97(6)	Load char constant 
 43:     ST  3,-3(1)	Store variable y
 44:    LDC  3,1(6)	Load Boolean constant 
 45:     ST  3,-4(1)	Store variable ba
 46:    LDC  3,1(6)	Load Boolean constant 
 47:     ST  3,-20(1)	Push left side 
* TOFF dec: -21
 48:    LDC  3,0(6)	Load Boolean constant 
 49:    LDC  4,1(6)	Load 1 
 50:    XOR  3,3,4	Op XOR to get logical not 
* TOFF inc: -20
 51:     LD  4,-20(1)	Pop left into ac1 
 52:    AND  3,4,3	Op AND 
 53:     ST  3,-5(1)	Store variable bb
 54:    LDC  3,5(6)	Load integer constant 
 55:     ST  3,-20(1)	Push left side 
* TOFF dec: -21
 56:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -20
 57:     LD  4,-20(1)	Pop left into ac1 
 58:    TGT  3,4,3	Op > 
 59:     ST  3,-6(1)	Store variable bc
 60:    LDC  3,10(6)	load size of array x
 61:     ST  3,-7(1)	save size of array x
 62:    LDC  3,4(6)	Load integer constant 
 63:     ST  3,-20(1)	Push left side 
* TOFF dec: -21
 64:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -20
 65:     LD  4,-20(1)	Pop left into ac1 
 66:    MUL  3,4,3	Op * 
 67:     ST  3,-20(1)	Push left side 
* TOFF dec: -21
 68:    LDC  3,3(6)	Load integer constant 
 69:     ST  3,-21(1)	Push left side 
* TOFF dec: -22
 70:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -21
 71:     LD  4,-21(1)	Pop left into ac1 
 72:    MUL  3,4,3	Op * 
* TOFF inc: -20
 73:     LD  4,-20(1)	Pop left into ac1 
 74:    ADD  3,4,3	Op + 
 75:     ST  3,-18(1)	Store variable k
 76:    LDC  3,46(6)	Load integer constant 
 77:    NEG  3,3,3	Op unary - 
 78:     ST  3,-19(1)	Store variable l
* Compound Body
* EXPRESSION
* CALL output
 79:     ST  1,-20(1)	Store fp in ghost frame for output
* TOFF dec: -21
* TOFF dec: -22
* Param 1
 80:     LD  3,0(0)	Load variable ga
 81:     ST  3,-22(1)	Push parameter 
* TOFF dec: -23
* Param end output
 82:    LDA  1,-20(1)	Ghost frame becomes new active frame 
 83:    LDA  3,1(7)	Return address in ac 
 84:    JMP  7,-79(7)	CALL output
 85:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -20
* EXPRESSION
* CALL outnl
 86:     ST  1,-20(1)	Store fp in ghost frame for outnl
* TOFF dec: -21
* TOFF dec: -22
* Param end outnl
 87:    LDA  1,-20(1)	Ghost frame becomes new active frame 
 88:    LDA  3,1(7)	Return address in ac 
 89:    JMP  7,-56(7)	CALL outnl
 90:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -20
* EXPRESSION
* CALL outputb
 91:     ST  1,-20(1)	Store fp in ghost frame for outputb
* TOFF dec: -21
* TOFF dec: -22
* Param 1
 92:     LD  3,-1(0)	Load variable gb
 93:     ST  3,-22(1)	Push parameter 
* TOFF dec: -23
* Param end outputb
 94:    LDA  1,-20(1)	Ghost frame becomes new active frame 
 95:    LDA  3,1(7)	Return address in ac 
 96:    JMP  7,-80(7)	CALL outputb
 97:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -20
* EXPRESSION
* CALL outnl
 98:     ST  1,-20(1)	Store fp in ghost frame for outnl
* TOFF dec: -21
* TOFF dec: -22
* Param end outnl
 99:    LDA  1,-20(1)	Ghost frame becomes new active frame 
100:    LDA  3,1(7)	Return address in ac 
101:    JMP  7,-68(7)	CALL outnl
102:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -20
* EXPRESSION
* CALL output
103:     ST  1,-20(1)	Store fp in ghost frame for output
* TOFF dec: -21
* TOFF dec: -22
* Param 1
104:    LDA  3,-3(0)	Load address of base of array gc
105:     LD  3,1(3)	Load array size 
106:     ST  3,-22(1)	Push parameter 
* TOFF dec: -23
* Param end output
107:    LDA  1,-20(1)	Ghost frame becomes new active frame 
108:    LDA  3,1(7)	Return address in ac 
109:    JMP  7,-104(7)	CALL output
110:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -20
* EXPRESSION
* CALL outnl
111:     ST  1,-20(1)	Store fp in ghost frame for outnl
* TOFF dec: -21
* TOFF dec: -22
* Param end outnl
112:    LDA  1,-20(1)	Ghost frame becomes new active frame 
113:    LDA  3,1(7)	Return address in ac 
114:    JMP  7,-81(7)	CALL outnl
115:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -20
* EXPRESSION
* CALL output
116:     ST  1,-20(1)	Store fp in ghost frame for output
* TOFF dec: -21
* TOFF dec: -22
* Param 1
117:     LD  3,-2(1)	Load variable i
118:     ST  3,-22(1)	Push parameter 
* TOFF dec: -23
* Param end output
119:    LDA  1,-20(1)	Ghost frame becomes new active frame 
120:    LDA  3,1(7)	Return address in ac 
121:    JMP  7,-116(7)	CALL output
122:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -20
* EXPRESSION
* CALL outnl
123:     ST  1,-20(1)	Store fp in ghost frame for outnl
* TOFF dec: -21
* TOFF dec: -22
* Param end outnl
124:    LDA  1,-20(1)	Ghost frame becomes new active frame 
125:    LDA  3,1(7)	Return address in ac 
126:    JMP  7,-93(7)	CALL outnl
127:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -20
* EXPRESSION
* CALL outputc
128:     ST  1,-20(1)	Store fp in ghost frame for outputc
* TOFF dec: -21
* TOFF dec: -22
* Param 1
129:     LD  3,-3(1)	Load variable y
130:     ST  3,-22(1)	Push parameter 
* TOFF dec: -23
* Param end outputc
131:    LDA  1,-20(1)	Ghost frame becomes new active frame 
132:    LDA  3,1(7)	Return address in ac 
133:    JMP  7,-106(7)	CALL outputc
134:    LDA  3,0(2)	Save the result in ac 
* Call end outputc
* TOFF set: -20
* EXPRESSION
* CALL outnl
135:     ST  1,-20(1)	Store fp in ghost frame for outnl
* TOFF dec: -21
* TOFF dec: -22
* Param end outnl
136:    LDA  1,-20(1)	Ghost frame becomes new active frame 
137:    LDA  3,1(7)	Return address in ac 
138:    JMP  7,-105(7)	CALL outnl
139:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -20
* EXPRESSION
* CALL outputb
140:     ST  1,-20(1)	Store fp in ghost frame for outputb
* TOFF dec: -21
* TOFF dec: -22
* Param 1
141:     LD  3,-4(1)	Load variable ba
142:     ST  3,-22(1)	Push parameter 
* TOFF dec: -23
* Param end outputb
143:    LDA  1,-20(1)	Ghost frame becomes new active frame 
144:    LDA  3,1(7)	Return address in ac 
145:    JMP  7,-129(7)	CALL outputb
146:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -20
* EXPRESSION
* CALL outnl
147:     ST  1,-20(1)	Store fp in ghost frame for outnl
* TOFF dec: -21
* TOFF dec: -22
* Param end outnl
148:    LDA  1,-20(1)	Ghost frame becomes new active frame 
149:    LDA  3,1(7)	Return address in ac 
150:    JMP  7,-117(7)	CALL outnl
151:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -20
* EXPRESSION
* CALL outputb
152:     ST  1,-20(1)	Store fp in ghost frame for outputb
* TOFF dec: -21
* TOFF dec: -22
* Param 1
153:     LD  3,-5(1)	Load variable bb
154:     ST  3,-22(1)	Push parameter 
* TOFF dec: -23
* Param end outputb
155:    LDA  1,-20(1)	Ghost frame becomes new active frame 
156:    LDA  3,1(7)	Return address in ac 
157:    JMP  7,-141(7)	CALL outputb
158:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -20
* EXPRESSION
* CALL outnl
159:     ST  1,-20(1)	Store fp in ghost frame for outnl
* TOFF dec: -21
* TOFF dec: -22
* Param end outnl
160:    LDA  1,-20(1)	Ghost frame becomes new active frame 
161:    LDA  3,1(7)	Return address in ac 
162:    JMP  7,-129(7)	CALL outnl
163:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -20
* EXPRESSION
* CALL outputb
164:     ST  1,-20(1)	Store fp in ghost frame for outputb
* TOFF dec: -21
* TOFF dec: -22
* Param 1
165:     LD  3,-6(1)	Load variable bc
166:     ST  3,-22(1)	Push parameter 
* TOFF dec: -23
* Param end outputb
167:    LDA  1,-20(1)	Ghost frame becomes new active frame 
168:    LDA  3,1(7)	Return address in ac 
169:    JMP  7,-153(7)	CALL outputb
170:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -20
* EXPRESSION
* CALL outnl
171:     ST  1,-20(1)	Store fp in ghost frame for outnl
* TOFF dec: -21
* TOFF dec: -22
* Param end outnl
172:    LDA  1,-20(1)	Ghost frame becomes new active frame 
173:    LDA  3,1(7)	Return address in ac 
174:    JMP  7,-141(7)	CALL outnl
175:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -20
* EXPRESSION
* CALL output
176:     ST  1,-20(1)	Store fp in ghost frame for output
* TOFF dec: -21
* TOFF dec: -22
* Param 1
177:    LDA  3,-8(1)	Load address of base of array x
178:     LD  3,1(3)	Load array size 
179:     ST  3,-22(1)	Push parameter 
* TOFF dec: -23
* Param end output
180:    LDA  1,-20(1)	Ghost frame becomes new active frame 
181:    LDA  3,1(7)	Return address in ac 
182:    JMP  7,-177(7)	CALL output
183:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -20
* EXPRESSION
* CALL outnl
184:     ST  1,-20(1)	Store fp in ghost frame for outnl
* TOFF dec: -21
* TOFF dec: -22
* Param end outnl
185:    LDA  1,-20(1)	Ghost frame becomes new active frame 
186:    LDA  3,1(7)	Return address in ac 
187:    JMP  7,-154(7)	CALL outnl
188:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -20
* EXPRESSION
* CALL output
189:     ST  1,-20(1)	Store fp in ghost frame for output
* TOFF dec: -21
* TOFF dec: -22
* Param 1
190:     LD  3,-18(1)	Load variable k
191:     ST  3,-22(1)	Push parameter 
* TOFF dec: -23
* Param end output
192:    LDA  1,-20(1)	Ghost frame becomes new active frame 
193:    LDA  3,1(7)	Return address in ac 
194:    JMP  7,-189(7)	CALL output
195:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -20
* EXPRESSION
* CALL outnl
196:     ST  1,-20(1)	Store fp in ghost frame for outnl
* TOFF dec: -21
* TOFF dec: -22
* Param end outnl
197:    LDA  1,-20(1)	Ghost frame becomes new active frame 
198:    LDA  3,1(7)	Return address in ac 
199:    JMP  7,-166(7)	CALL outnl
200:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -20
* EXPRESSION
* CALL output
201:     ST  1,-20(1)	Store fp in ghost frame for output
* TOFF dec: -21
* TOFF dec: -22
* Param 1
202:     LD  3,-19(1)	Load variable l
203:     ST  3,-22(1)	Push parameter 
* TOFF dec: -23
* Param end output
204:    LDA  1,-20(1)	Ghost frame becomes new active frame 
205:    LDA  3,1(7)	Return address in ac 
206:    JMP  7,-201(7)	CALL output
207:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -20
* EXPRESSION
* CALL outnl
208:     ST  1,-20(1)	Store fp in ghost frame for outnl
* TOFF dec: -21
* TOFF dec: -22
* Param end outnl
209:    LDA  1,-20(1)	Ghost frame becomes new active frame 
210:    LDA  3,1(7)	Return address in ac 
211:    JMP  7,-178(7)	CALL outnl
212:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -20
* EXPRESSION
* CALL output
213:     ST  1,-20(1)	Store fp in ghost frame for output
* TOFF dec: -21
* TOFF dec: -22
* Param 1
214:     LD  3,-16(0)	Load variable sia
215:     ST  3,-22(1)	Push parameter 
* TOFF dec: -23
* Param end output
216:    LDA  1,-20(1)	Ghost frame becomes new active frame 
217:    LDA  3,1(7)	Return address in ac 
218:    JMP  7,-213(7)	CALL output
219:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -20
* EXPRESSION
* CALL outnl
220:     ST  1,-20(1)	Store fp in ghost frame for outnl
* TOFF dec: -21
* TOFF dec: -22
* Param end outnl
221:    LDA  1,-20(1)	Ghost frame becomes new active frame 
222:    LDA  3,1(7)	Return address in ac 
223:    JMP  7,-190(7)	CALL outnl
224:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -20
* EXPRESSION
* CALL output
225:     ST  1,-20(1)	Store fp in ghost frame for output
* TOFF dec: -21
* TOFF dec: -22
* Param 1
226:    LDA  3,-18(0)	Load address of base of array sib
227:     LD  3,1(3)	Load array size 
228:     ST  3,-22(1)	Push parameter 
* TOFF dec: -23
* Param end output
229:    LDA  1,-20(1)	Ghost frame becomes new active frame 
230:    LDA  3,1(7)	Return address in ac 
231:    JMP  7,-226(7)	CALL output
232:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -20
* EXPRESSION
* CALL outnl
233:     ST  1,-20(1)	Store fp in ghost frame for outnl
* TOFF dec: -21
* TOFF dec: -22
* Param end outnl
234:    LDA  1,-20(1)	Ghost frame becomes new active frame 
235:    LDA  3,1(7)	Return address in ac 
236:    JMP  7,-203(7)	CALL outnl
237:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -20
* COMPOUND
* TOFF set: -42
238:    LDC  3,20(6)	load size of array y
239:     ST  3,-20(1)	save size of array y
240:    LDC  3,1(6)	Load Boolean constant 
241:    LDC  4,1(6)	Load 1 
242:    XOR  3,3,4	Op XOR to get logical not 
243:     ST  3,-41(1)	Store variable t
* Compound Body
* EXPRESSION
* CALL output
244:     ST  1,-42(1)	Store fp in ghost frame for output
* TOFF dec: -43
* TOFF dec: -44
* Param 1
245:    LDA  3,-21(1)	Load address of base of array y
246:     LD  3,1(3)	Load array size 
247:     ST  3,-44(1)	Push parameter 
* TOFF dec: -45
* Param end output
248:    LDA  1,-42(1)	Ghost frame becomes new active frame 
249:    LDA  3,1(7)	Return address in ac 
250:    JMP  7,-245(7)	CALL output
251:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -42
* EXPRESSION
* CALL outnl
252:     ST  1,-42(1)	Store fp in ghost frame for outnl
* TOFF dec: -43
* TOFF dec: -44
* Param end outnl
253:    LDA  1,-42(1)	Ghost frame becomes new active frame 
254:    LDA  3,1(7)	Return address in ac 
255:    JMP  7,-222(7)	CALL outnl
256:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -42
* EXPRESSION
* CALL outputb
257:     ST  1,-42(1)	Store fp in ghost frame for outputb
* TOFF dec: -43
* TOFF dec: -44
* Param 1
258:     LD  3,-41(1)	Load variable t
259:     ST  3,-44(1)	Push parameter 
* TOFF dec: -45
* Param end outputb
260:    LDA  1,-42(1)	Ghost frame becomes new active frame 
261:    LDA  3,1(7)	Return address in ac 
262:    JMP  7,-246(7)	CALL outputb
263:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -42
* EXPRESSION
* CALL outnl
264:     ST  1,-42(1)	Store fp in ghost frame for outnl
* TOFF dec: -43
* TOFF dec: -44
* Param end outnl
265:    LDA  1,-42(1)	Ghost frame becomes new active frame 
266:    LDA  3,1(7)	Return address in ac 
267:    JMP  7,-234(7)	CALL outnl
268:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -42
* TOFF set: -20
* END COMPOUND
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
269:    LDC  2,0(6)	Set return value to 0 
270:     LD  3,-1(1)	Load return address 
271:     LD  1,0(1)	Adjust fp 
272:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,272(7)	Jump to init [backpatch] 
* INIT
273:    LDA  1,-33(0)	set first frame at end of globals 
274:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
275:    LDC  3,111(6)	Load integer constant 
276:     ST  3,0(0)	Store variable ga
277:    LDC  3,1(6)	Load Boolean constant 
278:     ST  3,-1(0)	Store variable gb
279:    LDC  3,13(6)	load size of array gc
280:     ST  3,-2(0)	save size of array gc
281:    LDC  3,666(6)	Load integer constant 
282:     ST  3,-16(0)	Store variable sia
283:    LDC  3,15(6)	load size of array sib
284:     ST  3,-17(0)	save size of array sib
* END INIT GLOBALS AND STATICS
285:    LDA  3,1(7)	Return address in ac 
286:    JMP  7,-248(7)	Jump to main 
287:   HALT  0,0,0	DONE! 
* END INIT
