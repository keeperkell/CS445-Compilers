* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  sort2.c-
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
* FUNCTION swap
* TOFF set: -5
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -6
* Compound Body
* EXPRESSION
 40:     LD  3,-2(1)	Load address of base of array a
 41:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
 42:     LD  3,-3(1)	Load variable i
* TOFF inc: -6
 43:     LD  4,-6(1)	Pop left into ac1 
 44:    SUB  3,4,3	compute location from index 
 45:     LD  3,0(3)	Load array element 
 46:     ST  3,-5(1)	Store variable t
* EXPRESSION
 47:     LD  3,-3(1)	Load variable i
 48:     ST  3,-6(1)	Push index 
* TOFF dec: -7
 49:     LD  3,-2(1)	Load address of base of array a
 50:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
 51:     LD  3,-4(1)	Load variable j
* TOFF inc: -7
 52:     LD  4,-7(1)	Pop left into ac1 
 53:    SUB  3,4,3	compute location from index 
 54:     LD  3,0(3)	Load array element 
* TOFF inc: -6
 55:     LD  4,-6(1)	Pop index 
 56:     LD  5,-2(1)	Load address of base of array a
 57:    SUB  5,5,4	Compute offset of value 
 58:     ST  3,0(5)	Store variable a
* EXPRESSION
 59:     LD  3,-4(1)	Load variable j
 60:     ST  3,-6(1)	Push index 
* TOFF dec: -7
 61:     LD  3,-5(1)	Load variable t
* TOFF inc: -6
 62:     LD  4,-6(1)	Pop index 
 63:     LD  5,-2(1)	Load address of base of array a
 64:    SUB  5,5,4	Compute offset of value 
 65:     ST  3,0(5)	Store variable a
* TOFF set: -5
* END COMPOUND
* Add standard closing in case there is no return statement
 66:    LDC  2,0(6)	Set return value to 0 
 67:     LD  3,-1(1)	Load return address 
 68:     LD  1,0(1)	Adjust fp 
 69:    JMP  7,0(3)	Return 
* END FUNCTION swap
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION sort
* TOFF set: -3
 70:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* TOFF set: -6
* FOR
 71:    LDC  3,0(6)	Load integer constant 
 72:     ST  3,-3(1)	save starting value in index variable 
 73:     LD  3,-2(1)	Load address of base of array a
 74:     LD  3,1(3)	Load array size 
 75:     ST  3,-4(1)	save stop value 
 76:    LDC  3,1(6)	default increment by 1 
 77:     ST  3,-5(1)	save step value 
 78:     LD  4,-3(1)	loop index 
 79:     LD  5,-4(1)	stop value 
 80:     LD  3,-5(1)	step value 
 81:    SLT  3,4,5	Op < 
 82:    JNZ  3,1(7)	Jump to loop body 
* COMPOUND
* TOFF set: -7
* Compound Body
* EXPRESSION
 84:     LD  3,-3(1)	Load variable i
 85:     ST  3,-6(1)	Store variable minloc
* TOFF set: -10
* FOR
 86:     LD  3,-3(1)	Load variable i
 87:     ST  3,-10(1)	Push left side 
* TOFF dec: -11
 88:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -10
 89:     LD  4,-10(1)	Pop left into ac1 
 90:    ADD  3,4,3	Op + 
 91:     ST  3,-7(1)	save starting value in index variable 
 92:     LD  3,-2(1)	Load address of base of array a
 93:     LD  3,1(3)	Load array size 
 94:     ST  3,-8(1)	save stop value 
 95:    LDC  3,1(6)	default increment by 1 
 96:     ST  3,-9(1)	save step value 
 97:     LD  4,-7(1)	loop index 
 98:     LD  5,-8(1)	stop value 
 99:     LD  3,-9(1)	step value 
100:    SLT  3,4,5	Op < 
101:    JNZ  3,1(7)	Jump to loop body 
* IF
103:     LD  3,-2(1)	Load address of base of array a
104:     ST  3,-10(1)	Push left side 
* TOFF dec: -11
105:     LD  3,-7(1)	Load variable j
* TOFF inc: -10
106:     LD  4,-10(1)	Pop left into ac1 
107:    SUB  3,4,3	compute location from index 
108:     LD  3,0(3)	Load array element 
109:     ST  3,-10(1)	Push left side 
* TOFF dec: -11
110:     LD  3,-2(1)	Load address of base of array a
111:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
112:     LD  3,-6(1)	Load variable minloc
* TOFF inc: -11
113:     LD  4,-11(1)	Pop left into ac1 
114:    SUB  3,4,3	compute location from index 
115:     LD  3,0(3)	Load array element 
* TOFF inc: -10
116:     LD  4,-10(1)	Pop left into ac1 
117:    TLT  3,4,3	Op < 
* THEN
* EXPRESSION
119:     LD  3,-7(1)	Load variable j
120:     ST  3,-6(1)	Store variable minloc
118:    JZR  3,2(7)	Jump around the THEN if false [backpatch] 
* END IF
* Bottom of loop increment and jump
121:     LD  3,-7(1)	Load index 
122:     LD  5,-9(1)	Load step 
123:    ADD  3,3,5	increment 
124:     ST  3,-7(1)	store back to index 
125:    JMP  7,-29(7)	go to beginning of loop 
102:    JMP  7,23(7)	Jump past loop [backpatch] 
* END LOOP
* EXPRESSION
* CALL swap
126:     ST  1,-10(1)	Store fp in ghost frame for swap
* TOFF dec: -11
* TOFF dec: -12
* Param 1
127:     LD  3,-2(1)	Load address of base of array a
128:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param 2
129:     LD  3,-3(1)	Load variable i
130:     ST  3,-13(1)	Push parameter 
* TOFF dec: -14
* Param 3
131:     LD  3,-6(1)	Load variable minloc
132:     ST  3,-14(1)	Push parameter 
* TOFF dec: -15
* Param end swap
133:    LDA  1,-10(1)	Ghost frame becomes new active frame 
134:    LDA  3,1(7)	Return address in ac 
135:    JMP  7,-97(7)	CALL swap
136:    LDA  3,0(2)	Save the result in ac 
* Call end swap
* TOFF set: -10
* TOFF set: -6
* END COMPOUND
* Bottom of loop increment and jump
137:     LD  3,-3(1)	Load index 
138:     LD  5,-5(1)	Load step 
139:    ADD  3,3,5	increment 
140:     ST  3,-3(1)	store back to index 
141:    JMP  7,-64(7)	go to beginning of loop 
 83:    JMP  7,58(7)	Jump past loop [backpatch] 
* END LOOP
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
142:    LDC  2,0(6)	Set return value to 0 
143:     LD  3,-1(1)	Load return address 
144:     LD  1,0(1)	Adjust fp 
145:    JMP  7,0(3)	Return 
* END FUNCTION sort
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION print
* TOFF set: -3
146:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* TOFF set: -6
* FOR
147:    LDC  3,0(6)	Load integer constant 
148:     ST  3,-3(1)	save starting value in index variable 
149:     LD  3,-2(1)	Load address of base of array x
150:     LD  3,1(3)	Load array size 
151:     ST  3,-4(1)	save stop value 
152:    LDC  3,1(6)	default increment by 1 
153:     ST  3,-5(1)	save step value 
154:     LD  4,-3(1)	loop index 
155:     LD  5,-4(1)	stop value 
156:     LD  3,-5(1)	step value 
157:    SLT  3,4,5	Op < 
158:    JNZ  3,1(7)	Jump to loop body 
* EXPRESSION
* CALL output
160:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
161:     LD  3,-2(1)	Load address of base of array x
162:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
163:     LD  3,-3(1)	Load variable i
* TOFF inc: -8
164:     LD  4,-8(1)	Pop left into ac1 
165:    SUB  3,4,3	compute location from index 
166:     LD  3,0(3)	Load array element 
167:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
168:    LDA  1,-6(1)	Ghost frame becomes new active frame 
169:    LDA  3,1(7)	Return address in ac 
170:    JMP  7,-165(7)	CALL output
171:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* Bottom of loop increment and jump
172:     LD  3,-3(1)	Load index 
173:     LD  5,-5(1)	Load step 
174:    ADD  3,3,5	increment 
175:     ST  3,-3(1)	store back to index 
176:    JMP  7,-23(7)	go to beginning of loop 
159:    JMP  7,17(7)	Jump past loop [backpatch] 
* END LOOP
* EXPRESSION
* CALL outnl
177:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
178:    LDA  1,-6(1)	Ghost frame becomes new active frame 
179:    LDA  3,1(7)	Return address in ac 
180:    JMP  7,-147(7)	CALL outnl
181:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
182:    LDC  2,0(6)	Set return value to 0 
183:     LD  3,-1(1)	Load return address 
184:     LD  1,0(1)	Adjust fp 
185:    JMP  7,0(3)	Return 
* END FUNCTION print
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
186:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -23
187:    LDC  3,20(6)	load size of array x
188:     ST  3,-2(1)	save size of array x
* Compound Body
* TOFF set: -26
* FOR
189:    LDC  3,0(6)	Load integer constant 
190:     ST  3,-23(1)	save starting value in index variable 
191:    LDA  3,-3(1)	Load address of base of array x
192:     LD  3,1(3)	Load array size 
193:     ST  3,-24(1)	save stop value 
194:    LDC  3,1(6)	default increment by 1 
195:     ST  3,-25(1)	save step value 
196:     LD  4,-23(1)	loop index 
197:     LD  5,-24(1)	stop value 
198:     LD  3,-25(1)	step value 
199:    SLT  3,4,5	Op < 
200:    JNZ  3,1(7)	Jump to loop body 
* EXPRESSION
202:     LD  3,-23(1)	Load variable i
203:     ST  3,-26(1)	Push index 
* TOFF dec: -27
* CALL input
204:     ST  1,-27(1)	Store fp in ghost frame for input
* TOFF dec: -28
* TOFF dec: -29
* Param end input
205:    LDA  1,-27(1)	Ghost frame becomes new active frame 
206:    LDA  3,1(7)	Return address in ac 
207:    JMP  7,-207(7)	CALL input
208:    LDA  3,0(2)	Save the result in ac 
* Call end input
* TOFF set: -27
* TOFF inc: -26
209:     LD  4,-26(1)	Pop index 
210:    LDA  5,-3(1)	Load address of base of array x
211:    SUB  5,5,4	Compute offset of value 
212:     ST  3,0(5)	Store variable x
* Bottom of loop increment and jump
213:     LD  3,-23(1)	Load index 
214:     LD  5,-25(1)	Load step 
215:    ADD  3,3,5	increment 
216:     ST  3,-23(1)	store back to index 
217:    JMP  7,-22(7)	go to beginning of loop 
201:    JMP  7,16(7)	Jump past loop [backpatch] 
* END LOOP
* EXPRESSION
* CALL print
218:     ST  1,-26(1)	Store fp in ghost frame for print
* TOFF dec: -27
* TOFF dec: -28
* Param 1
219:    LDA  3,-3(1)	Load address of base of array x
220:     ST  3,-28(1)	Push parameter 
* TOFF dec: -29
* Param end print
221:    LDA  1,-26(1)	Ghost frame becomes new active frame 
222:    LDA  3,1(7)	Return address in ac 
223:    JMP  7,-78(7)	CALL print
224:    LDA  3,0(2)	Save the result in ac 
* Call end print
* TOFF set: -26
* EXPRESSION
* CALL sort
225:     ST  1,-26(1)	Store fp in ghost frame for sort
* TOFF dec: -27
* TOFF dec: -28
* Param 1
226:    LDA  3,-3(1)	Load address of base of array x
227:     ST  3,-28(1)	Push parameter 
* TOFF dec: -29
* Param end sort
228:    LDA  1,-26(1)	Ghost frame becomes new active frame 
229:    LDA  3,1(7)	Return address in ac 
230:    JMP  7,-161(7)	CALL sort
231:    LDA  3,0(2)	Save the result in ac 
* Call end sort
* TOFF set: -26
* EXPRESSION
* CALL print
232:     ST  1,-26(1)	Store fp in ghost frame for print
* TOFF dec: -27
* TOFF dec: -28
* Param 1
233:    LDA  3,-3(1)	Load address of base of array x
234:     ST  3,-28(1)	Push parameter 
* TOFF dec: -29
* Param end print
235:    LDA  1,-26(1)	Ghost frame becomes new active frame 
236:    LDA  3,1(7)	Return address in ac 
237:    JMP  7,-92(7)	CALL print
238:    LDA  3,0(2)	Save the result in ac 
* Call end print
* TOFF set: -26
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
239:    LDC  2,0(6)	Set return value to 0 
240:     LD  3,-1(1)	Load return address 
241:     LD  1,0(1)	Adjust fp 
242:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,242(7)	Jump to init [backpatch] 
* INIT
243:    LDA  1,0(0)	set first frame at end of globals 
244:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
245:    LDA  3,1(7)	Return address in ac 
246:    JMP  7,-61(7)	Jump to main 
247:   HALT  0,0,0	DONE! 
* END INIT
