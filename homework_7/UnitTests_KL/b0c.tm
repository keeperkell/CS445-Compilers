* =================================================
* C- compiler version C-S22
* Built: Apr 17 - May 8
* Author: Keller Lawson
* File Compiled:  homework_7/UnitTests_KL/b0c.tm
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
* LOFF Line87: -2
* LOFF Line96: -2
 39:     ST  3,-1(1)	Store return addr 
* COMPOUND
* START COMPOUND BODY
* START CALL
 40:     ST  1,-2(1)	Store fp in ghost frame outputb
* START Param 1
* LOFF Line680: -3
* LOFF Line685: -4
* START OP  =
* START OP  ?
* START CONSTANT
 41:    LDC  3,1(6)	Load int const 
* END CONSTANT
 42:    RND  3,3,6	Unary Op ?
* END OP  ?
 43:     ST  3,-5(1)	Push left side 
* START CONSTANT
 44:    LDC  3,0(6)	Load int const 
* END CONSTANT
 45:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
 46:    TEQ  3,4,3	Op =
* END OP  =
 47:     ST  3,-4(1)	Push left side 
 48:    LDA  1,-2(1)	Load fp of ghost frame 
* END Param 1
 49:    LDA  3,1(7)	Load return addr 
* BackPatch 50
 50:    JMP  7,-34(7)	CALL OUTPUT outputb
 51:    LDA  3,0(2)	Store 
* END CALL
* LOFF Line749: -2
* START CALL
 52:     ST  1,-2(1)	Store fp outnl
 53:    LDA  1,-2(1)	Load fp 
 54:    LDA  3,1(7)	Load return addr 
* BackPatch 55
 55:    JMP  7,-22(7)	CALL OUTPUT outnl
 56:    LDA  3,0(2)	Store 
* END CALL
* LOFF Line749: -2
* START CALL
 57:     ST  1,-2(1)	Store fp in ghost frame outputb
* START Param 1
* LOFF Line680: -3
* LOFF Line685: -4
* START OP  >
* START OP  ?
* START CONSTANT
 58:    LDC  3,100000(6)	Load int const 
* END CONSTANT
 59:    RND  3,3,6	Unary Op ?
* END OP  ?
 60:     ST  3,-5(1)	Push left side 
* START CONSTANT
 61:    LDC  3,0(6)	Load int const 
* END CONSTANT
 62:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
 63:    TGT  3,4,3	Op >
* END OP  >
 64:     ST  3,-4(1)	Push left side 
 65:    LDA  1,-2(1)	Load fp of ghost frame 
* END Param 1
 66:    LDA  3,1(7)	Load return addr 
* BackPatch 67
 67:    JMP  7,-51(7)	CALL OUTPUT outputb
 68:    LDA  3,0(2)	Store 
* END CALL
* LOFF Line749: -2
* START CALL
 69:     ST  1,-2(1)	Store fp in ghost frame outputb
* START Param 1
* LOFF Line680: -3
* LOFF Line685: -4
* START OP  and
* START OP  and
* START OP  and
* START OP  and
* START OP  and
* START OP  and
* START OP  and
* START OP  and
* START OP  and
* START OP  and
* START OP  and
* START OP  and
* START OP  >
* START OP  ?
* START CONSTANT
 70:    LDC  3,3(6)	Load int const 
* END CONSTANT
 71:    RND  3,3,6	Unary Op ?
* END OP  ?
 72:     ST  3,-5(1)	Push left side 
* START CONSTANT
 73:    LDC  3,0(6)	Load int const 
* END CONSTANT
 74:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
 75:    TGT  3,4,3	Op >
* END OP  >
 76:     ST  3,-5(1)	Push left side 
* START OP  >
* START OP  ?
* START CONSTANT
 77:    LDC  3,3(6)	Load int const 
* END CONSTANT
 78:    RND  3,3,6	Unary Op ?
* END OP  ?
 79:     ST  3,-5(1)	Push left side 
* START CONSTANT
 80:    LDC  3,0(6)	Load int const 
* END CONSTANT
 81:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
 82:    TGT  3,4,3	Op >
* END OP  >
 83:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
 84:    AND  3,4,3	Op and
* END OP  and
 85:     ST  3,-5(1)	Push left side 
* START OP  >
* START OP  ?
* START CONSTANT
 86:    LDC  3,3(6)	Load int const 
* END CONSTANT
 87:    RND  3,3,6	Unary Op ?
* END OP  ?
 88:     ST  3,-5(1)	Push left side 
* START CONSTANT
 89:    LDC  3,0(6)	Load int const 
* END CONSTANT
 90:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
 91:    TGT  3,4,3	Op >
* END OP  >
 92:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
 93:    AND  3,4,3	Op and
* END OP  and
 94:     ST  3,-5(1)	Push left side 
* START OP  >
* START OP  ?
* START CONSTANT
 95:    LDC  3,3(6)	Load int const 
* END CONSTANT
 96:    RND  3,3,6	Unary Op ?
* END OP  ?
 97:     ST  3,-5(1)	Push left side 
* START CONSTANT
 98:    LDC  3,0(6)	Load int const 
* END CONSTANT
 99:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
100:    TGT  3,4,3	Op >
* END OP  >
101:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
102:    AND  3,4,3	Op and
* END OP  and
103:     ST  3,-5(1)	Push left side 
* START OP  >
* START OP  ?
* START CONSTANT
104:    LDC  3,3(6)	Load int const 
* END CONSTANT
105:    RND  3,3,6	Unary Op ?
* END OP  ?
106:     ST  3,-5(1)	Push left side 
* START CONSTANT
107:    LDC  3,0(6)	Load int const 
* END CONSTANT
108:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
109:    TGT  3,4,3	Op >
* END OP  >
110:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
111:    AND  3,4,3	Op and
* END OP  and
112:     ST  3,-5(1)	Push left side 
* START OP  >
* START OP  ?
* START CONSTANT
113:    LDC  3,3(6)	Load int const 
* END CONSTANT
114:    RND  3,3,6	Unary Op ?
* END OP  ?
115:     ST  3,-5(1)	Push left side 
* START CONSTANT
116:    LDC  3,0(6)	Load int const 
* END CONSTANT
117:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
118:    TGT  3,4,3	Op >
* END OP  >
119:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
120:    AND  3,4,3	Op and
* END OP  and
121:     ST  3,-5(1)	Push left side 
* START OP  >
* START OP  ?
* START CONSTANT
122:    LDC  3,3(6)	Load int const 
* END CONSTANT
123:    RND  3,3,6	Unary Op ?
* END OP  ?
124:     ST  3,-5(1)	Push left side 
* START CONSTANT
125:    LDC  3,0(6)	Load int const 
* END CONSTANT
126:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
127:    TGT  3,4,3	Op >
* END OP  >
128:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
129:    AND  3,4,3	Op and
* END OP  and
130:     ST  3,-5(1)	Push left side 
* START OP  >
* START OP  ?
* START CONSTANT
131:    LDC  3,3(6)	Load int const 
* END CONSTANT
132:    RND  3,3,6	Unary Op ?
* END OP  ?
133:     ST  3,-5(1)	Push left side 
* START CONSTANT
134:    LDC  3,0(6)	Load int const 
* END CONSTANT
135:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
136:    TGT  3,4,3	Op >
* END OP  >
137:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
138:    AND  3,4,3	Op and
* END OP  and
139:     ST  3,-5(1)	Push left side 
* START OP  >
* START OP  ?
* START CONSTANT
140:    LDC  3,3(6)	Load int const 
* END CONSTANT
141:    RND  3,3,6	Unary Op ?
* END OP  ?
142:     ST  3,-5(1)	Push left side 
* START CONSTANT
143:    LDC  3,0(6)	Load int const 
* END CONSTANT
144:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
145:    TGT  3,4,3	Op >
* END OP  >
146:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
147:    AND  3,4,3	Op and
* END OP  and
148:     ST  3,-5(1)	Push left side 
* START OP  >
* START OP  ?
* START CONSTANT
149:    LDC  3,3(6)	Load int const 
* END CONSTANT
150:    RND  3,3,6	Unary Op ?
* END OP  ?
151:     ST  3,-5(1)	Push left side 
* START CONSTANT
152:    LDC  3,0(6)	Load int const 
* END CONSTANT
153:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
154:    TGT  3,4,3	Op >
* END OP  >
155:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
156:    AND  3,4,3	Op and
* END OP  and
157:     ST  3,-5(1)	Push left side 
* START OP  >
* START OP  ?
* START CONSTANT
158:    LDC  3,3(6)	Load int const 
* END CONSTANT
159:    RND  3,3,6	Unary Op ?
* END OP  ?
160:     ST  3,-5(1)	Push left side 
* START CONSTANT
161:    LDC  3,0(6)	Load int const 
* END CONSTANT
162:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
163:    TGT  3,4,3	Op >
* END OP  >
164:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
165:    AND  3,4,3	Op and
* END OP  and
166:     ST  3,-5(1)	Push left side 
* START OP  >
* START OP  ?
* START CONSTANT
167:    LDC  3,3(6)	Load int const 
* END CONSTANT
168:    RND  3,3,6	Unary Op ?
* END OP  ?
169:     ST  3,-5(1)	Push left side 
* START CONSTANT
170:    LDC  3,0(6)	Load int const 
* END CONSTANT
171:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
172:    TGT  3,4,3	Op >
* END OP  >
173:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
174:    AND  3,4,3	Op and
* END OP  and
175:     ST  3,-5(1)	Push left side 
* START OP  >
* START OP  ?
* START CONSTANT
176:    LDC  3,3(6)	Load int const 
* END CONSTANT
177:    RND  3,3,6	Unary Op ?
* END OP  ?
178:     ST  3,-5(1)	Push left side 
* START CONSTANT
179:    LDC  3,0(6)	Load int const 
* END CONSTANT
180:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
181:    TGT  3,4,3	Op >
* END OP  >
182:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
183:    AND  3,4,3	Op and
* END OP  and
184:     ST  3,-4(1)	Push left side 
185:    LDA  1,-2(1)	Load fp of ghost frame 
* END Param 1
186:    LDA  3,1(7)	Load return addr 
* BackPatch 187
187:    JMP  7,-171(7)	CALL OUTPUT outputb
188:    LDA  3,0(2)	Store 
* END CALL
* LOFF Line749: -2
* START CALL
189:     ST  1,-2(1)	Store fp in ghost frame outputb
* START Param 1
* LOFF Line680: -3
* LOFF Line685: -4
* START OP  or
* START OP  or
* START OP  or
* START OP  or
* START OP  or
* START OP  or
* START OP  or
* START OP  or
* START OP  or
* START OP  or
* START OP  or
* START OP  or
* START OP  >
* START OP  ?
* START CONSTANT
190:    LDC  3,3(6)	Load int const 
* END CONSTANT
191:    RND  3,3,6	Unary Op ?
* END OP  ?
192:     ST  3,-5(1)	Push left side 
* START CONSTANT
193:    LDC  3,0(6)	Load int const 
* END CONSTANT
194:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
195:    TGT  3,4,3	Op >
* END OP  >
196:     ST  3,-5(1)	Push left side 
* START OP  >
* START OP  ?
* START CONSTANT
197:    LDC  3,3(6)	Load int const 
* END CONSTANT
198:    RND  3,3,6	Unary Op ?
* END OP  ?
199:     ST  3,-5(1)	Push left side 
* START CONSTANT
200:    LDC  3,0(6)	Load int const 
* END CONSTANT
201:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
202:    TGT  3,4,3	Op >
* END OP  >
203:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
204:     OR  3,4,3	Op or
* END OP  or
205:     ST  3,-5(1)	Push left side 
* START OP  >
* START OP  ?
* START CONSTANT
206:    LDC  3,3(6)	Load int const 
* END CONSTANT
207:    RND  3,3,6	Unary Op ?
* END OP  ?
208:     ST  3,-5(1)	Push left side 
* START CONSTANT
209:    LDC  3,0(6)	Load int const 
* END CONSTANT
210:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
211:    TGT  3,4,3	Op >
* END OP  >
212:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
213:     OR  3,4,3	Op or
* END OP  or
214:     ST  3,-5(1)	Push left side 
* START OP  >
* START OP  ?
* START CONSTANT
215:    LDC  3,3(6)	Load int const 
* END CONSTANT
216:    RND  3,3,6	Unary Op ?
* END OP  ?
217:     ST  3,-5(1)	Push left side 
* START CONSTANT
218:    LDC  3,0(6)	Load int const 
* END CONSTANT
219:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
220:    TGT  3,4,3	Op >
* END OP  >
221:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
222:     OR  3,4,3	Op or
* END OP  or
223:     ST  3,-5(1)	Push left side 
* START OP  >
* START OP  ?
* START CONSTANT
224:    LDC  3,3(6)	Load int const 
* END CONSTANT
225:    RND  3,3,6	Unary Op ?
* END OP  ?
226:     ST  3,-5(1)	Push left side 
* START CONSTANT
227:    LDC  3,0(6)	Load int const 
* END CONSTANT
228:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
229:    TGT  3,4,3	Op >
* END OP  >
230:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
231:     OR  3,4,3	Op or
* END OP  or
232:     ST  3,-5(1)	Push left side 
* START OP  >
* START OP  ?
* START CONSTANT
233:    LDC  3,3(6)	Load int const 
* END CONSTANT
234:    RND  3,3,6	Unary Op ?
* END OP  ?
235:     ST  3,-5(1)	Push left side 
* START CONSTANT
236:    LDC  3,0(6)	Load int const 
* END CONSTANT
237:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
238:    TGT  3,4,3	Op >
* END OP  >
239:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
240:     OR  3,4,3	Op or
* END OP  or
241:     ST  3,-5(1)	Push left side 
* START OP  >
* START OP  ?
* START CONSTANT
242:    LDC  3,3(6)	Load int const 
* END CONSTANT
243:    RND  3,3,6	Unary Op ?
* END OP  ?
244:     ST  3,-5(1)	Push left side 
* START CONSTANT
245:    LDC  3,0(6)	Load int const 
* END CONSTANT
246:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
247:    TGT  3,4,3	Op >
* END OP  >
248:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
249:     OR  3,4,3	Op or
* END OP  or
250:     ST  3,-5(1)	Push left side 
* START OP  >
* START OP  ?
* START CONSTANT
251:    LDC  3,3(6)	Load int const 
* END CONSTANT
252:    RND  3,3,6	Unary Op ?
* END OP  ?
253:     ST  3,-5(1)	Push left side 
* START CONSTANT
254:    LDC  3,0(6)	Load int const 
* END CONSTANT
255:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
256:    TGT  3,4,3	Op >
* END OP  >
257:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
258:     OR  3,4,3	Op or
* END OP  or
259:     ST  3,-5(1)	Push left side 
* START OP  >
* START OP  ?
* START CONSTANT
260:    LDC  3,3(6)	Load int const 
* END CONSTANT
261:    RND  3,3,6	Unary Op ?
* END OP  ?
262:     ST  3,-5(1)	Push left side 
* START CONSTANT
263:    LDC  3,0(6)	Load int const 
* END CONSTANT
264:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
265:    TGT  3,4,3	Op >
* END OP  >
266:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
267:     OR  3,4,3	Op or
* END OP  or
268:     ST  3,-5(1)	Push left side 
* START OP  >
* START OP  ?
* START CONSTANT
269:    LDC  3,3(6)	Load int const 
* END CONSTANT
270:    RND  3,3,6	Unary Op ?
* END OP  ?
271:     ST  3,-5(1)	Push left side 
* START CONSTANT
272:    LDC  3,0(6)	Load int const 
* END CONSTANT
273:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
274:    TGT  3,4,3	Op >
* END OP  >
275:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
276:     OR  3,4,3	Op or
* END OP  or
277:     ST  3,-5(1)	Push left side 
* START OP  >
* START OP  ?
* START CONSTANT
278:    LDC  3,3(6)	Load int const 
* END CONSTANT
279:    RND  3,3,6	Unary Op ?
* END OP  ?
280:     ST  3,-5(1)	Push left side 
* START CONSTANT
281:    LDC  3,0(6)	Load int const 
* END CONSTANT
282:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
283:    TGT  3,4,3	Op >
* END OP  >
284:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
285:     OR  3,4,3	Op or
* END OP  or
286:     ST  3,-5(1)	Push left side 
* START OP  >
* START OP  ?
* START CONSTANT
287:    LDC  3,3(6)	Load int const 
* END CONSTANT
288:    RND  3,3,6	Unary Op ?
* END OP  ?
289:     ST  3,-5(1)	Push left side 
* START CONSTANT
290:    LDC  3,0(6)	Load int const 
* END CONSTANT
291:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
292:    TGT  3,4,3	Op >
* END OP  >
293:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
294:     OR  3,4,3	Op or
* END OP  or
295:     ST  3,-5(1)	Push left side 
* START OP  >
* START OP  ?
* START CONSTANT
296:    LDC  3,3(6)	Load int const 
* END CONSTANT
297:    RND  3,3,6	Unary Op ?
* END OP  ?
298:     ST  3,-5(1)	Push left side 
* START CONSTANT
299:    LDC  3,0(6)	Load int const 
* END CONSTANT
300:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
301:    TGT  3,4,3	Op >
* END OP  >
302:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -4
303:     OR  3,4,3	Op or
* END OP  or
304:     ST  3,-4(1)	Push left side 
305:    LDA  1,-2(1)	Load fp of ghost frame 
* END Param 1
306:    LDA  3,1(7)	Load return addr 
* BackPatch 307
307:    JMP  7,-291(7)	CALL OUTPUT outputb
308:    LDA  3,0(2)	Store 
* END CALL
* LOFF Line749: -2
* START CALL
309:     ST  1,-2(1)	Store fp outnl
310:    LDA  1,-2(1)	Load fp 
311:    LDA  3,1(7)	Load return addr 
* BackPatch 312
312:    JMP  7,-279(7)	CALL OUTPUT outnl
313:    LDA  3,0(2)	Store 
* END CALL
* LOFF Line749: -2
* END COMPOUND BODY
* LOFF Line188: -2
* END COMPOUND
314:    LDC  2,0(6)	Set return valuye to 0 
315:     LD  3,-1(1)	Load return address 
316:     LD  1,0(1)	Adjust file pointer 
317:    JMP  7,0(3)	return 
* End of Function main
  0:    JMP  7,317(7)	Jump to init 
* START INIT
318:    LDA  1,0(0)	Set first frame after globals 
319:     ST  1,0(1)	Store old fp 
* START INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
320:    LDA  3,1(7)	Load return address 
321:    JMP  7,-283(7)	Jump to main 
322:   HALT  0,0,0	DONE 
* END INIT
