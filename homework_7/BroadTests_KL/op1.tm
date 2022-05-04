* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  op1.c-
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
* CALL outputb
 40:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 41:    LDC  3,111(6)	Load integer constant 
 42:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 43:    LDC  3,222(6)	Load integer constant 
* TOFF inc: -4
 44:     LD  4,-4(1)	Pop left into ac1 
 45:    TLE  3,4,3	Op <= 
 46:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
 47:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 48:    LDA  3,1(7)	Return address in ac 
 49:    JMP  7,-33(7)	CALL outputb
 50:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outputb
 51:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 52:    LDC  3,222(6)	Load integer constant 
 53:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 54:    LDC  3,111(6)	Load integer constant 
* TOFF inc: -4
 55:     LD  4,-4(1)	Pop left into ac1 
 56:    TLE  3,4,3	Op <= 
 57:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
 58:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 59:    LDA  3,1(7)	Return address in ac 
 60:    JMP  7,-44(7)	CALL outputb
 61:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outputb
 62:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 63:    LDC  3,111(6)	Load integer constant 
 64:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 65:    LDC  3,111(6)	Load integer constant 
* TOFF inc: -4
 66:     LD  4,-4(1)	Pop left into ac1 
 67:    TLE  3,4,3	Op <= 
 68:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
 69:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 70:    LDA  3,1(7)	Return address in ac 
 71:    JMP  7,-55(7)	CALL outputb
 72:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outnl
 73:     ST  1,-2(1)	Store fp in ghost frame for outnl
* TOFF dec: -3
* TOFF dec: -4
* Param end outnl
 74:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 75:    LDA  3,1(7)	Return address in ac 
 76:    JMP  7,-43(7)	CALL outnl
 77:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -2
* EXPRESSION
* CALL outputb
 78:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 79:    LDC  3,111(6)	Load integer constant 
 80:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 81:    LDC  3,222(6)	Load integer constant 
* TOFF inc: -4
 82:     LD  4,-4(1)	Pop left into ac1 
 83:    TLT  3,4,3	Op < 
 84:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
 85:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 86:    LDA  3,1(7)	Return address in ac 
 87:    JMP  7,-71(7)	CALL outputb
 88:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outputb
 89:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 90:    LDC  3,222(6)	Load integer constant 
 91:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 92:    LDC  3,111(6)	Load integer constant 
* TOFF inc: -4
 93:     LD  4,-4(1)	Pop left into ac1 
 94:    TLT  3,4,3	Op < 
 95:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
 96:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 97:    LDA  3,1(7)	Return address in ac 
 98:    JMP  7,-82(7)	CALL outputb
 99:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outputb
100:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
101:    LDC  3,111(6)	Load integer constant 
102:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
103:    LDC  3,111(6)	Load integer constant 
* TOFF inc: -4
104:     LD  4,-4(1)	Pop left into ac1 
105:    TLT  3,4,3	Op < 
106:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
107:    LDA  1,-2(1)	Ghost frame becomes new active frame 
108:    LDA  3,1(7)	Return address in ac 
109:    JMP  7,-93(7)	CALL outputb
110:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outnl
111:     ST  1,-2(1)	Store fp in ghost frame for outnl
* TOFF dec: -3
* TOFF dec: -4
* Param end outnl
112:    LDA  1,-2(1)	Ghost frame becomes new active frame 
113:    LDA  3,1(7)	Return address in ac 
114:    JMP  7,-81(7)	CALL outnl
115:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -2
* EXPRESSION
* CALL outputb
116:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
117:    LDC  3,111(6)	Load integer constant 
118:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
119:    LDC  3,222(6)	Load integer constant 
* TOFF inc: -4
120:     LD  4,-4(1)	Pop left into ac1 
121:    TGT  3,4,3	Op > 
122:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
123:    LDA  1,-2(1)	Ghost frame becomes new active frame 
124:    LDA  3,1(7)	Return address in ac 
125:    JMP  7,-109(7)	CALL outputb
126:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outputb
127:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
128:    LDC  3,222(6)	Load integer constant 
129:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
130:    LDC  3,111(6)	Load integer constant 
* TOFF inc: -4
131:     LD  4,-4(1)	Pop left into ac1 
132:    TGT  3,4,3	Op > 
133:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
134:    LDA  1,-2(1)	Ghost frame becomes new active frame 
135:    LDA  3,1(7)	Return address in ac 
136:    JMP  7,-120(7)	CALL outputb
137:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outputb
138:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
139:    LDC  3,111(6)	Load integer constant 
140:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
141:    LDC  3,111(6)	Load integer constant 
* TOFF inc: -4
142:     LD  4,-4(1)	Pop left into ac1 
143:    TGT  3,4,3	Op > 
144:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
145:    LDA  1,-2(1)	Ghost frame becomes new active frame 
146:    LDA  3,1(7)	Return address in ac 
147:    JMP  7,-131(7)	CALL outputb
148:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outnl
149:     ST  1,-2(1)	Store fp in ghost frame for outnl
* TOFF dec: -3
* TOFF dec: -4
* Param end outnl
150:    LDA  1,-2(1)	Ghost frame becomes new active frame 
151:    LDA  3,1(7)	Return address in ac 
152:    JMP  7,-119(7)	CALL outnl
153:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -2
* EXPRESSION
* CALL outputb
154:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
155:    LDC  3,111(6)	Load integer constant 
156:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
157:    LDC  3,222(6)	Load integer constant 
* TOFF inc: -4
158:     LD  4,-4(1)	Pop left into ac1 
159:    TGE  3,4,3	Op >= 
160:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
161:    LDA  1,-2(1)	Ghost frame becomes new active frame 
162:    LDA  3,1(7)	Return address in ac 
163:    JMP  7,-147(7)	CALL outputb
164:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outputb
165:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
166:    LDC  3,222(6)	Load integer constant 
167:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
168:    LDC  3,111(6)	Load integer constant 
* TOFF inc: -4
169:     LD  4,-4(1)	Pop left into ac1 
170:    TGE  3,4,3	Op >= 
171:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
172:    LDA  1,-2(1)	Ghost frame becomes new active frame 
173:    LDA  3,1(7)	Return address in ac 
174:    JMP  7,-158(7)	CALL outputb
175:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outputb
176:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
177:    LDC  3,111(6)	Load integer constant 
178:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
179:    LDC  3,111(6)	Load integer constant 
* TOFF inc: -4
180:     LD  4,-4(1)	Pop left into ac1 
181:    TGE  3,4,3	Op >= 
182:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
183:    LDA  1,-2(1)	Ghost frame becomes new active frame 
184:    LDA  3,1(7)	Return address in ac 
185:    JMP  7,-169(7)	CALL outputb
186:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outnl
187:     ST  1,-2(1)	Store fp in ghost frame for outnl
* TOFF dec: -3
* TOFF dec: -4
* Param end outnl
188:    LDA  1,-2(1)	Ghost frame becomes new active frame 
189:    LDA  3,1(7)	Return address in ac 
190:    JMP  7,-157(7)	CALL outnl
191:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -2
* EXPRESSION
* CALL outputb
192:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
193:    LDC  3,111(6)	Load integer constant 
194:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
195:    LDC  3,222(6)	Load integer constant 
* TOFF inc: -4
196:     LD  4,-4(1)	Pop left into ac1 
197:    TEQ  3,4,3	Op = 
198:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
199:    LDA  1,-2(1)	Ghost frame becomes new active frame 
200:    LDA  3,1(7)	Return address in ac 
201:    JMP  7,-185(7)	CALL outputb
202:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outputb
203:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
204:    LDC  3,222(6)	Load integer constant 
205:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
206:    LDC  3,111(6)	Load integer constant 
* TOFF inc: -4
207:     LD  4,-4(1)	Pop left into ac1 
208:    TEQ  3,4,3	Op = 
209:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
210:    LDA  1,-2(1)	Ghost frame becomes new active frame 
211:    LDA  3,1(7)	Return address in ac 
212:    JMP  7,-196(7)	CALL outputb
213:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outputb
214:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
215:    LDC  3,111(6)	Load integer constant 
216:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
217:    LDC  3,111(6)	Load integer constant 
* TOFF inc: -4
218:     LD  4,-4(1)	Pop left into ac1 
219:    TEQ  3,4,3	Op = 
220:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
221:    LDA  1,-2(1)	Ghost frame becomes new active frame 
222:    LDA  3,1(7)	Return address in ac 
223:    JMP  7,-207(7)	CALL outputb
224:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outnl
225:     ST  1,-2(1)	Store fp in ghost frame for outnl
* TOFF dec: -3
* TOFF dec: -4
* Param end outnl
226:    LDA  1,-2(1)	Ghost frame becomes new active frame 
227:    LDA  3,1(7)	Return address in ac 
228:    JMP  7,-195(7)	CALL outnl
229:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -2
* EXPRESSION
* CALL outputb
230:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
231:    LDC  3,111(6)	Load integer constant 
232:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
233:    LDC  3,222(6)	Load integer constant 
* TOFF inc: -4
234:     LD  4,-4(1)	Pop left into ac1 
235:    TNE  3,4,3	Op >< 
236:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
237:    LDA  1,-2(1)	Ghost frame becomes new active frame 
238:    LDA  3,1(7)	Return address in ac 
239:    JMP  7,-223(7)	CALL outputb
240:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outputb
241:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
242:    LDC  3,222(6)	Load integer constant 
243:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
244:    LDC  3,111(6)	Load integer constant 
* TOFF inc: -4
245:     LD  4,-4(1)	Pop left into ac1 
246:    TNE  3,4,3	Op >< 
247:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
248:    LDA  1,-2(1)	Ghost frame becomes new active frame 
249:    LDA  3,1(7)	Return address in ac 
250:    JMP  7,-234(7)	CALL outputb
251:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outputb
252:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
253:    LDC  3,111(6)	Load integer constant 
254:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
255:    LDC  3,111(6)	Load integer constant 
* TOFF inc: -4
256:     LD  4,-4(1)	Pop left into ac1 
257:    TNE  3,4,3	Op >< 
258:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
259:    LDA  1,-2(1)	Ghost frame becomes new active frame 
260:    LDA  3,1(7)	Return address in ac 
261:    JMP  7,-245(7)	CALL outputb
262:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outnl
263:     ST  1,-2(1)	Store fp in ghost frame for outnl
* TOFF dec: -3
* TOFF dec: -4
* Param end outnl
264:    LDA  1,-2(1)	Ghost frame becomes new active frame 
265:    LDA  3,1(7)	Return address in ac 
266:    JMP  7,-233(7)	CALL outnl
267:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -2
* EXPRESSION
* CALL outputb
268:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
269:    LDC  3,111(6)	Load integer constant 
270:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
271:    LDC  3,222(6)	Load integer constant 
* TOFF inc: -4
272:     LD  4,-4(1)	Pop left into ac1 
273:    TNE  3,4,3	Op >< 
274:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
275:    LDA  1,-2(1)	Ghost frame becomes new active frame 
276:    LDA  3,1(7)	Return address in ac 
277:    JMP  7,-261(7)	CALL outputb
278:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outputb
279:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
280:    LDC  3,222(6)	Load integer constant 
281:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
282:    LDC  3,111(6)	Load integer constant 
* TOFF inc: -4
283:     LD  4,-4(1)	Pop left into ac1 
284:    TNE  3,4,3	Op >< 
285:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
286:    LDA  1,-2(1)	Ghost frame becomes new active frame 
287:    LDA  3,1(7)	Return address in ac 
288:    JMP  7,-272(7)	CALL outputb
289:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outputb
290:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
291:    LDC  3,111(6)	Load integer constant 
292:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
293:    LDC  3,111(6)	Load integer constant 
* TOFF inc: -4
294:     LD  4,-4(1)	Pop left into ac1 
295:    TNE  3,4,3	Op >< 
296:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
297:    LDA  1,-2(1)	Ghost frame becomes new active frame 
298:    LDA  3,1(7)	Return address in ac 
299:    JMP  7,-283(7)	CALL outputb
300:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outnl
301:     ST  1,-2(1)	Store fp in ghost frame for outnl
* TOFF dec: -3
* TOFF dec: -4
* Param end outnl
302:    LDA  1,-2(1)	Ghost frame becomes new active frame 
303:    LDA  3,1(7)	Return address in ac 
304:    JMP  7,-271(7)	CALL outnl
305:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -2
* EXPRESSION
* CALL outputb
306:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
307:    LDC  3,0(6)	Load Boolean constant 
308:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
309:    LDC  3,0(6)	Load Boolean constant 
* TOFF inc: -4
310:     LD  4,-4(1)	Pop left into ac1 
311:    AND  3,4,3	Op AND 
312:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
313:    LDA  1,-2(1)	Ghost frame becomes new active frame 
314:    LDA  3,1(7)	Return address in ac 
315:    JMP  7,-299(7)	CALL outputb
316:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outputb
317:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
318:    LDC  3,0(6)	Load Boolean constant 
319:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
320:    LDC  3,1(6)	Load Boolean constant 
* TOFF inc: -4
321:     LD  4,-4(1)	Pop left into ac1 
322:    AND  3,4,3	Op AND 
323:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
324:    LDA  1,-2(1)	Ghost frame becomes new active frame 
325:    LDA  3,1(7)	Return address in ac 
326:    JMP  7,-310(7)	CALL outputb
327:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outputb
328:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
329:    LDC  3,1(6)	Load Boolean constant 
330:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
331:    LDC  3,0(6)	Load Boolean constant 
* TOFF inc: -4
332:     LD  4,-4(1)	Pop left into ac1 
333:    AND  3,4,3	Op AND 
334:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
335:    LDA  1,-2(1)	Ghost frame becomes new active frame 
336:    LDA  3,1(7)	Return address in ac 
337:    JMP  7,-321(7)	CALL outputb
338:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outputb
339:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
340:    LDC  3,1(6)	Load Boolean constant 
341:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
342:    LDC  3,1(6)	Load Boolean constant 
* TOFF inc: -4
343:     LD  4,-4(1)	Pop left into ac1 
344:    AND  3,4,3	Op AND 
345:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
346:    LDA  1,-2(1)	Ghost frame becomes new active frame 
347:    LDA  3,1(7)	Return address in ac 
348:    JMP  7,-332(7)	CALL outputb
349:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outnl
350:     ST  1,-2(1)	Store fp in ghost frame for outnl
* TOFF dec: -3
* TOFF dec: -4
* Param end outnl
351:    LDA  1,-2(1)	Ghost frame becomes new active frame 
352:    LDA  3,1(7)	Return address in ac 
353:    JMP  7,-320(7)	CALL outnl
354:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -2
* EXPRESSION
* CALL outputb
355:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
356:    LDC  3,0(6)	Load Boolean constant 
357:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
358:    LDC  3,0(6)	Load Boolean constant 
* TOFF inc: -4
359:     LD  4,-4(1)	Pop left into ac1 
360:     OR  3,4,3	Op OR 
361:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
362:    LDA  1,-2(1)	Ghost frame becomes new active frame 
363:    LDA  3,1(7)	Return address in ac 
364:    JMP  7,-348(7)	CALL outputb
365:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outputb
366:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
367:    LDC  3,0(6)	Load Boolean constant 
368:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
369:    LDC  3,1(6)	Load Boolean constant 
* TOFF inc: -4
370:     LD  4,-4(1)	Pop left into ac1 
371:     OR  3,4,3	Op OR 
372:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
373:    LDA  1,-2(1)	Ghost frame becomes new active frame 
374:    LDA  3,1(7)	Return address in ac 
375:    JMP  7,-359(7)	CALL outputb
376:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outputb
377:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
378:    LDC  3,1(6)	Load Boolean constant 
379:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
380:    LDC  3,0(6)	Load Boolean constant 
* TOFF inc: -4
381:     LD  4,-4(1)	Pop left into ac1 
382:     OR  3,4,3	Op OR 
383:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
384:    LDA  1,-2(1)	Ghost frame becomes new active frame 
385:    LDA  3,1(7)	Return address in ac 
386:    JMP  7,-370(7)	CALL outputb
387:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outputb
388:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
389:    LDC  3,1(6)	Load Boolean constant 
390:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
391:    LDC  3,1(6)	Load Boolean constant 
* TOFF inc: -4
392:     LD  4,-4(1)	Pop left into ac1 
393:     OR  3,4,3	Op OR 
394:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
395:    LDA  1,-2(1)	Ghost frame becomes new active frame 
396:    LDA  3,1(7)	Return address in ac 
397:    JMP  7,-381(7)	CALL outputb
398:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outnl
399:     ST  1,-2(1)	Store fp in ghost frame for outnl
* TOFF dec: -3
* TOFF dec: -4
* Param end outnl
400:    LDA  1,-2(1)	Ghost frame becomes new active frame 
401:    LDA  3,1(7)	Return address in ac 
402:    JMP  7,-369(7)	CALL outnl
403:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -2
* EXPRESSION
* CALL outputb
404:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
405:    LDC  3,0(6)	Load Boolean constant 
406:    LDC  4,1(6)	Load 1 
407:    XOR  3,3,4	Op XOR to get logical not 
408:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
409:    LDA  1,-2(1)	Ghost frame becomes new active frame 
410:    LDA  3,1(7)	Return address in ac 
411:    JMP  7,-395(7)	CALL outputb
412:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outputb
413:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
414:    LDC  3,1(6)	Load Boolean constant 
415:    LDC  4,1(6)	Load 1 
416:    XOR  3,3,4	Op XOR to get logical not 
417:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
418:    LDA  1,-2(1)	Ghost frame becomes new active frame 
419:    LDA  3,1(7)	Return address in ac 
420:    JMP  7,-404(7)	CALL outputb
421:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outnl
422:     ST  1,-2(1)	Store fp in ghost frame for outnl
* TOFF dec: -3
* TOFF dec: -4
* Param end outnl
423:    LDA  1,-2(1)	Ghost frame becomes new active frame 
424:    LDA  3,1(7)	Return address in ac 
425:    JMP  7,-392(7)	CALL outnl
426:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -2
* EXPRESSION
* CALL output
427:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
428:    LDC  3,333(6)	Load integer constant 
429:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
430:    LDC  3,444(6)	Load integer constant 
* TOFF inc: -4
431:     LD  4,-4(1)	Pop left into ac1 
432:    ADD  3,4,3	Op + 
433:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
434:    LDA  1,-2(1)	Ghost frame becomes new active frame 
435:    LDA  3,1(7)	Return address in ac 
436:    JMP  7,-431(7)	CALL output
437:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL output
438:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
439:    LDC  3,333(6)	Load integer constant 
440:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
441:    LDC  3,444(6)	Load integer constant 
* TOFF inc: -4
442:     LD  4,-4(1)	Pop left into ac1 
443:    SUB  3,4,3	Op - 
444:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
445:    LDA  1,-2(1)	Ghost frame becomes new active frame 
446:    LDA  3,1(7)	Return address in ac 
447:    JMP  7,-442(7)	CALL output
448:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL output
449:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
450:    LDC  3,333(6)	Load integer constant 
451:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
452:    LDC  3,444(6)	Load integer constant 
* TOFF inc: -4
453:     LD  4,-4(1)	Pop left into ac1 
454:    MUL  3,4,3	Op * 
455:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
456:    LDA  1,-2(1)	Ghost frame becomes new active frame 
457:    LDA  3,1(7)	Return address in ac 
458:    JMP  7,-453(7)	CALL output
459:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL output
460:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
461:    LDC  3,333(6)	Load integer constant 
462:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
463:    LDC  3,444(6)	Load integer constant 
* TOFF inc: -4
464:     LD  4,-4(1)	Pop left into ac1 
465:    DIV  3,4,3	Op / 
466:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
467:    LDA  1,-2(1)	Ghost frame becomes new active frame 
468:    LDA  3,1(7)	Return address in ac 
469:    JMP  7,-464(7)	CALL output
470:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL output
471:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
472:    LDC  3,3333(6)	Load integer constant 
473:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
474:    LDC  3,444(6)	Load integer constant 
* TOFF inc: -4
475:     LD  4,-4(1)	Pop left into ac1 
476:    MOD  3,4,3	Op % 
477:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
478:    LDA  1,-2(1)	Ghost frame becomes new active frame 
479:    LDA  3,1(7)	Return address in ac 
480:    JMP  7,-475(7)	CALL output
481:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL output
482:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
483:    LDC  3,444(6)	Load integer constant 
484:    NEG  3,3,3	Op unary - 
485:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
486:    LDA  1,-2(1)	Ghost frame becomes new active frame 
487:    LDA  3,1(7)	Return address in ac 
488:    JMP  7,-483(7)	CALL output
489:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* RETURN
490:     LD  3,-1(1)	Load return address 
491:     LD  1,0(1)	Adjust fp 
492:    JMP  7,0(3)	Return 
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
493:    LDC  2,0(6)	Set return value to 0 
494:     LD  3,-1(1)	Load return address 
495:     LD  1,0(1)	Adjust fp 
496:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,496(7)	Jump to init [backpatch] 
* INIT
497:    LDA  1,0(0)	set first frame at end of globals 
498:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
499:    LDA  3,1(7)	Return address in ac 
500:    JMP  7,-462(7)	Jump to main 
501:   HALT  0,0,0	DONE! 
* END INIT
