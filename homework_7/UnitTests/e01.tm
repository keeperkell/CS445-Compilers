* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  e01.c-
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
* TOFF set: -3
* Compound Body
* IF
 40:    LDC  3,1(6)	Load Boolean constant 
* THEN
* EXPRESSION
* CALL output
 42:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 43:    LDC  3,13(6)	Load integer constant 
 44:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 45:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 46:    LDA  3,1(7)	Return address in ac 
 47:    JMP  7,-42(7)	CALL output
 48:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
 41:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* END IF
* EXPRESSION
* CALL output
 49:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 50:    LDC  3,23(6)	Load integer constant 
 51:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 52:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 53:    LDA  3,1(7)	Return address in ac 
 54:    JMP  7,-49(7)	CALL output
 55:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL outnl
 56:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
 57:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 58:    LDA  3,1(7)	Return address in ac 
 59:    JMP  7,-26(7)	CALL outnl
 60:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* EXPRESSION
 61:    LDC  3,0(6)	Load Boolean constant 
 62:     ST  3,-2(1)	Store variable x
* IF
 63:     LD  3,-2(1)	Load variable x
* THEN
* EXPRESSION
* CALL output
 65:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 66:    LDC  3,44(6)	Load integer constant 
 67:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 68:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 69:    LDA  3,1(7)	Return address in ac 
 70:    JMP  7,-65(7)	CALL output
 71:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
 64:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* END IF
* IF
 72:     LD  3,-2(1)	Load variable x
 73:    LDC  4,1(6)	Load 1 
 74:    XOR  3,3,4	Op XOR to get logical not 
* THEN
* EXPRESSION
* CALL output
 76:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 77:    LDC  3,55(6)	Load integer constant 
 78:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 79:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 80:    LDA  3,1(7)	Return address in ac 
 81:    JMP  7,-76(7)	CALL output
 82:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
 75:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* END IF
* EXPRESSION
* CALL outnl
 83:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
 84:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 85:    LDA  3,1(7)	Return address in ac 
 86:    JMP  7,-53(7)	CALL outnl
 87:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* IF
 88:    LDC  3,3(6)	Load integer constant 
 89:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 90:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -3
 91:     LD  4,-3(1)	Pop left into ac1 
 92:    TGT  3,4,3	Op > 
* THEN
* EXPRESSION
* CALL output
 94:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 95:    LDC  3,987(6)	Load integer constant 
 96:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 97:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 98:    LDA  3,1(7)	Return address in ac 
 99:    JMP  7,-94(7)	CALL output
100:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
 93:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* END IF
* IF
101:    LDC  3,3(6)	Load integer constant 
102:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
103:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -3
104:     LD  4,-3(1)	Pop left into ac1 
105:    TLT  3,4,3	Op < 
* THEN
* EXPRESSION
* CALL output
107:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
108:    LDC  3,211(6)	Load integer constant 
109:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
110:    LDA  1,-3(1)	Ghost frame becomes new active frame 
111:    LDA  3,1(7)	Return address in ac 
112:    JMP  7,-107(7)	CALL output
113:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
106:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* END IF
* EXPRESSION
* CALL outnl
114:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
115:    LDA  1,-3(1)	Ghost frame becomes new active frame 
116:    LDA  3,1(7)	Return address in ac 
117:    JMP  7,-84(7)	CALL outnl
118:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* IF
119:    LDC  3,1(6)	Load Boolean constant 
* THEN
* EXPRESSION
* CALL output
121:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
122:    LDC  3,13(6)	Load integer constant 
123:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
124:    LDA  1,-3(1)	Ghost frame becomes new active frame 
125:    LDA  3,1(7)	Return address in ac 
126:    JMP  7,-121(7)	CALL output
127:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
120:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
* CALL output
129:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
130:    LDC  3,51(6)	Load integer constant 
131:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
132:    LDA  1,-3(1)	Ghost frame becomes new active frame 
133:    LDA  3,1(7)	Return address in ac 
134:    JMP  7,-129(7)	CALL output
135:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
128:    JMP  7,7(7)	Jump around the ELSE [backpatch] 
* END IF
* IF
136:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
* CALL output
138:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
139:    LDC  3,23(6)	Load integer constant 
140:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
141:    LDA  1,-3(1)	Ghost frame becomes new active frame 
142:    LDA  3,1(7)	Return address in ac 
143:    JMP  7,-138(7)	CALL output
144:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
137:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
* CALL output
146:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
147:    LDC  3,451(6)	Load integer constant 
148:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
149:    LDA  1,-3(1)	Ghost frame becomes new active frame 
150:    LDA  3,1(7)	Return address in ac 
151:    JMP  7,-146(7)	CALL output
152:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
145:    JMP  7,7(7)	Jump around the ELSE [backpatch] 
* END IF
* EXPRESSION
* CALL outnl
153:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
154:    LDA  1,-3(1)	Ghost frame becomes new active frame 
155:    LDA  3,1(7)	Return address in ac 
156:    JMP  7,-123(7)	CALL outnl
157:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* EXPRESSION
158:    LDC  3,0(6)	Load Boolean constant 
159:     ST  3,-2(1)	Store variable x
* IF
160:     LD  3,-2(1)	Load variable x
* THEN
* EXPRESSION
* CALL output
162:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
163:    LDC  3,44(6)	Load integer constant 
164:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
165:    LDA  1,-3(1)	Ghost frame becomes new active frame 
166:    LDA  3,1(7)	Return address in ac 
167:    JMP  7,-162(7)	CALL output
168:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
161:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
* CALL output
170:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
171:    LDC  3,514(6)	Load integer constant 
172:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
173:    LDA  1,-3(1)	Ghost frame becomes new active frame 
174:    LDA  3,1(7)	Return address in ac 
175:    JMP  7,-170(7)	CALL output
176:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
169:    JMP  7,7(7)	Jump around the ELSE [backpatch] 
* END IF
* IF
177:     LD  3,-2(1)	Load variable x
178:    LDC  4,1(6)	Load 1 
179:    XOR  3,3,4	Op XOR to get logical not 
* THEN
* EXPRESSION
* CALL output
181:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
182:    LDC  3,55(6)	Load integer constant 
183:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
184:    LDA  1,-3(1)	Ghost frame becomes new active frame 
185:    LDA  3,1(7)	Return address in ac 
186:    JMP  7,-181(7)	CALL output
187:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
180:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
* CALL output
189:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
190:    LDC  3,1514(6)	Load integer constant 
191:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
192:    LDA  1,-3(1)	Ghost frame becomes new active frame 
193:    LDA  3,1(7)	Return address in ac 
194:    JMP  7,-189(7)	CALL output
195:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
188:    JMP  7,7(7)	Jump around the ELSE [backpatch] 
* END IF
* EXPRESSION
* CALL outnl
196:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
197:    LDA  1,-3(1)	Ghost frame becomes new active frame 
198:    LDA  3,1(7)	Return address in ac 
199:    JMP  7,-166(7)	CALL outnl
200:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* IF
201:    LDC  3,3(6)	Load integer constant 
202:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
203:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -3
204:     LD  4,-3(1)	Pop left into ac1 
205:    TGT  3,4,3	Op > 
* THEN
* EXPRESSION
* CALL output
207:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
208:    LDC  3,987(6)	Load integer constant 
209:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
210:    LDA  1,-3(1)	Ghost frame becomes new active frame 
211:    LDA  3,1(7)	Return address in ac 
212:    JMP  7,-207(7)	CALL output
213:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
206:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
* CALL output
215:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
216:    LDC  3,114(6)	Load integer constant 
217:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
218:    LDA  1,-3(1)	Ghost frame becomes new active frame 
219:    LDA  3,1(7)	Return address in ac 
220:    JMP  7,-215(7)	CALL output
221:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
214:    JMP  7,7(7)	Jump around the ELSE [backpatch] 
* END IF
* IF
222:    LDC  3,3(6)	Load integer constant 
223:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
224:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -3
225:     LD  4,-3(1)	Pop left into ac1 
226:    TLT  3,4,3	Op < 
* THEN
* EXPRESSION
* CALL output
228:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
229:    LDC  3,211(6)	Load integer constant 
230:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
231:    LDA  1,-3(1)	Ghost frame becomes new active frame 
232:    LDA  3,1(7)	Return address in ac 
233:    JMP  7,-228(7)	CALL output
234:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
227:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
* CALL output
236:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
237:    LDC  3,1614(6)	Load integer constant 
238:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
239:    LDA  1,-3(1)	Ghost frame becomes new active frame 
240:    LDA  3,1(7)	Return address in ac 
241:    JMP  7,-236(7)	CALL output
242:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
235:    JMP  7,7(7)	Jump around the ELSE [backpatch] 
* END IF
* EXPRESSION
* CALL outnl
243:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
244:    LDA  1,-3(1)	Ghost frame becomes new active frame 
245:    LDA  3,1(7)	Return address in ac 
246:    JMP  7,-213(7)	CALL outnl
247:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
248:    LDC  2,0(6)	Set return value to 0 
249:     LD  3,-1(1)	Load return address 
250:     LD  1,0(1)	Adjust fp 
251:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,251(7)	Jump to init [backpatch] 
* INIT
252:    LDA  1,0(0)	set first frame at end of globals 
253:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
254:    LDA  3,1(7)	Return address in ac 
255:    JMP  7,-217(7)	Jump to main 
256:   HALT  0,0,0	DONE! 
* END INIT
