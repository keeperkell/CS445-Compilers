* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  pushpopexp.c-
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
* TOFF set: -6
* Compound Body
* EXPRESSION
 40:    LDC  3,331(6)	Load integer constant 
 41:     ST  3,0(0)	Store variable g
* EXPRESSION
 42:    LDC  3,2(6)	Load integer constant 
 43:     ST  3,-2(1)	Store variable a
* EXPRESSION
 44:    LDC  3,3(6)	Load integer constant 
 45:     ST  3,-3(1)	Store variable b
* EXPRESSION
 46:    LDC  3,5(6)	Load integer constant 
 47:     ST  3,-4(1)	Store variable c
* EXPRESSION
 48:    LDC  3,7(6)	Load integer constant 
 49:     ST  3,-5(1)	Store variable d
* EXPRESSION
* CALL output
 50:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
 51:     LD  3,-5(1)	Load variable d
 52:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
 53:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 54:    LDA  3,1(7)	Return address in ac 
 55:    JMP  7,-50(7)	CALL output
 56:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
 57:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
 58:     LD  3,-2(1)	Load variable a
 59:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
 60:     LD  3,-3(1)	Load variable b
 61:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
 62:     LD  3,-4(1)	Load variable c
* TOFF inc: -9
 63:     LD  4,-9(1)	Pop left into ac1 
 64:    MUL  3,4,3	Op * 
* TOFF inc: -8
 65:     LD  4,-8(1)	Pop left into ac1 
 66:    ADD  3,4,3	Op + 
 67:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
 68:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 69:    LDA  3,1(7)	Return address in ac 
 70:    JMP  7,-65(7)	CALL output
 71:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL outputb
 72:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
 73:     LD  3,-5(1)	Load variable d
 74:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
 75:     LD  3,-2(1)	Load variable a
 76:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
 77:     LD  3,-3(1)	Load variable b
 78:     ST  3,-10(1)	Push left side 
* TOFF dec: -11
 79:     LD  3,-4(1)	Load variable c
* TOFF inc: -10
 80:     LD  4,-10(1)	Pop left into ac1 
 81:    MUL  3,4,3	Op * 
* TOFF inc: -9
 82:     LD  4,-9(1)	Pop left into ac1 
 83:    ADD  3,4,3	Op + 
* TOFF inc: -8
 84:     LD  4,-8(1)	Pop left into ac1 
 85:    TGT  3,4,3	Op > 
 86:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
 87:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 88:    LDA  3,1(7)	Return address in ac 
 89:    JMP  7,-73(7)	CALL outputb
 90:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outputb
 91:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
 92:     LD  3,-5(1)	Load variable d
 93:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
 94:     LD  3,-2(1)	Load variable a
 95:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
 96:     LD  3,-3(1)	Load variable b
 97:     ST  3,-10(1)	Push left side 
* TOFF dec: -11
 98:     LD  3,-4(1)	Load variable c
* TOFF inc: -10
 99:     LD  4,-10(1)	Pop left into ac1 
100:    MUL  3,4,3	Op * 
* TOFF inc: -9
101:     LD  4,-9(1)	Pop left into ac1 
102:    ADD  3,4,3	Op + 
* TOFF inc: -8
103:     LD  4,-8(1)	Pop left into ac1 
104:    TGT  3,4,3	Op > 
105:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
106:     LD  3,-3(1)	Load variable b
107:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
108:     LD  3,-4(1)	Load variable c
* TOFF inc: -9
109:     LD  4,-9(1)	Pop left into ac1 
110:    TLT  3,4,3	Op < 
* TOFF inc: -8
111:     LD  4,-8(1)	Pop left into ac1 
112:     OR  3,4,3	Op OR 
113:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
114:    LDA  1,-6(1)	Ghost frame becomes new active frame 
115:    LDA  3,1(7)	Return address in ac 
116:    JMP  7,-100(7)	CALL outputb
117:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outnl
118:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
119:    LDA  1,-6(1)	Ghost frame becomes new active frame 
120:    LDA  3,1(7)	Return address in ac 
121:    JMP  7,-88(7)	CALL outnl
122:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* COMPOUND
* TOFF set: -9
* Compound Body
* EXPRESSION
123:    LDC  3,101(6)	Load integer constant 
124:     ST  3,-6(1)	Store variable a
* EXPRESSION
125:    LDC  3,103(6)	Load integer constant 
126:     ST  3,-7(1)	Store variable b
* EXPRESSION
127:    LDC  3,107(6)	Load integer constant 
128:     ST  3,-8(1)	Store variable c
* EXPRESSION
* CALL outputb
129:     ST  1,-9(1)	Store fp in ghost frame for outputb
* TOFF dec: -10
* TOFF dec: -11
* Param 1
130:     LD  3,-5(1)	Load variable d
131:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
132:    LDC  3,20(6)	Load integer constant 
* TOFF inc: -11
133:     LD  4,-11(1)	Pop left into ac1 
134:    MUL  3,4,3	Op * 
135:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
136:     LD  3,-6(1)	Load variable a
137:     ST  3,-12(1)	Push left side 
* TOFF dec: -13
138:     LD  3,-8(1)	Load variable c
139:     ST  3,-13(1)	Push left side 
* TOFF dec: -14
140:     LD  3,-7(1)	Load variable b
* TOFF inc: -13
141:     LD  4,-13(1)	Pop left into ac1 
142:    DIV  3,4,3	Op / 
* TOFF inc: -12
143:     LD  4,-12(1)	Pop left into ac1 
144:    SUB  3,4,3	Op - 
* TOFF inc: -11
145:     LD  4,-11(1)	Pop left into ac1 
146:    TLT  3,4,3	Op < 
147:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param end outputb
148:    LDA  1,-9(1)	Ghost frame becomes new active frame 
149:    LDA  3,1(7)	Return address in ac 
150:    JMP  7,-134(7)	CALL outputb
151:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -9
* TOFF set: -6
* END COMPOUND
* COMPOUND
* TOFF set: -10
* Compound Body
* EXPRESSION
152:    LDC  3,101(6)	Load integer constant 
153:     ST  3,-6(1)	Store variable w
* EXPRESSION
154:    LDC  3,103(6)	Load integer constant 
155:     ST  3,-7(1)	Store variable x
* EXPRESSION
156:    LDC  3,107(6)	Load integer constant 
157:     ST  3,-8(1)	Store variable y
* EXPRESSION
158:    LDC  3,109(6)	Load integer constant 
159:     ST  3,-9(1)	Store variable z
* EXPRESSION
* CALL output
160:     ST  1,-10(1)	Store fp in ghost frame for output
* TOFF dec: -11
* TOFF dec: -12
* Param 1
161:     LD  3,-6(1)	Load variable w
162:     ST  3,-12(1)	Push left side 
* TOFF dec: -13
163:     LD  3,-7(1)	Load variable x
* TOFF inc: -12
164:     LD  4,-12(1)	Pop left into ac1 
165:    MUL  3,4,3	Op * 
166:     ST  3,-12(1)	Push left side 
* TOFF dec: -13
167:     LD  3,-8(1)	Load variable y
168:     ST  3,-13(1)	Push left side 
* TOFF dec: -14
169:     LD  3,-9(1)	Load variable z
* TOFF inc: -13
170:     LD  4,-13(1)	Pop left into ac1 
171:    MUL  3,4,3	Op * 
* TOFF inc: -12
172:     LD  4,-12(1)	Pop left into ac1 
173:    ADD  3,4,3	Op + 
174:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param end output
175:    LDA  1,-10(1)	Ghost frame becomes new active frame 
176:    LDA  3,1(7)	Return address in ac 
177:    JMP  7,-172(7)	CALL output
178:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -10
* EXPRESSION
* CALL outnl
179:     ST  1,-10(1)	Store fp in ghost frame for outnl
* TOFF dec: -11
* TOFF dec: -12
* Param end outnl
180:    LDA  1,-10(1)	Ghost frame becomes new active frame 
181:    LDA  3,1(7)	Return address in ac 
182:    JMP  7,-149(7)	CALL outnl
183:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -10
* TOFF set: -6
* END COMPOUND
* EXPRESSION
* CALL output
184:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
185:     LD  3,-2(1)	Load variable a
186:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
187:     LD  3,-3(1)	Load variable b
* TOFF inc: -8
188:     LD  4,-8(1)	Pop left into ac1 
189:    MUL  3,4,3	Op * 
190:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
191:     LD  3,-4(1)	Load variable c
192:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
193:     LD  3,-5(1)	Load variable d
* TOFF inc: -9
194:     LD  4,-9(1)	Pop left into ac1 
195:    MUL  3,4,3	Op * 
* TOFF inc: -8
196:     LD  4,-8(1)	Pop left into ac1 
197:    ADD  3,4,3	Op + 
198:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
199:    LDA  1,-6(1)	Ghost frame becomes new active frame 
200:    LDA  3,1(7)	Return address in ac 
201:    JMP  7,-196(7)	CALL output
202:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
203:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
204:     LD  3,0(0)	Load variable g
205:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
206:    LDA  1,-6(1)	Ghost frame becomes new active frame 
207:    LDA  3,1(7)	Return address in ac 
208:    JMP  7,-203(7)	CALL output
209:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL outnl
210:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
211:    LDA  1,-6(1)	Ghost frame becomes new active frame 
212:    LDA  3,1(7)	Return address in ac 
213:    JMP  7,-180(7)	CALL outnl
214:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
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
