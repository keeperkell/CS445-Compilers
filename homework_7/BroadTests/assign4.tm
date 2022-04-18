* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  assign4.c-
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
 40:    LDC  3,111(6)	Load integer constant 
 41:     LD  4,-2(1)	load lhs variable x
 42:    ADD  3,4,3	op += 
 43:     ST  3,-2(1)	Store variable x
* EXPRESSION
* CALL output
 44:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 45:     LD  3,-2(1)	Load variable x
 46:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
 47:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 48:    LDA  3,1(7)	Return address in ac 
 49:    JMP  7,-44(7)	CALL output
 50:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
 51:    LDC  3,222(6)	Load integer constant 
 52:     LD  4,-3(1)	load lhs variable y
 53:    ADD  3,4,3	op += 
 54:     ST  3,-3(1)	Store variable y
* EXPRESSION
* CALL output
 55:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 56:     LD  3,-3(1)	Load variable y
 57:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
 58:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 59:    LDA  3,1(7)	Return address in ac 
 60:    JMP  7,-55(7)	CALL output
 61:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
* CALL outnl
 62:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
 63:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 64:    LDA  3,1(7)	Return address in ac 
 65:    JMP  7,-32(7)	CALL outnl
 66:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
* EXPRESSION
 67:    LDC  3,333(6)	Load integer constant 
 68:     LD  4,0(0)	load lhs variable gx
 69:    ADD  3,4,3	op += 
 70:     ST  3,0(0)	Store variable gx
* EXPRESSION
* CALL output
 71:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 72:     LD  3,0(0)	Load variable gx
 73:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
 74:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 75:    LDA  3,1(7)	Return address in ac 
 76:    JMP  7,-71(7)	CALL output
 77:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
 78:    LDC  3,444(6)	Load integer constant 
 79:     LD  4,-1(0)	load lhs variable gy
 80:    ADD  3,4,3	op += 
 81:     ST  3,-1(0)	Store variable gy
* EXPRESSION
* CALL output
 82:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 83:     LD  3,-1(0)	Load variable gy
 84:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
 85:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 86:    LDA  3,1(7)	Return address in ac 
 87:    JMP  7,-82(7)	CALL output
 88:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
* CALL outnl
 89:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
 90:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 91:    LDA  3,1(7)	Return address in ac 
 92:    JMP  7,-59(7)	CALL outnl
 93:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
* EXPRESSION
 94:     LD  3,-3(1)	Load variable y
 95:     LD  4,-2(1)	load lhs variable x
 96:    ADD  3,4,3	op += 
 97:     ST  3,-2(1)	Store variable x
* EXPRESSION
* CALL output
 98:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 99:     LD  3,-2(1)	Load variable x
100:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
101:    LDA  1,-4(1)	Ghost frame becomes new active frame 
102:    LDA  3,1(7)	Return address in ac 
103:    JMP  7,-98(7)	CALL output
104:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
* CALL outnl
105:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
106:    LDA  1,-4(1)	Ghost frame becomes new active frame 
107:    LDA  3,1(7)	Return address in ac 
108:    JMP  7,-75(7)	CALL outnl
109:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
* EXPRESSION
110:     LD  3,-1(0)	Load variable gy
111:     LD  4,0(0)	load lhs variable gx
112:    ADD  3,4,3	op += 
113:     ST  3,0(0)	Store variable gx
* EXPRESSION
* CALL output
114:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
115:     LD  3,0(0)	Load variable gx
116:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
117:    LDA  1,-4(1)	Ghost frame becomes new active frame 
118:    LDA  3,1(7)	Return address in ac 
119:    JMP  7,-114(7)	CALL output
120:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
* CALL outnl
121:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
122:    LDA  1,-4(1)	Ghost frame becomes new active frame 
123:    LDA  3,1(7)	Return address in ac 
124:    JMP  7,-91(7)	CALL outnl
125:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
* EXPRESSION
126:    LDC  3,111(6)	Load integer constant 
127:     LD  4,-2(1)	load lhs variable x
128:    SUB  3,4,3	op -= 
129:     ST  3,-2(1)	Store variable x
* EXPRESSION
* CALL output
130:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
131:     LD  3,-2(1)	Load variable x
132:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
133:    LDA  1,-4(1)	Ghost frame becomes new active frame 
134:    LDA  3,1(7)	Return address in ac 
135:    JMP  7,-130(7)	CALL output
136:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
137:    LDC  3,222(6)	Load integer constant 
138:     LD  4,-3(1)	load lhs variable y
139:    SUB  3,4,3	op -= 
140:     ST  3,-3(1)	Store variable y
* EXPRESSION
* CALL output
141:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
142:     LD  3,-3(1)	Load variable y
143:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
144:    LDA  1,-4(1)	Ghost frame becomes new active frame 
145:    LDA  3,1(7)	Return address in ac 
146:    JMP  7,-141(7)	CALL output
147:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
* CALL outnl
148:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
149:    LDA  1,-4(1)	Ghost frame becomes new active frame 
150:    LDA  3,1(7)	Return address in ac 
151:    JMP  7,-118(7)	CALL outnl
152:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
* EXPRESSION
153:    LDC  3,333(6)	Load integer constant 
154:     LD  4,0(0)	load lhs variable gx
155:    SUB  3,4,3	op -= 
156:     ST  3,0(0)	Store variable gx
* EXPRESSION
* CALL output
157:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
158:     LD  3,0(0)	Load variable gx
159:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
160:    LDA  1,-4(1)	Ghost frame becomes new active frame 
161:    LDA  3,1(7)	Return address in ac 
162:    JMP  7,-157(7)	CALL output
163:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
164:    LDC  3,444(6)	Load integer constant 
165:     LD  4,-1(0)	load lhs variable gy
166:    SUB  3,4,3	op -= 
167:     ST  3,-1(0)	Store variable gy
* EXPRESSION
* CALL output
168:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
169:     LD  3,-1(0)	Load variable gy
170:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
171:    LDA  1,-4(1)	Ghost frame becomes new active frame 
172:    LDA  3,1(7)	Return address in ac 
173:    JMP  7,-168(7)	CALL output
174:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
* CALL outnl
175:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
176:    LDA  1,-4(1)	Ghost frame becomes new active frame 
177:    LDA  3,1(7)	Return address in ac 
178:    JMP  7,-145(7)	CALL outnl
179:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
* EXPRESSION
180:     LD  3,-3(1)	Load variable y
181:     LD  4,-2(1)	load lhs variable x
182:    SUB  3,4,3	op -= 
183:     ST  3,-2(1)	Store variable x
* EXPRESSION
* CALL output
184:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
185:     LD  3,-2(1)	Load variable x
186:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
187:    LDA  1,-4(1)	Ghost frame becomes new active frame 
188:    LDA  3,1(7)	Return address in ac 
189:    JMP  7,-184(7)	CALL output
190:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
* CALL outnl
191:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
192:    LDA  1,-4(1)	Ghost frame becomes new active frame 
193:    LDA  3,1(7)	Return address in ac 
194:    JMP  7,-161(7)	CALL outnl
195:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
* EXPRESSION
196:     LD  3,-1(0)	Load variable gy
197:     LD  4,0(0)	load lhs variable gx
198:    SUB  3,4,3	op -= 
199:     ST  3,0(0)	Store variable gx
* EXPRESSION
* CALL output
200:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
201:     LD  3,0(0)	Load variable gx
202:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
203:    LDA  1,-4(1)	Ghost frame becomes new active frame 
204:    LDA  3,1(7)	Return address in ac 
205:    JMP  7,-200(7)	CALL output
206:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
* CALL outnl
207:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
208:    LDA  1,-4(1)	Ghost frame becomes new active frame 
209:    LDA  3,1(7)	Return address in ac 
210:    JMP  7,-177(7)	CALL outnl
211:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
* RETURN
212:     LD  3,-1(1)	Load return address 
213:     LD  1,0(1)	Adjust fp 
214:    JMP  7,0(3)	Return 
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
215:    LDC  2,0(6)	Set return value to 0 
216:     LD  3,-1(1)	Load return address 
217:     LD  1,0(1)	Adjust fp 
218:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,218(7)	Jump to init [backpatch] 
* INIT
219:    LDA  1,-2(0)	set first frame at end of globals 
220:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
221:    LDA  3,1(7)	Return address in ac 
222:    JMP  7,-184(7)	Jump to main 
223:   HALT  0,0,0	DONE! 
* END INIT
