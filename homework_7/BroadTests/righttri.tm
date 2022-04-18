* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  righttri.c-
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
* TOFF set: -8
* Compound Body
* EXPRESSION
 40:    LDC  3,1(6)	Load integer constant 
 41:     ST  3,-2(1)	Store variable a
* EXPRESSION
 42:    LDC  3,1(6)	Load integer constant 
 43:     ST  3,-4(1)	Store variable aa
* EXPRESSION
 44:    LDC  3,0(6)	Load integer constant 
 45:     ST  3,-6(1)	Store variable c
* WHILE
 46:     LD  3,-6(1)	Load variable c
 47:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
 48:    LDC  3,50(6)	Load integer constant 
* TOFF inc: -8
 49:     LD  4,-8(1)	Pop left into ac1 
 50:    TLT  3,4,3	Op < 
 51:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -8
* Compound Body
* EXPRESSION
 53:    LDC  3,1(6)	Load integer constant 
 54:     ST  3,-7(1)	Store variable cc
 55:     ST  3,-6(1)	Store variable c
* EXPRESSION
 56:    LDC  3,1(6)	Load integer constant 
 57:     ST  3,-3(1)	Store variable b
* EXPRESSION
 58:    LDC  3,1(6)	Load integer constant 
 59:     ST  3,-5(1)	Store variable bb
* WHILE
 60:     LD  3,-3(1)	Load variable b
 61:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
 62:     LD  3,-2(1)	Load variable a
* TOFF inc: -8
 63:     LD  4,-8(1)	Pop left into ac1 
 64:    TLE  3,4,3	Op <= 
 65:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -8
* Compound Body
* IF
 67:     LD  3,-4(1)	Load variable aa
 68:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
 69:     LD  3,-5(1)	Load variable bb
* TOFF inc: -8
 70:     LD  4,-8(1)	Pop left into ac1 
 71:    ADD  3,4,3	Op + 
 72:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
 73:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -8
 74:     LD  4,-8(1)	Pop left into ac1 
 75:    DIV  3,4,3	Op / 
 76:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
 77:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -8
 78:     LD  4,-8(1)	Pop left into ac1 
 79:    MOD  3,4,3	Op % 
 80:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
 81:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -8
 82:     LD  4,-8(1)	Pop left into ac1 
 83:    TEQ  3,4,3	Op = 
* THEN
* COMPOUND
* TOFF set: -8
* Compound Body
* WHILE
 85:     LD  3,-7(1)	Load variable cc
 86:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
 87:     LD  3,-4(1)	Load variable aa
 88:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
 89:     LD  3,-5(1)	Load variable bb
* TOFF inc: -9
 90:     LD  4,-9(1)	Pop left into ac1 
 91:    ADD  3,4,3	Op + 
* TOFF inc: -8
 92:     LD  4,-8(1)	Pop left into ac1 
 93:    TLT  3,4,3	Op < 
 94:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -8
* Compound Body
* EXPRESSION
 96:     LD  3,-6(1)	Load variable c
 97:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
 98:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -8
 99:     LD  4,-8(1)	Pop left into ac1 
100:    ADD  3,4,3	Op + 
101:     ST  3,-6(1)	Store variable c
* EXPRESSION
102:     LD  3,-7(1)	Load variable cc
103:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
104:    LDC  3,2(6)	Load integer constant 
105:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
106:     LD  3,-6(1)	Load variable c
* TOFF inc: -9
107:     LD  4,-9(1)	Pop left into ac1 
108:    MUL  3,4,3	Op * 
* TOFF inc: -8
109:     LD  4,-8(1)	Pop left into ac1 
110:    ADD  3,4,3	Op + 
111:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
112:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -8
113:     LD  4,-8(1)	Pop left into ac1 
114:    SUB  3,4,3	Op - 
115:     ST  3,-7(1)	Store variable cc
* TOFF set: -8
* END COMPOUND
116:    JMP  7,-32(7)	go to beginning of loop 
 95:    JMP  7,21(7)	Jump past loop [backpatch] 
* END WHILE
* IF
117:     LD  3,-4(1)	Load variable aa
118:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
119:     LD  3,-5(1)	Load variable bb
* TOFF inc: -8
120:     LD  4,-8(1)	Pop left into ac1 
121:    ADD  3,4,3	Op + 
122:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
123:     LD  3,-7(1)	Load variable cc
* TOFF inc: -8
124:     LD  4,-8(1)	Pop left into ac1 
125:    TEQ  3,4,3	Op = 
* THEN
* COMPOUND
* TOFF set: -8
* Compound Body
* EXPRESSION
* CALL output
127:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
128:     LD  3,-2(1)	Load variable a
129:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
130:    LDA  1,-8(1)	Ghost frame becomes new active frame 
131:    LDA  3,1(7)	Return address in ac 
132:    JMP  7,-127(7)	CALL output
133:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
134:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
135:     LD  3,-3(1)	Load variable b
136:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
137:    LDA  1,-8(1)	Ghost frame becomes new active frame 
138:    LDA  3,1(7)	Return address in ac 
139:    JMP  7,-134(7)	CALL output
140:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
141:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
142:     LD  3,-6(1)	Load variable c
143:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
144:    LDA  1,-8(1)	Ghost frame becomes new active frame 
145:    LDA  3,1(7)	Return address in ac 
146:    JMP  7,-141(7)	CALL output
147:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL outnl
148:     ST  1,-8(1)	Store fp in ghost frame for outnl
* TOFF dec: -9
* TOFF dec: -10
* Param end outnl
149:    LDA  1,-8(1)	Ghost frame becomes new active frame 
150:    LDA  3,1(7)	Return address in ac 
151:    JMP  7,-118(7)	CALL outnl
152:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -8
* TOFF set: -8
* END COMPOUND
126:    JZR  3,26(7)	Jump around the THEN if false [backpatch] 
* END IF
* TOFF set: -8
* END COMPOUND
 84:    JZR  3,68(7)	Jump around the THEN if false [backpatch] 
* END IF
* EXPRESSION
153:     LD  3,-3(1)	Load variable b
154:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
155:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -8
156:     LD  4,-8(1)	Pop left into ac1 
157:    ADD  3,4,3	Op + 
158:     ST  3,-3(1)	Store variable b
* EXPRESSION
159:     LD  3,-5(1)	Load variable bb
160:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
161:    LDC  3,2(6)	Load integer constant 
162:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
163:     LD  3,-3(1)	Load variable b
* TOFF inc: -9
164:     LD  4,-9(1)	Pop left into ac1 
165:    MUL  3,4,3	Op * 
* TOFF inc: -8
166:     LD  4,-8(1)	Pop left into ac1 
167:    ADD  3,4,3	Op + 
168:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
169:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -8
170:     LD  4,-8(1)	Pop left into ac1 
171:    SUB  3,4,3	Op - 
172:     ST  3,-5(1)	Store variable bb
* TOFF set: -8
* END COMPOUND
173:    JMP  7,-114(7)	go to beginning of loop 
 66:    JMP  7,107(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
174:     LD  3,-2(1)	Load variable a
175:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
176:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -8
177:     LD  4,-8(1)	Pop left into ac1 
178:    ADD  3,4,3	Op + 
179:     ST  3,-2(1)	Store variable a
* EXPRESSION
180:     LD  3,-4(1)	Load variable aa
181:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
182:    LDC  3,2(6)	Load integer constant 
183:     ST  3,-9(1)	Push left side 
* TOFF dec: -10
184:     LD  3,-2(1)	Load variable a
* TOFF inc: -9
185:     LD  4,-9(1)	Pop left into ac1 
186:    MUL  3,4,3	Op * 
* TOFF inc: -8
187:     LD  4,-8(1)	Pop left into ac1 
188:    ADD  3,4,3	Op + 
189:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
190:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -8
191:     LD  4,-8(1)	Pop left into ac1 
192:    SUB  3,4,3	Op - 
193:     ST  3,-4(1)	Store variable aa
* TOFF set: -8
* END COMPOUND
194:    JMP  7,-149(7)	go to beginning of loop 
 52:    JMP  7,142(7)	Jump past loop [backpatch] 
* END WHILE
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
195:    LDC  2,0(6)	Set return value to 0 
196:     LD  3,-1(1)	Load return address 
197:     LD  1,0(1)	Adjust fp 
198:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,198(7)	Jump to init [backpatch] 
* INIT
199:    LDA  1,0(0)	set first frame at end of globals 
200:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
201:    LDA  3,1(7)	Return address in ac 
202:    JMP  7,-164(7)	Jump to main 
203:   HALT  0,0,0	DONE! 
* END INIT
