* =================================================
* C- compiler version C-S22
* Built: Apr 17 - May 8
* Author: Keller Lawson
* File Compiled:  homework_7/UnitTests_KL/h08.tm
* =================================================
* 
* START FUNC INPUT
  1:     ST  3,-1(1)	Store return addr 
  2:     IN  2,2,2	Get int input 
  3:     LD  3,-1(1)	Load return addr 
  4:     LD  1,0(1)	Adjust fp 
  5:    JMP  7,0(3)	Return 
* END FUNC INPUT
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* START FUNC OUTPUT
  6:     ST  3,-1(1)	Store return addr 
  7:     LD  3,-2(1)	Load return addr 
  8:    OUT  3,3,3	Output int 
  9:     LD  3,-1(1)	Load return addr 
 10:     LD  1,0(1)	Adjust fp 
 11:    JMP  7,0(3)	Return 
* END FUNC OUTPUT
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* START FUNC INPUTB
 12:     ST  3,-1(1)	Store return addr 
 13:    INB  2,2,2	Get bool input 
 14:     LD  3,-1(1)	Load return addr 
 15:     LD  1,0(1)	Adjust fp 
 16:    JMP  7,0(3)	Return 
* END FUNC INPUTB
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* START FUNC OUTPUTB
 17:     ST  3,-1(1)	Store return addr 
 18:     LD  3,-2(1)	Load return addr 
 19:   OUTB  3,3,3	Output bool 
 20:     LD  3,-1(1)	Load return addr 
 21:     LD  1,0(1)	Adjust fp 
 22:    JMP  7,0(3)	Return 
* END FUNC OUTPUTB
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* START FUNC INPUTC
 23:     ST  3,-1(1)	Store return addr 
 24:    INC  2,2,2	Get char input 
 25:     LD  3,-1(1)	Load return addr 
 26:     LD  1,0(1)	Adjust fp 
 27:    JMP  7,0(3)	Return 
* END FUNC INPUTC
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* START FUNC OUTPUTC
 28:     ST  3,-1(1)	Store return addr 
 29:     LD  3,-2(1)	Load return addr 
 30:   OUTC  3,3,3	Output char 
 31:     LD  3,-1(1)	Load return addr 
 32:     LD  1,0(1)	Adjust fp 
 33:    JMP  7,0(3)	Return 
* END FUNC OUTPUTC
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* START FUNC OUTNL
 34:     ST  3,-1(1)	Store return addr 
 35:  OUTNL  3,3,3	Output newline 
 36:     LD  3,-1(1)	Load return addr 
 37:     LD  1,0(1)	Adjust fp 
 38:    JMP  7,0(3)	Return 
* END FUNC OUTNL
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FuncK fib
* LOFF Line96: -4
 39:     ST  3,-1(1)	Store return addr 
* COMPOUND
* LOFF Line188: -4
* START COMPOUND BODY
* START CALL output
 40:     ST  1,-4(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -5
* LOFF Line685: -6
* START ID
 41:     LD  3,-2(1)	Load var x
* END ID
 42:     ST  3,-6(1)	Push parameter 623 
* LOFF Line615: -7
* END Param 1
 43:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 44:    LDA  3,1(7)	Load return addr 
* BackPatch 45
 45:    JMP  7,-40(7)	CALL OUTPUT output
 46:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -4
* START CALL outnl
 47:     ST  1,-4(1)	Store fp in ghost frame for outnl
 48:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 49:    LDA  3,1(7)	Load return addr 
* BackPatch 50
 50:    JMP  7,-17(7)	CALL OUTPUT outnl
 51:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -4
* START IF
* START OP  <
* START ID
 52:     LD  3,-2(1)	Load var x
* END ID
 53:     ST  3,-4(1)	Push left side1 
* LOFF Line 289: -5
 54:    LDC  3,2(6)	Load int const 
* LOFF Line 292: -4
 55:     LD  4,-4(1)	Pop left into acl 1 
 56:    TLT  3,4,3	Op <
* END OP  <
* THEN
* COMPOUND
* LOFF Line188: -4
* START COMPOUND BODY
* START ASSIGN
 58:    LDC  3,0(6)	Load int const 
 59:     ST  3,-4(1)	Push index on 
* LOFF Line 478: -5
* START ASSIGN
 60:    LDC  3,1(6)	Load int const 
 61:     ST  3,-5(1)	Push index on 
* LOFF Line 478: -6
 62:    LDC  3,1(6)	Load int const 
* LOFF Line 481: -5
 63:     LD  4,-5(1)	Pop index off 
 64:     LD  5,-3(1)	Load address of base of array 395 f
 65:    SUB  5,5,4	Compute offset of value 
 66:     ST  3,0(5)	Store var f
* END ASSIGN
* LOFF Line 481: -4
 67:     LD  4,-4(1)	Pop index off 
 68:     LD  5,-3(1)	Load address of base of array 395 f
 69:    SUB  5,5,4	Compute offset of value 
 70:     ST  3,0(5)	Store var f
* END ASSIGN
* RETURN
* START OP  [
* START ID
 71:     LD  3,-3(1)	Load address of base of array3 f
* END ID
 72:     ST  3,-4(1)	Push left side1 
* LOFF Line 289: -5
* START ID
 73:     LD  3,-2(1)	Load var x
* END ID
* LOFF Line 292: -4
 74:     LD  4,-4(1)	Pop left into acl 1 
 75:    SUB  3,4,3	compute location from index 
 76:     LD  3,0(3)	Load array element 
* END OP  [
 77:    LDA  2,0(3)	Copy to return register 
 78:     LD  3,-1(1)	Load return address 
 79:     LD  1,0(1)	Adjust fp 
 80:    JMP  7,0(3)	Return 
* END RETURN
* END COMPOUND BODY
* END COMPOUND
 57:    JZR  3,23(7)	Jump around THEN if false [backpatch] 
* END IF
* START CALL fib
 81:     ST  1,-4(1)	Store fp in ghost frame for  fib
* LOFF Line698: -5
* LOFF Line704: -6
* START Param 1
* LUChild->non array -
* START OP  -
* START ID
 82:     LD  3,-2(1)	Load var x
* END ID
 83:     ST  3,-6(1)	Push left side1 
* LOFF Line 289: -7
 84:    LDC  3,1(6)	Load int const 
* LOFF Line 292: -6
 85:     LD  4,-6(1)	Pop left into acl 1 
 86:    SUB  3,4,3	Op -
* END OP  -
 87:     ST  3,-6(1)	Push Parameter 
* END Param 1
* LOFF Line704: -7
* START Param 2
 88:     LD  3,-3(1)	Load address of base of array 841 f
 89:     ST  3,-7(1)	Push Parameter 
* END Param 2
 90:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 91:    LDA  3,1(7)	Load return addr 
* BackPatch 92
 92:    JMP  7,-54(7)	CALL OUTPUT fib
 93:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -4
* START ASSIGN
* START ID
 94:     LD  3,-2(1)	Load var x
* END ID
 95:     ST  3,-4(1)	Push index on 
* LOFF Line 478: -5
* START OP  +
* START OP  [
* START ID
 96:     LD  3,-3(1)	Load address of base of array3 f
* END ID
 97:     ST  3,-5(1)	Push left side1 
* LOFF Line 289: -6
* START OP  -
* START ID
 98:     LD  3,-2(1)	Load var x
* END ID
 99:     ST  3,-6(1)	Push left side1 
* LOFF Line 289: -7
100:    LDC  3,1(6)	Load int const 
* LOFF Line 292: -6
101:     LD  4,-6(1)	Pop left into acl 1 
102:    SUB  3,4,3	Op -
* END OP  -
* LOFF Line 292: -5
103:     LD  4,-5(1)	Pop left into acl 1 
104:    SUB  3,4,3	compute location from index 
105:     LD  3,0(3)	Load array element 
* END OP  [
106:     ST  3,-5(1)	Push left side1 
* LOFF Line 289: -6
* START OP  [
* START ID
107:     LD  3,-3(1)	Load address of base of array3 f
* END ID
108:     ST  3,-6(1)	Push left side1 
* LOFF Line 289: -7
* START OP  -
* START ID
109:     LD  3,-2(1)	Load var x
* END ID
110:     ST  3,-7(1)	Push left side1 
* LOFF Line 289: -8
111:    LDC  3,2(6)	Load int const 
* LOFF Line 292: -7
112:     LD  4,-7(1)	Pop left into acl 1 
113:    SUB  3,4,3	Op -
* END OP  -
* LOFF Line 292: -6
114:     LD  4,-6(1)	Pop left into acl 1 
115:    SUB  3,4,3	compute location from index 
116:     LD  3,0(3)	Load array element 
* END OP  [
* LOFF Line 292: -5
117:     LD  4,-5(1)	Pop left into acl 1 
118:    ADD  3,4,3	Op +
* END OP  +
* LOFF Line 481: -4
119:     LD  4,-4(1)	Pop index off 
120:     LD  5,-3(1)	Load address of base of array 395 f
121:    SUB  5,5,4	Compute offset of value 
122:     ST  3,0(5)	Store var f
* END ASSIGN
* RETURN
* START OP  [
* START ID
123:     LD  3,-3(1)	Load address of base of array3 f
* END ID
124:     ST  3,-4(1)	Push left side1 
* LOFF Line 289: -5
* START ID
125:     LD  3,-2(1)	Load var x
* END ID
* LOFF Line 292: -4
126:     LD  4,-4(1)	Pop left into acl 1 
127:    SUB  3,4,3	compute location from index 
128:     LD  3,0(3)	Load array element 
* END OP  [
129:    LDA  2,0(3)	Copy to return register 
130:     LD  3,-1(1)	Load return address 
131:     LD  1,0(1)	Adjust fp 
132:    JMP  7,0(3)	Return 
* END RETURN
* END COMPOUND BODY
* END COMPOUND
133:    LDC  2,0(6)	Set return value to 0 
134:     LD  3,-1(1)	Load return address 
135:     LD  1,0(1)	Adjust fp 
136:    JMP  7,0(3)	return 
* End of Function fib
* 
* =========================================================
* FuncK main
* LOFF Line96: -4
137:     ST  3,-1(1)	Store return addr 
* COMPOUND
* LOFF Line188: -10
* START COMPOUND BODY
138:    LDC  3,7(6)	load array size f
139:     ST  3,-2(1)	save array size f
* START ASSIGN
140:    LDC  3,0(6)	Load int const 
141:     ST  3,-10(1)	Push index on 
* LOFF Line 478: -11
142:    LDC  3,0(6)	Load int const 
* LOFF Line 481: -10
143:     LD  4,-10(1)	Pop index off 
144:    LDA  5,-3(1)	Load address of base of array 398 f
145:    SUB  5,5,4	Compute offset of value 
146:     ST  3,0(5)	Store var f
* END ASSIGN
* START ASSIGN
147:    LDC  3,1(6)	Load int const 
148:     ST  3,-10(1)	Push index on 
* LOFF Line 478: -11
149:    LDC  3,0(6)	Load int const 
* LOFF Line 481: -10
150:     LD  4,-10(1)	Pop index off 
151:    LDA  5,-3(1)	Load address of base of array 398 f
152:    SUB  5,5,4	Compute offset of value 
153:     ST  3,0(5)	Store var f
* END ASSIGN
* START ASSIGN
154:    LDC  3,2(6)	Load int const 
155:     ST  3,-10(1)	Push index on 
* LOFF Line 478: -11
156:    LDC  3,0(6)	Load int const 
* LOFF Line 481: -10
157:     LD  4,-10(1)	Pop index off 
158:    LDA  5,-3(1)	Load address of base of array 398 f
159:    SUB  5,5,4	Compute offset of value 
160:     ST  3,0(5)	Store var f
* END ASSIGN
* START ASSIGN
161:    LDC  3,3(6)	Load int const 
162:     ST  3,-10(1)	Push index on 
* LOFF Line 478: -11
163:    LDC  3,0(6)	Load int const 
* LOFF Line 481: -10
164:     LD  4,-10(1)	Pop index off 
165:    LDA  5,-3(1)	Load address of base of array 398 f
166:    SUB  5,5,4	Compute offset of value 
167:     ST  3,0(5)	Store var f
* END ASSIGN
* START ASSIGN
168:    LDC  3,4(6)	Load int const 
169:     ST  3,-10(1)	Push index on 
* LOFF Line 478: -11
170:    LDC  3,0(6)	Load int const 
* LOFF Line 481: -10
171:     LD  4,-10(1)	Pop index off 
172:    LDA  5,-3(1)	Load address of base of array 398 f
173:    SUB  5,5,4	Compute offset of value 
174:     ST  3,0(5)	Store var f
* END ASSIGN
* START ASSIGN
175:    LDC  3,5(6)	Load int const 
176:     ST  3,-10(1)	Push index on 
* LOFF Line 478: -11
177:    LDC  3,0(6)	Load int const 
* LOFF Line 481: -10
178:     LD  4,-10(1)	Pop index off 
179:    LDA  5,-3(1)	Load address of base of array 398 f
180:    SUB  5,5,4	Compute offset of value 
181:     ST  3,0(5)	Store var f
* END ASSIGN
* START ASSIGN
182:    LDC  3,6(6)	Load int const 
183:     ST  3,-10(1)	Push index on 
* LOFF Line 478: -11
184:    LDC  3,0(6)	Load int const 
* LOFF Line 481: -10
185:     LD  4,-10(1)	Pop index off 
186:    LDA  5,-3(1)	Load address of base of array 398 f
187:    SUB  5,5,4	Compute offset of value 
188:     ST  3,0(5)	Store var f
* END ASSIGN
* START CALL fib
189:     ST  1,-10(1)	Store fp in ghost frame for  fib
* LOFF Line698: -11
* LOFF Line704: -12
* START Param 1
190:    LDC  3,5(6)	Load int const 
191:     ST  3,-12(1)	Push Parameter 
* END Param 1
* LOFF Line704: -13
* START Param 2
192:    LDA  3,-3(1)	Load address of base of array 844 f
193:     ST  3,-13(1)	Push Parameter 
* END Param 2
194:    LDA  1,-10(1)	Ghost frame becomes new active frame 
195:    LDA  3,1(7)	Load return addr 
* BackPatch 196
196:    JMP  7,-158(7)	CALL OUTPUT fib
197:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -10
* START CALL output
* START Param 1 array op 606
198:     ST  1,-10(1)	Store fp in ghost frame for  output
* START ID
199:    LDA  3,-3(1)	Load address of base of array2 f
* END ID
200:     ST  3,-12(1)	Push left 610 
* LOFF Line614: -13
201:    LDC  3,0(6)	Load int const 
202:     LD  4,-12(1)	Pop left into acl 1 
203:    SUB  3,4,3	compute location from index 
204:     LD  3,0(3)	Load array element 
205:     ST  3,-12(1)	Push parameter 618 
* LOFF Line622: -13
* END Param 1
206:    LDA  1,-10(1)	Ghost frame becomes new active frame 
207:    LDA  3,1(7)	Load return addr 
* BackPatch 208
208:    JMP  7,-203(7)	CALL OUTPUT output
209:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -10
* START CALL output
* START Param 1 array op 606
210:     ST  1,-10(1)	Store fp in ghost frame for  output
* START ID
211:    LDA  3,-3(1)	Load address of base of array2 f
* END ID
212:     ST  3,-12(1)	Push left 610 
* LOFF Line614: -13
213:    LDC  3,1(6)	Load int const 
214:     LD  4,-12(1)	Pop left into acl 1 
215:    SUB  3,4,3	compute location from index 
216:     LD  3,0(3)	Load array element 
217:     ST  3,-12(1)	Push parameter 618 
* LOFF Line622: -13
* END Param 1
218:    LDA  1,-10(1)	Ghost frame becomes new active frame 
219:    LDA  3,1(7)	Load return addr 
* BackPatch 220
220:    JMP  7,-215(7)	CALL OUTPUT output
221:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -10
* START CALL output
* START Param 1 array op 606
222:     ST  1,-10(1)	Store fp in ghost frame for  output
* START ID
223:    LDA  3,-3(1)	Load address of base of array2 f
* END ID
224:     ST  3,-12(1)	Push left 610 
* LOFF Line614: -13
225:    LDC  3,2(6)	Load int const 
226:     LD  4,-12(1)	Pop left into acl 1 
227:    SUB  3,4,3	compute location from index 
228:     LD  3,0(3)	Load array element 
229:     ST  3,-12(1)	Push parameter 618 
* LOFF Line622: -13
* END Param 1
230:    LDA  1,-10(1)	Ghost frame becomes new active frame 
231:    LDA  3,1(7)	Load return addr 
* BackPatch 232
232:    JMP  7,-227(7)	CALL OUTPUT output
233:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -10
* START CALL output
* START Param 1 array op 606
234:     ST  1,-10(1)	Store fp in ghost frame for  output
* START ID
235:    LDA  3,-3(1)	Load address of base of array2 f
* END ID
236:     ST  3,-12(1)	Push left 610 
* LOFF Line614: -13
237:    LDC  3,3(6)	Load int const 
238:     LD  4,-12(1)	Pop left into acl 1 
239:    SUB  3,4,3	compute location from index 
240:     LD  3,0(3)	Load array element 
241:     ST  3,-12(1)	Push parameter 618 
* LOFF Line622: -13
* END Param 1
242:    LDA  1,-10(1)	Ghost frame becomes new active frame 
243:    LDA  3,1(7)	Load return addr 
* BackPatch 244
244:    JMP  7,-239(7)	CALL OUTPUT output
245:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -10
* START CALL output
* START Param 1 array op 606
246:     ST  1,-10(1)	Store fp in ghost frame for  output
* START ID
247:    LDA  3,-3(1)	Load address of base of array2 f
* END ID
248:     ST  3,-12(1)	Push left 610 
* LOFF Line614: -13
249:    LDC  3,4(6)	Load int const 
250:     LD  4,-12(1)	Pop left into acl 1 
251:    SUB  3,4,3	compute location from index 
252:     LD  3,0(3)	Load array element 
253:     ST  3,-12(1)	Push parameter 618 
* LOFF Line622: -13
* END Param 1
254:    LDA  1,-10(1)	Ghost frame becomes new active frame 
255:    LDA  3,1(7)	Load return addr 
* BackPatch 256
256:    JMP  7,-251(7)	CALL OUTPUT output
257:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -10
* START CALL output
* START Param 1 array op 606
258:     ST  1,-10(1)	Store fp in ghost frame for  output
* START ID
259:    LDA  3,-3(1)	Load address of base of array2 f
* END ID
260:     ST  3,-12(1)	Push left 610 
* LOFF Line614: -13
261:    LDC  3,5(6)	Load int const 
262:     LD  4,-12(1)	Pop left into acl 1 
263:    SUB  3,4,3	compute location from index 
264:     LD  3,0(3)	Load array element 
265:     ST  3,-12(1)	Push parameter 618 
* LOFF Line622: -13
* END Param 1
266:    LDA  1,-10(1)	Ghost frame becomes new active frame 
267:    LDA  3,1(7)	Load return addr 
* BackPatch 268
268:    JMP  7,-263(7)	CALL OUTPUT output
269:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -10
* START CALL output
* START Param 1 array op 606
270:     ST  1,-10(1)	Store fp in ghost frame for  output
* START ID
271:    LDA  3,-3(1)	Load address of base of array2 f
* END ID
272:     ST  3,-12(1)	Push left 610 
* LOFF Line614: -13
273:    LDC  3,6(6)	Load int const 
274:     LD  4,-12(1)	Pop left into acl 1 
275:    SUB  3,4,3	compute location from index 
276:     LD  3,0(3)	Load array element 
277:     ST  3,-12(1)	Push parameter 618 
* LOFF Line622: -13
* END Param 1
278:    LDA  1,-10(1)	Ghost frame becomes new active frame 
279:    LDA  3,1(7)	Load return addr 
* BackPatch 280
280:    JMP  7,-275(7)	CALL OUTPUT output
281:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -10
* START CALL outnl
282:     ST  1,-10(1)	Store fp in ghost frame for outnl
283:    LDA  1,-10(1)	Ghost frame becomes new active frame 
284:    LDA  3,1(7)	Load return addr 
* BackPatch 285
285:    JMP  7,-252(7)	CALL OUTPUT outnl
286:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -10
* END COMPOUND BODY
* END COMPOUND
287:    LDC  2,0(6)	Set return value to 0 
288:     LD  3,-1(1)	Load return address 
289:     LD  1,0(1)	Adjust fp 
290:    JMP  7,0(3)	return 
* End of Function main
* 
* =========================================================
  0:    JMP  7,290(7)	Jump to init 
* START INIT
291:    LDA  1,0(0)	Set first frame after globals 
292:     ST  1,0(1)	Store old fp 
* START INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
293:    LDA  3,1(7)	Load return address 
294:    JMP  7,-158(7)	Jump to main 
295:   HALT  0,0,0	DONE 
* END INIT
