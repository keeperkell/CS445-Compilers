* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  v07.c-
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
* FUNCTION outputarray
* TOFF set: -3
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -4
* Compound Body
* EXPRESSION
 40:    LDC  3,0(6)	Load integer constant 
 41:     ST  3,-3(1)	Store variable i
* WHILE
 42:     LD  3,-3(1)	Load variable i
 43:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 44:     LD  3,-2(1)	Load address of base of array s
 45:     LD  3,1(3)	Load array size 
* TOFF inc: -4
 46:     LD  4,-4(1)	Pop left into ac1 
 47:    TLT  3,4,3	Op < 
 48:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -4
* Compound Body
* EXPRESSION
* CALL output
 50:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 51:     LD  3,-2(1)	Load address of base of array s
 52:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
 53:     LD  3,-3(1)	Load variable i
* TOFF inc: -6
 54:     LD  4,-6(1)	Pop left into ac1 
 55:    SUB  3,4,3	compute location from index 
 56:     LD  3,0(3)	Load array element 
 57:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
 58:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 59:    LDA  3,1(7)	Return address in ac 
 60:    JMP  7,-55(7)	CALL output
 61:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
 62:     LD  3,-3(1)	load lhs variable i
 63:    LDA  3,1(3)	increment value of i
 64:     ST  3,-3(1)	Store variable i
* TOFF set: -4
* END COMPOUND
 65:    JMP  7,-24(7)	go to beginning of loop 
 49:    JMP  7,16(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
* CALL outnl
 66:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
 67:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 68:    LDA  3,1(7)	Return address in ac 
 69:    JMP  7,-36(7)	CALL outnl
 70:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
 71:    LDC  2,0(6)	Set return value to 0 
 72:     LD  3,-1(1)	Load return address 
 73:     LD  1,0(1)	Adjust fp 
 74:    JMP  7,0(3)	Return 
* END FUNCTION outputarray
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
 75:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -38
 76:    LDC  3,9(6)	load size of array a
 77:     ST  3,-2(1)	save size of array a
 78:    LDC  3,4(6)	load size of array b
 79:     ST  3,-12(1)	save size of array b
 80:    LDC  3,6(6)	load size of array h
 81:     ST  3,-17(1)	save size of array h
 82:    LDC  3,2(6)	load size of array small
 83:     ST  3,-24(1)	save size of array small
 84:    LDC  3,10(6)	load size of array big
 85:     ST  3,-27(1)	save size of array big
* Compound Body
* TOFF set: -41
* FOR
 86:    LDC  3,0(6)	Load integer constant 
 87:     ST  3,-38(1)	save starting value in index variable 
 88:    LDC  3,9(6)	Load integer constant 
 89:     ST  3,-39(1)	save stop value 
 90:    LDC  3,1(6)	default increment by 1 
 91:     ST  3,-40(1)	save step value 
 92:     LD  4,-38(1)	loop index 
 93:     LD  5,-39(1)	stop value 
 94:     LD  3,-40(1)	step value 
 95:    SLT  3,4,5	Op < 
 96:    JNZ  3,1(7)	Jump to loop body 
* EXPRESSION
 98:     LD  3,-38(1)	Load variable i
 99:     ST  3,-41(1)	Push index 
* TOFF dec: -42
100:     LD  3,-38(1)	Load variable i
101:     ST  3,-42(1)	Push left side 
* TOFF dec: -43
102:    LDC  3,10(6)	Load integer constant 
* TOFF inc: -42
103:     LD  4,-42(1)	Pop left into ac1 
104:    ADD  3,4,3	Op + 
* TOFF inc: -41
105:     LD  4,-41(1)	Pop index 
106:    LDA  5,-3(1)	Load address of base of array a
107:    SUB  5,5,4	Compute offset of value 
108:     ST  3,0(5)	Store variable a
* Bottom of loop increment and jump
109:     LD  3,-38(1)	Load index 
110:     LD  5,-40(1)	Load step 
111:    ADD  3,3,5	increment 
112:     ST  3,-38(1)	store back to index 
113:    JMP  7,-22(7)	go to beginning of loop 
 97:    JMP  7,16(7)	Jump past loop [backpatch] 
* END LOOP
* TOFF set: -41
* FOR
114:    LDC  3,0(6)	Load integer constant 
115:     ST  3,-38(1)	save starting value in index variable 
116:    LDC  3,4(6)	Load integer constant 
117:     ST  3,-39(1)	save stop value 
118:    LDC  3,1(6)	default increment by 1 
119:     ST  3,-40(1)	save step value 
120:     LD  4,-38(1)	loop index 
121:     LD  5,-39(1)	stop value 
122:     LD  3,-40(1)	step value 
123:    SLT  3,4,5	Op < 
124:    JNZ  3,1(7)	Jump to loop body 
* EXPRESSION
126:     LD  3,-38(1)	Load variable i
127:     ST  3,-41(1)	Push index 
* TOFF dec: -42
128:     LD  3,-38(1)	Load variable i
129:     ST  3,-42(1)	Push left side 
* TOFF dec: -43
130:    LDC  3,200(6)	Load integer constant 
* TOFF inc: -42
131:     LD  4,-42(1)	Pop left into ac1 
132:    ADD  3,4,3	Op + 
* TOFF inc: -41
133:     LD  4,-41(1)	Pop index 
134:    LDA  5,-13(1)	Load address of base of array b
135:    SUB  5,5,4	Compute offset of value 
136:     ST  3,0(5)	Store variable b
* Bottom of loop increment and jump
137:     LD  3,-38(1)	Load index 
138:     LD  5,-40(1)	Load step 
139:    ADD  3,3,5	increment 
140:     ST  3,-38(1)	store back to index 
141:    JMP  7,-22(7)	go to beginning of loop 
125:    JMP  7,16(7)	Jump past loop [backpatch] 
* END LOOP
* TOFF set: -41
* FOR
142:    LDC  3,0(6)	Load integer constant 
143:     ST  3,-38(1)	save starting value in index variable 
144:    LDC  3,6(6)	Load integer constant 
145:     ST  3,-39(1)	save stop value 
146:    LDC  3,1(6)	default increment by 1 
147:     ST  3,-40(1)	save step value 
148:     LD  4,-38(1)	loop index 
149:     LD  5,-39(1)	stop value 
150:     LD  3,-40(1)	step value 
151:    SLT  3,4,5	Op < 
152:    JNZ  3,1(7)	Jump to loop body 
* EXPRESSION
154:     LD  3,-38(1)	Load variable i
155:     ST  3,-41(1)	Push index 
* TOFF dec: -42
156:     LD  3,-38(1)	Load variable i
157:     ST  3,-42(1)	Push left side 
* TOFF dec: -43
158:    LDC  3,3000(6)	Load integer constant 
* TOFF inc: -42
159:     LD  4,-42(1)	Pop left into ac1 
160:    ADD  3,4,3	Op + 
* TOFF inc: -41
161:     LD  4,-41(1)	Pop index 
162:    LDA  5,-18(1)	Load address of base of array h
163:    SUB  5,5,4	Compute offset of value 
164:     ST  3,0(5)	Store variable h
* Bottom of loop increment and jump
165:     LD  3,-38(1)	Load index 
166:     LD  5,-40(1)	Load step 
167:    ADD  3,3,5	increment 
168:     ST  3,-38(1)	store back to index 
169:    JMP  7,-22(7)	go to beginning of loop 
153:    JMP  7,16(7)	Jump past loop [backpatch] 
* END LOOP
* EXPRESSION
170:    LDC  3,9(6)	Load integer constant 
171:     ST  3,-41(1)	Push index 
* TOFF dec: -42
172:    LDC  3,2048(6)	Load integer constant 
* TOFF inc: -41
173:     LD  4,-41(1)	Pop index 
174:    LDA  5,-28(1)	Load address of base of array big
175:    SUB  5,5,4	Compute offset of value 
176:     ST  3,0(5)	Store variable big
* EXPRESSION
177:    LDA  3,-3(1)	Load address of base of array a
178:    LDA  4,-25(1)	address of lhs 
179:     LD  5,1(3)	size of rhs 
180:     LD  6,1(4)	size of lhs 
181:    SWP  5,6,6	pick smallest size 
182:    MOV  4,3,5	array op = 
* EXPRESSION
* CALL outputarray
183:     ST  1,-41(1)	Store fp in ghost frame for outputarray
* TOFF dec: -42
* TOFF dec: -43
* Param 1
184:    LDA  3,-25(1)	Load address of base of array small
185:     ST  3,-43(1)	Push parameter 
* TOFF dec: -44
* Param end outputarray
186:    LDA  1,-41(1)	Ghost frame becomes new active frame 
187:    LDA  3,1(7)	Return address in ac 
188:    JMP  7,-150(7)	CALL outputarray
189:    LDA  3,0(2)	Save the result in ac 
* Call end outputarray
* TOFF set: -41
* EXPRESSION
190:    LDA  3,-3(1)	Load address of base of array a
191:    LDA  4,-28(1)	address of lhs 
192:     LD  5,1(3)	size of rhs 
193:     LD  6,1(4)	size of lhs 
194:    SWP  5,6,6	pick smallest size 
195:    MOV  4,3,5	array op = 
* EXPRESSION
* CALL outputarray
196:     ST  1,-41(1)	Store fp in ghost frame for outputarray
* TOFF dec: -42
* TOFF dec: -43
* Param 1
197:    LDA  3,-28(1)	Load address of base of array big
198:     ST  3,-43(1)	Push parameter 
* TOFF dec: -44
* Param end outputarray
199:    LDA  1,-41(1)	Ghost frame becomes new active frame 
200:    LDA  3,1(7)	Return address in ac 
201:    JMP  7,-163(7)	CALL outputarray
202:    LDA  3,0(2)	Save the result in ac 
* Call end outputarray
* TOFF set: -41
* EXPRESSION
* CALL outnl
203:     ST  1,-41(1)	Store fp in ghost frame for outnl
* TOFF dec: -42
* TOFF dec: -43
* Param end outnl
204:    LDA  1,-41(1)	Ghost frame becomes new active frame 
205:    LDA  3,1(7)	Return address in ac 
206:    JMP  7,-173(7)	CALL outnl
207:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -41
* EXPRESSION
208:    LDA  3,-13(1)	Load address of base of array b
209:    LDA  4,-25(1)	address of lhs 
210:     LD  5,1(3)	size of rhs 
211:     LD  6,1(4)	size of lhs 
212:    SWP  5,6,6	pick smallest size 
213:    MOV  4,3,5	array op = 
* EXPRESSION
* CALL outputarray
214:     ST  1,-41(1)	Store fp in ghost frame for outputarray
* TOFF dec: -42
* TOFF dec: -43
* Param 1
215:    LDA  3,-25(1)	Load address of base of array small
216:     ST  3,-43(1)	Push parameter 
* TOFF dec: -44
* Param end outputarray
217:    LDA  1,-41(1)	Ghost frame becomes new active frame 
218:    LDA  3,1(7)	Return address in ac 
219:    JMP  7,-181(7)	CALL outputarray
220:    LDA  3,0(2)	Save the result in ac 
* Call end outputarray
* TOFF set: -41
* EXPRESSION
221:    LDA  3,-13(1)	Load address of base of array b
222:    LDA  4,-28(1)	address of lhs 
223:     LD  5,1(3)	size of rhs 
224:     LD  6,1(4)	size of lhs 
225:    SWP  5,6,6	pick smallest size 
226:    MOV  4,3,5	array op = 
* EXPRESSION
* CALL outputarray
227:     ST  1,-41(1)	Store fp in ghost frame for outputarray
* TOFF dec: -42
* TOFF dec: -43
* Param 1
228:    LDA  3,-28(1)	Load address of base of array big
229:     ST  3,-43(1)	Push parameter 
* TOFF dec: -44
* Param end outputarray
230:    LDA  1,-41(1)	Ghost frame becomes new active frame 
231:    LDA  3,1(7)	Return address in ac 
232:    JMP  7,-194(7)	CALL outputarray
233:    LDA  3,0(2)	Save the result in ac 
* Call end outputarray
* TOFF set: -41
* EXPRESSION
* CALL outnl
234:     ST  1,-41(1)	Store fp in ghost frame for outnl
* TOFF dec: -42
* TOFF dec: -43
* Param end outnl
235:    LDA  1,-41(1)	Ghost frame becomes new active frame 
236:    LDA  3,1(7)	Return address in ac 
237:    JMP  7,-204(7)	CALL outnl
238:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -41
* EXPRESSION
239:    LDA  3,-18(1)	Load address of base of array h
240:    LDA  4,-25(1)	address of lhs 
241:     LD  5,1(3)	size of rhs 
242:     LD  6,1(4)	size of lhs 
243:    SWP  5,6,6	pick smallest size 
244:    MOV  4,3,5	array op = 
* EXPRESSION
* CALL outputarray
245:     ST  1,-41(1)	Store fp in ghost frame for outputarray
* TOFF dec: -42
* TOFF dec: -43
* Param 1
246:    LDA  3,-25(1)	Load address of base of array small
247:     ST  3,-43(1)	Push parameter 
* TOFF dec: -44
* Param end outputarray
248:    LDA  1,-41(1)	Ghost frame becomes new active frame 
249:    LDA  3,1(7)	Return address in ac 
250:    JMP  7,-212(7)	CALL outputarray
251:    LDA  3,0(2)	Save the result in ac 
* Call end outputarray
* TOFF set: -41
* EXPRESSION
252:    LDA  3,-18(1)	Load address of base of array h
253:    LDA  4,-28(1)	address of lhs 
254:     LD  5,1(3)	size of rhs 
255:     LD  6,1(4)	size of lhs 
256:    SWP  5,6,6	pick smallest size 
257:    MOV  4,3,5	array op = 
* EXPRESSION
* CALL outputarray
258:     ST  1,-41(1)	Store fp in ghost frame for outputarray
* TOFF dec: -42
* TOFF dec: -43
* Param 1
259:    LDA  3,-28(1)	Load address of base of array big
260:     ST  3,-43(1)	Push parameter 
* TOFF dec: -44
* Param end outputarray
261:    LDA  1,-41(1)	Ghost frame becomes new active frame 
262:    LDA  3,1(7)	Return address in ac 
263:    JMP  7,-225(7)	CALL outputarray
264:    LDA  3,0(2)	Save the result in ac 
* Call end outputarray
* TOFF set: -41
* EXPRESSION
* CALL outnl
265:     ST  1,-41(1)	Store fp in ghost frame for outnl
* TOFF dec: -42
* TOFF dec: -43
* Param end outnl
266:    LDA  1,-41(1)	Ghost frame becomes new active frame 
267:    LDA  3,1(7)	Return address in ac 
268:    JMP  7,-235(7)	CALL outnl
269:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -41
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
270:    LDC  2,0(6)	Set return value to 0 
271:     LD  3,-1(1)	Load return address 
272:     LD  1,0(1)	Adjust fp 
273:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,273(7)	Jump to init [backpatch] 
* INIT
274:    LDA  1,0(0)	set first frame at end of globals 
275:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
276:    LDA  3,1(7)	Return address in ac 
277:    JMP  7,-203(7)	Jump to main 
278:   HALT  0,0,0	DONE! 
* END INIT
