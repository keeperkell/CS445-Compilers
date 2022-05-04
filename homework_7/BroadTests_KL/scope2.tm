* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  scope2.c-
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
* FUNCTION ant
* TOFF set: -3
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -5
* Compound Body
* EXPRESSION
 40:    LDC  3,111(6)	Load integer constant 
 41:     ST  3,-4(1)	Store variable b
* EXPRESSION
 42:    LDC  3,222(6)	Load integer constant 
 43:     ST  3,-2(1)	Store variable x
* EXPRESSION
 44:    LDC  3,333(6)	Load integer constant 
 45:     ST  3,0(0)	Store variable g
* COMPOUND
* TOFF set: -7
* Compound Body
* EXPRESSION
 46:    LDC  3,444(6)	Load integer constant 
 47:     ST  3,-3(1)	Store variable a
* EXPRESSION
 48:    LDC  3,555(6)	Load integer constant 
 49:     ST  3,-6(1)	Store variable b
* EXPRESSION
 50:    LDC  3,666(6)	Load integer constant 
 51:     ST  3,-5(1)	Store variable c
* EXPRESSION
 52:    LDC  3,777(6)	Load integer constant 
 53:     ST  3,0(0)	Store variable g
* EXPRESSION
 54:    LDC  3,888(6)	Load integer constant 
 55:     ST  3,-2(1)	Store variable x
* EXPRESSION
* CALL output
 56:     ST  1,-7(1)	Store fp in ghost frame for output
* TOFF dec: -8
* TOFF dec: -9
* Param 1
 57:     LD  3,-3(1)	Load variable a
 58:     ST  3,-9(1)	Push parameter 
* TOFF dec: -10
* Param end output
 59:    LDA  1,-7(1)	Ghost frame becomes new active frame 
 60:    LDA  3,1(7)	Return address in ac 
 61:    JMP  7,-56(7)	CALL output
 62:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -7
* EXPRESSION
* CALL output
 63:     ST  1,-7(1)	Store fp in ghost frame for output
* TOFF dec: -8
* TOFF dec: -9
* Param 1
 64:     LD  3,-6(1)	Load variable b
 65:     ST  3,-9(1)	Push parameter 
* TOFF dec: -10
* Param end output
 66:    LDA  1,-7(1)	Ghost frame becomes new active frame 
 67:    LDA  3,1(7)	Return address in ac 
 68:    JMP  7,-63(7)	CALL output
 69:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -7
* EXPRESSION
* CALL output
 70:     ST  1,-7(1)	Store fp in ghost frame for output
* TOFF dec: -8
* TOFF dec: -9
* Param 1
 71:     LD  3,-5(1)	Load variable c
 72:     ST  3,-9(1)	Push parameter 
* TOFF dec: -10
* Param end output
 73:    LDA  1,-7(1)	Ghost frame becomes new active frame 
 74:    LDA  3,1(7)	Return address in ac 
 75:    JMP  7,-70(7)	CALL output
 76:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -7
* EXPRESSION
* CALL output
 77:     ST  1,-7(1)	Store fp in ghost frame for output
* TOFF dec: -8
* TOFF dec: -9
* Param 1
 78:     LD  3,0(0)	Load variable g
 79:     ST  3,-9(1)	Push parameter 
* TOFF dec: -10
* Param end output
 80:    LDA  1,-7(1)	Ghost frame becomes new active frame 
 81:    LDA  3,1(7)	Return address in ac 
 82:    JMP  7,-77(7)	CALL output
 83:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -7
* EXPRESSION
* CALL output
 84:     ST  1,-7(1)	Store fp in ghost frame for output
* TOFF dec: -8
* TOFF dec: -9
* Param 1
 85:     LD  3,-2(1)	Load variable x
 86:     ST  3,-9(1)	Push parameter 
* TOFF dec: -10
* Param end output
 87:    LDA  1,-7(1)	Ghost frame becomes new active frame 
 88:    LDA  3,1(7)	Return address in ac 
 89:    JMP  7,-84(7)	CALL output
 90:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -7
* EXPRESSION
* CALL outnl
 91:     ST  1,-7(1)	Store fp in ghost frame for outnl
* TOFF dec: -8
* TOFF dec: -9
* Param end outnl
 92:    LDA  1,-7(1)	Ghost frame becomes new active frame 
 93:    LDA  3,1(7)	Return address in ac 
 94:    JMP  7,-61(7)	CALL outnl
 95:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -7
* TOFF set: -5
* END COMPOUND
* EXPRESSION
* CALL output
 96:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 97:     LD  3,-3(1)	Load variable a
 98:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
 99:    LDA  1,-5(1)	Ghost frame becomes new active frame 
100:    LDA  3,1(7)	Return address in ac 
101:    JMP  7,-96(7)	CALL output
102:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
103:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
104:     LD  3,-4(1)	Load variable b
105:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
106:    LDA  1,-5(1)	Ghost frame becomes new active frame 
107:    LDA  3,1(7)	Return address in ac 
108:    JMP  7,-103(7)	CALL output
109:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
110:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
111:     LD  3,0(0)	Load variable g
112:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
113:    LDA  1,-5(1)	Ghost frame becomes new active frame 
114:    LDA  3,1(7)	Return address in ac 
115:    JMP  7,-110(7)	CALL output
116:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
117:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
118:     LD  3,-2(1)	Load variable x
119:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
120:    LDA  1,-5(1)	Ghost frame becomes new active frame 
121:    LDA  3,1(7)	Return address in ac 
122:    JMP  7,-117(7)	CALL output
123:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL outnl
124:     ST  1,-5(1)	Store fp in ghost frame for outnl
* TOFF dec: -6
* TOFF dec: -7
* Param end outnl
125:    LDA  1,-5(1)	Ghost frame becomes new active frame 
126:    LDA  3,1(7)	Return address in ac 
127:    JMP  7,-94(7)	CALL outnl
128:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -5
* EXPRESSION
129:    LDC  3,11(6)	Load integer constant 
130:     ST  3,-3(1)	Store variable a
* EXPRESSION
131:    LDC  3,12(6)	Load integer constant 
132:     ST  3,-4(1)	Store variable b
* EXPRESSION
133:    LDC  3,14(6)	Load integer constant 
134:     ST  3,-2(1)	Store variable x
* COMPOUND
* TOFF set: -5
* Compound Body
* EXPRESSION
135:    LDC  3,15(6)	Load integer constant 
136:     ST  3,-2(1)	Store variable x
* TOFF set: -5
* END COMPOUND
* EXPRESSION
* CALL output
137:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
138:     LD  3,-3(1)	Load variable a
139:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
140:    LDA  1,-5(1)	Ghost frame becomes new active frame 
141:    LDA  3,1(7)	Return address in ac 
142:    JMP  7,-137(7)	CALL output
143:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
144:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
145:     LD  3,-4(1)	Load variable b
146:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
147:    LDA  1,-5(1)	Ghost frame becomes new active frame 
148:    LDA  3,1(7)	Return address in ac 
149:    JMP  7,-144(7)	CALL output
150:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
151:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
152:     LD  3,0(0)	Load variable g
153:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
154:    LDA  1,-5(1)	Ghost frame becomes new active frame 
155:    LDA  3,1(7)	Return address in ac 
156:    JMP  7,-151(7)	CALL output
157:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
158:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
159:     LD  3,-2(1)	Load variable x
160:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
161:    LDA  1,-5(1)	Ghost frame becomes new active frame 
162:    LDA  3,1(7)	Return address in ac 
163:    JMP  7,-158(7)	CALL output
164:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL outnl
165:     ST  1,-5(1)	Store fp in ghost frame for outnl
* TOFF dec: -6
* TOFF dec: -7
* Param end outnl
166:    LDA  1,-5(1)	Ghost frame becomes new active frame 
167:    LDA  3,1(7)	Return address in ac 
168:    JMP  7,-135(7)	CALL outnl
169:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -5
* RETURN
170:     LD  3,-3(1)	Load variable a
171:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
172:     LD  3,-4(1)	Load variable b
* TOFF inc: -5
173:     LD  4,-5(1)	Pop left into ac1 
174:    ADD  3,4,3	Op + 
175:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
176:     LD  3,0(0)	Load variable g
* TOFF inc: -5
177:     LD  4,-5(1)	Pop left into ac1 
178:    ADD  3,4,3	Op + 
179:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
180:     LD  3,-2(1)	Load variable x
* TOFF inc: -5
181:     LD  4,-5(1)	Pop left into ac1 
182:    ADD  3,4,3	Op + 
183:    LDA  2,0(3)	Copy result to return register 
184:     LD  3,-1(1)	Load return address 
185:     LD  1,0(1)	Adjust fp 
186:    JMP  7,0(3)	Return 
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
187:    LDC  2,0(6)	Set return value to 0 
188:     LD  3,-1(1)	Load return address 
189:     LD  1,0(1)	Adjust fp 
190:    JMP  7,0(3)	Return 
* END FUNCTION ant
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
191:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
192:    LDC  3,16(6)	Load integer constant 
193:     ST  3,-2(1)	Store variable a
* EXPRESSION
194:    LDC  3,1(6)	Load integer constant 
195:     ST  3,0(0)	Store variable g
* EXPRESSION
* CALL output
196:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
* CALL ant
197:     ST  1,-5(1)	Store fp in ghost frame for ant
* TOFF dec: -6
* TOFF dec: -7
* Param 1
198:    LDC  3,2(6)	Load integer constant 
199:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end ant
200:    LDA  1,-5(1)	Ghost frame becomes new active frame 
201:    LDA  3,1(7)	Return address in ac 
202:    JMP  7,-164(7)	CALL ant
203:    LDA  3,0(2)	Save the result in ac 
* Call end ant
* TOFF set: -5
204:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
205:    LDA  1,-3(1)	Ghost frame becomes new active frame 
206:    LDA  3,1(7)	Return address in ac 
207:    JMP  7,-202(7)	CALL output
208:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL output
209:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
210:     LD  3,0(0)	Load variable g
211:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
212:    LDA  1,-3(1)	Ghost frame becomes new active frame 
213:    LDA  3,1(7)	Return address in ac 
214:    JMP  7,-209(7)	CALL output
215:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL output
216:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
217:     LD  3,-2(1)	Load variable a
218:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
219:    LDA  1,-3(1)	Ghost frame becomes new active frame 
220:    LDA  3,1(7)	Return address in ac 
221:    JMP  7,-216(7)	CALL output
222:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL outnl
223:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
224:    LDA  1,-3(1)	Ghost frame becomes new active frame 
225:    LDA  3,1(7)	Return address in ac 
226:    JMP  7,-193(7)	CALL outnl
227:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
228:    LDC  2,0(6)	Set return value to 0 
229:     LD  3,-1(1)	Load return address 
230:     LD  1,0(1)	Adjust fp 
231:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,231(7)	Jump to init [backpatch] 
* INIT
232:    LDA  1,-1(0)	set first frame at end of globals 
233:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
234:    LDA  3,1(7)	Return address in ac 
235:    JMP  7,-45(7)	Jump to main 
236:   HALT  0,0,0	DONE! 
* END INIT
