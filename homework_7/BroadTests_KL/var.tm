* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  var.c-
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
* FUNCTION cat
* TOFF set: -4
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -4
* Compound Body
* EXPRESSION
* CALL output
 40:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 41:     LD  3,-2(1)	Load variable x
 42:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
 43:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 44:    LDA  3,1(7)	Return address in ac 
 45:    JMP  7,-40(7)	CALL output
 46:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
* CALL output
 47:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 48:     LD  3,-3(1)	Load address of base of array xa
 49:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
 50:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -6
 51:     LD  4,-6(1)	Pop left into ac1 
 52:    SUB  3,4,3	compute location from index 
 53:     LD  3,0(3)	Load array element 
 54:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
 55:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 56:    LDA  3,1(7)	Return address in ac 
 57:    JMP  7,-52(7)	CALL output
 58:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
* CALL outnl
 59:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
 60:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 61:    LDA  3,1(7)	Return address in ac 
 62:    JMP  7,-29(7)	CALL outnl
 63:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
* TOFF set: -4
* END COMPOUND
* Add standard closing in case there is no return statement
 64:    LDC  2,0(6)	Set return value to 0 
 65:     LD  3,-1(1)	Load return address 
 66:     LD  1,0(1)	Adjust fp 
 67:    JMP  7,0(3)	Return 
* END FUNCTION cat
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION dog
* TOFF set: -4
 68:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -4
* Compound Body
* EXPRESSION
* CALL output
 69:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 70:     LD  3,-2(1)	Load variable x
 71:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
 72:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 73:    LDA  3,1(7)	Return address in ac 
 74:    JMP  7,-69(7)	CALL output
 75:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
* CALL output
 76:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 77:     LD  3,-3(1)	Load address of base of array xa
 78:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
 79:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -6
 80:     LD  4,-6(1)	Pop left into ac1 
 81:    SUB  3,4,3	compute location from index 
 82:     LD  3,0(3)	Load array element 
 83:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
 84:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 85:    LDA  3,1(7)	Return address in ac 
 86:    JMP  7,-81(7)	CALL output
 87:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
* CALL outnl
 88:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
 89:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 90:    LDA  3,1(7)	Return address in ac 
 91:    JMP  7,-58(7)	CALL outnl
 92:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
* EXPRESSION
 93:    LDC  3,668(6)	Load integer constant 
 94:     ST  3,-2(1)	Store variable x
* EXPRESSION
 95:    LDC  3,1(6)	Load integer constant 
 96:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 97:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -4
 98:     LD  4,-4(1)	Pop left into ac1 
 99:    ADD  3,4,3	Op + 
100:     ST  3,-4(1)	Push index 
* TOFF dec: -5
101:    LDC  3,669(6)	Load integer constant 
* TOFF inc: -4
102:     LD  4,-4(1)	Pop index 
103:     LD  5,-3(1)	Load address of base of array xa
104:    SUB  5,5,4	Compute offset of value 
105:     ST  3,0(5)	Store variable xa
* EXPRESSION
* CALL output
106:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
107:     LD  3,-2(1)	Load variable x
108:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
109:    LDA  1,-4(1)	Ghost frame becomes new active frame 
110:    LDA  3,1(7)	Return address in ac 
111:    JMP  7,-106(7)	CALL output
112:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
* CALL output
113:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
114:     LD  3,-3(1)	Load address of base of array xa
115:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
116:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -6
117:     LD  4,-6(1)	Pop left into ac1 
118:    SUB  3,4,3	compute location from index 
119:     LD  3,0(3)	Load array element 
120:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
121:    LDA  1,-4(1)	Ghost frame becomes new active frame 
122:    LDA  3,1(7)	Return address in ac 
123:    JMP  7,-118(7)	CALL output
124:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
* CALL outnl
125:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
126:    LDA  1,-4(1)	Ghost frame becomes new active frame 
127:    LDA  3,1(7)	Return address in ac 
128:    JMP  7,-95(7)	CALL outnl
129:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
* EXPRESSION
130:    LDC  3,670(6)	Load integer constant 
131:     ST  3,0(0)	Store variable g
* EXPRESSION
132:    LDC  3,2(6)	Load integer constant 
133:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
134:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
135:     LD  4,-4(1)	Pop left into ac1 
136:    ADD  3,4,3	Op + 
137:     ST  3,-4(1)	Push index 
* TOFF dec: -5
138:    LDC  3,671(6)	Load integer constant 
* TOFF inc: -4
139:     LD  4,-4(1)	Pop index 
140:    LDA  5,-2(0)	Load address of base of array ga
141:    SUB  5,5,4	Compute offset of value 
142:     ST  3,0(5)	Store variable ga
* EXPRESSION
* CALL output
143:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
144:     LD  3,0(0)	Load variable g
145:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
146:    LDA  1,-4(1)	Ghost frame becomes new active frame 
147:    LDA  3,1(7)	Return address in ac 
148:    JMP  7,-143(7)	CALL output
149:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
* CALL output
150:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
151:    LDA  3,-2(0)	Load address of base of array ga
152:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
153:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -6
154:     LD  4,-6(1)	Pop left into ac1 
155:    SUB  3,4,3	compute location from index 
156:     LD  3,0(3)	Load array element 
157:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
158:    LDA  1,-4(1)	Ghost frame becomes new active frame 
159:    LDA  3,1(7)	Return address in ac 
160:    JMP  7,-155(7)	CALL output
161:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
* CALL outnl
162:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
163:    LDA  1,-4(1)	Ghost frame becomes new active frame 
164:    LDA  3,1(7)	Return address in ac 
165:    JMP  7,-132(7)	CALL outnl
166:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
* EXPRESSION
* CALL cat
167:     ST  1,-4(1)	Store fp in ghost frame for cat
* TOFF dec: -5
* TOFF dec: -6
* Param 1
168:     LD  3,-2(1)	Load variable x
169:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param 2
170:     LD  3,-3(1)	Load address of base of array xa
171:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end cat
172:    LDA  1,-4(1)	Ghost frame becomes new active frame 
173:    LDA  3,1(7)	Return address in ac 
174:    JMP  7,-136(7)	CALL cat
175:    LDA  3,0(2)	Save the result in ac 
* Call end cat
* TOFF set: -4
* EXPRESSION
* CALL cat
176:     ST  1,-4(1)	Store fp in ghost frame for cat
* TOFF dec: -5
* TOFF dec: -6
* Param 1
177:     LD  3,0(0)	Load variable g
178:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param 2
179:    LDA  3,-2(0)	Load address of base of array ga
180:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end cat
181:    LDA  1,-4(1)	Ghost frame becomes new active frame 
182:    LDA  3,1(7)	Return address in ac 
183:    JMP  7,-145(7)	CALL cat
184:    LDA  3,0(2)	Save the result in ac 
* Call end cat
* TOFF set: -4
* TOFF set: -4
* END COMPOUND
* Add standard closing in case there is no return statement
185:    LDC  2,0(6)	Set return value to 0 
186:     LD  3,-1(1)	Load return address 
187:     LD  1,0(1)	Adjust fp 
188:    JMP  7,0(3)	Return 
* END FUNCTION dog
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
189:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -14
190:    LDC  3,10(6)	load size of array ya
191:     ST  3,-3(1)	save size of array ya
* Compound Body
* EXPRESSION
192:    LDC  3,666(6)	Load integer constant 
193:     ST  3,-2(1)	Store variable y
* EXPRESSION
194:    LDC  3,1(6)	Load integer constant 
195:     ST  3,-14(1)	Push left side 
* TOFF dec: -15
196:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -14
197:     LD  4,-14(1)	Pop left into ac1 
198:    ADD  3,4,3	Op + 
199:     ST  3,-14(1)	Push index 
* TOFF dec: -15
200:    LDC  3,667(6)	Load integer constant 
* TOFF inc: -14
201:     LD  4,-14(1)	Pop index 
202:    LDA  5,-4(1)	Load address of base of array ya
203:    SUB  5,5,4	Compute offset of value 
204:     ST  3,0(5)	Store variable ya
* EXPRESSION
* CALL output
205:     ST  1,-14(1)	Store fp in ghost frame for output
* TOFF dec: -15
* TOFF dec: -16
* Param 1
206:     LD  3,-2(1)	Load variable y
207:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param end output
208:    LDA  1,-14(1)	Ghost frame becomes new active frame 
209:    LDA  3,1(7)	Return address in ac 
210:    JMP  7,-205(7)	CALL output
211:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -14
* EXPRESSION
* CALL output
212:     ST  1,-14(1)	Store fp in ghost frame for output
* TOFF dec: -15
* TOFF dec: -16
* Param 1
213:    LDA  3,-4(1)	Load address of base of array ya
214:     ST  3,-16(1)	Push left side 
* TOFF dec: -17
215:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -16
216:     LD  4,-16(1)	Pop left into ac1 
217:    SUB  3,4,3	compute location from index 
218:     LD  3,0(3)	Load array element 
219:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param end output
220:    LDA  1,-14(1)	Ghost frame becomes new active frame 
221:    LDA  3,1(7)	Return address in ac 
222:    JMP  7,-217(7)	CALL output
223:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -14
* EXPRESSION
* CALL outnl
224:     ST  1,-14(1)	Store fp in ghost frame for outnl
* TOFF dec: -15
* TOFF dec: -16
* Param end outnl
225:    LDA  1,-14(1)	Ghost frame becomes new active frame 
226:    LDA  3,1(7)	Return address in ac 
227:    JMP  7,-194(7)	CALL outnl
228:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -14
* EXPRESSION
* CALL dog
229:     ST  1,-14(1)	Store fp in ghost frame for dog
* TOFF dec: -15
* TOFF dec: -16
* Param 1
230:     LD  3,-2(1)	Load variable y
231:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param 2
232:    LDA  3,-4(1)	Load address of base of array ya
233:     ST  3,-17(1)	Push parameter 
* TOFF dec: -18
* Param end dog
234:    LDA  1,-14(1)	Ghost frame becomes new active frame 
235:    LDA  3,1(7)	Return address in ac 
236:    JMP  7,-169(7)	CALL dog
237:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -14
* EXPRESSION
* CALL output
238:     ST  1,-14(1)	Store fp in ghost frame for output
* TOFF dec: -15
* TOFF dec: -16
* Param 1
239:     LD  3,-2(1)	Load variable y
240:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param end output
241:    LDA  1,-14(1)	Ghost frame becomes new active frame 
242:    LDA  3,1(7)	Return address in ac 
243:    JMP  7,-238(7)	CALL output
244:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -14
* EXPRESSION
* CALL output
245:     ST  1,-14(1)	Store fp in ghost frame for output
* TOFF dec: -15
* TOFF dec: -16
* Param 1
246:    LDA  3,-4(1)	Load address of base of array ya
247:     ST  3,-16(1)	Push left side 
* TOFF dec: -17
248:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -16
249:     LD  4,-16(1)	Pop left into ac1 
250:    SUB  3,4,3	compute location from index 
251:     LD  3,0(3)	Load array element 
252:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param end output
253:    LDA  1,-14(1)	Ghost frame becomes new active frame 
254:    LDA  3,1(7)	Return address in ac 
255:    JMP  7,-250(7)	CALL output
256:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -14
* EXPRESSION
* CALL outnl
257:     ST  1,-14(1)	Store fp in ghost frame for outnl
* TOFF dec: -15
* TOFF dec: -16
* Param end outnl
258:    LDA  1,-14(1)	Ghost frame becomes new active frame 
259:    LDA  3,1(7)	Return address in ac 
260:    JMP  7,-227(7)	CALL outnl
261:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -14
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
262:    LDC  2,0(6)	Set return value to 0 
263:     LD  3,-1(1)	Load return address 
264:     LD  1,0(1)	Adjust fp 
265:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,265(7)	Jump to init [backpatch] 
* INIT
266:    LDA  1,-12(0)	set first frame at end of globals 
267:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
268:    LDC  3,10(6)	load size of array ga
269:     ST  3,-1(0)	save size of array ga
* END INIT GLOBALS AND STATICS
270:    LDA  3,1(7)	Return address in ac 
271:    JMP  7,-83(7)	Jump to main 
272:   HALT  0,0,0	DONE! 
* END INIT
