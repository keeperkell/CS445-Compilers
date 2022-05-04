* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  unary.c-
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
* TOFF set: -18
 40:    LDC  3,7(6)	load size of array a
 41:     ST  3,-4(1)	save size of array a
 42:    LDC  3,5(6)	load size of array b
 43:     ST  3,-12(1)	save size of array b
* Compound Body
* EXPRESSION
 44:    LDC  3,88(6)	Load integer constant 
 45:     ST  3,-2(1)	Store variable x
* EXPRESSION
 46:     LD  3,-2(1)	Load variable x
 47:     ST  3,-18(1)	Push left side 
* TOFF dec: -19
 48:    LDC  3,9(6)	Load integer constant 
* TOFF inc: -18
 49:     LD  4,-18(1)	Pop left into ac1 
 50:    SUB  3,4,3	Op - 
 51:     ST  3,-3(1)	Store variable y
* EXPRESSION
 52:     LD  3,-2(1)	Load variable x
 53:    NEG  3,3,3	Op unary - 
 54:     ST  3,-3(1)	Store variable y
* EXPRESSION
* CALL output
 55:     ST  1,-18(1)	Store fp in ghost frame for output
* TOFF dec: -19
* TOFF dec: -20
* Param 1
 56:     LD  3,-2(1)	Load variable x
 57:    NEG  3,3,3	Op unary - 
 58:     ST  3,-20(1)	Push parameter 
* TOFF dec: -21
* Param end output
 59:    LDA  1,-18(1)	Ghost frame becomes new active frame 
 60:    LDA  3,1(7)	Return address in ac 
 61:    JMP  7,-56(7)	CALL output
 62:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -18
* EXPRESSION
* CALL output
 63:     ST  1,-18(1)	Store fp in ghost frame for output
* TOFF dec: -19
* TOFF dec: -20
* Param 1
 64:     LD  3,-3(1)	Load variable y
 65:     ST  3,-20(1)	Push parameter 
* TOFF dec: -21
* Param end output
 66:    LDA  1,-18(1)	Ghost frame becomes new active frame 
 67:    LDA  3,1(7)	Return address in ac 
 68:    JMP  7,-63(7)	CALL output
 69:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -18
* EXPRESSION
* CALL outnl
 70:     ST  1,-18(1)	Store fp in ghost frame for outnl
* TOFF dec: -19
* TOFF dec: -20
* Param end outnl
 71:    LDA  1,-18(1)	Ghost frame becomes new active frame 
 72:    LDA  3,1(7)	Return address in ac 
 73:    JMP  7,-40(7)	CALL outnl
 74:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -18
* EXPRESSION
* CALL output
 75:     ST  1,-18(1)	Store fp in ghost frame for output
* TOFF dec: -19
* TOFF dec: -20
* Param 1
 76:    LDC  3,3(6)	Load integer constant 
 77:    NEG  3,3,3	Op unary - 
 78:    NEG  3,3,3	Op unary - 
 79:     ST  3,-20(1)	Push left side 
* TOFF dec: -21
 80:    LDC  3,5(6)	Load integer constant 
 81:    NEG  3,3,3	Op unary - 
* TOFF inc: -20
 82:     LD  4,-20(1)	Pop left into ac1 
 83:    MUL  3,4,3	Op * 
 84:     ST  3,-20(1)	Push parameter 
* TOFF dec: -21
* Param end output
 85:    LDA  1,-18(1)	Ghost frame becomes new active frame 
 86:    LDA  3,1(7)	Return address in ac 
 87:    JMP  7,-82(7)	CALL output
 88:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -18
* EXPRESSION
* CALL output
 89:     ST  1,-18(1)	Store fp in ghost frame for output
* TOFF dec: -19
* TOFF dec: -20
* Param 1
 90:    LDC  3,3(6)	Load integer constant 
 91:    NEG  3,3,3	Op unary - 
 92:    NEG  3,3,3	Op unary - 
 93:     ST  3,-20(1)	Push parameter 
* TOFF dec: -21
* Param end output
 94:    LDA  1,-18(1)	Ghost frame becomes new active frame 
 95:    LDA  3,1(7)	Return address in ac 
 96:    JMP  7,-91(7)	CALL output
 97:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -18
* EXPRESSION
* CALL outnl
 98:     ST  1,-18(1)	Store fp in ghost frame for outnl
* TOFF dec: -19
* TOFF dec: -20
* Param end outnl
 99:    LDA  1,-18(1)	Ghost frame becomes new active frame 
100:    LDA  3,1(7)	Return address in ac 
101:    JMP  7,-68(7)	CALL outnl
102:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -18
* COMPOUND
* TOFF set: -20
* Compound Body
* EXPRESSION
103:    LDC  3,1(6)	Load Boolean constant 
104:     ST  3,-18(1)	Store variable x
* EXPRESSION
105:     LD  3,-18(1)	Load variable x
106:    LDC  4,1(6)	Load 1 
107:    XOR  3,3,4	Op XOR to get logical not 
108:     ST  3,-19(1)	Store variable y
* EXPRESSION
* CALL outputb
109:     ST  1,-20(1)	Store fp in ghost frame for outputb
* TOFF dec: -21
* TOFF dec: -22
* Param 1
110:     LD  3,-18(1)	Load variable x
111:    LDC  4,1(6)	Load 1 
112:    XOR  3,3,4	Op XOR to get logical not 
113:     ST  3,-22(1)	Push parameter 
* TOFF dec: -23
* Param end outputb
114:    LDA  1,-20(1)	Ghost frame becomes new active frame 
115:    LDA  3,1(7)	Return address in ac 
116:    JMP  7,-100(7)	CALL outputb
117:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -20
* EXPRESSION
* CALL outputb
118:     ST  1,-20(1)	Store fp in ghost frame for outputb
* TOFF dec: -21
* TOFF dec: -22
* Param 1
119:     LD  3,-19(1)	Load variable y
120:     ST  3,-22(1)	Push parameter 
* TOFF dec: -23
* Param end outputb
121:    LDA  1,-20(1)	Ghost frame becomes new active frame 
122:    LDA  3,1(7)	Return address in ac 
123:    JMP  7,-107(7)	CALL outputb
124:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -20
* EXPRESSION
* CALL outputb
125:     ST  1,-20(1)	Store fp in ghost frame for outputb
* TOFF dec: -21
* TOFF dec: -22
* Param 1
126:     LD  3,-18(1)	Load variable x
127:    LDC  4,1(6)	Load 1 
128:    XOR  3,3,4	Op XOR to get logical not 
129:    LDC  4,1(6)	Load 1 
130:    XOR  3,3,4	Op XOR to get logical not 
131:     ST  3,-22(1)	Push left side 
* TOFF dec: -23
132:     LD  3,-19(1)	Load variable y
133:    LDC  4,1(6)	Load 1 
134:    XOR  3,3,4	Op XOR to get logical not 
* TOFF inc: -22
135:     LD  4,-22(1)	Pop left into ac1 
136:    AND  3,4,3	Op AND 
137:     ST  3,-22(1)	Push parameter 
* TOFF dec: -23
* Param end outputb
138:    LDA  1,-20(1)	Ghost frame becomes new active frame 
139:    LDA  3,1(7)	Return address in ac 
140:    JMP  7,-124(7)	CALL outputb
141:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -20
* EXPRESSION
* CALL outputb
142:     ST  1,-20(1)	Store fp in ghost frame for outputb
* TOFF dec: -21
* TOFF dec: -22
* Param 1
143:     LD  3,-18(1)	Load variable x
144:    LDC  4,1(6)	Load 1 
145:    XOR  3,3,4	Op XOR to get logical not 
146:    LDC  4,1(6)	Load 1 
147:    XOR  3,3,4	Op XOR to get logical not 
148:     ST  3,-22(1)	Push left side 
* TOFF dec: -23
149:     LD  3,-19(1)	Load variable y
150:    LDC  4,1(6)	Load 1 
151:    XOR  3,3,4	Op XOR to get logical not 
* TOFF inc: -22
152:     LD  4,-22(1)	Pop left into ac1 
153:     OR  3,4,3	Op OR 
154:     ST  3,-22(1)	Push parameter 
* TOFF dec: -23
* Param end outputb
155:    LDA  1,-20(1)	Ghost frame becomes new active frame 
156:    LDA  3,1(7)	Return address in ac 
157:    JMP  7,-141(7)	CALL outputb
158:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -20
* EXPRESSION
* CALL outputb
159:     ST  1,-20(1)	Store fp in ghost frame for outputb
* TOFF dec: -21
* TOFF dec: -22
* Param 1
160:     LD  3,-19(1)	Load variable y
161:    LDC  4,1(6)	Load 1 
162:    XOR  3,3,4	Op XOR to get logical not 
163:    LDC  4,1(6)	Load 1 
164:    XOR  3,3,4	Op XOR to get logical not 
165:     ST  3,-22(1)	Push left side 
* TOFF dec: -23
166:     LD  3,-18(1)	Load variable x
167:    LDC  4,1(6)	Load 1 
168:    XOR  3,3,4	Op XOR to get logical not 
* TOFF inc: -22
169:     LD  4,-22(1)	Pop left into ac1 
170:     OR  3,4,3	Op OR 
171:     ST  3,-22(1)	Push parameter 
* TOFF dec: -23
* Param end outputb
172:    LDA  1,-20(1)	Ghost frame becomes new active frame 
173:    LDA  3,1(7)	Return address in ac 
174:    JMP  7,-158(7)	CALL outputb
175:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -20
* EXPRESSION
* CALL outputb
176:     ST  1,-20(1)	Store fp in ghost frame for outputb
* TOFF dec: -21
* TOFF dec: -22
* Param 1
177:     LD  3,-18(1)	Load variable x
178:    LDC  4,1(6)	Load 1 
179:    XOR  3,3,4	Op XOR to get logical not 
180:    LDC  4,1(6)	Load 1 
181:    XOR  3,3,4	Op XOR to get logical not 
182:     ST  3,-22(1)	Push parameter 
* TOFF dec: -23
* Param end outputb
183:    LDA  1,-20(1)	Ghost frame becomes new active frame 
184:    LDA  3,1(7)	Return address in ac 
185:    JMP  7,-169(7)	CALL outputb
186:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -20
* EXPRESSION
* CALL outnl
187:     ST  1,-20(1)	Store fp in ghost frame for outnl
* TOFF dec: -21
* TOFF dec: -22
* Param end outnl
188:    LDA  1,-20(1)	Ghost frame becomes new active frame 
189:    LDA  3,1(7)	Return address in ac 
190:    JMP  7,-157(7)	CALL outnl
191:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -20
* TOFF set: -18
* END COMPOUND
* EXPRESSION
* CALL output
192:     ST  1,-18(1)	Store fp in ghost frame for output
* TOFF dec: -19
* TOFF dec: -20
* Param 1
193:    LDA  3,-5(1)	Load address of base of array a
194:     LD  3,1(3)	Load array size 
195:     ST  3,-20(1)	Push parameter 
* TOFF dec: -21
* Param end output
196:    LDA  1,-18(1)	Ghost frame becomes new active frame 
197:    LDA  3,1(7)	Return address in ac 
198:    JMP  7,-193(7)	CALL output
199:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -18
* EXPRESSION
* CALL output
200:     ST  1,-18(1)	Store fp in ghost frame for output
* TOFF dec: -19
* TOFF dec: -20
* Param 1
201:    LDA  3,-13(1)	Load address of base of array b
202:     LD  3,1(3)	Load array size 
203:     ST  3,-20(1)	Push parameter 
* TOFF dec: -21
* Param end output
204:    LDA  1,-18(1)	Ghost frame becomes new active frame 
205:    LDA  3,1(7)	Return address in ac 
206:    JMP  7,-201(7)	CALL output
207:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -18
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
208:    LDC  2,0(6)	Set return value to 0 
209:     LD  3,-1(1)	Load return address 
210:     LD  1,0(1)	Adjust fp 
211:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,211(7)	Jump to init [backpatch] 
* INIT
212:    LDA  1,0(0)	set first frame at end of globals 
213:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
214:    LDA  3,1(7)	Return address in ac 
215:    JMP  7,-177(7)	Jump to main 
216:   HALT  0,0,0	DONE! 
* END INIT
