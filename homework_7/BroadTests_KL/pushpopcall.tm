* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  pushpopcall.c-
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
* FUNCTION dog
* TOFF set: -3
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* IF
 40:     LD  3,-2(1)	Load variable x
 41:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 42:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -3
 43:     LD  4,-3(1)	Pop left into ac1 
 44:    TGT  3,4,3	Op > 
* THEN
* RETURN
 46:    LDC  3,1000(6)	Load integer constant 
 47:    LDA  2,0(3)	Copy result to return register 
 48:     LD  3,-1(1)	Load return address 
 49:     LD  1,0(1)	Adjust fp 
 50:    JMP  7,0(3)	Return 
 45:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* END IF
* EXPRESSION
* CALL output
 51:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
* CALL dog
 52:     ST  1,-5(1)	Store fp in ghost frame for dog
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 53:    LDC  3,666(6)	Load integer constant 
 54:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end dog
 55:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 56:    LDA  3,1(7)	Return address in ac 
 57:    JMP  7,-19(7)	CALL dog
 58:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -5
 59:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 60:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 61:    LDA  3,1(7)	Return address in ac 
 62:    JMP  7,-57(7)	CALL output
 63:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL output
 64:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 65:    LDC  3,777(6)	Load integer constant 
 66:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
* CALL dog
 67:     ST  1,-6(1)	Store fp in ghost frame for dog
* TOFF dec: -7
* TOFF dec: -8
* Param 1
 68:    LDC  3,888(6)	Load integer constant 
 69:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end dog
 70:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 71:    LDA  3,1(7)	Return address in ac 
 72:    JMP  7,-34(7)	CALL dog
 73:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -6
* TOFF inc: -5
 74:     LD  4,-5(1)	Pop left into ac1 
 75:    ADD  3,4,3	Op + 
 76:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 77:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 78:    LDA  3,1(7)	Return address in ac 
 79:    JMP  7,-74(7)	CALL output
 80:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL output
 81:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 82:    LDC  3,111(6)	Load integer constant 
 83:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 84:    LDC  3,222(6)	Load integer constant 
 85:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
* CALL dog
 86:     ST  1,-7(1)	Store fp in ghost frame for dog
* TOFF dec: -8
* TOFF dec: -9
* Param 1
 87:    LDC  3,333(6)	Load integer constant 
 88:     ST  3,-9(1)	Push parameter 
* TOFF dec: -10
* Param end dog
 89:    LDA  1,-7(1)	Ghost frame becomes new active frame 
 90:    LDA  3,1(7)	Return address in ac 
 91:    JMP  7,-53(7)	CALL dog
 92:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -7
* TOFF inc: -6
 93:     LD  4,-6(1)	Pop left into ac1 
 94:    MUL  3,4,3	Op * 
* TOFF inc: -5
 95:     LD  4,-5(1)	Pop left into ac1 
 96:    ADD  3,4,3	Op + 
 97:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 98:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 99:    LDA  3,1(7)	Return address in ac 
100:    JMP  7,-95(7)	CALL output
101:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL output
102:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
* CALL dog
103:     ST  1,-5(1)	Store fp in ghost frame for dog
* TOFF dec: -6
* TOFF dec: -7
* Param 1
* CALL dog
104:     ST  1,-7(1)	Store fp in ghost frame for dog
* TOFF dec: -8
* TOFF dec: -9
* Param 1
105:    LDC  3,444(6)	Load integer constant 
106:     ST  3,-9(1)	Push parameter 
* TOFF dec: -10
* Param end dog
107:    LDA  1,-7(1)	Ghost frame becomes new active frame 
108:    LDA  3,1(7)	Return address in ac 
109:    JMP  7,-71(7)	CALL dog
110:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -7
111:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end dog
112:    LDA  1,-5(1)	Ghost frame becomes new active frame 
113:    LDA  3,1(7)	Return address in ac 
114:    JMP  7,-76(7)	CALL dog
115:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -5
116:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
117:    LDA  1,-3(1)	Ghost frame becomes new active frame 
118:    LDA  3,1(7)	Return address in ac 
119:    JMP  7,-114(7)	CALL output
120:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL output
121:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
* CALL dog
122:     ST  1,-5(1)	Store fp in ghost frame for dog
* TOFF dec: -6
* TOFF dec: -7
* Param 1
123:     LD  3,-2(1)	Load variable x
124:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
125:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -7
126:     LD  4,-7(1)	Pop left into ac1 
127:    ADD  3,4,3	Op + 
128:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end dog
129:    LDA  1,-5(1)	Ghost frame becomes new active frame 
130:    LDA  3,1(7)	Return address in ac 
131:    JMP  7,-93(7)	CALL dog
132:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -5
133:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
* CALL dog
134:     ST  1,-6(1)	Store fp in ghost frame for dog
* TOFF dec: -7
* TOFF dec: -8
* Param 1
135:    LDC  3,1(6)	Load integer constant 
136:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
137:     LD  3,-2(1)	Load variable x
* TOFF inc: -8
138:     LD  4,-8(1)	Pop left into ac1 
139:    ADD  3,4,3	Op + 
140:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end dog
141:    LDA  1,-6(1)	Ghost frame becomes new active frame 
142:    LDA  3,1(7)	Return address in ac 
143:    JMP  7,-105(7)	CALL dog
144:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -6
* TOFF inc: -5
145:     LD  4,-5(1)	Pop left into ac1 
146:    ADD  3,4,3	Op + 
147:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
148:    LDA  1,-3(1)	Ghost frame becomes new active frame 
149:    LDA  3,1(7)	Return address in ac 
150:    JMP  7,-145(7)	CALL output
151:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL output
152:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
* CALL dog
153:     ST  1,-5(1)	Store fp in ghost frame for dog
* TOFF dec: -6
* TOFF dec: -7
* Param 1
154:    LDC  3,555(6)	Load integer constant 
155:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
156:    LDC  3,666(6)	Load integer constant 
157:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
158:     LD  3,-2(1)	Load variable x
* TOFF inc: -8
159:     LD  4,-8(1)	Pop left into ac1 
160:    MUL  3,4,3	Op * 
* TOFF inc: -7
161:     LD  4,-7(1)	Pop left into ac1 
162:    ADD  3,4,3	Op + 
163:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end dog
164:    LDA  1,-5(1)	Ghost frame becomes new active frame 
165:    LDA  3,1(7)	Return address in ac 
166:    JMP  7,-128(7)	CALL dog
167:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -5
168:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
169:    LDA  1,-3(1)	Ghost frame becomes new active frame 
170:    LDA  3,1(7)	Return address in ac 
171:    JMP  7,-166(7)	CALL output
172:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* RETURN
173:    LDC  3,555(6)	Load integer constant 
174:    LDA  2,0(3)	Copy result to return register 
175:     LD  3,-1(1)	Load return address 
176:     LD  1,0(1)	Adjust fp 
177:    JMP  7,0(3)	Return 
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
178:    LDC  2,0(6)	Set return value to 0 
179:     LD  3,-1(1)	Load return address 
180:     LD  1,0(1)	Adjust fp 
181:    JMP  7,0(3)	Return 
* END FUNCTION dog
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
182:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -2
* Compound Body
* EXPRESSION
* CALL output
183:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
* CALL dog
184:     ST  1,-4(1)	Store fp in ghost frame for dog
* TOFF dec: -5
* TOFF dec: -6
* Param 1
185:    LDC  3,0(6)	Load integer constant 
186:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end dog
187:    LDA  1,-4(1)	Ghost frame becomes new active frame 
188:    LDA  3,1(7)	Return address in ac 
189:    JMP  7,-151(7)	CALL dog
190:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -4
191:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
192:    LDA  1,-2(1)	Ghost frame becomes new active frame 
193:    LDA  3,1(7)	Return address in ac 
194:    JMP  7,-189(7)	CALL output
195:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
196:    LDC  2,0(6)	Set return value to 0 
197:     LD  3,-1(1)	Load return address 
198:     LD  1,0(1)	Adjust fp 
199:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,199(7)	Jump to init [backpatch] 
* INIT
200:    LDA  1,-2(0)	set first frame at end of globals 
201:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
202:    LDA  3,1(7)	Return address in ac 
203:    JMP  7,-22(7)	Jump to main 
204:   HALT  0,0,0	DONE! 
* END INIT
