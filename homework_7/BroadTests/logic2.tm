* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  logic2.c-
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
* CALL outputb
 40:     ST  1,-4(1)	Store fp in ghost frame for outputb
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 41:    LDC  3,1(6)	Load Boolean constant 
 42:     ST  3,-2(1)	Store variable a
 43:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end outputb
 44:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 45:    LDA  3,1(7)	Return address in ac 
 46:    JMP  7,-30(7)	CALL outputb
 47:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -4
* EXPRESSION
* CALL outputb
 48:     ST  1,-4(1)	Store fp in ghost frame for outputb
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 49:    LDC  3,0(6)	Load Boolean constant 
 50:     ST  3,-3(1)	Store variable b
 51:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end outputb
 52:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 53:    LDA  3,1(7)	Return address in ac 
 54:    JMP  7,-38(7)	CALL outputb
 55:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -4
* EXPRESSION
* CALL outnl
 56:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
 57:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 58:    LDA  3,1(7)	Return address in ac 
 59:    JMP  7,-26(7)	CALL outnl
 60:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
* EXPRESSION
* CALL outputb
 61:     ST  1,-4(1)	Store fp in ghost frame for outputb
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 62:     LD  3,-2(1)	Load variable a
 63:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
 64:     LD  3,-3(1)	Load variable b
* TOFF inc: -6
 65:     LD  4,-6(1)	Pop left into ac1 
 66:    AND  3,4,3	Op AND 
 67:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end outputb
 68:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 69:    LDA  3,1(7)	Return address in ac 
 70:    JMP  7,-54(7)	CALL outputb
 71:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -4
* EXPRESSION
* CALL outputb
 72:     ST  1,-4(1)	Store fp in ghost frame for outputb
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 73:     LD  3,-2(1)	Load variable a
 74:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
 75:     LD  3,-3(1)	Load variable b
* TOFF inc: -6
 76:     LD  4,-6(1)	Pop left into ac1 
 77:     OR  3,4,3	Op OR 
 78:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end outputb
 79:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 80:    LDA  3,1(7)	Return address in ac 
 81:    JMP  7,-65(7)	CALL outputb
 82:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -4
* EXPRESSION
* CALL outputb
 83:     ST  1,-4(1)	Store fp in ghost frame for outputb
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 84:     LD  3,-2(1)	Load variable a
 85:    LDC  4,1(6)	Load 1 
 86:    XOR  3,3,4	Op XOR to get logical not 
 87:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end outputb
 88:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 89:    LDA  3,1(7)	Return address in ac 
 90:    JMP  7,-74(7)	CALL outputb
 91:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -4
* EXPRESSION
* CALL outnl
 92:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
 93:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 94:    LDA  3,1(7)	Return address in ac 
 95:    JMP  7,-62(7)	CALL outnl
 96:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
* EXPRESSION
* CALL outputb
 97:     ST  1,-4(1)	Store fp in ghost frame for outputb
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 98:    LDC  3,111(6)	Load integer constant 
 99:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
100:    LDC  3,222(6)	Load integer constant 
* TOFF inc: -6
101:     LD  4,-6(1)	Pop left into ac1 
102:    TGT  3,4,3	Op > 
103:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end outputb
104:    LDA  1,-4(1)	Ghost frame becomes new active frame 
105:    LDA  3,1(7)	Return address in ac 
106:    JMP  7,-90(7)	CALL outputb
107:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -4
* EXPRESSION
* CALL outputb
108:     ST  1,-4(1)	Store fp in ghost frame for outputb
* TOFF dec: -5
* TOFF dec: -6
* Param 1
109:    LDC  3,111(6)	Load integer constant 
110:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
111:    LDC  3,222(6)	Load integer constant 
* TOFF inc: -6
112:     LD  4,-6(1)	Pop left into ac1 
113:    TLT  3,4,3	Op < 
114:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end outputb
115:    LDA  1,-4(1)	Ghost frame becomes new active frame 
116:    LDA  3,1(7)	Return address in ac 
117:    JMP  7,-101(7)	CALL outputb
118:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -4
* EXPRESSION
* CALL outputb
119:     ST  1,-4(1)	Store fp in ghost frame for outputb
* TOFF dec: -5
* TOFF dec: -6
* Param 1
120:    LDC  3,111(6)	Load integer constant 
121:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
122:    LDC  3,222(6)	Load integer constant 
* TOFF inc: -6
123:     LD  4,-6(1)	Pop left into ac1 
124:    TEQ  3,4,3	Op = 
125:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end outputb
126:    LDA  1,-4(1)	Ghost frame becomes new active frame 
127:    LDA  3,1(7)	Return address in ac 
128:    JMP  7,-112(7)	CALL outputb
129:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -4
* EXPRESSION
* CALL outputb
130:     ST  1,-4(1)	Store fp in ghost frame for outputb
* TOFF dec: -5
* TOFF dec: -6
* Param 1
131:    LDC  3,111(6)	Load integer constant 
132:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
133:    LDC  3,222(6)	Load integer constant 
* TOFF inc: -6
134:     LD  4,-6(1)	Pop left into ac1 
135:    TGE  3,4,3	Op >= 
136:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end outputb
137:    LDA  1,-4(1)	Ghost frame becomes new active frame 
138:    LDA  3,1(7)	Return address in ac 
139:    JMP  7,-123(7)	CALL outputb
140:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -4
* EXPRESSION
* CALL outputb
141:     ST  1,-4(1)	Store fp in ghost frame for outputb
* TOFF dec: -5
* TOFF dec: -6
* Param 1
142:    LDC  3,111(6)	Load integer constant 
143:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
144:    LDC  3,222(6)	Load integer constant 
* TOFF inc: -6
145:     LD  4,-6(1)	Pop left into ac1 
146:    TLE  3,4,3	Op <= 
147:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end outputb
148:    LDA  1,-4(1)	Ghost frame becomes new active frame 
149:    LDA  3,1(7)	Return address in ac 
150:    JMP  7,-134(7)	CALL outputb
151:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -4
* EXPRESSION
* CALL outputb
152:     ST  1,-4(1)	Store fp in ghost frame for outputb
* TOFF dec: -5
* TOFF dec: -6
* Param 1
153:    LDC  3,111(6)	Load integer constant 
154:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
155:    LDC  3,222(6)	Load integer constant 
* TOFF inc: -6
156:     LD  4,-6(1)	Pop left into ac1 
157:    TNE  3,4,3	Op >< 
158:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end outputb
159:    LDA  1,-4(1)	Ghost frame becomes new active frame 
160:    LDA  3,1(7)	Return address in ac 
161:    JMP  7,-145(7)	CALL outputb
162:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -4
* EXPRESSION
* CALL outnl
163:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
164:    LDA  1,-4(1)	Ghost frame becomes new active frame 
165:    LDA  3,1(7)	Return address in ac 
166:    JMP  7,-133(7)	CALL outnl
167:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
168:    LDC  2,0(6)	Set return value to 0 
169:     LD  3,-1(1)	Load return address 
170:     LD  1,0(1)	Adjust fp 
171:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,171(7)	Jump to init [backpatch] 
* INIT
172:    LDA  1,0(0)	set first frame at end of globals 
173:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
174:    LDA  3,1(7)	Return address in ac 
175:    JMP  7,-137(7)	Jump to main 
176:   HALT  0,0,0	DONE! 
* END INIT
