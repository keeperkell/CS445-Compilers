* =================================================
* C- compiler version C-S22
* Built: Apr 17 - May 8
* Author: Keller Lawson
* File Compiled:  homework_7/UnitTests_KL/e05.tm
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
* FuncK main
* LOFF Line96: -2
 39:     ST  3,-1(1)	Store return addr 
* COMPOUND
* LOFF Line188: -3
* START COMPOUND BODY
* START IF
 40:    LDC  3,1(6)	Load bool const 
* THEN
* START IF
 42:    LDC  3,1(6)	Load bool const 
* THEN
* START CALL
 44:     ST  1,-3(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
 45:    LDC  3,13(6)	Load int const 
 46:     ST  3,-5(1)	Push parameter 623 
* LOFF Line615: -6
* END Param 1
 47:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 48:    LDA  3,1(7)	Load return addr 
* BackPatch 49
 49:    JMP  7,-44(7)	CALL OUTPUT output
 50:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
 43:    JZR  3,7(7)	Jump around THEN if false [backpatch] 
* END IF
 41:    JZR  3,9(7)	Jump around THEN if false [backpatch] 
* END IF
* START IF
 51:    LDC  3,1(6)	Load bool const 
* THEN
* START IF
 53:    LDC  3,0(6)	Load bool const 
* THEN
* START CALL
 55:     ST  1,-3(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
 56:    LDC  3,23(6)	Load int const 
 57:     ST  3,-5(1)	Push parameter 623 
* LOFF Line615: -6
* END Param 1
 58:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 59:    LDA  3,1(7)	Load return addr 
* BackPatch 60
 60:    JMP  7,-55(7)	CALL OUTPUT output
 61:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
 54:    JZR  3,7(7)	Jump around THEN if false [backpatch] 
* END IF
 52:    JZR  3,9(7)	Jump around THEN if false [backpatch] 
* END IF
* START ASSIGN
 62:    LDC  3,0(6)	Load bool const 
* START ID
 63:     ST  3,-2(1)	Store var x
* END ID
* END ASSIGN
* START IF
 64:    LDC  3,1(6)	Load bool const 
* THEN
* START IF
* START ID
 66:     LD  3,-2(1)	Load var x
* END ID
* THEN
* START CALL
 68:     ST  1,-3(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
 69:    LDC  3,44(6)	Load int const 
 70:     ST  3,-5(1)	Push parameter 623 
* LOFF Line615: -6
* END Param 1
 71:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 72:    LDA  3,1(7)	Load return addr 
* BackPatch 73
 73:    JMP  7,-68(7)	CALL OUTPUT output
 74:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
 67:    JZR  3,7(7)	Jump around THEN if false [backpatch] 
* END IF
 65:    JZR  3,9(7)	Jump around THEN if false [backpatch] 
* END IF
* START IF
 75:    LDC  3,1(6)	Load bool const 
* THEN
* START IF
* START OP  not
* START ID
 77:     LD  3,-2(1)	Load var x
* END ID
 78:    LDC  4,1(6)	Load 1 
 79:    XOR  3,3,4	Op XOR for logical not 
* END OP  not
* THEN
* START CALL
 81:     ST  1,-3(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
 82:    LDC  3,55(6)	Load int const 
 83:     ST  3,-5(1)	Push parameter 623 
* LOFF Line615: -6
* END Param 1
 84:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 85:    LDA  3,1(7)	Load return addr 
* BackPatch 86
 86:    JMP  7,-81(7)	CALL OUTPUT output
 87:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
 80:    JZR  3,7(7)	Jump around THEN if false [backpatch] 
* END IF
 76:    JZR  3,11(7)	Jump around THEN if false [backpatch] 
* END IF
* START IF
 88:    LDC  3,1(6)	Load bool const 
* THEN
* START IF
* START OP  >
 90:    LDC  3,3(6)	Load int const 
 91:     ST  3,-3(1)	Push left side1 
* LOFF Line 289: -4
 92:    LDC  3,1(6)	Load int const 
* LOFF Line 292: -3
 93:     LD  4,-3(1)	Pop left into acl 1 
 94:    TGT  3,4,3	Op >
* END OP  >
* THEN
* START CALL
 96:     ST  1,-3(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
 97:    LDC  3,987(6)	Load int const 
 98:     ST  3,-5(1)	Push parameter 623 
* LOFF Line615: -6
* END Param 1
 99:    LDA  1,-3(1)	Ghost frame becomes new active frame 
100:    LDA  3,1(7)	Load return addr 
* BackPatch 101
101:    JMP  7,-96(7)	CALL OUTPUT output
102:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
 95:    JZR  3,7(7)	Jump around THEN if false [backpatch] 
* END IF
 89:    JZR  3,13(7)	Jump around THEN if false [backpatch] 
* END IF
* START IF
103:    LDC  3,1(6)	Load bool const 
* THEN
* START IF
* START OP  <
105:    LDC  3,3(6)	Load int const 
106:     ST  3,-3(1)	Push left side1 
* LOFF Line 289: -4
107:    LDC  3,1(6)	Load int const 
* LOFF Line 292: -3
108:     LD  4,-3(1)	Pop left into acl 1 
109:    TLT  3,4,3	Op <
* END OP  <
* THEN
* START CALL
111:     ST  1,-3(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
112:    LDC  3,211(6)	Load int const 
113:     ST  3,-5(1)	Push parameter 623 
* LOFF Line615: -6
* END Param 1
114:    LDA  1,-3(1)	Ghost frame becomes new active frame 
115:    LDA  3,1(7)	Load return addr 
* BackPatch 116
116:    JMP  7,-111(7)	CALL OUTPUT output
117:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
110:    JZR  3,7(7)	Jump around THEN if false [backpatch] 
* END IF
104:    JZR  3,13(7)	Jump around THEN if false [backpatch] 
* END IF
* START IF
118:    LDC  3,1(6)	Load bool const 
* THEN
* START IF
120:    LDC  3,1(6)	Load bool const 
* THEN
* START CALL
122:     ST  1,-3(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
123:    LDC  3,13(6)	Load int const 
124:     ST  3,-5(1)	Push parameter 623 
* LOFF Line615: -6
* END Param 1
125:    LDA  1,-3(1)	Ghost frame becomes new active frame 
126:    LDA  3,1(7)	Load return addr 
* BackPatch 127
127:    JMP  7,-122(7)	CALL OUTPUT output
128:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
121:    JZR  3,8(7)	Jump around THEN if false [backpatch] 
* ELSE
* START CALL
130:     ST  1,-3(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
131:    LDC  3,51(6)	Load int const 
132:     ST  3,-5(1)	Push parameter 623 
* LOFF Line615: -6
* END Param 1
133:    LDA  1,-3(1)	Ghost frame becomes new active frame 
134:    LDA  3,1(7)	Load return addr 
* BackPatch 135
135:    JMP  7,-130(7)	CALL OUTPUT output
136:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
129:    JMP  3,7(7)	Jump around ELSE [backpatch] 
* END IF
119:    JZR  3,17(7)	Jump around THEN if false [backpatch] 
* END IF
* START IF
137:    LDC  3,1(6)	Load bool const 
* THEN
* START IF
139:    LDC  3,0(6)	Load bool const 
* THEN
* START CALL
141:     ST  1,-3(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
142:    LDC  3,23(6)	Load int const 
143:     ST  3,-5(1)	Push parameter 623 
* LOFF Line615: -6
* END Param 1
144:    LDA  1,-3(1)	Ghost frame becomes new active frame 
145:    LDA  3,1(7)	Load return addr 
* BackPatch 146
146:    JMP  7,-141(7)	CALL OUTPUT output
147:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
140:    JZR  3,8(7)	Jump around THEN if false [backpatch] 
* ELSE
* START CALL
149:     ST  1,-3(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
150:    LDC  3,451(6)	Load int const 
151:     ST  3,-5(1)	Push parameter 623 
* LOFF Line615: -6
* END Param 1
152:    LDA  1,-3(1)	Ghost frame becomes new active frame 
153:    LDA  3,1(7)	Load return addr 
* BackPatch 154
154:    JMP  7,-149(7)	CALL OUTPUT output
155:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
148:    JMP  3,7(7)	Jump around ELSE [backpatch] 
* END IF
138:    JZR  3,17(7)	Jump around THEN if false [backpatch] 
* END IF
* START ASSIGN
156:    LDC  3,0(6)	Load bool const 
* START ID
157:     ST  3,-2(1)	Store var x
* END ID
* END ASSIGN
* START IF
158:    LDC  3,1(6)	Load bool const 
* THEN
* START IF
* START ID
160:     LD  3,-2(1)	Load var x
* END ID
* THEN
* START CALL
162:     ST  1,-3(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
163:    LDC  3,44(6)	Load int const 
164:     ST  3,-5(1)	Push parameter 623 
* LOFF Line615: -6
* END Param 1
165:    LDA  1,-3(1)	Ghost frame becomes new active frame 
166:    LDA  3,1(7)	Load return addr 
* BackPatch 167
167:    JMP  7,-162(7)	CALL OUTPUT output
168:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
161:    JZR  3,8(7)	Jump around THEN if false [backpatch] 
* ELSE
* START CALL
170:     ST  1,-3(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
171:    LDC  3,514(6)	Load int const 
172:     ST  3,-5(1)	Push parameter 623 
* LOFF Line615: -6
* END Param 1
173:    LDA  1,-3(1)	Ghost frame becomes new active frame 
174:    LDA  3,1(7)	Load return addr 
* BackPatch 175
175:    JMP  7,-170(7)	CALL OUTPUT output
176:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
169:    JMP  3,7(7)	Jump around ELSE [backpatch] 
* END IF
159:    JZR  3,17(7)	Jump around THEN if false [backpatch] 
* END IF
* START IF
177:    LDC  3,1(6)	Load bool const 
* THEN
* START IF
* START OP  not
* START ID
179:     LD  3,-2(1)	Load var x
* END ID
180:    LDC  4,1(6)	Load 1 
181:    XOR  3,3,4	Op XOR for logical not 
* END OP  not
* THEN
* START CALL
183:     ST  1,-3(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
184:    LDC  3,55(6)	Load int const 
185:     ST  3,-5(1)	Push parameter 623 
* LOFF Line615: -6
* END Param 1
186:    LDA  1,-3(1)	Ghost frame becomes new active frame 
187:    LDA  3,1(7)	Load return addr 
* BackPatch 188
188:    JMP  7,-183(7)	CALL OUTPUT output
189:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
182:    JZR  3,8(7)	Jump around THEN if false [backpatch] 
* ELSE
* START CALL
191:     ST  1,-3(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
192:    LDC  3,1514(6)	Load int const 
193:     ST  3,-5(1)	Push parameter 623 
* LOFF Line615: -6
* END Param 1
194:    LDA  1,-3(1)	Ghost frame becomes new active frame 
195:    LDA  3,1(7)	Load return addr 
* BackPatch 196
196:    JMP  7,-191(7)	CALL OUTPUT output
197:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
190:    JMP  3,7(7)	Jump around ELSE [backpatch] 
* END IF
178:    JZR  3,19(7)	Jump around THEN if false [backpatch] 
* END IF
* START IF
198:    LDC  3,1(6)	Load bool const 
* THEN
* START IF
* START OP  >
200:    LDC  3,3(6)	Load int const 
201:     ST  3,-3(1)	Push left side1 
* LOFF Line 289: -4
202:    LDC  3,1(6)	Load int const 
* LOFF Line 292: -3
203:     LD  4,-3(1)	Pop left into acl 1 
204:    TGT  3,4,3	Op >
* END OP  >
* THEN
* START CALL
206:     ST  1,-3(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
207:    LDC  3,987(6)	Load int const 
208:     ST  3,-5(1)	Push parameter 623 
* LOFF Line615: -6
* END Param 1
209:    LDA  1,-3(1)	Ghost frame becomes new active frame 
210:    LDA  3,1(7)	Load return addr 
* BackPatch 211
211:    JMP  7,-206(7)	CALL OUTPUT output
212:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
205:    JZR  3,8(7)	Jump around THEN if false [backpatch] 
* ELSE
* START CALL
214:     ST  1,-3(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
215:    LDC  3,114(6)	Load int const 
216:     ST  3,-5(1)	Push parameter 623 
* LOFF Line615: -6
* END Param 1
217:    LDA  1,-3(1)	Ghost frame becomes new active frame 
218:    LDA  3,1(7)	Load return addr 
* BackPatch 219
219:    JMP  7,-214(7)	CALL OUTPUT output
220:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
213:    JMP  3,7(7)	Jump around ELSE [backpatch] 
* END IF
199:    JZR  3,21(7)	Jump around THEN if false [backpatch] 
* END IF
* START IF
221:    LDC  3,1(6)	Load bool const 
* THEN
* START IF
* START OP  <
223:    LDC  3,3(6)	Load int const 
224:     ST  3,-3(1)	Push left side1 
* LOFF Line 289: -4
225:    LDC  3,1(6)	Load int const 
* LOFF Line 292: -3
226:     LD  4,-3(1)	Pop left into acl 1 
227:    TLT  3,4,3	Op <
* END OP  <
* THEN
* START CALL
229:     ST  1,-3(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
230:    LDC  3,211(6)	Load int const 
231:     ST  3,-5(1)	Push parameter 623 
* LOFF Line615: -6
* END Param 1
232:    LDA  1,-3(1)	Ghost frame becomes new active frame 
233:    LDA  3,1(7)	Load return addr 
* BackPatch 234
234:    JMP  7,-229(7)	CALL OUTPUT output
235:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
228:    JZR  3,8(7)	Jump around THEN if false [backpatch] 
* ELSE
* START CALL
237:     ST  1,-3(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
238:    LDC  3,1614(6)	Load int const 
239:     ST  3,-5(1)	Push parameter 623 
* LOFF Line615: -6
* END Param 1
240:    LDA  1,-3(1)	Ghost frame becomes new active frame 
241:    LDA  3,1(7)	Load return addr 
* BackPatch 242
242:    JMP  7,-237(7)	CALL OUTPUT output
243:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
236:    JMP  3,7(7)	Jump around ELSE [backpatch] 
* END IF
222:    JZR  3,21(7)	Jump around THEN if false [backpatch] 
* END IF
* END COMPOUND BODY
* END COMPOUND
244:    LDC  2,0(6)	Set return value to 0 
245:     LD  3,-1(1)	Load return address 
246:     LD  1,0(1)	Adjust fp 
247:    JMP  7,0(3)	return 
* End of Function main
* 
* =========================================================
  0:    JMP  7,247(7)	Jump to init 
* START INIT
248:    LDA  1,0(0)	Set first frame after globals 
249:     ST  1,0(1)	Store old fp 
* START INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
250:    LDA  3,1(7)	Load return address 
251:    JMP  7,-213(7)	Jump to main 
252:   HALT  0,0,0	DONE 
* END INIT
