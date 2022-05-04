* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  mod.c-
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
* TOFF set: -2
* Compound Body
* EXPRESSION
* CALL output
 40:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 41:    LDC  3,10(6)	Load integer constant 
 42:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 43:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
 44:     LD  4,-4(1)	Pop left into ac1 
 45:    MOD  3,4,3	Op % 
 46:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
 47:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 48:    LDA  3,1(7)	Return address in ac 
 49:    JMP  7,-44(7)	CALL output
 50:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL output
 51:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 52:    LDC  3,10(6)	Load integer constant 
 53:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 54:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -4
 55:     LD  4,-4(1)	Pop left into ac1 
 56:    MOD  3,4,3	Op % 
 57:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
 58:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 59:    LDA  3,1(7)	Return address in ac 
 60:    JMP  7,-55(7)	CALL output
 61:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL output
 62:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 63:    LDC  3,10(6)	Load integer constant 
 64:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 65:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -4
 66:     LD  4,-4(1)	Pop left into ac1 
 67:    MOD  3,4,3	Op % 
 68:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
 69:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 70:    LDA  3,1(7)	Return address in ac 
 71:    JMP  7,-66(7)	CALL output
 72:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL output
 73:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 74:    LDC  3,10(6)	Load integer constant 
 75:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 76:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -4
 77:     LD  4,-4(1)	Pop left into ac1 
 78:    MOD  3,4,3	Op % 
 79:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
 80:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 81:    LDA  3,1(7)	Return address in ac 
 82:    JMP  7,-77(7)	CALL output
 83:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL output
 84:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 85:    LDC  3,10(6)	Load integer constant 
 86:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 87:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -4
 88:     LD  4,-4(1)	Pop left into ac1 
 89:    MOD  3,4,3	Op % 
 90:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
 91:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 92:    LDA  3,1(7)	Return address in ac 
 93:    JMP  7,-88(7)	CALL output
 94:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL outnl
 95:     ST  1,-2(1)	Store fp in ghost frame for outnl
* TOFF dec: -3
* TOFF dec: -4
* Param end outnl
 96:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 97:    LDA  3,1(7)	Return address in ac 
 98:    JMP  7,-65(7)	CALL outnl
 99:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -2
* EXPRESSION
* CALL output
100:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
101:    LDC  3,10(6)	Load integer constant 
102:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
103:    LDC  3,10(6)	Load integer constant 
* TOFF inc: -4
104:     LD  4,-4(1)	Pop left into ac1 
105:    MOD  3,4,3	Op % 
106:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
107:    LDA  1,-2(1)	Ghost frame becomes new active frame 
108:    LDA  3,1(7)	Return address in ac 
109:    JMP  7,-104(7)	CALL output
110:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL output
111:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
112:    LDC  3,10(6)	Load integer constant 
113:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
114:    LDC  3,11(6)	Load integer constant 
* TOFF inc: -4
115:     LD  4,-4(1)	Pop left into ac1 
116:    MOD  3,4,3	Op % 
117:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
118:    LDA  1,-2(1)	Ghost frame becomes new active frame 
119:    LDA  3,1(7)	Return address in ac 
120:    JMP  7,-115(7)	CALL output
121:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL outnl
122:     ST  1,-2(1)	Store fp in ghost frame for outnl
* TOFF dec: -3
* TOFF dec: -4
* Param end outnl
123:    LDA  1,-2(1)	Ghost frame becomes new active frame 
124:    LDA  3,1(7)	Return address in ac 
125:    JMP  7,-92(7)	CALL outnl
126:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -2
* EXPRESSION
* CALL output
127:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
128:    LDC  3,0(6)	Load integer constant 
129:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
130:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
131:     LD  4,-4(1)	Pop left into ac1 
132:    MOD  3,4,3	Op % 
133:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
134:    LDA  1,-2(1)	Ghost frame becomes new active frame 
135:    LDA  3,1(7)	Return address in ac 
136:    JMP  7,-131(7)	CALL output
137:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL outnl
138:     ST  1,-2(1)	Store fp in ghost frame for outnl
* TOFF dec: -3
* TOFF dec: -4
* Param end outnl
139:    LDA  1,-2(1)	Ghost frame becomes new active frame 
140:    LDA  3,1(7)	Return address in ac 
141:    JMP  7,-108(7)	CALL outnl
142:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -2
* EXPRESSION
* CALL output
143:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
144:    LDC  3,10(6)	Load integer constant 
145:    NEG  3,3,3	Op unary - 
146:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
147:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
148:     LD  4,-4(1)	Pop left into ac1 
149:    MOD  3,4,3	Op % 
150:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
151:    LDA  1,-2(1)	Ghost frame becomes new active frame 
152:    LDA  3,1(7)	Return address in ac 
153:    JMP  7,-148(7)	CALL output
154:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL output
155:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
156:    LDC  3,10(6)	Load integer constant 
157:    NEG  3,3,3	Op unary - 
158:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
159:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -4
160:     LD  4,-4(1)	Pop left into ac1 
161:    MOD  3,4,3	Op % 
162:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
163:    LDA  1,-2(1)	Ghost frame becomes new active frame 
164:    LDA  3,1(7)	Return address in ac 
165:    JMP  7,-160(7)	CALL output
166:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL output
167:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
168:    LDC  3,10(6)	Load integer constant 
169:    NEG  3,3,3	Op unary - 
170:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
171:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -4
172:     LD  4,-4(1)	Pop left into ac1 
173:    MOD  3,4,3	Op % 
174:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
175:    LDA  1,-2(1)	Ghost frame becomes new active frame 
176:    LDA  3,1(7)	Return address in ac 
177:    JMP  7,-172(7)	CALL output
178:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL output
179:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
180:    LDC  3,10(6)	Load integer constant 
181:    NEG  3,3,3	Op unary - 
182:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
183:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -4
184:     LD  4,-4(1)	Pop left into ac1 
185:    MOD  3,4,3	Op % 
186:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
187:    LDA  1,-2(1)	Ghost frame becomes new active frame 
188:    LDA  3,1(7)	Return address in ac 
189:    JMP  7,-184(7)	CALL output
190:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL output
191:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
192:    LDC  3,10(6)	Load integer constant 
193:    NEG  3,3,3	Op unary - 
194:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
195:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -4
196:     LD  4,-4(1)	Pop left into ac1 
197:    MOD  3,4,3	Op % 
198:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
199:    LDA  1,-2(1)	Ghost frame becomes new active frame 
200:    LDA  3,1(7)	Return address in ac 
201:    JMP  7,-196(7)	CALL output
202:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL outnl
203:     ST  1,-2(1)	Store fp in ghost frame for outnl
* TOFF dec: -3
* TOFF dec: -4
* Param end outnl
204:    LDA  1,-2(1)	Ghost frame becomes new active frame 
205:    LDA  3,1(7)	Return address in ac 
206:    JMP  7,-173(7)	CALL outnl
207:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -2
* EXPRESSION
* CALL output
208:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
209:    LDC  3,10(6)	Load integer constant 
210:    NEG  3,3,3	Op unary - 
211:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
212:    LDC  3,10(6)	Load integer constant 
* TOFF inc: -4
213:     LD  4,-4(1)	Pop left into ac1 
214:    MOD  3,4,3	Op % 
215:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
216:    LDA  1,-2(1)	Ghost frame becomes new active frame 
217:    LDA  3,1(7)	Return address in ac 
218:    JMP  7,-213(7)	CALL output
219:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL output
220:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
221:    LDC  3,10(6)	Load integer constant 
222:    NEG  3,3,3	Op unary - 
223:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
224:    LDC  3,11(6)	Load integer constant 
* TOFF inc: -4
225:     LD  4,-4(1)	Pop left into ac1 
226:    MOD  3,4,3	Op % 
227:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
228:    LDA  1,-2(1)	Ghost frame becomes new active frame 
229:    LDA  3,1(7)	Return address in ac 
230:    JMP  7,-225(7)	CALL output
231:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL outnl
232:     ST  1,-2(1)	Store fp in ghost frame for outnl
* TOFF dec: -3
* TOFF dec: -4
* Param end outnl
233:    LDA  1,-2(1)	Ghost frame becomes new active frame 
234:    LDA  3,1(7)	Return address in ac 
235:    JMP  7,-202(7)	CALL outnl
236:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -2
* EXPRESSION
* CALL output
237:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
238:    LDC  3,331(6)	Load integer constant 
239:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
240:    LDC  3,31(6)	Load integer constant 
* TOFF inc: -4
241:     LD  4,-4(1)	Pop left into ac1 
242:    MOD  3,4,3	Op % 
243:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
244:    LDA  1,-2(1)	Ghost frame becomes new active frame 
245:    LDA  3,1(7)	Return address in ac 
246:    JMP  7,-241(7)	CALL output
247:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL output
248:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
249:    LDC  3,331(6)	Load integer constant 
250:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
251:    LDC  3,31(6)	Load integer constant 
252:    NEG  3,3,3	Op unary - 
* TOFF inc: -4
253:     LD  4,-4(1)	Pop left into ac1 
254:    MOD  3,4,3	Op % 
255:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
256:    LDA  1,-2(1)	Ghost frame becomes new active frame 
257:    LDA  3,1(7)	Return address in ac 
258:    JMP  7,-253(7)	CALL output
259:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL output
260:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
261:    LDC  3,331(6)	Load integer constant 
262:    NEG  3,3,3	Op unary - 
263:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
264:    LDC  3,31(6)	Load integer constant 
* TOFF inc: -4
265:     LD  4,-4(1)	Pop left into ac1 
266:    MOD  3,4,3	Op % 
267:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
268:    LDA  1,-2(1)	Ghost frame becomes new active frame 
269:    LDA  3,1(7)	Return address in ac 
270:    JMP  7,-265(7)	CALL output
271:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL output
272:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
273:    LDC  3,331(6)	Load integer constant 
274:    NEG  3,3,3	Op unary - 
275:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
276:    LDC  3,31(6)	Load integer constant 
277:    NEG  3,3,3	Op unary - 
* TOFF inc: -4
278:     LD  4,-4(1)	Pop left into ac1 
279:    MOD  3,4,3	Op % 
280:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
281:    LDA  1,-2(1)	Ghost frame becomes new active frame 
282:    LDA  3,1(7)	Return address in ac 
283:    JMP  7,-278(7)	CALL output
284:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
285:    LDC  2,0(6)	Set return value to 0 
286:     LD  3,-1(1)	Load return address 
287:     LD  1,0(1)	Adjust fp 
288:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,288(7)	Jump to init [backpatch] 
* INIT
289:    LDA  1,0(0)	set first frame at end of globals 
290:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
291:    LDA  3,1(7)	Return address in ac 
292:    JMP  7,-254(7)	Jump to main 
293:   HALT  0,0,0	DONE! 
* END INIT
