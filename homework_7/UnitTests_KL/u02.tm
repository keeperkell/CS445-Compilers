* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  u02.c-
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
 51:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* END IF
 49:    JMP  7,9(7)	Jump around the ELSE [backpatch] 
* END IF
* EXPRESSION
* CALL output
 59:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 60:    LDC  3,105(6)	Load integer constant 
 61:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
 62:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 63:    LDA  3,1(7)	Return address in ac 
 64:    JMP  7,-59(7)	CALL output
 65:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* IF
 66:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
* CALL output
 68:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 69:    LDC  3,101(6)	Load integer constant 
 70:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
 71:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 72:    LDA  3,1(7)	Return address in ac 
 73:    JMP  7,-68(7)	CALL output
 74:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
 67:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
 76:    LDC  3,1(6)	Load Boolean constant 
* THEN
* EXPRESSION
* CALL output
 78:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 79:    LDC  3,103(6)	Load integer constant 
 80:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
 81:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 82:    LDA  3,1(7)	Return address in ac 
 83:    JMP  7,-78(7)	CALL output
 84:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
 77:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* END IF
 75:    JMP  7,9(7)	Jump around the ELSE [backpatch] 
* END IF
* EXPRESSION
* CALL output
 85:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 86:    LDC  3,105(6)	Load integer constant 
 87:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
 88:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 89:    LDA  3,1(7)	Return address in ac 
 90:    JMP  7,-85(7)	CALL output
 91:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* IF
 92:    LDC  3,1(6)	Load Boolean constant 
* THEN
* EXPRESSION
* CALL output
 94:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 95:    LDC  3,101(6)	Load integer constant 
 96:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
 97:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 98:    LDA  3,1(7)	Return address in ac 
 99:    JMP  7,-94(7)	CALL output
100:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
 93:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
102:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
* CALL output
104:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
105:    LDC  3,103(6)	Load integer constant 
106:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
107:    LDA  1,-2(1)	Ghost frame becomes new active frame 
108:    LDA  3,1(7)	Return address in ac 
109:    JMP  7,-104(7)	CALL output
110:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
103:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* END IF
101:    JMP  7,9(7)	Jump around the ELSE [backpatch] 
* END IF
* EXPRESSION
* CALL output
111:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
112:    LDC  3,105(6)	Load integer constant 
113:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
114:    LDA  1,-2(1)	Ghost frame becomes new active frame 
115:    LDA  3,1(7)	Return address in ac 
116:    JMP  7,-111(7)	CALL output
117:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* IF
118:    LDC  3,1(6)	Load Boolean constant 
* THEN
* EXPRESSION
* CALL output
120:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
121:    LDC  3,101(6)	Load integer constant 
122:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
123:    LDA  1,-2(1)	Ghost frame becomes new active frame 
124:    LDA  3,1(7)	Return address in ac 
125:    JMP  7,-120(7)	CALL output
126:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
119:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
128:    LDC  3,1(6)	Load Boolean constant 
* THEN
* EXPRESSION
* CALL output
130:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
131:    LDC  3,103(6)	Load integer constant 
132:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
133:    LDA  1,-2(1)	Ghost frame becomes new active frame 
134:    LDA  3,1(7)	Return address in ac 
135:    JMP  7,-130(7)	CALL output
136:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
129:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* END IF
127:    JMP  7,9(7)	Jump around the ELSE [backpatch] 
* END IF
* EXPRESSION
* CALL output
137:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
138:    LDC  3,105(6)	Load integer constant 
139:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
140:    LDA  1,-2(1)	Ghost frame becomes new active frame 
141:    LDA  3,1(7)	Return address in ac 
142:    JMP  7,-137(7)	CALL output
143:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
144:    LDC  2,0(6)	Set return value to 0 
145:     LD  3,-1(1)	Load return address 
146:     LD  1,0(1)	Adjust fp 
147:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,147(7)	Jump to init [backpatch] 
* INIT
148:    LDA  1,0(0)	set first frame at end of globals 
149:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
150:    LDA  3,1(7)	Return address in ac 
151:    JMP  7,-113(7)	Jump to main 
152:   HALT  0,0,0	DONE! 
* END INIT
