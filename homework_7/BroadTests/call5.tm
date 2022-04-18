* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  call5.c-
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
* EXPRESSION
 40:    LDC  3,2(6)	Load integer constant 
 41:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 42:     LD  3,-2(1)	Load variable x
* TOFF inc: -3
 43:     LD  4,-3(1)	Pop left into ac1 
 44:    MUL  3,4,3	Op * 
 45:     ST  3,0(0)	Store variable g
* RETURN
 46:     LD  3,-2(1)	Load variable x
 47:    LDA  2,0(3)	Copy result to return register 
 48:     LD  3,-1(1)	Load return address 
 49:     LD  1,0(1)	Adjust fp 
 50:    JMP  7,0(3)	Return 
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
 51:    LDC  2,0(6)	Set return value to 0 
 52:     LD  3,-1(1)	Load return address 
 53:     LD  1,0(1)	Adjust fp 
 54:    JMP  7,0(3)	Return 
* END FUNCTION dog
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION cat
* TOFF set: -3
 55:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
 56:    LDC  3,3(6)	Load integer constant 
 57:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 58:     LD  3,-2(1)	Load variable x
* TOFF inc: -3
 59:     LD  4,-3(1)	Pop left into ac1 
 60:    MUL  3,4,3	Op * 
 61:     ST  3,0(0)	Store variable g
* RETURN
 62:     LD  3,-1(1)	Load return address 
 63:     LD  1,0(1)	Adjust fp 
 64:    JMP  7,0(3)	Return 
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
 65:    LDC  2,0(6)	Set return value to 0 
 66:     LD  3,-1(1)	Load return address 
 67:     LD  1,0(1)	Adjust fp 
 68:    JMP  7,0(3)	Return 
* END FUNCTION cat
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION elk
* TOFF set: -3
 69:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
 70:    LDC  3,4(6)	Load integer constant 
 71:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 72:     LD  3,-2(1)	Load variable x
* TOFF inc: -3
 73:     LD  4,-3(1)	Pop left into ac1 
 74:    MUL  3,4,3	Op * 
 75:     ST  3,0(0)	Store variable g
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
 76:    LDC  2,0(6)	Set return value to 0 
 77:     LD  3,-1(1)	Load return address 
 78:     LD  1,0(1)	Adjust fp 
 79:    JMP  7,0(3)	Return 
* END FUNCTION elk
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION fox
* TOFF set: -3
 80:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
 81:    LDC  3,5(6)	Load integer constant 
 82:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 83:     LD  3,-2(1)	Load variable x
* TOFF inc: -3
 84:     LD  4,-3(1)	Pop left into ac1 
 85:    MUL  3,4,3	Op * 
 86:     ST  3,0(0)	Store variable g
* RETURN
 87:     LD  3,0(0)	Load variable g
 88:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 89:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -3
 90:     LD  4,-3(1)	Pop left into ac1 
 91:    ADD  3,4,3	Op + 
 92:    LDA  2,0(3)	Copy result to return register 
 93:     LD  3,-1(1)	Load return address 
 94:     LD  1,0(1)	Adjust fp 
 95:    JMP  7,0(3)	Return 
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
 96:    LDC  2,0(6)	Set return value to 0 
 97:     LD  3,-1(1)	Load return address 
 98:     LD  1,0(1)	Adjust fp 
 99:    JMP  7,0(3)	Return 
* END FUNCTION fox
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
100:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -2
* Compound Body
* EXPRESSION
101:    LDC  3,1279(6)	Load integer constant 
102:     ST  3,0(0)	Store variable g
* EXPRESSION
* CALL output
103:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
104:     LD  3,0(0)	Load variable g
105:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
106:    LDA  1,-2(1)	Ghost frame becomes new active frame 
107:    LDA  3,1(7)	Return address in ac 
108:    JMP  7,-103(7)	CALL output
109:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL output
110:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
* CALL dog
111:     ST  1,-4(1)	Store fp in ghost frame for dog
* TOFF dec: -5
* TOFF dec: -6
* Param 1
112:    LDC  3,111(6)	Load integer constant 
113:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end dog
114:    LDA  1,-4(1)	Ghost frame becomes new active frame 
115:    LDA  3,1(7)	Return address in ac 
116:    JMP  7,-78(7)	CALL dog
117:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -4
118:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
119:    LDA  1,-2(1)	Ghost frame becomes new active frame 
120:    LDA  3,1(7)	Return address in ac 
121:    JMP  7,-116(7)	CALL output
122:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL output
123:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
124:     LD  3,0(0)	Load variable g
125:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
126:    LDA  1,-2(1)	Ghost frame becomes new active frame 
127:    LDA  3,1(7)	Return address in ac 
128:    JMP  7,-123(7)	CALL output
129:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL cat
130:     ST  1,-2(1)	Store fp in ghost frame for cat
* TOFF dec: -3
* TOFF dec: -4
* Param 1
131:    LDC  3,222(6)	Load integer constant 
132:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end cat
133:    LDA  1,-2(1)	Ghost frame becomes new active frame 
134:    LDA  3,1(7)	Return address in ac 
135:    JMP  7,-81(7)	CALL cat
136:    LDA  3,0(2)	Save the result in ac 
* Call end cat
* TOFF set: -2
* EXPRESSION
* CALL output
137:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
138:     LD  3,0(0)	Load variable g
139:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
140:    LDA  1,-2(1)	Ghost frame becomes new active frame 
141:    LDA  3,1(7)	Return address in ac 
142:    JMP  7,-137(7)	CALL output
143:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL elk
144:     ST  1,-2(1)	Store fp in ghost frame for elk
* TOFF dec: -3
* TOFF dec: -4
* Param 1
145:    LDC  3,333(6)	Load integer constant 
146:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end elk
147:    LDA  1,-2(1)	Ghost frame becomes new active frame 
148:    LDA  3,1(7)	Return address in ac 
149:    JMP  7,-81(7)	CALL elk
150:    LDA  3,0(2)	Save the result in ac 
* Call end elk
* TOFF set: -2
* EXPRESSION
* CALL output
151:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
152:     LD  3,0(0)	Load variable g
153:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
154:    LDA  1,-2(1)	Ghost frame becomes new active frame 
155:    LDA  3,1(7)	Return address in ac 
156:    JMP  7,-151(7)	CALL output
157:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL output
158:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
* CALL fox
159:     ST  1,-4(1)	Store fp in ghost frame for fox
* TOFF dec: -5
* TOFF dec: -6
* Param 1
160:    LDC  3,444(6)	Load integer constant 
161:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end fox
162:    LDA  1,-4(1)	Ghost frame becomes new active frame 
163:    LDA  3,1(7)	Return address in ac 
164:    JMP  7,-85(7)	CALL fox
165:    LDA  3,0(2)	Save the result in ac 
* Call end fox
* TOFF set: -4
166:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
167:    LDA  1,-2(1)	Ghost frame becomes new active frame 
168:    LDA  3,1(7)	Return address in ac 
169:    JMP  7,-164(7)	CALL output
170:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL output
171:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
172:     LD  3,0(0)	Load variable g
173:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
174:    LDA  1,-2(1)	Ghost frame becomes new active frame 
175:    LDA  3,1(7)	Return address in ac 
176:    JMP  7,-171(7)	CALL output
177:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL outnl
178:     ST  1,-2(1)	Store fp in ghost frame for outnl
* TOFF dec: -3
* TOFF dec: -4
* Param end outnl
179:    LDA  1,-2(1)	Ghost frame becomes new active frame 
180:    LDA  3,1(7)	Return address in ac 
181:    JMP  7,-148(7)	CALL outnl
182:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -2
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
183:    LDC  2,0(6)	Set return value to 0 
184:     LD  3,-1(1)	Load return address 
185:     LD  1,0(1)	Adjust fp 
186:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,186(7)	Jump to init [backpatch] 
* INIT
187:    LDA  1,-1(0)	set first frame at end of globals 
188:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
189:    LDA  3,1(7)	Return address in ac 
190:    JMP  7,-91(7)	Jump to main 
191:   HALT  0,0,0	DONE! 
* END INIT
