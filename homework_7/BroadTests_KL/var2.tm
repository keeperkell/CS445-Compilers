* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  var2.c-
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
* TOFF set: -4
 40:    LDC  3,222(6)	Load integer constant 
 41:     ST  3,-3(1)	Store variable y
* Compound Body
* EXPRESSION
* CALL output
 42:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 43:     LD  3,-2(1)	Load variable x
 44:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
 45:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 46:    LDA  3,1(7)	Return address in ac 
 47:    JMP  7,-42(7)	CALL output
 48:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
* CALL outnl
 49:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
 50:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 51:    LDA  3,1(7)	Return address in ac 
 52:    JMP  7,-19(7)	CALL outnl
 53:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
* EXPRESSION
* CALL output
 54:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 55:     LD  3,-10(0)	Load variable z
 56:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
 57:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 58:    LDA  3,1(7)	Return address in ac 
 59:    JMP  7,-54(7)	CALL output
 60:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
* CALL outnl
 61:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
 62:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 63:    LDA  3,1(7)	Return address in ac 
 64:    JMP  7,-31(7)	CALL outnl
 65:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
* EXPRESSION
 66:     LD  3,-3(1)	Load variable y
 67:     ST  3,-2(1)	Store variable x
* EXPRESSION
 68:     LD  3,0(0)	Load variable g
 69:     ST  3,-10(0)	Store variable z
* EXPRESSION
* CALL output
 70:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 71:     LD  3,-2(1)	Load variable x
 72:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
 73:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 74:    LDA  3,1(7)	Return address in ac 
 75:    JMP  7,-70(7)	CALL output
 76:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
* CALL outnl
 77:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
 78:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 79:    LDA  3,1(7)	Return address in ac 
 80:    JMP  7,-47(7)	CALL outnl
 81:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
* EXPRESSION
* CALL output
 82:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 83:     LD  3,-10(0)	Load variable z
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
* RETURN
 94:     LD  3,-10(0)	Load variable z
 95:    LDA  2,0(3)	Copy result to return register 
 96:     LD  3,-1(1)	Load return address 
 97:     LD  1,0(1)	Adjust fp 
 98:    JMP  7,0(3)	Return 
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
 99:    LDC  2,0(6)	Set return value to 0 
100:     LD  3,-1(1)	Load return address 
101:     LD  1,0(1)	Adjust fp 
102:    JMP  7,0(3)	Return 
* END FUNCTION dog
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
103:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
104:    LDC  3,444(6)	Load integer constant 
105:     ST  3,-2(1)	Store variable m
* Compound Body
* EXPRESSION
* CALL output
106:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
107:    LDA  3,-2(0)	Load address of base of array h
108:     LD  3,1(3)	Load array size 
109:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
110:    LDA  1,-3(1)	Ghost frame becomes new active frame 
111:    LDA  3,1(7)	Return address in ac 
112:    JMP  7,-107(7)	CALL output
113:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL output
114:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
115:     LD  3,0(0)	Load variable g
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
122:     LD  3,-2(1)	Load variable m
123:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
124:    LDA  1,-3(1)	Ghost frame becomes new active frame 
125:    LDA  3,1(7)	Return address in ac 
126:    JMP  7,-121(7)	CALL output
127:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL output
128:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
129:     LD  3,-11(0)	Load variable z
130:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
131:    LDA  1,-3(1)	Ghost frame becomes new active frame 
132:    LDA  3,1(7)	Return address in ac 
133:    JMP  7,-128(7)	CALL output
134:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL outnl
135:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
136:    LDA  1,-3(1)	Ghost frame becomes new active frame 
137:    LDA  3,1(7)	Return address in ac 
138:    JMP  7,-105(7)	CALL outnl
139:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* EXPRESSION
* CALL dog
140:     ST  1,-3(1)	Store fp in ghost frame for dog
* TOFF dec: -4
* TOFF dec: -5
* Param 1
141:     LD  3,-2(1)	Load variable m
142:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end dog
143:    LDA  1,-3(1)	Ghost frame becomes new active frame 
144:    LDA  3,1(7)	Return address in ac 
145:    JMP  7,-107(7)	CALL dog
146:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -3
* EXPRESSION
* CALL output
147:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
148:     LD  3,-11(0)	Load variable z
149:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
150:    LDA  1,-3(1)	Ghost frame becomes new active frame 
151:    LDA  3,1(7)	Return address in ac 
152:    JMP  7,-147(7)	CALL output
153:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL outnl
154:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
155:    LDA  1,-3(1)	Ghost frame becomes new active frame 
156:    LDA  3,1(7)	Return address in ac 
157:    JMP  7,-124(7)	CALL outnl
158:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
159:    LDC  2,0(6)	Set return value to 0 
160:     LD  3,-1(1)	Load return address 
161:     LD  1,0(1)	Adjust fp 
162:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,162(7)	Jump to init [backpatch] 
* INIT
163:    LDA  1,-12(0)	set first frame at end of globals 
164:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
165:    LDC  3,111(6)	Load integer constant 
166:     ST  3,-2(1)	Push left side 
* TOFF dec: -3
167:    LDC  3,22(6)	Load integer constant 
168:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
169:    LDC  3,33(6)	Load integer constant 
* TOFF inc: -3
170:     LD  4,-3(1)	Pop left into ac1 
171:    MUL  3,4,3	Op * 
* TOFF inc: -2
172:     LD  4,-2(1)	Pop left into ac1 
173:    ADD  3,4,3	Op + 
174:     ST  3,0(0)	Store variable g
175:    LDC  3,8(6)	load size of array h
176:     ST  3,-1(0)	save size of array h
177:    LDC  3,333(6)	Load integer constant 
178:     ST  3,-10(0)	Store variable z
179:    LDC  3,555(6)	Load integer constant 
180:     ST  3,-11(0)	Store variable z
* END INIT GLOBALS AND STATICS
181:    LDA  3,1(7)	Return address in ac 
182:    JMP  7,-80(7)	Jump to main 
183:   HALT  0,0,0	DONE! 
* END INIT
