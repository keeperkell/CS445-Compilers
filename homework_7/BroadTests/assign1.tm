* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  assign1.c-
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
 40:    LDC  3,111(6)	Load integer constant 
 41:     ST  3,-2(1)	Store variable x
* EXPRESSION
* CALL output
 42:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
 43:     LD  3,-2(1)	Load variable x
 44:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
 45:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 46:    LDA  3,1(7)	Return address in ac 
 47:    JMP  7,-42(7)	CALL output
 48:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
 49:    LDC  3,222(6)	Load integer constant 
 50:     ST  3,-3(1)	Store variable y
* EXPRESSION
* CALL output
 51:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
 52:     LD  3,-3(1)	Load variable y
 53:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
 54:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 55:    LDA  3,1(7)	Return address in ac 
 56:    JMP  7,-51(7)	CALL output
 57:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
 58:    LDC  3,1(6)	Load Boolean constant 
 59:     ST  3,-4(1)	Store variable a
* EXPRESSION
* CALL outputb
 60:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
 61:     LD  3,-4(1)	Load variable a
 62:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
 63:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 64:    LDA  3,1(7)	Return address in ac 
 65:    JMP  7,-49(7)	CALL outputb
 66:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
 67:    LDC  3,0(6)	Load Boolean constant 
 68:     ST  3,-5(1)	Store variable b
* EXPRESSION
* CALL outputb
 69:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
 70:     LD  3,-5(1)	Load variable b
 71:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
 72:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 73:    LDA  3,1(7)	Return address in ac 
 74:    JMP  7,-58(7)	CALL outputb
 75:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outnl
 76:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
 77:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 78:    LDA  3,1(7)	Return address in ac 
 79:    JMP  7,-46(7)	CALL outnl
 80:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
 81:    LDC  3,333(6)	Load integer constant 
 82:     ST  3,0(0)	Store variable gx
* EXPRESSION
* CALL output
 83:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
 84:     LD  3,0(0)	Load variable gx
 85:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
 86:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 87:    LDA  3,1(7)	Return address in ac 
 88:    JMP  7,-83(7)	CALL output
 89:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
 90:    LDC  3,444(6)	Load integer constant 
 91:     ST  3,-1(0)	Store variable gy
* EXPRESSION
* CALL output
 92:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
 93:     LD  3,-1(0)	Load variable gy
 94:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
 95:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 96:    LDA  3,1(7)	Return address in ac 
 97:    JMP  7,-92(7)	CALL output
 98:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
 99:    LDC  3,0(6)	Load Boolean constant 
100:     ST  3,-2(0)	Store variable ga
* EXPRESSION
* CALL outputb
101:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
102:     LD  3,-2(0)	Load variable ga
103:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
104:    LDA  1,-6(1)	Ghost frame becomes new active frame 
105:    LDA  3,1(7)	Return address in ac 
106:    JMP  7,-90(7)	CALL outputb
107:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
108:    LDC  3,1(6)	Load Boolean constant 
109:     ST  3,-3(0)	Store variable gb
* EXPRESSION
* CALL outputb
110:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
111:     LD  3,-3(0)	Load variable gb
112:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
113:    LDA  1,-6(1)	Ghost frame becomes new active frame 
114:    LDA  3,1(7)	Return address in ac 
115:    JMP  7,-99(7)	CALL outputb
116:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outnl
117:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
118:    LDA  1,-6(1)	Ghost frame becomes new active frame 
119:    LDA  3,1(7)	Return address in ac 
120:    JMP  7,-87(7)	CALL outnl
121:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
122:     LD  3,-3(1)	Load variable y
123:     ST  3,-2(1)	Store variable x
* EXPRESSION
* CALL output
124:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
125:     LD  3,-2(1)	Load variable x
126:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
127:    LDA  1,-6(1)	Ghost frame becomes new active frame 
128:    LDA  3,1(7)	Return address in ac 
129:    JMP  7,-124(7)	CALL output
130:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
131:     LD  3,-5(1)	Load variable b
132:     ST  3,-4(1)	Store variable a
* EXPRESSION
* CALL outputb
133:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
134:     LD  3,-4(1)	Load variable a
135:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
136:    LDA  1,-6(1)	Ghost frame becomes new active frame 
137:    LDA  3,1(7)	Return address in ac 
138:    JMP  7,-122(7)	CALL outputb
139:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outnl
140:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
141:    LDA  1,-6(1)	Ghost frame becomes new active frame 
142:    LDA  3,1(7)	Return address in ac 
143:    JMP  7,-110(7)	CALL outnl
144:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
145:     LD  3,-1(0)	Load variable gy
146:     ST  3,0(0)	Store variable gx
* EXPRESSION
* CALL output
147:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
148:     LD  3,0(0)	Load variable gx
149:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
150:    LDA  1,-6(1)	Ghost frame becomes new active frame 
151:    LDA  3,1(7)	Return address in ac 
152:    JMP  7,-147(7)	CALL output
153:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
154:     LD  3,-3(0)	Load variable gb
155:     ST  3,-2(0)	Store variable ga
* EXPRESSION
* CALL outputb
156:     ST  1,-6(1)	Store fp in ghost frame for outputb
* TOFF dec: -7
* TOFF dec: -8
* Param 1
157:     LD  3,-2(0)	Load variable ga
158:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputb
159:    LDA  1,-6(1)	Ghost frame becomes new active frame 
160:    LDA  3,1(7)	Return address in ac 
161:    JMP  7,-145(7)	CALL outputb
162:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -6
* EXPRESSION
* CALL outnl
163:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
164:    LDA  1,-6(1)	Ghost frame becomes new active frame 
165:    LDA  3,1(7)	Return address in ac 
166:    JMP  7,-133(7)	CALL outnl
167:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* RETURN
168:     LD  3,-1(1)	Load return address 
169:     LD  1,0(1)	Adjust fp 
170:    JMP  7,0(3)	Return 
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
171:    LDC  2,0(6)	Set return value to 0 
172:     LD  3,-1(1)	Load return address 
173:     LD  1,0(1)	Adjust fp 
174:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,174(7)	Jump to init [backpatch] 
* INIT
175:    LDA  1,-4(0)	set first frame at end of globals 
176:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
177:    LDA  3,1(7)	Return address in ac 
178:    JMP  7,-140(7)	Jump to main 
179:   HALT  0,0,0	DONE! 
* END INIT
