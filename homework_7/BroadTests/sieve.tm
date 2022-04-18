* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  sieve.c-
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
* TOFF set: -206
 40:    LDC  3,201(6)	load size of array n
 41:     ST  3,-4(1)	save size of array n
* Compound Body
* EXPRESSION
 42:    LDC  3,200(6)	Load integer constant 
 43:     ST  3,-2(1)	Store variable max
* EXPRESSION
 44:    LDC  3,2(6)	Load integer constant 
 45:     ST  3,-3(1)	Store variable k
* WHILE
 46:     LD  3,-3(1)	Load variable k
 47:     ST  3,-206(1)	Push left side 
* TOFF dec: -207
 48:     LD  3,-2(1)	Load variable max
* TOFF inc: -206
 49:     LD  4,-206(1)	Pop left into ac1 
 50:    TLE  3,4,3	Op <= 
 51:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -206
* Compound Body
* EXPRESSION
 53:     LD  3,-3(1)	Load variable k
 54:     ST  3,-206(1)	Push index 
* TOFF dec: -207
 55:    LDC  3,1(6)	Load Boolean constant 
* TOFF inc: -206
 56:     LD  4,-206(1)	Pop index 
 57:    LDA  5,-5(1)	Load address of base of array n
 58:    SUB  5,5,4	Compute offset of value 
 59:     ST  3,0(5)	Store variable n
* EXPRESSION
 60:     LD  3,-3(1)	Load variable k
 61:     ST  3,-206(1)	Push left side 
* TOFF dec: -207
 62:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -206
 63:     LD  4,-206(1)	Pop left into ac1 
 64:    ADD  3,4,3	Op + 
 65:     ST  3,-3(1)	Store variable k
* TOFF set: -206
* END COMPOUND
 66:    JMP  7,-21(7)	go to beginning of loop 
 52:    JMP  7,14(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
 67:    LDC  3,2(6)	Load integer constant 
 68:     ST  3,-3(1)	Store variable k
* WHILE
 69:     LD  3,-3(1)	Load variable k
 70:     ST  3,-206(1)	Push left side 
* TOFF dec: -207
 71:     LD  3,-3(1)	Load variable k
* TOFF inc: -206
 72:     LD  4,-206(1)	Pop left into ac1 
 73:    MUL  3,4,3	Op * 
 74:     ST  3,-206(1)	Push left side 
* TOFF dec: -207
 75:     LD  3,-2(1)	Load variable max
* TOFF inc: -206
 76:     LD  4,-206(1)	Pop left into ac1 
 77:    TLE  3,4,3	Op <= 
 78:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -207
* Compound Body
* EXPRESSION
 80:     LD  3,-3(1)	Load variable k
 81:     ST  3,-207(1)	Push left side 
* TOFF dec: -208
 82:     LD  3,-3(1)	Load variable k
* TOFF inc: -207
 83:     LD  4,-207(1)	Pop left into ac1 
 84:    MUL  3,4,3	Op * 
 85:     ST  3,-206(1)	Store variable j
* WHILE
 86:     LD  3,-206(1)	Load variable j
 87:     ST  3,-207(1)	Push left side 
* TOFF dec: -208
 88:     LD  3,-2(1)	Load variable max
* TOFF inc: -207
 89:     LD  4,-207(1)	Pop left into ac1 
 90:    TLE  3,4,3	Op <= 
 91:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -207
* Compound Body
* EXPRESSION
 93:     LD  3,-206(1)	Load variable j
 94:     ST  3,-207(1)	Push index 
* TOFF dec: -208
 95:    LDC  3,0(6)	Load Boolean constant 
* TOFF inc: -207
 96:     LD  4,-207(1)	Pop index 
 97:    LDA  5,-5(1)	Load address of base of array n
 98:    SUB  5,5,4	Compute offset of value 
 99:     ST  3,0(5)	Store variable n
* EXPRESSION
100:     LD  3,-206(1)	Load variable j
101:     ST  3,-207(1)	Push left side 
* TOFF dec: -208
102:     LD  3,-3(1)	Load variable k
* TOFF inc: -207
103:     LD  4,-207(1)	Pop left into ac1 
104:    ADD  3,4,3	Op + 
105:     ST  3,-206(1)	Store variable j
* TOFF set: -207
* END COMPOUND
106:    JMP  7,-21(7)	go to beginning of loop 
 92:    JMP  7,14(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
107:     LD  3,-3(1)	Load variable k
108:     ST  3,-207(1)	Push left side 
* TOFF dec: -208
109:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -207
110:     LD  4,-207(1)	Pop left into ac1 
111:    ADD  3,4,3	Op + 
112:     ST  3,-3(1)	Store variable k
* WHILE
113:     LD  3,-3(1)	Load variable k
114:     ST  3,-207(1)	Push left side 
* TOFF dec: -208
115:     LD  3,-2(1)	Load variable max
* TOFF inc: -207
116:     LD  4,-207(1)	Pop left into ac1 
117:    TLE  3,4,3	Op <= 
118:     ST  3,-207(1)	Push left side 
* TOFF dec: -208
119:    LDA  3,-5(1)	Load address of base of array n
120:     ST  3,-208(1)	Push left side 
* TOFF dec: -209
121:     LD  3,-3(1)	Load variable k
* TOFF inc: -208
122:     LD  4,-208(1)	Pop left into ac1 
123:    SUB  3,4,3	compute location from index 
124:     LD  3,0(3)	Load array element 
125:    LDC  4,1(6)	Load 1 
126:    XOR  3,3,4	Op XOR to get logical not 
* TOFF inc: -207
127:     LD  4,-207(1)	Pop left into ac1 
128:    AND  3,4,3	Op AND 
129:    JNZ  3,1(7)	Jump to while part 
* DO
* EXPRESSION
131:     LD  3,-3(1)	Load variable k
132:     ST  3,-207(1)	Push left side 
* TOFF dec: -208
133:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -207
134:     LD  4,-207(1)	Pop left into ac1 
135:    ADD  3,4,3	Op + 
136:     ST  3,-3(1)	Store variable k
137:    JMP  7,-25(7)	go to beginning of loop 
130:    JMP  7,7(7)	Jump past loop [backpatch] 
* END WHILE
* TOFF set: -206
* END COMPOUND
138:    JMP  7,-70(7)	go to beginning of loop 
 79:    JMP  7,59(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
139:    LDC  3,2(6)	Load integer constant 
140:     ST  3,-3(1)	Store variable k
* WHILE
141:     LD  3,-3(1)	Load variable k
142:     ST  3,-206(1)	Push left side 
* TOFF dec: -207
143:     LD  3,-2(1)	Load variable max
* TOFF inc: -206
144:     LD  4,-206(1)	Pop left into ac1 
145:    TLE  3,4,3	Op <= 
146:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -206
* Compound Body
* IF
148:    LDA  3,-5(1)	Load address of base of array n
149:     ST  3,-206(1)	Push left side 
* TOFF dec: -207
150:     LD  3,-3(1)	Load variable k
* TOFF inc: -206
151:     LD  4,-206(1)	Pop left into ac1 
152:    SUB  3,4,3	compute location from index 
153:     LD  3,0(3)	Load array element 
* THEN
* COMPOUND
* TOFF set: -206
* Compound Body
* EXPRESSION
* CALL output
155:     ST  1,-206(1)	Store fp in ghost frame for output
* TOFF dec: -207
* TOFF dec: -208
* Param 1
156:     LD  3,-3(1)	Load variable k
157:     ST  3,-208(1)	Push parameter 
* TOFF dec: -209
* Param end output
158:    LDA  1,-206(1)	Ghost frame becomes new active frame 
159:    LDA  3,1(7)	Return address in ac 
160:    JMP  7,-155(7)	CALL output
161:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -206
* EXPRESSION
* CALL outnl
162:     ST  1,-206(1)	Store fp in ghost frame for outnl
* TOFF dec: -207
* TOFF dec: -208
* Param end outnl
163:    LDA  1,-206(1)	Ghost frame becomes new active frame 
164:    LDA  3,1(7)	Return address in ac 
165:    JMP  7,-132(7)	CALL outnl
166:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -206
* TOFF set: -206
* END COMPOUND
154:    JZR  3,12(7)	Jump around the THEN if false [backpatch] 
* END IF
* EXPRESSION
167:     LD  3,-3(1)	Load variable k
168:     ST  3,-206(1)	Push left side 
* TOFF dec: -207
169:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -206
170:     LD  4,-206(1)	Pop left into ac1 
171:    ADD  3,4,3	Op + 
172:     ST  3,-3(1)	Store variable k
* TOFF set: -206
* END COMPOUND
173:    JMP  7,-33(7)	go to beginning of loop 
147:    JMP  7,26(7)	Jump past loop [backpatch] 
* END WHILE
* RETURN
174:    LDC  3,0(6)	Load integer constant 
175:    LDA  2,0(3)	Copy result to return register 
176:     LD  3,-1(1)	Load return address 
177:     LD  1,0(1)	Adjust fp 
178:    JMP  7,0(3)	Return 
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
179:    LDC  2,0(6)	Set return value to 0 
180:     LD  3,-1(1)	Load return address 
181:     LD  1,0(1)	Adjust fp 
182:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,182(7)	Jump to init [backpatch] 
* INIT
183:    LDA  1,0(0)	set first frame at end of globals 
184:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
185:    LDA  3,1(7)	Return address in ac 
186:    JMP  7,-148(7)	Jump to main 
187:   HALT  0,0,0	DONE! 
* END INIT
