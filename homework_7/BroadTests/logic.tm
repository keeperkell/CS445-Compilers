* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  logic.c-
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
* CALL outputb
 40:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 41:    LDC  3,0(6)	Load Boolean constant 
 42:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 43:    LDC  3,0(6)	Load Boolean constant 
* TOFF inc: -4
 44:     LD  4,-4(1)	Pop left into ac1 
 45:    AND  3,4,3	Op AND 
 46:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
 47:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 48:    LDA  3,1(7)	Return address in ac 
 49:    JMP  7,-33(7)	CALL outputb
 50:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outputb
 51:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 52:    LDC  3,0(6)	Load Boolean constant 
 53:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 54:    LDC  3,1(6)	Load Boolean constant 
* TOFF inc: -4
 55:     LD  4,-4(1)	Pop left into ac1 
 56:    AND  3,4,3	Op AND 
 57:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
 58:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 59:    LDA  3,1(7)	Return address in ac 
 60:    JMP  7,-44(7)	CALL outputb
 61:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outputb
 62:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 63:    LDC  3,1(6)	Load Boolean constant 
 64:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 65:    LDC  3,0(6)	Load Boolean constant 
* TOFF inc: -4
 66:     LD  4,-4(1)	Pop left into ac1 
 67:    AND  3,4,3	Op AND 
 68:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
 69:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 70:    LDA  3,1(7)	Return address in ac 
 71:    JMP  7,-55(7)	CALL outputb
 72:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outputb
 73:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 74:    LDC  3,1(6)	Load Boolean constant 
 75:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 76:    LDC  3,1(6)	Load Boolean constant 
* TOFF inc: -4
 77:     LD  4,-4(1)	Pop left into ac1 
 78:    AND  3,4,3	Op AND 
 79:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
 80:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 81:    LDA  3,1(7)	Return address in ac 
 82:    JMP  7,-66(7)	CALL outputb
 83:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outnl
 84:     ST  1,-2(1)	Store fp in ghost frame for outnl
* TOFF dec: -3
* TOFF dec: -4
* Param end outnl
 85:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 86:    LDA  3,1(7)	Return address in ac 
 87:    JMP  7,-54(7)	CALL outnl
 88:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -2
* EXPRESSION
* CALL outputb
 89:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 90:    LDC  3,0(6)	Load Boolean constant 
 91:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 92:    LDC  3,0(6)	Load Boolean constant 
* TOFF inc: -4
 93:     LD  4,-4(1)	Pop left into ac1 
 94:     OR  3,4,3	Op OR 
 95:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
 96:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 97:    LDA  3,1(7)	Return address in ac 
 98:    JMP  7,-82(7)	CALL outputb
 99:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outputb
100:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
101:    LDC  3,0(6)	Load Boolean constant 
102:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
103:    LDC  3,1(6)	Load Boolean constant 
* TOFF inc: -4
104:     LD  4,-4(1)	Pop left into ac1 
105:     OR  3,4,3	Op OR 
106:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
107:    LDA  1,-2(1)	Ghost frame becomes new active frame 
108:    LDA  3,1(7)	Return address in ac 
109:    JMP  7,-93(7)	CALL outputb
110:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outputb
111:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
112:    LDC  3,1(6)	Load Boolean constant 
113:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
114:    LDC  3,0(6)	Load Boolean constant 
* TOFF inc: -4
115:     LD  4,-4(1)	Pop left into ac1 
116:     OR  3,4,3	Op OR 
117:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
118:    LDA  1,-2(1)	Ghost frame becomes new active frame 
119:    LDA  3,1(7)	Return address in ac 
120:    JMP  7,-104(7)	CALL outputb
121:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outputb
122:     ST  1,-2(1)	Store fp in ghost frame for outputb
* TOFF dec: -3
* TOFF dec: -4
* Param 1
123:    LDC  3,1(6)	Load Boolean constant 
124:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
125:    LDC  3,1(6)	Load Boolean constant 
* TOFF inc: -4
126:     LD  4,-4(1)	Pop left into ac1 
127:     OR  3,4,3	Op OR 
128:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputb
129:    LDA  1,-2(1)	Ghost frame becomes new active frame 
130:    LDA  3,1(7)	Return address in ac 
131:    JMP  7,-115(7)	CALL outputb
132:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -2
* EXPRESSION
* CALL outnl
133:     ST  1,-2(1)	Store fp in ghost frame for outnl
* TOFF dec: -3
* TOFF dec: -4
* Param end outnl
134:    LDA  1,-2(1)	Ghost frame becomes new active frame 
135:    LDA  3,1(7)	Return address in ac 
136:    JMP  7,-103(7)	CALL outnl
137:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -2
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
138:    LDC  2,0(6)	Set return value to 0 
139:     LD  3,-1(1)	Load return address 
140:     LD  1,0(1)	Adjust fp 
141:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,141(7)	Jump to init [backpatch] 
* INIT
142:    LDA  1,0(0)	set first frame at end of globals 
143:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
144:    LDA  3,1(7)	Return address in ac 
145:    JMP  7,-107(7)	Jump to main 
146:   HALT  0,0,0	DONE! 
* END INIT
