* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  e.c-
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
* TOFF set: -2
* Compound Body
* EXPRESSION
* CALL output
 40:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 41:    LDC  3,111(6)	Load integer constant 
 42:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 43:    LDC  3,222(6)	Load integer constant 
 44:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 45:    LDC  3,333(6)	Load integer constant 
 46:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
 47:    LDC  3,444(6)	Load integer constant 
* TOFF inc: -6
 48:     LD  4,-6(1)	Pop left into ac1 
 49:    ADD  3,4,3	Op + 
* TOFF inc: -5
 50:     LD  4,-5(1)	Pop left into ac1 
 51:    ADD  3,4,3	Op + 
* TOFF inc: -4
 52:     LD  4,-4(1)	Pop left into ac1 
 53:    ADD  3,4,3	Op + 
 54:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
 55:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 56:    LDA  3,1(7)	Return address in ac 
 57:    JMP  7,-52(7)	CALL output
 58:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL outnl
 59:     ST  1,-2(1)	Store fp in ghost frame for outnl
* TOFF dec: -3
* TOFF dec: -4
* Param end outnl
 60:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 61:    LDA  3,1(7)	Return address in ac 
 62:    JMP  7,-29(7)	CALL outnl
 63:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -2
* EXPRESSION
* CALL output
 64:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 65:    LDC  3,111(6)	Load integer constant 
 66:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 67:    LDC  3,222(6)	Load integer constant 
* TOFF inc: -4
 68:     LD  4,-4(1)	Pop left into ac1 
 69:    ADD  3,4,3	Op + 
 70:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 71:    LDC  3,333(6)	Load integer constant 
* TOFF inc: -4
 72:     LD  4,-4(1)	Pop left into ac1 
 73:    ADD  3,4,3	Op + 
 74:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 75:    LDC  3,444(6)	Load integer constant 
* TOFF inc: -4
 76:     LD  4,-4(1)	Pop left into ac1 
 77:    ADD  3,4,3	Op + 
 78:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
 79:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 80:    LDA  3,1(7)	Return address in ac 
 81:    JMP  7,-76(7)	CALL output
 82:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL outnl
 83:     ST  1,-2(1)	Store fp in ghost frame for outnl
* TOFF dec: -3
* TOFF dec: -4
* Param end outnl
 84:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 85:    LDA  3,1(7)	Return address in ac 
 86:    JMP  7,-53(7)	CALL outnl
 87:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -2
* EXPRESSION
* CALL output
 88:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 89:    LDC  3,111(6)	Load integer constant 
 90:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 91:    LDC  3,222(6)	Load integer constant 
 92:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 93:    LDC  3,333(6)	Load integer constant 
 94:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
 95:    LDC  3,444(6)	Load integer constant 
* TOFF inc: -6
 96:     LD  4,-6(1)	Pop left into ac1 
 97:    SUB  3,4,3	Op - 
* TOFF inc: -5
 98:     LD  4,-5(1)	Pop left into ac1 
 99:    SUB  3,4,3	Op - 
* TOFF inc: -4
100:     LD  4,-4(1)	Pop left into ac1 
101:    SUB  3,4,3	Op - 
102:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
103:    LDA  1,-2(1)	Ghost frame becomes new active frame 
104:    LDA  3,1(7)	Return address in ac 
105:    JMP  7,-100(7)	CALL output
106:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL outnl
107:     ST  1,-2(1)	Store fp in ghost frame for outnl
* TOFF dec: -3
* TOFF dec: -4
* Param end outnl
108:    LDA  1,-2(1)	Ghost frame becomes new active frame 
109:    LDA  3,1(7)	Return address in ac 
110:    JMP  7,-77(7)	CALL outnl
111:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -2
* EXPRESSION
* CALL output
112:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
113:    LDC  3,111(6)	Load integer constant 
114:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
115:    LDC  3,222(6)	Load integer constant 
* TOFF inc: -4
116:     LD  4,-4(1)	Pop left into ac1 
117:    SUB  3,4,3	Op - 
118:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
119:    LDC  3,333(6)	Load integer constant 
* TOFF inc: -4
120:     LD  4,-4(1)	Pop left into ac1 
121:    SUB  3,4,3	Op - 
122:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
123:    LDC  3,444(6)	Load integer constant 
* TOFF inc: -4
124:     LD  4,-4(1)	Pop left into ac1 
125:    SUB  3,4,3	Op - 
126:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
127:    LDA  1,-2(1)	Ghost frame becomes new active frame 
128:    LDA  3,1(7)	Return address in ac 
129:    JMP  7,-124(7)	CALL output
130:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL outnl
131:     ST  1,-2(1)	Store fp in ghost frame for outnl
* TOFF dec: -3
* TOFF dec: -4
* Param end outnl
132:    LDA  1,-2(1)	Ghost frame becomes new active frame 
133:    LDA  3,1(7)	Return address in ac 
134:    JMP  7,-101(7)	CALL outnl
135:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -2
* EXPRESSION
* CALL output
136:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
137:    LDC  3,111(6)	Load integer constant 
138:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
139:    LDC  3,222(6)	Load integer constant 
* TOFF inc: -4
140:     LD  4,-4(1)	Pop left into ac1 
141:    SUB  3,4,3	Op - 
142:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
143:    LDC  3,333(6)	Load integer constant 
* TOFF inc: -4
144:     LD  4,-4(1)	Pop left into ac1 
145:    SUB  3,4,3	Op - 
146:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
147:    LDC  3,444(6)	Load integer constant 
* TOFF inc: -4
148:     LD  4,-4(1)	Pop left into ac1 
149:    SUB  3,4,3	Op - 
150:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
151:    LDA  1,-2(1)	Ghost frame becomes new active frame 
152:    LDA  3,1(7)	Return address in ac 
153:    JMP  7,-148(7)	CALL output
154:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL outnl
155:     ST  1,-2(1)	Store fp in ghost frame for outnl
* TOFF dec: -3
* TOFF dec: -4
* Param end outnl
156:    LDA  1,-2(1)	Ghost frame becomes new active frame 
157:    LDA  3,1(7)	Return address in ac 
158:    JMP  7,-125(7)	CALL outnl
159:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -2
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
160:    LDC  2,0(6)	Set return value to 0 
161:     LD  3,-1(1)	Load return address 
162:     LD  1,0(1)	Adjust fp 
163:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,163(7)	Jump to init [backpatch] 
* INIT
164:    LDA  1,0(0)	set first frame at end of globals 
165:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
166:    LDA  3,1(7)	Return address in ac 
167:    JMP  7,-129(7)	Jump to main 
168:   HALT  0,0,0	DONE! 
* END INIT
