* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  vararray.c-
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
* TOFF set: -3
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
* CALL output
 40:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 41:     LD  3,-2(1)	Load address of base of array q
 42:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 43:    LDC  3,10(6)	Load integer constant 
* TOFF inc: -5
 44:     LD  4,-5(1)	Pop left into ac1 
 45:    SUB  3,4,3	compute location from index 
 46:     LD  3,0(3)	Load array element 
 47:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 48:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 49:    LDA  3,1(7)	Return address in ac 
 50:    JMP  7,-45(7)	CALL output
 51:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
 52:    LDC  2,0(6)	Set return value to 0 
 53:     LD  3,-1(1)	Load return address 
 54:     LD  1,0(1)	Adjust fp 
 55:    JMP  7,0(3)	Return 
* END FUNCTION cat
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION dog
* TOFF set: -3
 56:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -13
 57:    LDC  3,9(6)	load size of array y
 58:     ST  3,-3(1)	save size of array y
* Compound Body
* EXPRESSION
* CALL output
 59:     ST  1,-13(1)	Store fp in ghost frame for output
* TOFF dec: -14
* TOFF dec: -15
* Param 1
 60:     LD  3,-2(1)	Load address of base of array x
 61:     LD  3,1(3)	Load array size 
 62:     ST  3,-15(1)	Push parameter 
* TOFF dec: -16
* Param end output
 63:    LDA  1,-13(1)	Ghost frame becomes new active frame 
 64:    LDA  3,1(7)	Return address in ac 
 65:    JMP  7,-60(7)	CALL output
 66:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -13
* EXPRESSION
* CALL outnl
 67:     ST  1,-13(1)	Store fp in ghost frame for outnl
* TOFF dec: -14
* TOFF dec: -15
* Param end outnl
 68:    LDA  1,-13(1)	Ghost frame becomes new active frame 
 69:    LDA  3,1(7)	Return address in ac 
 70:    JMP  7,-37(7)	CALL outnl
 71:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -13
* EXPRESSION
* CALL output
 72:     ST  1,-13(1)	Store fp in ghost frame for output
* TOFF dec: -14
* TOFF dec: -15
* Param 1
 73:     LD  3,-2(1)	Load address of base of array x
 74:     ST  3,-15(1)	Push left side 
* TOFF dec: -16
 75:    LDC  3,10(6)	Load integer constant 
* TOFF inc: -15
 76:     LD  4,-15(1)	Pop left into ac1 
 77:    SUB  3,4,3	compute location from index 
 78:     LD  3,0(3)	Load array element 
 79:     ST  3,-15(1)	Push parameter 
* TOFF dec: -16
* Param end output
 80:    LDA  1,-13(1)	Ghost frame becomes new active frame 
 81:    LDA  3,1(7)	Return address in ac 
 82:    JMP  7,-77(7)	CALL output
 83:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -13
* EXPRESSION
* CALL cat
 84:     ST  1,-13(1)	Store fp in ghost frame for cat
* TOFF dec: -14
* TOFF dec: -15
* Param 1
 85:     LD  3,-2(1)	Load address of base of array x
 86:     ST  3,-15(1)	Push parameter 
* TOFF dec: -16
* Param end cat
 87:    LDA  1,-13(1)	Ghost frame becomes new active frame 
 88:    LDA  3,1(7)	Return address in ac 
 89:    JMP  7,-51(7)	CALL cat
 90:    LDA  3,0(2)	Save the result in ac 
* Call end cat
* TOFF set: -13
* EXPRESSION
* CALL outnl
 91:     ST  1,-13(1)	Store fp in ghost frame for outnl
* TOFF dec: -14
* TOFF dec: -15
* Param end outnl
 92:    LDA  1,-13(1)	Ghost frame becomes new active frame 
 93:    LDA  3,1(7)	Return address in ac 
 94:    JMP  7,-61(7)	CALL outnl
 95:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -13
* EXPRESSION
 96:    LDC  3,5(6)	Load integer constant 
 97:     ST  3,-13(1)	Push index 
* TOFF dec: -14
 98:    LDA  3,-4(1)	Load address of base of array y
 99:     ST  3,-14(1)	Push left side 
* TOFF dec: -15
100:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -14
101:     LD  4,-14(1)	Pop left into ac1 
102:    SUB  3,4,3	compute location from index 
103:     LD  3,0(3)	Load array element 
* TOFF inc: -13
104:     LD  4,-13(1)	Pop index 
105:     LD  5,-2(1)	Load address of base of array x
106:    SUB  5,5,4	Compute offset of value 
107:     ST  3,0(5)	Store variable x
* EXPRESSION
108:    LDC  3,6(6)	Load integer constant 
109:     ST  3,-13(1)	Push index 
* TOFF dec: -14
110:    LDA  3,-1(0)	Load address of base of array g
111:     ST  3,-14(1)	Push left side 
* TOFF dec: -15
112:    LDC  3,6(6)	Load integer constant 
* TOFF inc: -14
113:     LD  4,-14(1)	Pop left into ac1 
114:    SUB  3,4,3	compute location from index 
115:     LD  3,0(3)	Load array element 
* TOFF inc: -13
116:     LD  4,-13(1)	Pop index 
117:    LDA  5,-14(0)	Load address of base of array z
118:    SUB  5,5,4	Compute offset of value 
119:     ST  3,0(5)	Store variable z
* RETURN
120:    LDA  3,-14(0)	Load address of base of array z
121:     ST  3,-13(1)	Push left side 
* TOFF dec: -14
122:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -13
123:     LD  4,-13(1)	Pop left into ac1 
124:    SUB  3,4,3	compute location from index 
125:     LD  3,0(3)	Load array element 
126:    LDA  2,0(3)	Copy result to return register 
127:     LD  3,-1(1)	Load return address 
128:     LD  1,0(1)	Adjust fp 
129:    JMP  7,0(3)	Return 
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
130:    LDC  2,0(6)	Set return value to 0 
131:     LD  3,-1(1)	Load return address 
132:     LD  1,0(1)	Adjust fp 
133:    JMP  7,0(3)	Return 
* END FUNCTION dog
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
134:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -14
135:    LDC  3,11(6)	load size of array m
136:     ST  3,-2(1)	save size of array m
* Compound Body
* EXPRESSION
137:    LDC  3,10(6)	Load integer constant 
138:     ST  3,-14(1)	Push index 
* TOFF dec: -15
139:    LDC  3,111(6)	Load integer constant 
* TOFF inc: -14
140:     LD  4,-14(1)	Pop index 
141:    LDA  5,-3(1)	Load address of base of array m
142:    SUB  5,5,4	Compute offset of value 
143:     ST  3,0(5)	Store variable m
* EXPRESSION
* CALL dog
144:     ST  1,-14(1)	Store fp in ghost frame for dog
* TOFF dec: -15
* TOFF dec: -16
* Param 1
145:    LDA  3,-3(1)	Load address of base of array m
146:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param end dog
147:    LDA  1,-14(1)	Ghost frame becomes new active frame 
148:    LDA  3,1(7)	Return address in ac 
149:    JMP  7,-94(7)	CALL dog
150:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -14
* EXPRESSION
* CALL output
151:     ST  1,-14(1)	Store fp in ghost frame for output
* TOFF dec: -15
* TOFF dec: -16
* Param 1
152:    LDA  3,-3(1)	Load address of base of array m
153:     ST  3,-16(1)	Push left side 
* TOFF dec: -17
154:    LDC  3,10(6)	Load integer constant 
* TOFF inc: -16
155:     LD  4,-16(1)	Pop left into ac1 
156:    SUB  3,4,3	compute location from index 
157:     LD  3,0(3)	Load array element 
158:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param end output
159:    LDA  1,-14(1)	Ghost frame becomes new active frame 
160:    LDA  3,1(7)	Return address in ac 
161:    JMP  7,-156(7)	CALL output
162:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -14
* EXPRESSION
163:    LDC  3,10(6)	Load integer constant 
164:     ST  3,-14(1)	Push index 
* TOFF dec: -15
165:    LDC  3,222(6)	Load integer constant 
* TOFF inc: -14
166:     LD  4,-14(1)	Pop index 
167:    LDA  5,-1(0)	Load address of base of array g
168:    SUB  5,5,4	Compute offset of value 
169:     ST  3,0(5)	Store variable g
* EXPRESSION
* CALL dog
170:     ST  1,-14(1)	Store fp in ghost frame for dog
* TOFF dec: -15
* TOFF dec: -16
* Param 1
171:    LDA  3,-1(0)	Load address of base of array g
172:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param end dog
173:    LDA  1,-14(1)	Ghost frame becomes new active frame 
174:    LDA  3,1(7)	Return address in ac 
175:    JMP  7,-120(7)	CALL dog
176:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -14
* EXPRESSION
* CALL output
177:     ST  1,-14(1)	Store fp in ghost frame for output
* TOFF dec: -15
* TOFF dec: -16
* Param 1
178:    LDA  3,-1(0)	Load address of base of array g
179:     ST  3,-16(1)	Push left side 
* TOFF dec: -17
180:    LDC  3,10(6)	Load integer constant 
* TOFF inc: -16
181:     LD  4,-16(1)	Pop left into ac1 
182:    SUB  3,4,3	compute location from index 
183:     LD  3,0(3)	Load array element 
184:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param end output
185:    LDA  1,-14(1)	Ghost frame becomes new active frame 
186:    LDA  3,1(7)	Return address in ac 
187:    JMP  7,-182(7)	CALL output
188:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -14
* EXPRESSION
189:    LDC  3,10(6)	Load integer constant 
190:     ST  3,-14(1)	Push index 
* TOFF dec: -15
191:    LDC  3,333(6)	Load integer constant 
* TOFF inc: -14
192:     LD  4,-14(1)	Pop index 
193:    LDA  5,-25(0)	Load address of base of array z
194:    SUB  5,5,4	Compute offset of value 
195:     ST  3,0(5)	Store variable z
* EXPRESSION
* CALL dog
196:     ST  1,-14(1)	Store fp in ghost frame for dog
* TOFF dec: -15
* TOFF dec: -16
* Param 1
197:    LDA  3,-25(0)	Load address of base of array z
198:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param end dog
199:    LDA  1,-14(1)	Ghost frame becomes new active frame 
200:    LDA  3,1(7)	Return address in ac 
201:    JMP  7,-146(7)	CALL dog
202:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -14
* EXPRESSION
* CALL output
203:     ST  1,-14(1)	Store fp in ghost frame for output
* TOFF dec: -15
* TOFF dec: -16
* Param 1
204:    LDA  3,-25(0)	Load address of base of array z
205:     ST  3,-16(1)	Push left side 
* TOFF dec: -17
206:    LDC  3,10(6)	Load integer constant 
* TOFF inc: -16
207:     LD  4,-16(1)	Pop left into ac1 
208:    SUB  3,4,3	compute location from index 
209:     LD  3,0(3)	Load array element 
210:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param end output
211:    LDA  1,-14(1)	Ghost frame becomes new active frame 
212:    LDA  3,1(7)	Return address in ac 
213:    JMP  7,-208(7)	CALL output
214:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -14
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
219:    LDA  1,-38(0)	set first frame at end of globals 
220:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
221:    LDC  3,12(6)	load size of array g
222:     ST  3,0(0)	save size of array g
223:    LDC  3,10(6)	load size of array z
224:     ST  3,-13(0)	save size of array z
225:    LDC  3,13(6)	load size of array z
226:     ST  3,-24(0)	save size of array z
* END INIT GLOBALS AND STATICS
227:    LDA  3,1(7)	Return address in ac 
228:    JMP  7,-95(7)	Jump to main 
229:   HALT  0,0,0	DONE! 
* END INIT
