* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  e04.c-
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
 40:    LDC  3,0(6)	Load Boolean constant 
* THEN
* IF
 42:    LDC  3,1(6)	Load Boolean constant 
* THEN
* EXPRESSION
* CALL output
 44:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 45:    LDC  3,13(6)	Load integer constant 
 46:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 47:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 48:    LDA  3,1(7)	Return address in ac 
 49:    JMP  7,-44(7)	CALL output
 50:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
 43:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* END IF
 41:    JZR  3,9(7)	Jump around the THEN if false [backpatch] 
* END IF
* IF
 51:    LDC  3,0(6)	Load Boolean constant 
* THEN
* IF
 53:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
* CALL output
 55:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 56:    LDC  3,23(6)	Load integer constant 
 57:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 58:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 59:    LDA  3,1(7)	Return address in ac 
 60:    JMP  7,-55(7)	CALL output
 61:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
 54:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* END IF
 52:    JZR  3,9(7)	Jump around the THEN if false [backpatch] 
* END IF
* EXPRESSION
 62:    LDC  3,0(6)	Load Boolean constant 
 63:     ST  3,-2(1)	Store variable x
* IF
 64:    LDC  3,0(6)	Load Boolean constant 
* THEN
* IF
 66:     LD  3,-2(1)	Load variable x
* THEN
* EXPRESSION
* CALL output
 68:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 69:    LDC  3,44(6)	Load integer constant 
 70:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 71:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 72:    LDA  3,1(7)	Return address in ac 
 73:    JMP  7,-68(7)	CALL output
 74:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
 67:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* END IF
 65:    JZR  3,9(7)	Jump around the THEN if false [backpatch] 
* END IF
* IF
 75:    LDC  3,0(6)	Load Boolean constant 
* THEN
* IF
 77:     LD  3,-2(1)	Load variable x
 78:    LDC  4,1(6)	Load 1 
 79:    XOR  3,3,4	Op XOR to get logical not 
* THEN
* EXPRESSION
* CALL output
 81:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 82:    LDC  3,55(6)	Load integer constant 
 83:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 84:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 85:    LDA  3,1(7)	Return address in ac 
 86:    JMP  7,-81(7)	CALL output
 87:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
 80:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* END IF
 76:    JZR  3,11(7)	Jump around the THEN if false [backpatch] 
* END IF
* IF
 88:    LDC  3,0(6)	Load Boolean constant 
* THEN
* IF
 90:    LDC  3,3(6)	Load integer constant 
 91:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 92:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -3
 93:     LD  4,-3(1)	Pop left into ac1 
 94:    TGT  3,4,3	Op > 
* THEN
* EXPRESSION
* CALL output
 96:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 97:    LDC  3,987(6)	Load integer constant 
 98:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 99:    LDA  1,-3(1)	Ghost frame becomes new active frame 
100:    LDA  3,1(7)	Return address in ac 
101:    JMP  7,-96(7)	CALL output
102:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
 95:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* END IF
 89:    JZR  3,13(7)	Jump around the THEN if false [backpatch] 
* END IF
* IF
103:    LDC  3,0(6)	Load Boolean constant 
* THEN
* IF
105:    LDC  3,3(6)	Load integer constant 
106:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
107:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -3
108:     LD  4,-3(1)	Pop left into ac1 
109:    TLT  3,4,3	Op < 
* THEN
* EXPRESSION
* CALL output
111:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
112:    LDC  3,211(6)	Load integer constant 
113:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
114:    LDA  1,-3(1)	Ghost frame becomes new active frame 
115:    LDA  3,1(7)	Return address in ac 
116:    JMP  7,-111(7)	CALL output
117:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
110:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* END IF
104:    JZR  3,13(7)	Jump around the THEN if false [backpatch] 
* END IF
* IF
118:    LDC  3,0(6)	Load Boolean constant 
* THEN
* IF
120:    LDC  3,1(6)	Load Boolean constant 
* THEN
* EXPRESSION
* CALL output
122:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
123:    LDC  3,13(6)	Load integer constant 
124:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
125:    LDA  1,-3(1)	Ghost frame becomes new active frame 
126:    LDA  3,1(7)	Return address in ac 
127:    JMP  7,-122(7)	CALL output
128:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
121:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
* CALL output
130:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
131:    LDC  3,51(6)	Load integer constant 
132:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
133:    LDA  1,-3(1)	Ghost frame becomes new active frame 
134:    LDA  3,1(7)	Return address in ac 
135:    JMP  7,-130(7)	CALL output
136:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
129:    JMP  7,7(7)	Jump around the ELSE [backpatch] 
* END IF
119:    JZR  3,17(7)	Jump around the THEN if false [backpatch] 
* END IF
* IF
137:    LDC  3,0(6)	Load Boolean constant 
* THEN
* IF
139:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
* CALL output
141:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
142:    LDC  3,23(6)	Load integer constant 
143:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
144:    LDA  1,-3(1)	Ghost frame becomes new active frame 
145:    LDA  3,1(7)	Return address in ac 
146:    JMP  7,-141(7)	CALL output
147:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
140:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
* CALL output
149:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
150:    LDC  3,451(6)	Load integer constant 
151:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
152:    LDA  1,-3(1)	Ghost frame becomes new active frame 
153:    LDA  3,1(7)	Return address in ac 
154:    JMP  7,-149(7)	CALL output
155:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
148:    JMP  7,7(7)	Jump around the ELSE [backpatch] 
* END IF
138:    JZR  3,17(7)	Jump around the THEN if false [backpatch] 
* END IF
* EXPRESSION
156:    LDC  3,0(6)	Load Boolean constant 
157:     ST  3,-2(1)	Store variable x
* IF
158:    LDC  3,0(6)	Load Boolean constant 
* THEN
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
159:    JZR  3,17(7)	Jump around the THEN if false [backpatch] 
* END IF
* IF
177:    LDC  3,0(6)	Load Boolean constant 
* THEN
* IF
179:     LD  3,-2(1)	Load variable x
180:    LDC  4,1(6)	Load 1 
181:    XOR  3,3,4	Op XOR to get logical not 
* THEN
* EXPRESSION
* CALL output
183:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
184:    LDC  3,55(6)	Load integer constant 
185:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
186:    LDA  1,-3(1)	Ghost frame becomes new active frame 
187:    LDA  3,1(7)	Return address in ac 
188:    JMP  7,-183(7)	CALL output
189:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
182:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
* CALL output
191:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
192:    LDC  3,1514(6)	Load integer constant 
193:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
194:    LDA  1,-3(1)	Ghost frame becomes new active frame 
195:    LDA  3,1(7)	Return address in ac 
196:    JMP  7,-191(7)	CALL output
197:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
190:    JMP  7,7(7)	Jump around the ELSE [backpatch] 
* END IF
178:    JZR  3,19(7)	Jump around the THEN if false [backpatch] 
* END IF
* IF
198:    LDC  3,0(6)	Load Boolean constant 
* THEN
* IF
200:    LDC  3,3(6)	Load integer constant 
201:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
202:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -3
203:     LD  4,-3(1)	Pop left into ac1 
204:    TGT  3,4,3	Op > 
* THEN
* EXPRESSION
* CALL output
206:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
207:    LDC  3,987(6)	Load integer constant 
208:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
209:    LDA  1,-3(1)	Ghost frame becomes new active frame 
210:    LDA  3,1(7)	Return address in ac 
211:    JMP  7,-206(7)	CALL output
212:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
205:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
* CALL output
214:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
215:    LDC  3,114(6)	Load integer constant 
216:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
217:    LDA  1,-3(1)	Ghost frame becomes new active frame 
218:    LDA  3,1(7)	Return address in ac 
219:    JMP  7,-214(7)	CALL output
220:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
213:    JMP  7,7(7)	Jump around the ELSE [backpatch] 
* END IF
199:    JZR  3,21(7)	Jump around the THEN if false [backpatch] 
* END IF
* IF
221:    LDC  3,0(6)	Load Boolean constant 
* THEN
* IF
223:    LDC  3,3(6)	Load integer constant 
224:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
225:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -3
226:     LD  4,-3(1)	Pop left into ac1 
227:    TLT  3,4,3	Op < 
* THEN
* EXPRESSION
* CALL output
229:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
230:    LDC  3,211(6)	Load integer constant 
231:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
232:    LDA  1,-3(1)	Ghost frame becomes new active frame 
233:    LDA  3,1(7)	Return address in ac 
234:    JMP  7,-229(7)	CALL output
235:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
228:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
* CALL output
237:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
238:    LDC  3,1614(6)	Load integer constant 
239:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
240:    LDA  1,-3(1)	Ghost frame becomes new active frame 
241:    LDA  3,1(7)	Return address in ac 
242:    JMP  7,-237(7)	CALL output
243:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
236:    JMP  7,7(7)	Jump around the ELSE [backpatch] 
* END IF
222:    JZR  3,21(7)	Jump around the THEN if false [backpatch] 
* END IF
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
244:    LDC  2,0(6)	Set return value to 0 
245:     LD  3,-1(1)	Load return address 
246:     LD  1,0(1)	Adjust fp 
247:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,247(7)	Jump to init [backpatch] 
* INIT
248:    LDA  1,0(0)	set first frame at end of globals 
249:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
250:    LDA  3,1(7)	Return address in ac 
251:    JMP  7,-213(7)	Jump to main 
252:   HALT  0,0,0	DONE! 
* END INIT
