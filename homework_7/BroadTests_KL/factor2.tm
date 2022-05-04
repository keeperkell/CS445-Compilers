* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  factor2.c-
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
* TOFF set: -3
* Compound Body
* WHILE
 40:    LDC  3,1(6)	Load Boolean constant 
 41:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
* CALL input
 43:     ST  1,-3(1)	Store fp in ghost frame for input
* TOFF dec: -4
* TOFF dec: -5
* Param end input
 44:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 45:    LDA  3,1(7)	Return address in ac 
 46:    JMP  7,-46(7)	CALL input
 47:    LDA  3,0(2)	Save the result in ac 
* Call end input
* TOFF set: -3
 48:     ST  3,-2(1)	Store variable n
* IF
 49:     LD  3,-2(1)	Load variable n
 50:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 51:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
 52:     LD  4,-3(1)	Pop left into ac1 
 53:    TLT  3,4,3	Op < 
* THEN
* BREAK
 55:    JMP  7,-14(7)	break 
 54:    JZR  3,1(7)	Jump around the THEN if false [backpatch] 
* END IF
* WHILE
 56:     LD  3,-2(1)	Load variable n
 57:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 58:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
 59:     LD  4,-3(1)	Pop left into ac1 
 60:    MOD  3,4,3	Op % 
 61:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 62:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -3
 63:     LD  4,-3(1)	Pop left into ac1 
 64:    TEQ  3,4,3	Op = 
 65:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
* CALL output
 67:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 68:    LDC  3,2(6)	Load integer constant 
 69:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 70:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 71:    LDA  3,1(7)	Return address in ac 
 72:    JMP  7,-67(7)	CALL output
 73:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
 74:    LDC  3,2(6)	Load integer constant 
 75:     LD  4,-2(1)	load lhs variable n
 76:    DIV  3,4,3	op /= 
 77:     ST  3,-2(1)	Store variable n
* TOFF set: -3
* END COMPOUND
 78:    JMP  7,-23(7)	go to beginning of loop 
 66:    JMP  7,12(7)	Jump past loop [backpatch] 
* END WHILE
* TOFF set: -6
* FOR
 79:    LDC  3,3(6)	Load integer constant 
 80:     ST  3,-3(1)	save starting value in index variable 
 81:     LD  3,-2(1)	Load variable n
 82:     ST  3,-4(1)	save stop value 
 83:    LDC  3,2(6)	Load integer constant 
 84:     ST  3,-5(1)	save step value 
 85:     LD  4,-3(1)	loop index 
 86:     LD  5,-4(1)	stop value 
 87:     LD  3,-5(1)	step value 
 88:    SLT  3,4,5	Op < 
 89:    JNZ  3,1(7)	Jump to loop body 
* COMPOUND
* TOFF set: -6
* Compound Body
* IF
 91:     LD  3,-3(1)	Load variable i
 92:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
 93:     LD  3,-3(1)	Load variable i
* TOFF inc: -6
 94:     LD  4,-6(1)	Pop left into ac1 
 95:    MUL  3,4,3	Op * 
 96:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
 97:     LD  3,-2(1)	Load variable n
* TOFF inc: -6
 98:     LD  4,-6(1)	Pop left into ac1 
 99:    TGT  3,4,3	Op > 
* THEN
* BREAK
101:    JMP  7,-12(7)	break 
100:    JZR  3,1(7)	Jump around the THEN if false [backpatch] 
* END IF
* WHILE
102:     LD  3,-2(1)	Load variable n
103:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
104:     LD  3,-3(1)	Load variable i
* TOFF inc: -6
105:     LD  4,-6(1)	Pop left into ac1 
106:    MOD  3,4,3	Op % 
107:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
108:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -6
109:     LD  4,-6(1)	Pop left into ac1 
110:    TEQ  3,4,3	Op = 
111:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -6
* Compound Body
* EXPRESSION
* CALL output
113:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
114:     LD  3,-3(1)	Load variable i
115:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
116:    LDA  1,-6(1)	Ghost frame becomes new active frame 
117:    LDA  3,1(7)	Return address in ac 
118:    JMP  7,-113(7)	CALL output
119:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
120:     LD  3,-3(1)	Load variable i
121:     LD  4,-2(1)	load lhs variable n
122:    DIV  3,4,3	op /= 
123:     ST  3,-2(1)	Store variable n
* TOFF set: -6
* END COMPOUND
124:    JMP  7,-23(7)	go to beginning of loop 
112:    JMP  7,12(7)	Jump past loop [backpatch] 
* END WHILE
* TOFF set: -6
* END COMPOUND
* Bottom of loop increment and jump
125:     LD  3,-3(1)	Load index 
126:     LD  5,-5(1)	Load step 
127:    ADD  3,3,5	increment 
128:     ST  3,-3(1)	store back to index 
129:    JMP  7,-45(7)	go to beginning of loop 
 90:    JMP  7,39(7)	Jump past loop [backpatch] 
* END LOOP
* IF
130:     LD  3,-2(1)	Load variable n
131:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
132:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -6
133:     LD  4,-6(1)	Pop left into ac1 
134:    TGT  3,4,3	Op > 
* THEN
* EXPRESSION
* CALL output
136:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
137:     LD  3,-2(1)	Load variable n
138:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
139:    LDA  1,-6(1)	Ghost frame becomes new active frame 
140:    LDA  3,1(7)	Return address in ac 
141:    JMP  7,-136(7)	CALL output
142:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
135:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* END IF
* EXPRESSION
* CALL outnl
143:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
144:    LDA  1,-6(1)	Ghost frame becomes new active frame 
145:    LDA  3,1(7)	Return address in ac 
146:    JMP  7,-113(7)	CALL outnl
147:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* TOFF set: -3
* END COMPOUND
148:    JMP  7,-109(7)	go to beginning of loop 
 42:    JMP  7,106(7)	Jump past loop [backpatch] 
* END WHILE
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
149:    LDC  2,0(6)	Set return value to 0 
150:     LD  3,-1(1)	Load return address 
151:     LD  1,0(1)	Adjust fp 
152:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,152(7)	Jump to init [backpatch] 
* INIT
153:    LDA  1,0(0)	set first frame at end of globals 
154:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
155:    LDA  3,1(7)	Return address in ac 
156:    JMP  7,-118(7)	Jump to main 
157:   HALT  0,0,0	DONE! 
* END INIT
