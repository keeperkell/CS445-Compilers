* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  exp3.c-
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
* TOFF set: -8
* Compound Body
* EXPRESSION
 40:    LDC  3,1(6)	Load integer constant 
 41:     ST  3,-3(1)	Store variable bilbo
* EXPRESSION
 42:    LDC  3,10(6)	Load integer constant 
 43:     ST  3,-2(1)	Store variable frodo
* EXPRESSION
 44:    LDC  3,100(6)	Load integer constant 
 45:     ST  3,-4(1)	Store variable sam
* EXPRESSION
 46:    LDC  3,1000(6)	Load integer constant 
 47:     ST  3,-5(1)	Store variable merry
* EXPRESSION
 48:    LDC  3,10000(6)	Load integer constant 
 49:     ST  3,-6(1)	Store variable pippin
* EXPRESSION
 50:     LD  3,-3(1)	Load variable bilbo
 51:     ST  3,-3(1)	Store variable bilbo
* EXPRESSION
* CALL output
 52:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
 53:     LD  3,-3(1)	Load variable bilbo
 54:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
 55:    LDA  1,-8(1)	Ghost frame becomes new active frame 
 56:    LDA  3,1(7)	Return address in ac 
 57:    JMP  7,-52(7)	CALL output
 58:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL outnl
 59:     ST  1,-8(1)	Store fp in ghost frame for outnl
* TOFF dec: -9
* TOFF dec: -10
* Param end outnl
 60:    LDA  1,-8(1)	Ghost frame becomes new active frame 
 61:    LDA  3,1(7)	Return address in ac 
 62:    JMP  7,-29(7)	CALL outnl
 63:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -8
* EXPRESSION
 64:     LD  3,-3(1)	Load variable bilbo
 65:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
 66:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -8
 67:     LD  4,-8(1)	Pop left into ac1 
 68:    ADD  3,4,3	Op + 
 69:     ST  3,-3(1)	Store variable bilbo
* EXPRESSION
* CALL output
 70:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
 71:     LD  3,-3(1)	Load variable bilbo
 72:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
 73:    LDA  1,-8(1)	Ghost frame becomes new active frame 
 74:    LDA  3,1(7)	Return address in ac 
 75:    JMP  7,-70(7)	CALL output
 76:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL outnl
 77:     ST  1,-8(1)	Store fp in ghost frame for outnl
* TOFF dec: -9
* TOFF dec: -10
* Param end outnl
 78:    LDA  1,-8(1)	Ghost frame becomes new active frame 
 79:    LDA  3,1(7)	Return address in ac 
 80:    JMP  7,-47(7)	CALL outnl
 81:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -8
* EXPRESSION
 82:     LD  3,-2(1)	Load variable frodo
 83:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
 84:     LD  3,-3(1)	Load variable bilbo
 85:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
 86:     LD  3,-4(1)	Load variable sam
 87:     ST  3,-10(1)	Push left side 
* TOFF dec: -11
 88:     LD  3,-5(1)	Load variable merry
 89:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
 90:     LD  3,-6(1)	Load variable pippin
* TOFF inc: -11
 91:     LD  4,-11(1)	Pop left into ac1 
 92:    MUL  3,4,3	Op * 
* TOFF inc: -10
 93:     LD  4,-10(1)	Pop left into ac1 
 94:    ADD  3,4,3	Op + 
* TOFF inc: -9
 95:     LD  4,-9(1)	Pop left into ac1 
 96:    MUL  3,4,3	Op * 
* TOFF inc: -8
 97:     LD  4,-8(1)	Pop left into ac1 
 98:    ADD  3,4,3	Op + 
 99:     ST  3,-3(1)	Store variable bilbo
* EXPRESSION
* CALL output
100:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
101:     LD  3,-3(1)	Load variable bilbo
102:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
103:    LDA  1,-8(1)	Ghost frame becomes new active frame 
104:    LDA  3,1(7)	Return address in ac 
105:    JMP  7,-100(7)	CALL output
106:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL outnl
107:     ST  1,-8(1)	Store fp in ghost frame for outnl
* TOFF dec: -9
* TOFF dec: -10
* Param end outnl
108:    LDA  1,-8(1)	Ghost frame becomes new active frame 
109:    LDA  3,1(7)	Return address in ac 
110:    JMP  7,-77(7)	CALL outnl
111:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -8
* EXPRESSION
112:     LD  3,-5(1)	Load variable merry
113:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
114:     LD  3,-6(1)	Load variable pippin
* TOFF inc: -8
115:     LD  4,-8(1)	Pop left into ac1 
116:    MUL  3,4,3	Op * 
117:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
118:     LD  3,-4(1)	Load variable sam
* TOFF inc: -8
119:     LD  4,-8(1)	Pop left into ac1 
120:    ADD  3,4,3	Op + 
121:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
122:     LD  3,-3(1)	Load variable bilbo
* TOFF inc: -8
123:     LD  4,-8(1)	Pop left into ac1 
124:    MUL  3,4,3	Op * 
125:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
126:     LD  3,-2(1)	Load variable frodo
* TOFF inc: -8
127:     LD  4,-8(1)	Pop left into ac1 
128:    ADD  3,4,3	Op + 
129:     ST  3,-3(1)	Store variable bilbo
* EXPRESSION
* CALL output
130:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
131:     LD  3,-3(1)	Load variable bilbo
132:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
133:    LDA  1,-8(1)	Ghost frame becomes new active frame 
134:    LDA  3,1(7)	Return address in ac 
135:    JMP  7,-130(7)	CALL output
136:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL outnl
137:     ST  1,-8(1)	Store fp in ghost frame for outnl
* TOFF dec: -9
* TOFF dec: -10
* Param end outnl
138:    LDA  1,-8(1)	Ghost frame becomes new active frame 
139:    LDA  3,1(7)	Return address in ac 
140:    JMP  7,-107(7)	CALL outnl
141:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -8
* EXPRESSION
142:     LD  3,-3(1)	Load variable bilbo
143:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
144:     LD  3,-3(1)	Load variable bilbo
145:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
146:     LD  3,-3(1)	Load variable bilbo
147:     ST  3,-10(1)	Push left side 
* TOFF dec: -11
148:     LD  3,-3(1)	Load variable bilbo
149:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
150:     LD  3,-3(1)	Load variable bilbo
151:     ST  3,-12(1)	Push left side 
* TOFF dec: -13
152:     LD  3,-3(1)	Load variable bilbo
* TOFF inc: -12
153:     LD  4,-12(1)	Pop left into ac1 
154:    ADD  3,4,3	Op + 
* TOFF inc: -11
155:     LD  4,-11(1)	Pop left into ac1 
156:    SUB  3,4,3	Op - 
* TOFF inc: -10
157:     LD  4,-10(1)	Pop left into ac1 
158:    ADD  3,4,3	Op + 
* TOFF inc: -9
159:     LD  4,-9(1)	Pop left into ac1 
160:    SUB  3,4,3	Op - 
* TOFF inc: -8
161:     LD  4,-8(1)	Pop left into ac1 
162:    ADD  3,4,3	Op + 
163:     ST  3,-3(1)	Store variable bilbo
* EXPRESSION
* CALL output
164:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
165:     LD  3,-3(1)	Load variable bilbo
166:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
167:    LDA  1,-8(1)	Ghost frame becomes new active frame 
168:    LDA  3,1(7)	Return address in ac 
169:    JMP  7,-164(7)	CALL output
170:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL outnl
171:     ST  1,-8(1)	Store fp in ghost frame for outnl
* TOFF dec: -9
* TOFF dec: -10
* Param end outnl
172:    LDA  1,-8(1)	Ghost frame becomes new active frame 
173:    LDA  3,1(7)	Return address in ac 
174:    JMP  7,-141(7)	CALL outnl
175:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -8
* EXPRESSION
176:    LDC  3,1(6)	Load Boolean constant 
177:     ST  3,-7(1)	Store variable arwen
* EXPRESSION
178:    LDC  3,0(6)	Load Boolean constant 
179:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
180:     LD  3,-7(1)	Load variable arwen
181:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
182:     LD  3,-5(1)	Load variable merry
183:    NEG  3,3,3	Op unary - 
184:     ST  3,-10(1)	Push left side 
* TOFF dec: -11
185:     LD  3,-4(1)	Load variable sam
186:    NEG  3,3,3	Op unary - 
* TOFF inc: -10
187:     LD  4,-10(1)	Pop left into ac1 
188:    MUL  3,4,3	Op * 
189:     ST  3,-10(1)	Push left side 
* TOFF dec: -11
190:     LD  3,-6(1)	Load variable pippin
* TOFF inc: -10
191:     LD  4,-10(1)	Pop left into ac1 
192:    ADD  3,4,3	Op + 
193:     ST  3,-10(1)	Push left side 
* TOFF dec: -11
194:     LD  3,-3(1)	Load variable bilbo
195:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
196:     LD  3,-2(1)	Load variable frodo
197:     ST  3,-12(1)	Push left side 
* TOFF dec: -13
198:     LD  3,-2(1)	Load variable frodo
199:    NEG  3,3,3	Op unary - 
* TOFF inc: -12
200:     LD  4,-12(1)	Pop left into ac1 
201:    MUL  3,4,3	Op * 
* TOFF inc: -11
202:     LD  4,-11(1)	Pop left into ac1 
203:    ADD  3,4,3	Op + 
* TOFF inc: -10
204:     LD  4,-10(1)	Pop left into ac1 
205:    TGE  3,4,3	Op >= 
206:    LDC  4,1(6)	Load 1 
207:    XOR  3,3,4	Op XOR to get logical not 
* TOFF inc: -9
208:     LD  4,-9(1)	Pop left into ac1 
209:    AND  3,4,3	Op AND 
* TOFF inc: -8
210:     LD  4,-8(1)	Pop left into ac1 
211:     OR  3,4,3	Op OR 
212:     ST  3,-7(1)	Store variable arwen
* EXPRESSION
* CALL outputb
213:     ST  1,-8(1)	Store fp in ghost frame for outputb
* TOFF dec: -9
* TOFF dec: -10
* Param 1
214:     LD  3,-7(1)	Load variable arwen
215:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end outputb
216:    LDA  1,-8(1)	Ghost frame becomes new active frame 
217:    LDA  3,1(7)	Return address in ac 
218:    JMP  7,-202(7)	CALL outputb
219:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -8
* EXPRESSION
* CALL outnl
220:     ST  1,-8(1)	Store fp in ghost frame for outnl
* TOFF dec: -9
* TOFF dec: -10
* Param end outnl
221:    LDA  1,-8(1)	Ghost frame becomes new active frame 
222:    LDA  3,1(7)	Return address in ac 
223:    JMP  7,-190(7)	CALL outnl
224:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -8
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
225:    LDC  2,0(6)	Set return value to 0 
226:     LD  3,-1(1)	Load return address 
227:     LD  1,0(1)	Adjust fp 
228:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,228(7)	Jump to init [backpatch] 
* INIT
229:    LDA  1,0(0)	set first frame at end of globals 
230:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
231:    LDA  3,1(7)	Return address in ac 
232:    JMP  7,-194(7)	Jump to main 
233:   HALT  0,0,0	DONE! 
* END INIT
