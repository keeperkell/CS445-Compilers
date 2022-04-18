* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  combslow.c-
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
* TOFF set: -4
* Compound Body
* IF
 40:     LD  3,-2(1)	Load variable a
 41:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 42:     LD  3,-3(1)	Load variable b
* TOFF inc: -4
 43:     LD  4,-4(1)	Pop left into ac1 
 44:    TEQ  3,4,3	Op = 
* THEN
* RETURN
 46:    LDC  3,1(6)	Load integer constant 
 47:    LDA  2,0(3)	Copy result to return register 
 48:     LD  3,-1(1)	Load return address 
 49:     LD  1,0(1)	Adjust fp 
 50:    JMP  7,0(3)	Return 
 45:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* END IF
* IF
 51:     LD  3,-3(1)	Load variable b
 52:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 53:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -4
 54:     LD  4,-4(1)	Pop left into ac1 
 55:    TEQ  3,4,3	Op = 
* THEN
* RETURN
 57:    LDC  3,1(6)	Load integer constant 
 58:    LDA  2,0(3)	Copy result to return register 
 59:     LD  3,-1(1)	Load return address 
 60:     LD  1,0(1)	Adjust fp 
 61:    JMP  7,0(3)	Return 
 56:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* END IF
* IF
 62:     LD  3,-3(1)	Load variable b
 63:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 64:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
 65:     LD  4,-4(1)	Pop left into ac1 
 66:    TEQ  3,4,3	Op = 
* THEN
* RETURN
 68:     LD  3,-2(1)	Load variable a
 69:    LDA  2,0(3)	Copy result to return register 
 70:     LD  3,-1(1)	Load return address 
 71:     LD  1,0(1)	Adjust fp 
 72:    JMP  7,0(3)	Return 
 67:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* END IF
* RETURN
* CALL comb
 73:     ST  1,-4(1)	Store fp in ghost frame for comb
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 74:     LD  3,-2(1)	Load variable a
 75:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
 76:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -6
 77:     LD  4,-6(1)	Pop left into ac1 
 78:    SUB  3,4,3	Op - 
 79:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param 2
 80:     LD  3,-3(1)	Load variable b
 81:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
 82:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -7
 83:     LD  4,-7(1)	Pop left into ac1 
 84:    SUB  3,4,3	Op - 
 85:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end comb
 86:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 87:    LDA  3,1(7)	Return address in ac 
 88:    JMP  7,-50(7)	CALL comb
 89:    LDA  3,0(2)	Save the result in ac 
* Call end comb
* TOFF set: -4
 90:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
* CALL comb
 91:     ST  1,-5(1)	Store fp in ghost frame for comb
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 92:     LD  3,-2(1)	Load variable a
 93:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
 94:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -7
 95:     LD  4,-7(1)	Pop left into ac1 
 96:    SUB  3,4,3	Op - 
 97:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param 2
 98:     LD  3,-3(1)	Load variable b
 99:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end comb
100:    LDA  1,-5(1)	Ghost frame becomes new active frame 
101:    LDA  3,1(7)	Return address in ac 
102:    JMP  7,-64(7)	CALL comb
103:    LDA  3,0(2)	Save the result in ac 
* Call end comb
* TOFF set: -5
* TOFF inc: -4
104:     LD  4,-4(1)	Pop left into ac1 
105:    ADD  3,4,3	Op + 
106:    LDA  2,0(3)	Copy result to return register 
107:     LD  3,-1(1)	Load return address 
108:     LD  1,0(1)	Adjust fp 
109:    JMP  7,0(3)	Return 
* TOFF set: -4
* END COMPOUND
* Add standard closing in case there is no return statement
110:    LDC  2,0(6)	Set return value to 0 
111:     LD  3,-1(1)	Load return address 
112:     LD  1,0(1)	Adjust fp 
113:    JMP  7,0(3)	Return 
* END FUNCTION comb
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
114:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -5
* Compound Body
* WHILE
115:    LDC  3,1(6)	Load Boolean constant 
116:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -5
* Compound Body
* IF
* CALL input
118:     ST  1,-5(1)	Store fp in ghost frame for input
* TOFF dec: -6
* TOFF dec: -7
* Param end input
119:    LDA  1,-5(1)	Ghost frame becomes new active frame 
120:    LDA  3,1(7)	Return address in ac 
121:    JMP  7,-121(7)	CALL input
122:    LDA  3,0(2)	Save the result in ac 
* Call end input
* TOFF set: -5
123:     ST  3,-4(1)	Store variable n
124:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
125:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -5
126:     LD  4,-5(1)	Pop left into ac1 
127:    TEQ  3,4,3	Op = 
* THEN
* BREAK
129:    JMP  7,-13(7)	break 
128:    JZR  3,1(7)	Jump around the THEN if false [backpatch] 
* END IF
* EXPRESSION
130:    LDC  3,0(6)	Load integer constant 
131:     ST  3,-2(1)	Store variable a
* WHILE
132:     LD  3,-2(1)	Load variable a
133:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
134:     LD  3,-4(1)	Load variable n
* TOFF inc: -5
135:     LD  4,-5(1)	Pop left into ac1 
136:    TLE  3,4,3	Op <= 
137:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -5
* Compound Body
* EXPRESSION
139:    LDC  3,0(6)	Load integer constant 
140:     ST  3,-3(1)	Store variable b
* WHILE
141:     LD  3,-3(1)	Load variable b
142:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
143:     LD  3,-2(1)	Load variable a
* TOFF inc: -5
144:     LD  4,-5(1)	Pop left into ac1 
145:    TLE  3,4,3	Op <= 
146:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -5
* Compound Body
* EXPRESSION
* CALL output
148:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
* CALL comb
149:     ST  1,-7(1)	Store fp in ghost frame for comb
* TOFF dec: -8
* TOFF dec: -9
* Param 1
150:     LD  3,-2(1)	Load variable a
151:     ST  3,-9(1)	Push parameter 
* TOFF dec: -10
* Param 2
152:     LD  3,-3(1)	Load variable b
153:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end comb
154:    LDA  1,-7(1)	Ghost frame becomes new active frame 
155:    LDA  3,1(7)	Return address in ac 
156:    JMP  7,-118(7)	CALL comb
157:    LDA  3,0(2)	Save the result in ac 
* Call end comb
* TOFF set: -7
158:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
159:    LDA  1,-5(1)	Ghost frame becomes new active frame 
160:    LDA  3,1(7)	Return address in ac 
161:    JMP  7,-156(7)	CALL output
162:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
163:     LD  3,-3(1)	load lhs variable b
164:    LDA  3,1(3)	increment value of b
165:     ST  3,-3(1)	Store variable b
* TOFF set: -5
* END COMPOUND
166:    JMP  7,-26(7)	go to beginning of loop 
147:    JMP  7,19(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
* CALL outnl
167:     ST  1,-5(1)	Store fp in ghost frame for outnl
* TOFF dec: -6
* TOFF dec: -7
* Param end outnl
168:    LDA  1,-5(1)	Ghost frame becomes new active frame 
169:    LDA  3,1(7)	Return address in ac 
170:    JMP  7,-137(7)	CALL outnl
171:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -5
* EXPRESSION
172:     LD  3,-2(1)	load lhs variable a
173:    LDA  3,1(3)	increment value of a
174:     ST  3,-2(1)	Store variable a
* TOFF set: -5
* END COMPOUND
175:    JMP  7,-44(7)	go to beginning of loop 
138:    JMP  7,37(7)	Jump past loop [backpatch] 
* END WHILE
* TOFF set: -5
* END COMPOUND
176:    JMP  7,-62(7)	go to beginning of loop 
117:    JMP  7,59(7)	Jump past loop [backpatch] 
* END WHILE
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
177:    LDC  2,0(6)	Set return value to 0 
178:     LD  3,-1(1)	Load return address 
179:     LD  1,0(1)	Adjust fp 
180:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,180(7)	Jump to init [backpatch] 
* INIT
181:    LDA  1,0(0)	set first frame at end of globals 
182:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
183:    LDA  3,1(7)	Return address in ac 
184:    JMP  7,-71(7)	Jump to main 
185:   HALT  0,0,0	DONE! 
* END INIT
