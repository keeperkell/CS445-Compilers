* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  u03.c-
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
* EXPRESSION
 40:    LDC  3,0(6)	Load integer constant 
 41:     ST  3,-2(1)	Store variable x
* WHILE
 42:     LD  3,-2(1)	Load variable x
 43:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 44:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -3
 45:     LD  4,-3(1)	Pop left into ac1 
 46:    TLT  3,4,3	Op < 
 47:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
* CALL output
 49:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 50:     LD  3,-2(1)	Load variable x
 51:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 52:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 53:    LDA  3,1(7)	Return address in ac 
 54:    JMP  7,-49(7)	CALL output
 55:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* IF
 56:     LD  3,-2(1)	Load variable x
 57:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 58:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -3
 59:     LD  4,-3(1)	Pop left into ac1 
 60:    TLE  3,4,3	Op <= 
* THEN
* EXPRESSION
* CALL outputc
 62:     ST  1,-3(1)	Store fp in ghost frame for outputc
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 63:    LDC  3,65(6)	Load char constant 
 64:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end outputc
 65:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 66:    LDA  3,1(7)	Return address in ac 
 67:    JMP  7,-40(7)	CALL outputc
 68:    LDA  3,0(2)	Save the result in ac 
* Call end outputc
* TOFF set: -3
 61:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
 70:     LD  3,-2(1)	Load variable x
 71:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 72:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
 73:     LD  4,-3(1)	Pop left into ac1 
 74:    TLE  3,4,3	Op <= 
* THEN
* EXPRESSION
* CALL outputc
 76:     ST  1,-3(1)	Store fp in ghost frame for outputc
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 77:    LDC  3,66(6)	Load char constant 
 78:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end outputc
 79:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 80:    LDA  3,1(7)	Return address in ac 
 81:    JMP  7,-54(7)	CALL outputc
 82:    LDA  3,0(2)	Save the result in ac 
* Call end outputc
* TOFF set: -3
 75:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
 84:     LD  3,-2(1)	Load variable x
 85:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 86:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -3
 87:     LD  4,-3(1)	Pop left into ac1 
 88:    TLE  3,4,3	Op <= 
* THEN
* EXPRESSION
* CALL outputc
 90:     ST  1,-3(1)	Store fp in ghost frame for outputc
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 91:    LDC  3,67(6)	Load char constant 
 92:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end outputc
 93:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 94:    LDA  3,1(7)	Return address in ac 
 95:    JMP  7,-68(7)	CALL outputc
 96:    LDA  3,0(2)	Save the result in ac 
* Call end outputc
* TOFF set: -3
 89:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
 98:     LD  3,-2(1)	Load variable x
 99:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
100:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -3
101:     LD  4,-3(1)	Pop left into ac1 
102:    TLE  3,4,3	Op <= 
* THEN
* EXPRESSION
* CALL outputc
104:     ST  1,-3(1)	Store fp in ghost frame for outputc
* TOFF dec: -4
* TOFF dec: -5
* Param 1
105:    LDC  3,68(6)	Load char constant 
106:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end outputc
107:    LDA  1,-3(1)	Ghost frame becomes new active frame 
108:    LDA  3,1(7)	Return address in ac 
109:    JMP  7,-82(7)	CALL outputc
110:    LDA  3,0(2)	Save the result in ac 
* Call end outputc
* TOFF set: -3
103:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
* CALL outputc
112:     ST  1,-3(1)	Store fp in ghost frame for outputc
* TOFF dec: -4
* TOFF dec: -5
* Param 1
113:    LDC  3,69(6)	Load char constant 
114:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end outputc
115:    LDA  1,-3(1)	Ghost frame becomes new active frame 
116:    LDA  3,1(7)	Return address in ac 
117:    JMP  7,-90(7)	CALL outputc
118:    LDA  3,0(2)	Save the result in ac 
* Call end outputc
* TOFF set: -3
111:    JMP  7,7(7)	Jump around the ELSE [backpatch] 
* END IF
 97:    JMP  7,21(7)	Jump around the ELSE [backpatch] 
* END IF
 83:    JMP  7,35(7)	Jump around the ELSE [backpatch] 
* END IF
 69:    JMP  7,49(7)	Jump around the ELSE [backpatch] 
* END IF
* EXPRESSION
* CALL outnl
119:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
120:    LDA  1,-3(1)	Ghost frame becomes new active frame 
121:    LDA  3,1(7)	Return address in ac 
122:    JMP  7,-89(7)	CALL outnl
123:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* EXPRESSION
* CALL output
124:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
125:     LD  3,-2(1)	Load variable x
126:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
127:    LDA  1,-3(1)	Ghost frame becomes new active frame 
128:    LDA  3,1(7)	Return address in ac 
129:    JMP  7,-124(7)	CALL output
130:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* IF
131:     LD  3,-2(1)	Load variable x
132:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
133:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -3
134:     LD  4,-3(1)	Pop left into ac1 
135:    TLE  3,4,3	Op <= 
* THEN
* EXPRESSION
* CALL outputc
137:     ST  1,-3(1)	Store fp in ghost frame for outputc
* TOFF dec: -4
* TOFF dec: -5
* Param 1
138:    LDC  3,65(6)	Load char constant 
139:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end outputc
140:    LDA  1,-3(1)	Ghost frame becomes new active frame 
141:    LDA  3,1(7)	Return address in ac 
142:    JMP  7,-115(7)	CALL outputc
143:    LDA  3,0(2)	Save the result in ac 
* Call end outputc
* TOFF set: -3
136:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
145:     LD  3,-2(1)	Load variable x
146:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
147:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
148:     LD  4,-3(1)	Pop left into ac1 
149:    TLE  3,4,3	Op <= 
* THEN
* EXPRESSION
* CALL outputc
151:     ST  1,-3(1)	Store fp in ghost frame for outputc
* TOFF dec: -4
* TOFF dec: -5
* Param 1
152:    LDC  3,66(6)	Load char constant 
153:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end outputc
154:    LDA  1,-3(1)	Ghost frame becomes new active frame 
155:    LDA  3,1(7)	Return address in ac 
156:    JMP  7,-129(7)	CALL outputc
157:    LDA  3,0(2)	Save the result in ac 
* Call end outputc
* TOFF set: -3
150:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
159:     LD  3,-2(1)	Load variable x
160:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
161:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -3
162:     LD  4,-3(1)	Pop left into ac1 
163:    TLE  3,4,3	Op <= 
* THEN
* EXPRESSION
* CALL outputc
165:     ST  1,-3(1)	Store fp in ghost frame for outputc
* TOFF dec: -4
* TOFF dec: -5
* Param 1
166:    LDC  3,67(6)	Load char constant 
167:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end outputc
168:    LDA  1,-3(1)	Ghost frame becomes new active frame 
169:    LDA  3,1(7)	Return address in ac 
170:    JMP  7,-143(7)	CALL outputc
171:    LDA  3,0(2)	Save the result in ac 
* Call end outputc
* TOFF set: -3
164:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
173:     LD  3,-2(1)	Load variable x
174:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
175:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -3
176:     LD  4,-3(1)	Pop left into ac1 
177:    TLE  3,4,3	Op <= 
* THEN
* EXPRESSION
* CALL outputc
179:     ST  1,-3(1)	Store fp in ghost frame for outputc
* TOFF dec: -4
* TOFF dec: -5
* Param 1
180:    LDC  3,68(6)	Load char constant 
181:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end outputc
182:    LDA  1,-3(1)	Ghost frame becomes new active frame 
183:    LDA  3,1(7)	Return address in ac 
184:    JMP  7,-157(7)	CALL outputc
185:    LDA  3,0(2)	Save the result in ac 
* Call end outputc
* TOFF set: -3
178:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
* CALL outputc
187:     ST  1,-3(1)	Store fp in ghost frame for outputc
* TOFF dec: -4
* TOFF dec: -5
* Param 1
188:    LDC  3,69(6)	Load char constant 
189:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end outputc
190:    LDA  1,-3(1)	Ghost frame becomes new active frame 
191:    LDA  3,1(7)	Return address in ac 
192:    JMP  7,-165(7)	CALL outputc
193:    LDA  3,0(2)	Save the result in ac 
* Call end outputc
* TOFF set: -3
186:    JMP  7,7(7)	Jump around the ELSE [backpatch] 
* END IF
172:    JMP  7,21(7)	Jump around the ELSE [backpatch] 
* END IF
158:    JMP  7,35(7)	Jump around the ELSE [backpatch] 
* END IF
144:    JMP  7,49(7)	Jump around the ELSE [backpatch] 
* END IF
* EXPRESSION
* CALL outnl
194:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
195:    LDA  1,-3(1)	Ghost frame becomes new active frame 
196:    LDA  3,1(7)	Return address in ac 
197:    JMP  7,-164(7)	CALL outnl
198:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* EXPRESSION
199:     LD  3,-2(1)	load lhs variable x
200:    LDA  3,1(3)	increment value of x
201:     ST  3,-2(1)	Store variable x
* TOFF set: -3
* END COMPOUND
202:    JMP  7,-161(7)	go to beginning of loop 
 48:    JMP  7,154(7)	Jump past loop [backpatch] 
* END WHILE
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
203:    LDC  2,0(6)	Set return value to 0 
204:     LD  3,-1(1)	Load return address 
205:     LD  1,0(1)	Adjust fp 
206:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,206(7)	Jump to init [backpatch] 
* INIT
207:    LDA  1,0(0)	set first frame at end of globals 
208:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
209:    LDA  3,1(7)	Return address in ac 
210:    JMP  7,-172(7)	Jump to main 
211:   HALT  0,0,0	DONE! 
* END INIT
