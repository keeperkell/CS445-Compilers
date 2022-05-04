* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  d03.c-
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
 40:    LDC  3,755(6)	Load integer constant 
 41:     ST  3,-2(1)	Store variable x
* EXPRESSION
 42:    LDC  3,88(6)	Load integer constant 
 43:     ST  3,-3(1)	Store variable y
* EXPRESSION
 44:    LDC  3,3(6)	Load integer constant 
 45:     ST  3,-4(1)	Store variable z
* EXPRESSION
* CALL output
 46:     ST  1,-5(1)	Store fp in ghost frame for output
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
 53:    MUL  3,4,3	Op * 
* TOFF inc: -7
 54:     LD  4,-7(1)	Pop left into ac1 
 55:    ADD  3,4,3	Op + 
 56:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
 57:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 58:    LDA  3,1(7)	Return address in ac 
 59:    JMP  7,-54(7)	CALL output
 60:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
 61:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 62:     LD  3,-2(1)	Load variable x
 63:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
 64:     LD  3,-3(1)	Load variable y
* TOFF inc: -7
 65:     LD  4,-7(1)	Pop left into ac1 
 66:    MUL  3,4,3	Op * 
 67:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
 68:     LD  3,-4(1)	Load variable z
* TOFF inc: -7
 69:     LD  4,-7(1)	Pop left into ac1 
 70:    ADD  3,4,3	Op + 
 71:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
 72:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 73:    LDA  3,1(7)	Return address in ac 
 74:    JMP  7,-69(7)	CALL output
 75:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
 76:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 77:     LD  3,-2(1)	Load variable x
 78:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
 79:     LD  3,-3(1)	Load variable y
* TOFF inc: -7
 80:     LD  4,-7(1)	Pop left into ac1 
 81:    SUB  3,4,3	Op - 
 82:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
 83:     LD  3,-4(1)	Load variable z
* TOFF inc: -7
 84:     LD  4,-7(1)	Pop left into ac1 
 85:    SUB  3,4,3	Op - 
 86:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
 87:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 88:    LDA  3,1(7)	Return address in ac 
 89:    JMP  7,-84(7)	CALL output
 90:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
 91:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 92:     LD  3,-2(1)	Load variable x
 93:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
 94:     LD  3,-3(1)	Load variable y
* TOFF inc: -7
 95:     LD  4,-7(1)	Pop left into ac1 
 96:    DIV  3,4,3	Op / 
 97:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
 98:     LD  3,-4(1)	Load variable z
* TOFF inc: -7
 99:     LD  4,-7(1)	Pop left into ac1 
100:    DIV  3,4,3	Op / 
101:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
102:    LDA  1,-5(1)	Ghost frame becomes new active frame 
103:    LDA  3,1(7)	Return address in ac 
104:    JMP  7,-99(7)	CALL output
105:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
106:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
107:     LD  3,-2(1)	Load variable x
108:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
109:     LD  3,-3(1)	Load variable y
* TOFF inc: -7
110:     LD  4,-7(1)	Pop left into ac1 
111:    MUL  3,4,3	Op * 
112:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
113:     LD  3,-4(1)	Load variable z
114:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
115:     LD  3,-4(1)	Load variable z
* TOFF inc: -8
116:     LD  4,-8(1)	Pop left into ac1 
117:    MUL  3,4,3	Op * 
* TOFF inc: -7
118:     LD  4,-7(1)	Pop left into ac1 
119:    ADD  3,4,3	Op + 
120:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
121:    LDA  1,-5(1)	Ghost frame becomes new active frame 
122:    LDA  3,1(7)	Return address in ac 
123:    JMP  7,-118(7)	CALL output
124:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
125:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
126:     LD  3,-2(1)	Load variable x
127:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
128:     LD  3,-3(1)	Load variable y
* TOFF inc: -7
129:     LD  4,-7(1)	Pop left into ac1 
130:    MOD  3,4,3	Op % 
131:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
132:     LD  3,-4(1)	Load variable z
* TOFF inc: -7
133:     LD  4,-7(1)	Pop left into ac1 
134:    MOD  3,4,3	Op % 
135:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
136:    LDA  1,-5(1)	Ghost frame becomes new active frame 
137:    LDA  3,1(7)	Return address in ac 
138:    JMP  7,-133(7)	CALL output
139:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL output
140:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
141:     LD  3,-2(1)	Load variable x
142:    NEG  3,3,3	Op unary - 
143:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
144:     LD  3,-3(1)	Load variable y
145:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
146:     LD  3,-4(1)	Load variable z
* TOFF inc: -8
147:     LD  4,-8(1)	Pop left into ac1 
148:    MUL  3,4,3	Op * 
* TOFF inc: -7
149:     LD  4,-7(1)	Pop left into ac1 
150:    ADD  3,4,3	Op + 
151:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
152:    LDA  1,-5(1)	Ghost frame becomes new active frame 
153:    LDA  3,1(7)	Return address in ac 
154:    JMP  7,-149(7)	CALL output
155:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
* CALL outnl
156:     ST  1,-5(1)	Store fp in ghost frame for outnl
* TOFF dec: -6
* TOFF dec: -7
* Param end outnl
157:    LDA  1,-5(1)	Ghost frame becomes new active frame 
158:    LDA  3,1(7)	Return address in ac 
159:    JMP  7,-126(7)	CALL outnl
160:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -5
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
161:    LDC  2,0(6)	Set return value to 0 
162:     LD  3,-1(1)	Load return address 
163:     LD  1,0(1)	Adjust fp 
164:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,164(7)	Jump to init [backpatch] 
* INIT
165:    LDA  1,0(0)	set first frame at end of globals 
166:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
167:    LDA  3,1(7)	Return address in ac 
168:    JMP  7,-130(7)	Jump to main 
169:   HALT  0,0,0	DONE! 
* END INIT
