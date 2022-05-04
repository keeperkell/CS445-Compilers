* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  comb.c-
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
* FUNCTION comb
* TOFF set: -4
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -7
* Compound Body
* EXPRESSION
 40:     LD  3,-2(1)	Load variable n
 41:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
 42:     LD  3,-3(1)	Load variable r
* TOFF inc: -7
 43:     LD  4,-7(1)	Pop left into ac1 
 44:    SUB  3,4,3	Op - 
 45:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
 46:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -7
 47:     LD  4,-7(1)	Pop left into ac1 
 48:    ADD  3,4,3	Op + 
 49:     ST  3,-6(1)	Store variable c
* EXPRESSION
 50:     LD  3,-2(1)	Load variable n
 51:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
 52:     LD  3,-3(1)	Load variable r
* TOFF inc: -7
 53:     LD  4,-7(1)	Pop left into ac1 
 54:    SUB  3,4,3	Op - 
 55:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
 56:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -7
 57:     LD  4,-7(1)	Pop left into ac1 
 58:    ADD  3,4,3	Op + 
 59:     ST  3,-4(1)	Store variable i
* EXPRESSION
 60:    LDC  3,2(6)	Load integer constant 
 61:     ST  3,-5(1)	Store variable j
* WHILE
 62:     LD  3,-4(1)	Load variable i
 63:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
 64:     LD  3,-2(1)	Load variable n
* TOFF inc: -7
 65:     LD  4,-7(1)	Pop left into ac1 
 66:    TLE  3,4,3	Op <= 
 67:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -7
* Compound Body
* EXPRESSION
 69:     LD  3,-6(1)	Load variable c
 70:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
 71:     LD  3,-4(1)	Load variable i
* TOFF inc: -7
 72:     LD  4,-7(1)	Pop left into ac1 
 73:    MUL  3,4,3	Op * 
 74:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
 75:     LD  3,-5(1)	Load variable j
* TOFF inc: -7
 76:     LD  4,-7(1)	Pop left into ac1 
 77:    DIV  3,4,3	Op / 
 78:     ST  3,-6(1)	Store variable c
* EXPRESSION
 79:     LD  3,-4(1)	load lhs variable i
 80:    LDA  3,1(3)	increment value of i
 81:     ST  3,-4(1)	Store variable i
* EXPRESSION
 82:     LD  3,-5(1)	load lhs variable j
 83:    LDA  3,1(3)	increment value of j
 84:     ST  3,-5(1)	Store variable j
* TOFF set: -7
* END COMPOUND
 85:    JMP  7,-24(7)	go to beginning of loop 
 68:    JMP  7,17(7)	Jump past loop [backpatch] 
* END WHILE
* RETURN
 86:     LD  3,-6(1)	Load variable c
 87:    LDA  2,0(3)	Copy result to return register 
 88:     LD  3,-1(1)	Load return address 
 89:     LD  1,0(1)	Adjust fp 
 90:    JMP  7,0(3)	Return 
* TOFF set: -4
* END COMPOUND
* Add standard closing in case there is no return statement
 91:    LDC  2,0(6)	Set return value to 0 
 92:     LD  3,-1(1)	Load return address 
 93:     LD  1,0(1)	Adjust fp 
 94:    JMP  7,0(3)	Return 
* END FUNCTION comb
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
 95:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -6
* Compound Body
* EXPRESSION
 96:    LDC  3,15(6)	Load integer constant 
 97:     ST  3,-2(1)	Store variable max
* EXPRESSION
 98:    LDC  3,2(6)	Load integer constant 
 99:     ST  3,-3(1)	Store variable n
* WHILE
100:     LD  3,-3(1)	Load variable n
101:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
102:     LD  3,-2(1)	Load variable max
* TOFF inc: -6
103:     LD  4,-6(1)	Pop left into ac1 
104:    TLE  3,4,3	Op <= 
105:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -6
* Compound Body
* EXPRESSION
107:    LDC  3,2(6)	Load integer constant 
108:     ST  3,-5(1)	Store variable r
* WHILE
109:     LD  3,-5(1)	Load variable r
110:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
111:     LD  3,-3(1)	Load variable n
112:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
113:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -7
114:     LD  4,-7(1)	Pop left into ac1 
115:    DIV  3,4,3	Op / 
* TOFF inc: -6
116:     LD  4,-6(1)	Pop left into ac1 
117:    TLE  3,4,3	Op <= 
118:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -6
* Compound Body
* EXPRESSION
* CALL output
120:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
121:     LD  3,-3(1)	Load variable n
122:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
123:    LDA  1,-6(1)	Ghost frame becomes new active frame 
124:    LDA  3,1(7)	Return address in ac 
125:    JMP  7,-120(7)	CALL output
126:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
127:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
128:     LD  3,-5(1)	Load variable r
129:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
130:    LDA  1,-6(1)	Ghost frame becomes new active frame 
131:    LDA  3,1(7)	Return address in ac 
132:    JMP  7,-127(7)	CALL output
133:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL output
134:     ST  1,-6(1)	Store fp in ghost frame for output
* TOFF dec: -7
* TOFF dec: -8
* Param 1
* CALL comb
135:     ST  1,-8(1)	Store fp in ghost frame for comb
* TOFF dec: -9
* TOFF dec: -10
* Param 1
136:     LD  3,-3(1)	Load variable n
137:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param 2
138:     LD  3,-5(1)	Load variable r
139:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param end comb
140:    LDA  1,-8(1)	Ghost frame becomes new active frame 
141:    LDA  3,1(7)	Return address in ac 
142:    JMP  7,-104(7)	CALL comb
143:    LDA  3,0(2)	Save the result in ac 
* Call end comb
* TOFF set: -8
144:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end output
145:    LDA  1,-6(1)	Ghost frame becomes new active frame 
146:    LDA  3,1(7)	Return address in ac 
147:    JMP  7,-142(7)	CALL output
148:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -6
* EXPRESSION
* CALL outnl
149:     ST  1,-6(1)	Store fp in ghost frame for outnl
* TOFF dec: -7
* TOFF dec: -8
* Param end outnl
150:    LDA  1,-6(1)	Ghost frame becomes new active frame 
151:    LDA  3,1(7)	Return address in ac 
152:    JMP  7,-119(7)	CALL outnl
153:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -6
* EXPRESSION
154:     LD  3,-5(1)	load lhs variable r
155:    LDA  3,1(3)	increment value of r
156:     ST  3,-5(1)	Store variable r
* TOFF set: -6
* END COMPOUND
157:    JMP  7,-49(7)	go to beginning of loop 
119:    JMP  7,38(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
158:     LD  3,-3(1)	load lhs variable n
159:    LDA  3,1(3)	increment value of n
160:     ST  3,-3(1)	Store variable n
* TOFF set: -6
* END COMPOUND
161:    JMP  7,-62(7)	go to beginning of loop 
106:    JMP  7,55(7)	Jump past loop [backpatch] 
* END WHILE
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
162:    LDC  2,0(6)	Set return value to 0 
163:     LD  3,-1(1)	Load return address 
164:     LD  1,0(1)	Adjust fp 
165:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,165(7)	Jump to init [backpatch] 
* INIT
166:    LDA  1,0(0)	set first frame at end of globals 
167:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
168:    LDA  3,1(7)	Return address in ac 
169:    JMP  7,-75(7)	Jump to main 
170:   HALT  0,0,0	DONE! 
* END INIT
