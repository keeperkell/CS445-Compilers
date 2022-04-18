* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  factor.c-
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
* FUNCTION sqrt
* TOFF set: -3
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -5
* Compound Body
* IF
 40:     LD  3,-2(1)	Load variable x
 41:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 42:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -5
 43:     LD  4,-5(1)	Pop left into ac1 
 44:    TEQ  3,4,3	Op = 
* THEN
* RETURN
 46:    LDC  3,1(6)	Load integer constant 
 47:    LDA  2,0(3)	Copy result to return register 
 48:     LD  3,-1(1)	Load return address 
 49:     LD  1,0(1)	Adjust fp 
 50:    JMP  7,0(3)	Return 
 45:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* END IF
* EXPRESSION
 51:     LD  3,-2(1)	Load variable x
 52:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 53:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -5
 54:     LD  4,-5(1)	Pop left into ac1 
 55:    DIV  3,4,3	Op / 
 56:     ST  3,-3(1)	Store variable guess
* EXPRESSION
 57:     LD  3,-2(1)	Load variable x
 58:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 59:     LD  3,-3(1)	Load variable guess
* TOFF inc: -5
 60:     LD  4,-5(1)	Pop left into ac1 
 61:    DIV  3,4,3	Op / 
 62:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 63:     LD  3,-3(1)	Load variable guess
* TOFF inc: -5
 64:     LD  4,-5(1)	Pop left into ac1 
 65:    ADD  3,4,3	Op + 
 66:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 67:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -5
 68:     LD  4,-5(1)	Pop left into ac1 
 69:    DIV  3,4,3	Op / 
 70:     ST  3,-4(1)	Store variable newguess
* WHILE
 71:     LD  3,-3(1)	Load variable guess
 72:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 73:     LD  3,-4(1)	Load variable newguess
* TOFF inc: -5
 74:     LD  4,-5(1)	Pop left into ac1 
 75:    SUB  3,4,3	Op - 
 76:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 77:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -5
 78:     LD  4,-5(1)	Pop left into ac1 
 79:    TGT  3,4,3	Op > 
 80:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -5
* Compound Body
* EXPRESSION
 82:     LD  3,-4(1)	Load variable newguess
 83:     ST  3,-3(1)	Store variable guess
* EXPRESSION
 84:     LD  3,-2(1)	Load variable x
 85:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 86:     LD  3,-3(1)	Load variable guess
* TOFF inc: -5
 87:     LD  4,-5(1)	Pop left into ac1 
 88:    DIV  3,4,3	Op / 
 89:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 90:     LD  3,-3(1)	Load variable guess
* TOFF inc: -5
 91:     LD  4,-5(1)	Pop left into ac1 
 92:    ADD  3,4,3	Op + 
 93:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 94:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -5
 95:     LD  4,-5(1)	Pop left into ac1 
 96:    DIV  3,4,3	Op / 
 97:     ST  3,-4(1)	Store variable newguess
* TOFF set: -5
* END COMPOUND
 98:    JMP  7,-28(7)	go to beginning of loop 
 81:    JMP  7,17(7)	Jump past loop [backpatch] 
* END WHILE
* IF
 99:     LD  3,-4(1)	Load variable newguess
100:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
101:     LD  3,-4(1)	Load variable newguess
* TOFF inc: -5
102:     LD  4,-5(1)	Pop left into ac1 
103:    MUL  3,4,3	Op * 
104:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
105:     LD  3,-2(1)	Load variable x
* TOFF inc: -5
106:     LD  4,-5(1)	Pop left into ac1 
107:    TGT  3,4,3	Op > 
* THEN
* EXPRESSION
109:     LD  3,-4(1)	Load variable newguess
110:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
111:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -5
112:     LD  4,-5(1)	Pop left into ac1 
113:    SUB  3,4,3	Op - 
114:     ST  3,-4(1)	Store variable newguess
108:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* END IF
* RETURN
115:     LD  3,-4(1)	Load variable newguess
116:    LDA  2,0(3)	Copy result to return register 
117:     LD  3,-1(1)	Load return address 
118:     LD  1,0(1)	Adjust fp 
119:    JMP  7,0(3)	Return 
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
120:    LDC  2,0(6)	Set return value to 0 
121:     LD  3,-1(1)	Load return address 
122:     LD  1,0(1)	Adjust fp 
123:    JMP  7,0(3)	Return 
* END FUNCTION sqrt
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
124:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -4
* Compound Body
* WHILE
* CALL input
125:     ST  1,-4(1)	Store fp in ghost frame for input
* TOFF dec: -5
* TOFF dec: -6
* Param end input
126:    LDA  1,-4(1)	Ghost frame becomes new active frame 
127:    LDA  3,1(7)	Return address in ac 
128:    JMP  7,-128(7)	CALL input
129:    LDA  3,0(2)	Save the result in ac 
* Call end input
* TOFF set: -4
130:     ST  3,-2(1)	Store variable n
131:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
132:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
133:     LD  4,-4(1)	Pop left into ac1 
134:    TGT  3,4,3	Op > 
135:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -5
* Compound Body
* EXPRESSION
* CALL sqrt
137:     ST  1,-5(1)	Store fp in ghost frame for sqrt
* TOFF dec: -6
* TOFF dec: -7
* Param 1
138:     LD  3,-2(1)	Load variable n
139:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end sqrt
140:    LDA  1,-5(1)	Ghost frame becomes new active frame 
141:    LDA  3,1(7)	Return address in ac 
142:    JMP  7,-104(7)	CALL sqrt
143:    LDA  3,0(2)	Save the result in ac 
* Call end sqrt
* TOFF set: -5
144:     ST  3,-4(1)	Store variable limit
* WHILE
145:     LD  3,-2(1)	Load variable n
146:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
147:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -5
148:     LD  4,-5(1)	Pop left into ac1 
149:    MOD  3,4,3	Op % 
150:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
151:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -5
152:     LD  4,-5(1)	Pop left into ac1 
153:    TEQ  3,4,3	Op = 
154:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -5
* Compound Body
* EXPRESSION
* CALL output
156:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
157:    LDC  3,2(6)	Load integer constant 
158:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
159:    LDA  1,-5(1)	Ghost frame becomes new active frame 
160:    LDA  3,1(7)	Return address in ac 
161:    JMP  7,-156(7)	CALL output
162:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
163:     LD  3,-2(1)	Load variable n
164:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
165:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -5
166:     LD  4,-5(1)	Pop left into ac1 
167:    DIV  3,4,3	Op / 
168:     ST  3,-2(1)	Store variable n
* TOFF set: -5
* END COMPOUND
169:    JMP  7,-25(7)	go to beginning of loop 
155:    JMP  7,14(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
170:    LDC  3,3(6)	Load integer constant 
171:     ST  3,-3(1)	Store variable i
* WHILE
172:     LD  3,-3(1)	Load variable i
173:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
174:     LD  3,-4(1)	Load variable limit
* TOFF inc: -5
175:     LD  4,-5(1)	Pop left into ac1 
176:    TLE  3,4,3	Op <= 
177:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -5
* Compound Body
* WHILE
179:     LD  3,-2(1)	Load variable n
180:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
181:     LD  3,-3(1)	Load variable i
* TOFF inc: -5
182:     LD  4,-5(1)	Pop left into ac1 
183:    MOD  3,4,3	Op % 
184:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
185:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -5
186:     LD  4,-5(1)	Pop left into ac1 
187:    TEQ  3,4,3	Op = 
188:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -5
* Compound Body
* EXPRESSION
* CALL output
190:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
191:     LD  3,-3(1)	Load variable i
192:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
193:    LDA  1,-5(1)	Ghost frame becomes new active frame 
194:    LDA  3,1(7)	Return address in ac 
195:    JMP  7,-190(7)	CALL output
196:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
197:     LD  3,-2(1)	Load variable n
198:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
199:     LD  3,-3(1)	Load variable i
* TOFF inc: -5
200:     LD  4,-5(1)	Pop left into ac1 
201:    DIV  3,4,3	Op / 
202:     ST  3,-2(1)	Store variable n
* EXPRESSION
* CALL sqrt
203:     ST  1,-5(1)	Store fp in ghost frame for sqrt
* TOFF dec: -6
* TOFF dec: -7
* Param 1
204:     LD  3,-2(1)	Load variable n
205:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end sqrt
206:    LDA  1,-5(1)	Ghost frame becomes new active frame 
207:    LDA  3,1(7)	Return address in ac 
208:    JMP  7,-170(7)	CALL sqrt
209:    LDA  3,0(2)	Save the result in ac 
* Call end sqrt
* TOFF set: -5
210:     ST  3,-4(1)	Store variable limit
* TOFF set: -5
* END COMPOUND
211:    JMP  7,-33(7)	go to beginning of loop 
189:    JMP  7,22(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
212:     LD  3,-3(1)	Load variable i
213:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
214:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -5
215:     LD  4,-5(1)	Pop left into ac1 
216:    ADD  3,4,3	Op + 
217:     ST  3,-3(1)	Store variable i
* TOFF set: -5
* END COMPOUND
218:    JMP  7,-47(7)	go to beginning of loop 
178:    JMP  7,40(7)	Jump past loop [backpatch] 
* END WHILE
* IF
219:     LD  3,-2(1)	Load variable n
220:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
221:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -5
222:     LD  4,-5(1)	Pop left into ac1 
223:    TGT  3,4,3	Op > 
* THEN
* EXPRESSION
* CALL output
225:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
226:     LD  3,-2(1)	Load variable n
227:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
228:    LDA  1,-5(1)	Ghost frame becomes new active frame 
229:    LDA  3,1(7)	Return address in ac 
230:    JMP  7,-225(7)	CALL output
231:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
224:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* END IF
* EXPRESSION
* CALL outnl
232:     ST  1,-5(1)	Store fp in ghost frame for outnl
* TOFF dec: -6
* TOFF dec: -7
* Param end outnl
233:    LDA  1,-5(1)	Ghost frame becomes new active frame 
234:    LDA  3,1(7)	Return address in ac 
235:    JMP  7,-202(7)	CALL outnl
236:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -5
* TOFF set: -4
* END COMPOUND
237:    JMP  7,-113(7)	go to beginning of loop 
136:    JMP  7,101(7)	Jump past loop [backpatch] 
* END WHILE
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
238:    LDC  2,0(6)	Set return value to 0 
239:     LD  3,-1(1)	Load return address 
240:     LD  1,0(1)	Adjust fp 
241:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,241(7)	Jump to init [backpatch] 
* INIT
242:    LDA  1,0(0)	set first frame at end of globals 
243:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
244:    LDA  3,1(7)	Return address in ac 
245:    JMP  7,-122(7)	Jump to main 
246:   HALT  0,0,0	DONE! 
* END INIT
