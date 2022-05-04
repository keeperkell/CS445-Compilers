* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  d04.c-
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
* TOFF set: -5
* Compound Body
* EXPRESSION
 40:    LDC  3,1(6)	Load Boolean constant 
 41:     ST  3,-2(1)	Store variable x
* EXPRESSION
 42:    LDC  3,0(6)	Load Boolean constant 
 43:     ST  3,-3(1)	Store variable y
* EXPRESSION
 44:    LDC  3,1(6)	Load Boolean constant 
 45:     ST  3,-4(1)	Store variable z
* EXPRESSION
* CALL outputb
 46:     ST  1,-5(1)	Store fp in ghost frame for outputb
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 47:     LD  3,-2(1)	Load variable x
 48:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
 49:     LD  3,-3(1)	Load variable y
 50:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
 51:     LD  3,-4(1)	Load variable z
* TOFF inc: -8
 52:     LD  4,-8(1)	Pop left into ac1 
 53:    AND  3,4,3	Op AND 
* TOFF inc: -7
 54:     LD  4,-7(1)	Pop left into ac1 
 55:     OR  3,4,3	Op OR 
 56:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end outputb
 57:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 58:    LDA  3,1(7)	Return address in ac 
 59:    JMP  7,-43(7)	CALL outputb
 60:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -5
* EXPRESSION
* CALL outputb
 61:     ST  1,-5(1)	Store fp in ghost frame for outputb
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 62:     LD  3,-2(1)	Load variable x
 63:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
 64:     LD  3,-3(1)	Load variable y
* TOFF inc: -7
 65:     LD  4,-7(1)	Pop left into ac1 
 66:    AND  3,4,3	Op AND 
 67:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
 68:     LD  3,-4(1)	Load variable z
* TOFF inc: -7
 69:     LD  4,-7(1)	Pop left into ac1 
 70:     OR  3,4,3	Op OR 
 71:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end outputb
 72:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 73:    LDA  3,1(7)	Return address in ac 
 74:    JMP  7,-58(7)	CALL outputb
 75:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -5
* EXPRESSION
* CALL outputb
 76:     ST  1,-5(1)	Store fp in ghost frame for outputb
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 77:     LD  3,-2(1)	Load variable x
 78:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
 79:     LD  3,-3(1)	Load variable y
* TOFF inc: -7
 80:     LD  4,-7(1)	Pop left into ac1 
 81:    AND  3,4,3	Op AND 
 82:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
 83:     LD  3,-4(1)	Load variable z
 84:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
 85:     LD  3,-4(1)	Load variable z
* TOFF inc: -8
 86:     LD  4,-8(1)	Pop left into ac1 
 87:    AND  3,4,3	Op AND 
* TOFF inc: -7
 88:     LD  4,-7(1)	Pop left into ac1 
 89:     OR  3,4,3	Op OR 
 90:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end outputb
 91:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 92:    LDA  3,1(7)	Return address in ac 
 93:    JMP  7,-77(7)	CALL outputb
 94:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -5
* EXPRESSION
* CALL outputb
 95:     ST  1,-5(1)	Store fp in ghost frame for outputb
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 96:     LD  3,-2(1)	Load variable x
 97:    LDC  4,1(6)	Load 1 
 98:    XOR  3,3,4	Op XOR to get logical not 
 99:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
100:     LD  3,-3(1)	Load variable y
101:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
102:     LD  3,-4(1)	Load variable z
* TOFF inc: -8
103:     LD  4,-8(1)	Pop left into ac1 
104:    AND  3,4,3	Op AND 
* TOFF inc: -7
105:     LD  4,-7(1)	Pop left into ac1 
106:     OR  3,4,3	Op OR 
107:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end outputb
108:    LDA  1,-5(1)	Ghost frame becomes new active frame 
109:    LDA  3,1(7)	Return address in ac 
110:    JMP  7,-94(7)	CALL outputb
111:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -5
* EXPRESSION
* CALL outputb
112:     ST  1,-5(1)	Store fp in ghost frame for outputb
* TOFF dec: -6
* TOFF dec: -7
* Param 1
113:     LD  3,-2(1)	Load variable x
114:    LDC  4,1(6)	Load 1 
115:    XOR  3,3,4	Op XOR to get logical not 
116:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
117:     LD  3,-3(1)	Load variable y
* TOFF inc: -7
118:     LD  4,-7(1)	Pop left into ac1 
119:    AND  3,4,3	Op AND 
120:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
121:     LD  3,-4(1)	Load variable z
* TOFF inc: -7
122:     LD  4,-7(1)	Pop left into ac1 
123:     OR  3,4,3	Op OR 
124:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end outputb
125:    LDA  1,-5(1)	Ghost frame becomes new active frame 
126:    LDA  3,1(7)	Return address in ac 
127:    JMP  7,-111(7)	CALL outputb
128:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -5
* EXPRESSION
* CALL outnl
129:     ST  1,-5(1)	Store fp in ghost frame for outnl
* TOFF dec: -6
* TOFF dec: -7
* Param end outnl
130:    LDA  1,-5(1)	Ghost frame becomes new active frame 
131:    LDA  3,1(7)	Return address in ac 
132:    JMP  7,-99(7)	CALL outnl
133:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -5
* EXPRESSION
134:    LDC  3,1(6)	Load Boolean constant 
135:     ST  3,-2(1)	Store variable x
* EXPRESSION
136:    LDC  3,1(6)	Load Boolean constant 
137:     ST  3,-3(1)	Store variable y
* EXPRESSION
138:    LDC  3,0(6)	Load Boolean constant 
139:     ST  3,-4(1)	Store variable z
* EXPRESSION
* CALL outputb
140:     ST  1,-5(1)	Store fp in ghost frame for outputb
* TOFF dec: -6
* TOFF dec: -7
* Param 1
141:     LD  3,-2(1)	Load variable x
142:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
143:     LD  3,-3(1)	Load variable y
144:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
145:     LD  3,-4(1)	Load variable z
* TOFF inc: -8
146:     LD  4,-8(1)	Pop left into ac1 
147:    AND  3,4,3	Op AND 
* TOFF inc: -7
148:     LD  4,-7(1)	Pop left into ac1 
149:     OR  3,4,3	Op OR 
150:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end outputb
151:    LDA  1,-5(1)	Ghost frame becomes new active frame 
152:    LDA  3,1(7)	Return address in ac 
153:    JMP  7,-137(7)	CALL outputb
154:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -5
* EXPRESSION
* CALL outputb
155:     ST  1,-5(1)	Store fp in ghost frame for outputb
* TOFF dec: -6
* TOFF dec: -7
* Param 1
156:     LD  3,-2(1)	Load variable x
157:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
158:     LD  3,-3(1)	Load variable y
* TOFF inc: -7
159:     LD  4,-7(1)	Pop left into ac1 
160:    AND  3,4,3	Op AND 
161:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
162:     LD  3,-4(1)	Load variable z
* TOFF inc: -7
163:     LD  4,-7(1)	Pop left into ac1 
164:     OR  3,4,3	Op OR 
165:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end outputb
166:    LDA  1,-5(1)	Ghost frame becomes new active frame 
167:    LDA  3,1(7)	Return address in ac 
168:    JMP  7,-152(7)	CALL outputb
169:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -5
* EXPRESSION
* CALL outputb
170:     ST  1,-5(1)	Store fp in ghost frame for outputb
* TOFF dec: -6
* TOFF dec: -7
* Param 1
171:     LD  3,-2(1)	Load variable x
172:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
173:     LD  3,-3(1)	Load variable y
* TOFF inc: -7
174:     LD  4,-7(1)	Pop left into ac1 
175:    AND  3,4,3	Op AND 
176:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
177:     LD  3,-4(1)	Load variable z
178:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
179:     LD  3,-4(1)	Load variable z
* TOFF inc: -8
180:     LD  4,-8(1)	Pop left into ac1 
181:    AND  3,4,3	Op AND 
* TOFF inc: -7
182:     LD  4,-7(1)	Pop left into ac1 
183:     OR  3,4,3	Op OR 
184:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end outputb
185:    LDA  1,-5(1)	Ghost frame becomes new active frame 
186:    LDA  3,1(7)	Return address in ac 
187:    JMP  7,-171(7)	CALL outputb
188:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -5
* EXPRESSION
* CALL outputb
189:     ST  1,-5(1)	Store fp in ghost frame for outputb
* TOFF dec: -6
* TOFF dec: -7
* Param 1
190:     LD  3,-2(1)	Load variable x
191:    LDC  4,1(6)	Load 1 
192:    XOR  3,3,4	Op XOR to get logical not 
193:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
194:     LD  3,-3(1)	Load variable y
195:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
196:     LD  3,-4(1)	Load variable z
* TOFF inc: -8
197:     LD  4,-8(1)	Pop left into ac1 
198:    AND  3,4,3	Op AND 
* TOFF inc: -7
199:     LD  4,-7(1)	Pop left into ac1 
200:     OR  3,4,3	Op OR 
201:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end outputb
202:    LDA  1,-5(1)	Ghost frame becomes new active frame 
203:    LDA  3,1(7)	Return address in ac 
204:    JMP  7,-188(7)	CALL outputb
205:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -5
* EXPRESSION
* CALL outputb
206:     ST  1,-5(1)	Store fp in ghost frame for outputb
* TOFF dec: -6
* TOFF dec: -7
* Param 1
207:     LD  3,-2(1)	Load variable x
208:    LDC  4,1(6)	Load 1 
209:    XOR  3,3,4	Op XOR to get logical not 
210:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
211:     LD  3,-3(1)	Load variable y
* TOFF inc: -7
212:     LD  4,-7(1)	Pop left into ac1 
213:    AND  3,4,3	Op AND 
214:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
215:     LD  3,-4(1)	Load variable z
* TOFF inc: -7
216:     LD  4,-7(1)	Pop left into ac1 
217:     OR  3,4,3	Op OR 
218:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end outputb
219:    LDA  1,-5(1)	Ghost frame becomes new active frame 
220:    LDA  3,1(7)	Return address in ac 
221:    JMP  7,-205(7)	CALL outputb
222:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -5
* EXPRESSION
* CALL outnl
223:     ST  1,-5(1)	Store fp in ghost frame for outnl
* TOFF dec: -6
* TOFF dec: -7
* Param end outnl
224:    LDA  1,-5(1)	Ghost frame becomes new active frame 
225:    LDA  3,1(7)	Return address in ac 
226:    JMP  7,-193(7)	CALL outnl
227:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -5
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
232:    LDA  1,0(0)	set first frame at end of globals 
233:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
234:    LDA  3,1(7)	Return address in ac 
235:    JMP  7,-197(7)	Jump to main 
236:   HALT  0,0,0	DONE! 
* END INIT
