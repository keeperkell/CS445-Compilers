* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  io.c-
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
* TOFF set: -4
* Compound Body
* EXPRESSION
* CALL output
 40:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 41:    LDC  3,777(6)	Load integer constant 
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
* CALL outputb
 47:     ST  1,-4(1)	Store fp in ghost frame for outputb
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 48:    LDC  3,0(6)	Load Boolean constant 
 49:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end outputb
 50:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 51:    LDA  3,1(7)	Return address in ac 
 52:    JMP  7,-36(7)	CALL outputb
 53:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -4
* EXPRESSION
* CALL outnl
 54:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
 55:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 56:    LDA  3,1(7)	Return address in ac 
 57:    JMP  7,-24(7)	CALL outnl
 58:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
* EXPRESSION
 59:    LDC  3,666(6)	Load integer constant 
 60:     ST  3,-2(1)	Store variable x
* EXPRESSION
* CALL output
 61:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 62:     LD  3,-2(1)	Load variable x
 63:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
 64:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 65:    LDA  3,1(7)	Return address in ac 
 66:    JMP  7,-61(7)	CALL output
 67:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
* CALL outnl
 68:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
 69:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 70:    LDA  3,1(7)	Return address in ac 
 71:    JMP  7,-38(7)	CALL outnl
 72:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
* EXPRESSION
* CALL output
 73:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 74:     LD  3,-2(1)	Load variable x
 75:    NEG  3,3,3	Op unary - 
 76:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
 77:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 78:    LDA  3,1(7)	Return address in ac 
 79:    JMP  7,-74(7)	CALL output
 80:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
* CALL output
 81:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 82:    LDC  3,1(6)	Load integer constant 
 83:    NEG  3,3,3	Op unary - 
 84:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
 85:     LD  3,-2(1)	Load variable x
* TOFF inc: -6
 86:     LD  4,-6(1)	Pop left into ac1 
 87:    MUL  3,4,3	Op * 
 88:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
 89:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 90:    LDA  3,1(7)	Return address in ac 
 91:    JMP  7,-86(7)	CALL output
 92:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
* CALL outnl
 93:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
 94:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 95:    LDA  3,1(7)	Return address in ac 
 96:    JMP  7,-63(7)	CALL outnl
 97:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
* EXPRESSION
* CALL output
 98:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 99:    LDC  3,111(6)	Load integer constant 
100:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
101:    LDC  3,222(6)	Load integer constant 
* TOFF inc: -6
102:     LD  4,-6(1)	Pop left into ac1 
103:    ADD  3,4,3	Op + 
104:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
105:    LDC  3,333(6)	Load integer constant 
* TOFF inc: -6
106:     LD  4,-6(1)	Pop left into ac1 
107:    ADD  3,4,3	Op + 
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
114:    LDC  3,3(6)	Load integer constant 
115:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
116:    LDC  3,6(6)	Load integer constant 
* TOFF inc: -6
117:     LD  4,-6(1)	Pop left into ac1 
118:    MUL  3,4,3	Op * 
119:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
120:    LDC  3,6(6)	Load integer constant 
121:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
122:    LDC  3,6(6)	Load integer constant 
* TOFF inc: -7
123:     LD  4,-7(1)	Pop left into ac1 
124:    MUL  3,4,3	Op * 
125:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
126:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -7
127:     LD  4,-7(1)	Pop left into ac1 
128:    ADD  3,4,3	Op + 
* TOFF inc: -6
129:     LD  4,-6(1)	Pop left into ac1 
130:    MUL  3,4,3	Op * 
131:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
132:    LDA  1,-4(1)	Ghost frame becomes new active frame 
133:    LDA  3,1(7)	Return address in ac 
134:    JMP  7,-129(7)	CALL output
135:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
* CALL outnl
136:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
137:    LDA  1,-4(1)	Ghost frame becomes new active frame 
138:    LDA  3,1(7)	Return address in ac 
139:    JMP  7,-106(7)	CALL outnl
140:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
* EXPRESSION
* CALL input
141:     ST  1,-4(1)	Store fp in ghost frame for input
* TOFF dec: -5
* TOFF dec: -6
* Param end input
142:    LDA  1,-4(1)	Ghost frame becomes new active frame 
143:    LDA  3,1(7)	Return address in ac 
144:    JMP  7,-144(7)	CALL input
145:    LDA  3,0(2)	Save the result in ac 
* Call end input
* TOFF set: -4
146:     ST  3,-2(1)	Store variable x
* EXPRESSION
* CALL output
147:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
148:     LD  3,-2(1)	Load variable x
149:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
150:    LDA  1,-4(1)	Ghost frame becomes new active frame 
151:    LDA  3,1(7)	Return address in ac 
152:    JMP  7,-147(7)	CALL output
153:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
* CALL outnl
154:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
155:    LDA  1,-4(1)	Ghost frame becomes new active frame 
156:    LDA  3,1(7)	Return address in ac 
157:    JMP  7,-124(7)	CALL outnl
158:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
* EXPRESSION
* CALL inputb
159:     ST  1,-4(1)	Store fp in ghost frame for inputb
* TOFF dec: -5
* TOFF dec: -6
* Param end inputb
160:    LDA  1,-4(1)	Ghost frame becomes new active frame 
161:    LDA  3,1(7)	Return address in ac 
162:    JMP  7,-151(7)	CALL inputb
163:    LDA  3,0(2)	Save the result in ac 
* Call end inputb
* TOFF set: -4
164:     ST  3,-3(1)	Store variable b
* EXPRESSION
* CALL outputb
165:     ST  1,-4(1)	Store fp in ghost frame for outputb
* TOFF dec: -5
* TOFF dec: -6
* Param 1
166:     LD  3,-3(1)	Load variable b
167:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end outputb
168:    LDA  1,-4(1)	Ghost frame becomes new active frame 
169:    LDA  3,1(7)	Return address in ac 
170:    JMP  7,-154(7)	CALL outputb
171:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -4
* EXPRESSION
* CALL outnl
172:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
173:    LDA  1,-4(1)	Ghost frame becomes new active frame 
174:    LDA  3,1(7)	Return address in ac 
175:    JMP  7,-142(7)	CALL outnl
176:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
* EXPRESSION
* CALL output
177:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
* CALL input
178:     ST  1,-6(1)	Store fp in ghost frame for input
* TOFF dec: -7
* TOFF dec: -8
* Param end input
179:    LDA  1,-6(1)	Ghost frame becomes new active frame 
180:    LDA  3,1(7)	Return address in ac 
181:    JMP  7,-181(7)	CALL input
182:    LDA  3,0(2)	Save the result in ac 
* Call end input
* TOFF set: -6
183:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
* CALL input
184:     ST  1,-7(1)	Store fp in ghost frame for input
* TOFF dec: -8
* TOFF dec: -9
* Param end input
185:    LDA  1,-7(1)	Ghost frame becomes new active frame 
186:    LDA  3,1(7)	Return address in ac 
187:    JMP  7,-187(7)	CALL input
188:    LDA  3,0(2)	Save the result in ac 
* Call end input
* TOFF set: -7
* TOFF inc: -6
189:     LD  4,-6(1)	Pop left into ac1 
190:    MUL  3,4,3	Op * 
191:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
192:    LDA  1,-4(1)	Ghost frame becomes new active frame 
193:    LDA  3,1(7)	Return address in ac 
194:    JMP  7,-189(7)	CALL output
195:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
* CALL outnl
196:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
197:    LDA  1,-4(1)	Ghost frame becomes new active frame 
198:    LDA  3,1(7)	Return address in ac 
199:    JMP  7,-166(7)	CALL outnl
200:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
* EXPRESSION
* CALL outputb
201:     ST  1,-4(1)	Store fp in ghost frame for outputb
* TOFF dec: -5
* TOFF dec: -6
* Param 1
* CALL inputb
202:     ST  1,-6(1)	Store fp in ghost frame for inputb
* TOFF dec: -7
* TOFF dec: -8
* Param end inputb
203:    LDA  1,-6(1)	Ghost frame becomes new active frame 
204:    LDA  3,1(7)	Return address in ac 
205:    JMP  7,-194(7)	CALL inputb
206:    LDA  3,0(2)	Save the result in ac 
* Call end inputb
* TOFF set: -6
207:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
* CALL inputb
208:     ST  1,-7(1)	Store fp in ghost frame for inputb
* TOFF dec: -8
* TOFF dec: -9
* Param end inputb
209:    LDA  1,-7(1)	Ghost frame becomes new active frame 
210:    LDA  3,1(7)	Return address in ac 
211:    JMP  7,-200(7)	CALL inputb
212:    LDA  3,0(2)	Save the result in ac 
* Call end inputb
* TOFF set: -7
* TOFF inc: -6
213:     LD  4,-6(1)	Pop left into ac1 
214:    AND  3,4,3	Op AND 
215:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end outputb
216:    LDA  1,-4(1)	Ghost frame becomes new active frame 
217:    LDA  3,1(7)	Return address in ac 
218:    JMP  7,-202(7)	CALL outputb
219:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -4
* EXPRESSION
* CALL outnl
220:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
221:    LDA  1,-4(1)	Ghost frame becomes new active frame 
222:    LDA  3,1(7)	Return address in ac 
223:    JMP  7,-190(7)	CALL outnl
224:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
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
