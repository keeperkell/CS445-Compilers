* =================================================
* C- compiler version C-S22
* Built: Apr 17 - May 8
* Author: Keller Lawson
* File Compiled:  homework_7/UnitTests_KL/e01.tm
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
* START CALL
 42:     ST  1,-3(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
 43:    LDC  3,13(6)	Load int const 
 44:     ST  3,-5(1)	Push parameter 623 
* LOFF Line615: -6
* END Param 1
 45:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 46:    LDA  3,1(7)	Load return addr 
* BackPatch 47
 47:    JMP  7,-42(7)	CALL OUTPUT output
 48:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
 41:    JZR  3,7(7)	Jump around THEN if false [backpatch] 
* END IF
* START CALL
 49:     ST  1,-3(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
 50:    LDC  3,23(6)	Load int const 
 51:     ST  3,-5(1)	Push parameter 623 
* LOFF Line615: -6
* END Param 1
 52:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 53:    LDA  3,1(7)	Load return addr 
* BackPatch 54
 54:    JMP  7,-49(7)	CALL OUTPUT output
 55:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
* START CALL
 56:     ST  1,-3(1)	Store fp in ghost frame for outnl
 57:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 58:    LDA  3,1(7)	Load return addr 
* BackPatch 59
 59:    JMP  7,-26(7)	CALL OUTPUT outnl
 60:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
* START ASSIGN
 61:    LDC  3,0(6)	Load bool const 
* START ID
 62:     ST  3,-2(1)	Store var x
* END ID
* END ASSIGN
* START IF
* START ID
 63:     LD  3,-2(1)	Load var x
* END ID
* THEN
* START CALL
 65:     ST  1,-3(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
 66:    LDC  3,44(6)	Load int const 
 67:     ST  3,-5(1)	Push parameter 623 
* LOFF Line615: -6
* END Param 1
 68:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 69:    LDA  3,1(7)	Load return addr 
* BackPatch 70
 70:    JMP  7,-65(7)	CALL OUTPUT output
 71:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
 64:    JZR  3,7(7)	Jump around THEN if false [backpatch] 
* END IF
* START IF
* START OP  not
* START ID
 72:     LD  3,-2(1)	Load var x
* END ID
 73:    LDC  4,1(6)	Load 1 
 74:    XOR  3,3,4	Op XOR for logical not 
* END OP  not
* THEN
* START CALL
 76:     ST  1,-3(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
 77:    LDC  3,55(6)	Load int const 
 78:     ST  3,-5(1)	Push parameter 623 
* LOFF Line615: -6
* END Param 1
 79:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 80:    LDA  3,1(7)	Load return addr 
* BackPatch 81
 81:    JMP  7,-76(7)	CALL OUTPUT output
 82:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
 75:    JZR  3,7(7)	Jump around THEN if false [backpatch] 
* END IF
* START CALL
 83:     ST  1,-3(1)	Store fp in ghost frame for outnl
 84:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 85:    LDA  3,1(7)	Load return addr 
* BackPatch 86
 86:    JMP  7,-53(7)	CALL OUTPUT outnl
 87:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
* START IF
* START OP  >
 88:    LDC  3,3(6)	Load int const 
 89:     ST  3,-3(1)	Push left side1 
* LOFF Line 289: -4
 90:    LDC  3,1(6)	Load int const 
* LOFF Line 292: -3
 91:     LD  4,-3(1)	Pop left into acl 1 
 92:    TGT  3,4,3	Op >
* END OP  >
* THEN
* START CALL
 94:     ST  1,-3(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
 95:    LDC  3,987(6)	Load int const 
 96:     ST  3,-5(1)	Push parameter 623 
* LOFF Line615: -6
* END Param 1
 97:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 98:    LDA  3,1(7)	Load return addr 
* BackPatch 99
 99:    JMP  7,-94(7)	CALL OUTPUT output
100:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
 93:    JZR  3,7(7)	Jump around THEN if false [backpatch] 
* END IF
* START IF
* START OP  <
101:    LDC  3,3(6)	Load int const 
102:     ST  3,-3(1)	Push left side1 
* LOFF Line 289: -4
103:    LDC  3,1(6)	Load int const 
* LOFF Line 292: -3
104:     LD  4,-3(1)	Pop left into acl 1 
105:    TLT  3,4,3	Op <
* END OP  <
* THEN
* START CALL
107:     ST  1,-3(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
108:    LDC  3,211(6)	Load int const 
109:     ST  3,-5(1)	Push parameter 623 
* LOFF Line615: -6
* END Param 1
110:    LDA  1,-3(1)	Ghost frame becomes new active frame 
111:    LDA  3,1(7)	Load return addr 
* BackPatch 112
112:    JMP  7,-107(7)	CALL OUTPUT output
113:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
106:    JZR  3,7(7)	Jump around THEN if false [backpatch] 
* END IF
* START CALL
114:     ST  1,-3(1)	Store fp in ghost frame for outnl
115:    LDA  1,-3(1)	Ghost frame becomes new active frame 
116:    LDA  3,1(7)	Load return addr 
* BackPatch 117
117:    JMP  7,-84(7)	CALL OUTPUT outnl
118:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
* START IF
119:    LDC  3,1(6)	Load bool const 
* THEN
* START CALL
121:     ST  1,-3(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
122:    LDC  3,13(6)	Load int const 
123:     ST  3,-5(1)	Push parameter 623 
* LOFF Line615: -6
* END Param 1
124:    LDA  1,-3(1)	Ghost frame becomes new active frame 
125:    LDA  3,1(7)	Load return addr 
* BackPatch 126
126:    JMP  7,-121(7)	CALL OUTPUT output
127:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
120:    JZR  3,8(7)	Jump around THEN if false [backpatch] 
* ELSE
* START CALL
129:     ST  1,-3(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
130:    LDC  3,51(6)	Load int const 
131:     ST  3,-5(1)	Push parameter 623 
* LOFF Line615: -6
* END Param 1
132:    LDA  1,-3(1)	Ghost frame becomes new active frame 
133:    LDA  3,1(7)	Load return addr 
* BackPatch 134
134:    JMP  7,-129(7)	CALL OUTPUT output
135:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
128:    JMP  3,7(7)	Jump around ELSE [backpatch] 
* END IF
* START IF
136:    LDC  3,0(6)	Load bool const 
* THEN
* START CALL
138:     ST  1,-3(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
139:    LDC  3,23(6)	Load int const 
140:     ST  3,-5(1)	Push parameter 623 
* LOFF Line615: -6
* END Param 1
141:    LDA  1,-3(1)	Ghost frame becomes new active frame 
142:    LDA  3,1(7)	Load return addr 
* BackPatch 143
143:    JMP  7,-138(7)	CALL OUTPUT output
144:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
137:    JZR  3,8(7)	Jump around THEN if false [backpatch] 
* ELSE
* START CALL
146:     ST  1,-3(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
147:    LDC  3,451(6)	Load int const 
148:     ST  3,-5(1)	Push parameter 623 
* LOFF Line615: -6
* END Param 1
149:    LDA  1,-3(1)	Ghost frame becomes new active frame 
150:    LDA  3,1(7)	Load return addr 
* BackPatch 151
151:    JMP  7,-146(7)	CALL OUTPUT output
152:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
145:    JMP  3,7(7)	Jump around ELSE [backpatch] 
* END IF
* START CALL
153:     ST  1,-3(1)	Store fp in ghost frame for outnl
154:    LDA  1,-3(1)	Ghost frame becomes new active frame 
155:    LDA  3,1(7)	Load return addr 
* BackPatch 156
156:    JMP  7,-123(7)	CALL OUTPUT outnl
157:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
* START ASSIGN
158:    LDC  3,0(6)	Load bool const 
* START ID
159:     ST  3,-2(1)	Store var x
* END ID
* END ASSIGN
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
* START IF
* START OP  not
* START ID
177:     LD  3,-2(1)	Load var x
* END ID
178:    LDC  4,1(6)	Load 1 
179:    XOR  3,3,4	Op XOR for logical not 
* END OP  not
* THEN
* START CALL
181:     ST  1,-3(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
182:    LDC  3,55(6)	Load int const 
183:     ST  3,-5(1)	Push parameter 623 
* LOFF Line615: -6
* END Param 1
184:    LDA  1,-3(1)	Ghost frame becomes new active frame 
185:    LDA  3,1(7)	Load return addr 
* BackPatch 186
186:    JMP  7,-181(7)	CALL OUTPUT output
187:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
180:    JZR  3,8(7)	Jump around THEN if false [backpatch] 
* ELSE
* START CALL
189:     ST  1,-3(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
190:    LDC  3,1514(6)	Load int const 
191:     ST  3,-5(1)	Push parameter 623 
* LOFF Line615: -6
* END Param 1
192:    LDA  1,-3(1)	Ghost frame becomes new active frame 
193:    LDA  3,1(7)	Load return addr 
* BackPatch 194
194:    JMP  7,-189(7)	CALL OUTPUT output
195:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
188:    JMP  3,7(7)	Jump around ELSE [backpatch] 
* END IF
* START CALL
196:     ST  1,-3(1)	Store fp in ghost frame for outnl
197:    LDA  1,-3(1)	Ghost frame becomes new active frame 
198:    LDA  3,1(7)	Load return addr 
* BackPatch 199
199:    JMP  7,-166(7)	CALL OUTPUT outnl
200:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
* START IF
* START OP  >
201:    LDC  3,3(6)	Load int const 
202:     ST  3,-3(1)	Push left side1 
* LOFF Line 289: -4
203:    LDC  3,1(6)	Load int const 
* LOFF Line 292: -3
204:     LD  4,-3(1)	Pop left into acl 1 
205:    TGT  3,4,3	Op >
* END OP  >
* THEN
* START CALL
207:     ST  1,-3(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
208:    LDC  3,987(6)	Load int const 
209:     ST  3,-5(1)	Push parameter 623 
* LOFF Line615: -6
* END Param 1
210:    LDA  1,-3(1)	Ghost frame becomes new active frame 
211:    LDA  3,1(7)	Load return addr 
* BackPatch 212
212:    JMP  7,-207(7)	CALL OUTPUT output
213:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
206:    JZR  3,8(7)	Jump around THEN if false [backpatch] 
* ELSE
* START CALL
215:     ST  1,-3(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
216:    LDC  3,114(6)	Load int const 
217:     ST  3,-5(1)	Push parameter 623 
* LOFF Line615: -6
* END Param 1
218:    LDA  1,-3(1)	Ghost frame becomes new active frame 
219:    LDA  3,1(7)	Load return addr 
* BackPatch 220
220:    JMP  7,-215(7)	CALL OUTPUT output
221:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
214:    JMP  3,7(7)	Jump around ELSE [backpatch] 
* END IF
* START IF
* START OP  <
222:    LDC  3,3(6)	Load int const 
223:     ST  3,-3(1)	Push left side1 
* LOFF Line 289: -4
224:    LDC  3,1(6)	Load int const 
* LOFF Line 292: -3
225:     LD  4,-3(1)	Pop left into acl 1 
226:    TLT  3,4,3	Op <
* END OP  <
* THEN
* START CALL
228:     ST  1,-3(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
229:    LDC  3,211(6)	Load int const 
230:     ST  3,-5(1)	Push parameter 623 
* LOFF Line615: -6
* END Param 1
231:    LDA  1,-3(1)	Ghost frame becomes new active frame 
232:    LDA  3,1(7)	Load return addr 
* BackPatch 233
233:    JMP  7,-228(7)	CALL OUTPUT output
234:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
227:    JZR  3,8(7)	Jump around THEN if false [backpatch] 
* ELSE
* START CALL
236:     ST  1,-3(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
237:    LDC  3,1614(6)	Load int const 
238:     ST  3,-5(1)	Push parameter 623 
* LOFF Line615: -6
* END Param 1
239:    LDA  1,-3(1)	Ghost frame becomes new active frame 
240:    LDA  3,1(7)	Load return addr 
* BackPatch 241
241:    JMP  7,-236(7)	CALL OUTPUT output
242:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
235:    JMP  3,7(7)	Jump around ELSE [backpatch] 
* END IF
* START CALL
243:     ST  1,-3(1)	Store fp in ghost frame for outnl
244:    LDA  1,-3(1)	Ghost frame becomes new active frame 
245:    LDA  3,1(7)	Load return addr 
* BackPatch 246
246:    JMP  7,-213(7)	CALL OUTPUT outnl
247:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
* END COMPOUND BODY
* END COMPOUND
248:    LDC  2,0(6)	Set return value to 0 
249:     LD  3,-1(1)	Load return address 
250:     LD  1,0(1)	Adjust fp 
251:    JMP  7,0(3)	return 
* End of Function main
* 
* =========================================================
  0:    JMP  7,251(7)	Jump to init 
* START INIT
252:    LDA  1,0(0)	Set first frame after globals 
253:     ST  1,0(1)	Store old fp 
* START INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
254:    LDA  3,1(7)	Load return address 
255:    JMP  7,-217(7)	Jump to main 
256:   HALT  0,0,0	DONE 
* END INIT
