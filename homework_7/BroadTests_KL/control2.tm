* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  control2.c-
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
 40:    LDC  3,10(6)	Load integer constant 
 41:     ST  3,-2(1)	Store variable x
* EXPRESSION
 42:    LDC  3,7(6)	Load integer constant 
 43:     ST  3,-3(1)	Store variable y
* WHILE
 44:     LD  3,-2(1)	Load variable x
 45:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 46:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -4
 47:     LD  4,-4(1)	Pop left into ac1 
 48:    TGT  3,4,3	Op > 
 49:    JNZ  3,1(7)	Jump to while part 
* DO
* IF
 51:     LD  3,-2(1)	Load variable x
 52:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 53:     LD  3,-3(1)	Load variable y
* TOFF inc: -4
 54:     LD  4,-4(1)	Pop left into ac1 
 55:    TEQ  3,4,3	Op = 
* THEN
* EXPRESSION
 57:    LDC  3,666(6)	Load integer constant 
 58:     ST  3,-3(1)	Store variable y
 56:    JZR  3,3(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
 60:     LD  3,-2(1)	Load variable x
 61:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 62:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
 63:     LD  4,-4(1)	Pop left into ac1 
 64:    SUB  3,4,3	Op - 
 65:     ST  3,-2(1)	Store variable x
 59:    JMP  7,6(7)	Jump around the ELSE [backpatch] 
* END IF
 66:    JMP  7,-23(7)	go to beginning of loop 
 50:    JMP  7,16(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
* CALL output
 67:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 68:     LD  3,-3(1)	Load variable y
 69:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
 70:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 71:    LDA  3,1(7)	Return address in ac 
 72:    JMP  7,-67(7)	CALL output
 73:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
* CALL outnl
 74:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
 75:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 76:    LDA  3,1(7)	Return address in ac 
 77:    JMP  7,-44(7)	CALL outnl
 78:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
* EXPRESSION
 79:    LDC  3,1(6)	Load integer constant 
 80:     ST  3,-2(1)	Store variable x
* EXPRESSION
 81:    LDC  3,1(6)	Load integer constant 
 82:     ST  3,-3(1)	Store variable y
* WHILE
 83:     LD  3,-2(1)	Load variable x
 84:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 85:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -4
 86:     LD  4,-4(1)	Pop left into ac1 
 87:    TLT  3,4,3	Op < 
 88:    JNZ  3,1(7)	Jump to while part 
* DO
* IF
 90:     LD  3,-3(1)	Load variable y
 91:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 92:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -4
 93:     LD  4,-4(1)	Pop left into ac1 
 94:    TLT  3,4,3	Op < 
* THEN
* WHILE
 96:     LD  3,-3(1)	Load variable y
 97:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 98:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -4
 99:     LD  4,-4(1)	Pop left into ac1 
100:    TLT  3,4,3	Op < 
101:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -4
* Compound Body
* EXPRESSION
* CALL output
103:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
104:     LD  3,-2(1)	Load variable x
105:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
106:    LDA  1,-4(1)	Ghost frame becomes new active frame 
107:    LDA  3,1(7)	Return address in ac 
108:    JMP  7,-103(7)	CALL output
109:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
* CALL output
110:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
111:     LD  3,-3(1)	Load variable y
112:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
113:    LDA  1,-4(1)	Ghost frame becomes new active frame 
114:    LDA  3,1(7)	Return address in ac 
115:    JMP  7,-110(7)	CALL output
116:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
* CALL outnl
117:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
118:    LDA  1,-4(1)	Ghost frame becomes new active frame 
119:    LDA  3,1(7)	Return address in ac 
120:    JMP  7,-87(7)	CALL outnl
121:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
* EXPRESSION
122:     LD  3,-3(1)	load lhs variable y
123:    LDA  3,1(3)	increment value of y
124:     ST  3,-3(1)	Store variable y
* TOFF set: -4
* END COMPOUND
125:    JMP  7,-30(7)	go to beginning of loop 
102:    JMP  7,23(7)	Jump past loop [backpatch] 
* END WHILE
 95:    JZR  3,31(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* TOFF set: -4
* Compound Body
* EXPRESSION
127:    LDC  3,1(6)	Load integer constant 
128:     ST  3,-3(1)	Store variable y
* EXPRESSION
129:     LD  3,-2(1)	load lhs variable x
130:    LDA  3,1(3)	increment value of x
131:     ST  3,-2(1)	Store variable x
* TOFF set: -4
* END COMPOUND
126:    JMP  7,5(7)	Jump around the ELSE [backpatch] 
* END IF
132:    JMP  7,-50(7)	go to beginning of loop 
 89:    JMP  7,43(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
* CALL output
133:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
134:     LD  3,-2(1)	Load variable x
135:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
136:    LDA  1,-4(1)	Ghost frame becomes new active frame 
137:    LDA  3,1(7)	Return address in ac 
138:    JMP  7,-133(7)	CALL output
139:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* RETURN
140:     LD  3,-1(1)	Load return address 
141:     LD  1,0(1)	Adjust fp 
142:    JMP  7,0(3)	Return 
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
143:    LDC  2,0(6)	Set return value to 0 
144:     LD  3,-1(1)	Load return address 
145:     LD  1,0(1)	Adjust fp 
146:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,146(7)	Jump to init [backpatch] 
* INIT
147:    LDA  1,0(0)	set first frame at end of globals 
148:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
149:    LDA  3,1(7)	Return address in ac 
150:    JMP  7,-112(7)	Jump to main 
151:   HALT  0,0,0	DONE! 
* END INIT
