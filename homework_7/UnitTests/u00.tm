* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  u00.c-
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
* IF
 40:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
* CALL output
 42:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 43:    LDC  3,101(6)	Load integer constant 
 44:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
 45:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 46:    LDA  3,1(7)	Return address in ac 
 47:    JMP  7,-42(7)	CALL output
 48:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
 41:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
 50:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
* CALL output
 52:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 53:    LDC  3,103(6)	Load integer constant 
 54:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
 55:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 56:    LDA  3,1(7)	Return address in ac 
 57:    JMP  7,-52(7)	CALL output
 58:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
 51:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
* CALL output
 60:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 61:    LDC  3,105(6)	Load integer constant 
 62:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
 63:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 64:    LDA  3,1(7)	Return address in ac 
 65:    JMP  7,-60(7)	CALL output
 66:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
 59:    JMP  7,7(7)	Jump around the ELSE [backpatch] 
* END IF
 49:    JMP  7,17(7)	Jump around the ELSE [backpatch] 
* END IF
* IF
 67:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
* CALL output
 69:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 70:    LDC  3,101(6)	Load integer constant 
 71:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
 72:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 73:    LDA  3,1(7)	Return address in ac 
 74:    JMP  7,-69(7)	CALL output
 75:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
 68:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
 77:    LDC  3,1(6)	Load Boolean constant 
* THEN
* EXPRESSION
* CALL output
 79:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 80:    LDC  3,103(6)	Load integer constant 
 81:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
 82:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 83:    LDA  3,1(7)	Return address in ac 
 84:    JMP  7,-79(7)	CALL output
 85:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
 78:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
* CALL output
 87:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 88:    LDC  3,105(6)	Load integer constant 
 89:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
 90:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 91:    LDA  3,1(7)	Return address in ac 
 92:    JMP  7,-87(7)	CALL output
 93:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
 86:    JMP  7,7(7)	Jump around the ELSE [backpatch] 
* END IF
 76:    JMP  7,17(7)	Jump around the ELSE [backpatch] 
* END IF
* IF
 94:    LDC  3,1(6)	Load Boolean constant 
* THEN
* EXPRESSION
* CALL output
 96:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 97:    LDC  3,101(6)	Load integer constant 
 98:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
 99:    LDA  1,-2(1)	Ghost frame becomes new active frame 
100:    LDA  3,1(7)	Return address in ac 
101:    JMP  7,-96(7)	CALL output
102:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
 95:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
104:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
* CALL output
106:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
107:    LDC  3,103(6)	Load integer constant 
108:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
109:    LDA  1,-2(1)	Ghost frame becomes new active frame 
110:    LDA  3,1(7)	Return address in ac 
111:    JMP  7,-106(7)	CALL output
112:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
105:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
* CALL output
114:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
115:    LDC  3,105(6)	Load integer constant 
116:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
117:    LDA  1,-2(1)	Ghost frame becomes new active frame 
118:    LDA  3,1(7)	Return address in ac 
119:    JMP  7,-114(7)	CALL output
120:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
113:    JMP  7,7(7)	Jump around the ELSE [backpatch] 
* END IF
103:    JMP  7,17(7)	Jump around the ELSE [backpatch] 
* END IF
* IF
121:    LDC  3,1(6)	Load Boolean constant 
* THEN
* EXPRESSION
* CALL output
123:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
124:    LDC  3,101(6)	Load integer constant 
125:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
126:    LDA  1,-2(1)	Ghost frame becomes new active frame 
127:    LDA  3,1(7)	Return address in ac 
128:    JMP  7,-123(7)	CALL output
129:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
122:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
131:    LDC  3,1(6)	Load Boolean constant 
* THEN
* EXPRESSION
* CALL output
133:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
134:    LDC  3,103(6)	Load integer constant 
135:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
136:    LDA  1,-2(1)	Ghost frame becomes new active frame 
137:    LDA  3,1(7)	Return address in ac 
138:    JMP  7,-133(7)	CALL output
139:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
132:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
* CALL output
141:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
142:    LDC  3,105(6)	Load integer constant 
143:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
144:    LDA  1,-2(1)	Ghost frame becomes new active frame 
145:    LDA  3,1(7)	Return address in ac 
146:    JMP  7,-141(7)	CALL output
147:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
140:    JMP  7,7(7)	Jump around the ELSE [backpatch] 
* END IF
130:    JMP  7,17(7)	Jump around the ELSE [backpatch] 
* END IF
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
148:    LDC  2,0(6)	Set return value to 0 
149:     LD  3,-1(1)	Load return address 
150:     LD  1,0(1)	Adjust fp 
151:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,151(7)	Jump to init [backpatch] 
* INIT
152:    LDA  1,0(0)	set first frame at end of globals 
153:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
154:    LDA  3,1(7)	Return address in ac 
155:    JMP  7,-117(7)	Jump to main 
156:   HALT  0,0,0	DONE! 
* END INIT
