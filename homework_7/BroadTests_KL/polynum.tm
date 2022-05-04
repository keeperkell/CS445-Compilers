* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  polynum.c-
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
* TOFF set: -11
* Compound Body
* EXPRESSION
 40:    LDC  3,1(6)	Load integer constant 
 41:     ST  3,-2(1)	Store variable i
* EXPRESSION
 42:    LDC  3,1(6)	Load integer constant 
 43:     ST  3,-8(1)	Store variable min
* WHILE
 44:     LD  3,-2(1)	Load variable i
 45:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
 46:    LDC  3,2000(6)	Load integer constant 
* TOFF inc: -11
 47:     LD  4,-11(1)	Pop left into ac1 
 48:    TLT  3,4,3	Op < 
 49:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -11
* Compound Body
* EXPRESSION
 51:    LDC  3,2(6)	Load integer constant 
 52:     ST  3,-3(1)	Store variable m
* EXPRESSION
 53:     LD  3,-3(1)	Load variable m
 54:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
 55:     LD  3,-3(1)	Load variable m
 56:     ST  3,-12(1)	Push left side 
* TOFF dec: -13
 57:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -12
 58:     LD  4,-12(1)	Pop left into ac1 
 59:    ADD  3,4,3	Op + 
* TOFF inc: -11
 60:     LD  4,-11(1)	Pop left into ac1 
 61:    MUL  3,4,3	Op * 
 62:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
 63:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -11
 64:     LD  4,-11(1)	Pop left into ac1 
 65:    DIV  3,4,3	Op / 
 66:     ST  3,-6(1)	Store variable tm
* EXPRESSION
 67:     LD  3,-2(1)	Load variable i
 68:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
 69:     LD  3,-3(1)	Load variable m
 70:     ST  3,-12(1)	Push left side 
* TOFF dec: -13
 71:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -12
 72:     LD  4,-12(1)	Pop left into ac1 
 73:    ADD  3,4,3	Op + 
* TOFF inc: -11
 74:     LD  4,-11(1)	Pop left into ac1 
 75:    SUB  3,4,3	Op - 
 76:     ST  3,-5(1)	Store variable x
* EXPRESSION
 77:     LD  3,-5(1)	Load variable x
 78:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
 79:     LD  3,-6(1)	Load variable tm
* TOFF inc: -11
 80:     LD  4,-11(1)	Pop left into ac1 
 81:    DIV  3,4,3	Op / 
 82:     ST  3,-4(1)	Store variable t
* EXPRESSION
 83:    LDC  3,0(6)	Load integer constant 
 84:     ST  3,-7(1)	Store variable num
* WHILE
 85:     LD  3,-4(1)	Load variable t
 86:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
 87:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -11
 88:     LD  4,-11(1)	Pop left into ac1 
 89:    TGT  3,4,3	Op > 
 90:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -11
* Compound Body
* IF
 92:     LD  3,-4(1)	Load variable t
 93:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
 94:     LD  3,-6(1)	Load variable tm
* TOFF inc: -11
 95:     LD  4,-11(1)	Pop left into ac1 
 96:    MUL  3,4,3	Op * 
 97:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
 98:     LD  3,-5(1)	Load variable x
* TOFF inc: -11
 99:     LD  4,-11(1)	Pop left into ac1 
100:    TEQ  3,4,3	Op = 
* THEN
* EXPRESSION
102:     LD  3,-7(1)	Load variable num
103:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
104:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -11
105:     LD  4,-11(1)	Pop left into ac1 
106:    ADD  3,4,3	Op + 
107:     ST  3,-7(1)	Store variable num
101:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* END IF
* EXPRESSION
108:     LD  3,-3(1)	Load variable m
109:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
110:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -11
111:     LD  4,-11(1)	Pop left into ac1 
112:    ADD  3,4,3	Op + 
113:     ST  3,-3(1)	Store variable m
* EXPRESSION
114:     LD  3,-3(1)	Load variable m
115:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
116:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -11
117:     LD  4,-11(1)	Pop left into ac1 
118:    ADD  3,4,3	Op + 
119:     ST  3,-9(1)	Store variable a
* EXPRESSION
120:     LD  3,-3(1)	Load variable m
121:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
122:     LD  3,-3(1)	Load variable m
123:     ST  3,-12(1)	Push left side 
* TOFF dec: -13
124:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -12
125:     LD  4,-12(1)	Pop left into ac1 
126:    ADD  3,4,3	Op + 
* TOFF inc: -11
127:     LD  4,-11(1)	Pop left into ac1 
128:    MUL  3,4,3	Op * 
129:     ST  3,-10(1)	Store variable b
* EXPRESSION
130:     LD  3,-3(1)	Load variable m
131:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
132:     LD  3,-3(1)	Load variable m
133:     ST  3,-12(1)	Push left side 
* TOFF dec: -13
134:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -12
135:     LD  4,-12(1)	Pop left into ac1 
136:    ADD  3,4,3	Op + 
* TOFF inc: -11
137:     LD  4,-11(1)	Pop left into ac1 
138:    MUL  3,4,3	Op * 
139:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
140:    LDC  3,1(6)	Load integer constant 
141:     ST  3,-12(1)	Push left side 
* TOFF dec: -13
142:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -12
143:     LD  4,-12(1)	Pop left into ac1 
144:    ADD  3,4,3	Op + 
* TOFF inc: -11
145:     LD  4,-11(1)	Pop left into ac1 
146:    DIV  3,4,3	Op / 
147:     ST  3,-6(1)	Store variable tm
* EXPRESSION
148:     LD  3,-2(1)	Load variable i
149:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
150:     LD  3,-3(1)	Load variable m
151:     ST  3,-12(1)	Push left side 
* TOFF dec: -13
152:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -12
153:     LD  4,-12(1)	Pop left into ac1 
154:    ADD  3,4,3	Op + 
* TOFF inc: -11
155:     LD  4,-11(1)	Pop left into ac1 
156:    SUB  3,4,3	Op - 
157:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
158:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -11
159:     LD  4,-11(1)	Pop left into ac1 
160:    ADD  3,4,3	Op + 
161:     ST  3,-5(1)	Store variable x
* EXPRESSION
162:     LD  3,-5(1)	Load variable x
163:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
164:     LD  3,-6(1)	Load variable tm
* TOFF inc: -11
165:     LD  4,-11(1)	Pop left into ac1 
166:    DIV  3,4,3	Op / 
167:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
168:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -11
169:     LD  4,-11(1)	Pop left into ac1 
170:    MUL  3,4,3	Op * 
171:     ST  3,-4(1)	Store variable t
* TOFF set: -11
* END COMPOUND
172:    JMP  7,-88(7)	go to beginning of loop 
 91:    JMP  7,81(7)	Jump past loop [backpatch] 
* END WHILE
* IF
173:     LD  3,-7(1)	Load variable num
174:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
175:     LD  3,-8(1)	Load variable min
* TOFF inc: -11
176:     LD  4,-11(1)	Pop left into ac1 
177:    TGE  3,4,3	Op >= 
* THEN
* COMPOUND
* TOFF set: -11
* Compound Body
* EXPRESSION
* CALL output
179:     ST  1,-11(1)	Store fp in ghost frame for output
* TOFF dec: -12
* TOFF dec: -13
* Param 1
180:     LD  3,-7(1)	Load variable num
181:     ST  3,-13(1)	Push parameter 
* TOFF dec: -14
* Param end output
182:    LDA  1,-11(1)	Ghost frame becomes new active frame 
183:    LDA  3,1(7)	Return address in ac 
184:    JMP  7,-179(7)	CALL output
185:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -11
* EXPRESSION
* CALL output
186:     ST  1,-11(1)	Store fp in ghost frame for output
* TOFF dec: -12
* TOFF dec: -13
* Param 1
187:     LD  3,-2(1)	Load variable i
188:     ST  3,-13(1)	Push parameter 
* TOFF dec: -14
* Param end output
189:    LDA  1,-11(1)	Ghost frame becomes new active frame 
190:    LDA  3,1(7)	Return address in ac 
191:    JMP  7,-186(7)	CALL output
192:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -11
* EXPRESSION
* CALL output
193:     ST  1,-11(1)	Store fp in ghost frame for output
* TOFF dec: -12
* TOFF dec: -13
* Param 1
194:    LDC  3,11111111(6)	Load integer constant 
195:     ST  3,-13(1)	Push parameter 
* TOFF dec: -14
* Param end output
196:    LDA  1,-11(1)	Ghost frame becomes new active frame 
197:    LDA  3,1(7)	Return address in ac 
198:    JMP  7,-193(7)	CALL output
199:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -11
* EXPRESSION
200:     LD  3,-7(1)	Load variable num
201:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
202:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -11
203:     LD  4,-11(1)	Pop left into ac1 
204:    ADD  3,4,3	Op + 
205:     ST  3,-8(1)	Store variable min
* TOFF set: -11
* END COMPOUND
178:    JZR  3,27(7)	Jump around the THEN if false [backpatch] 
* END IF
* EXPRESSION
206:     LD  3,-2(1)	Load variable i
207:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
208:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -11
209:     LD  4,-11(1)	Pop left into ac1 
210:    ADD  3,4,3	Op + 
211:     ST  3,-2(1)	Store variable i
* TOFF set: -11
* END COMPOUND
212:    JMP  7,-169(7)	go to beginning of loop 
 50:    JMP  7,162(7)	Jump past loop [backpatch] 
* END WHILE
* RETURN
213:    LDC  3,0(6)	Load integer constant 
214:    LDA  2,0(3)	Copy result to return register 
215:     LD  3,-1(1)	Load return address 
216:     LD  1,0(1)	Adjust fp 
217:    JMP  7,0(3)	Return 
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
218:    LDC  2,0(6)	Set return value to 0 
219:     LD  3,-1(1)	Load return address 
220:     LD  1,0(1)	Adjust fp 
221:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,221(7)	Jump to init [backpatch] 
* INIT
222:    LDA  1,0(0)	set first frame at end of globals 
223:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
224:    LDA  3,1(7)	Return address in ac 
225:    JMP  7,-187(7)	Jump to main 
226:   HALT  0,0,0	DONE! 
* END INIT
