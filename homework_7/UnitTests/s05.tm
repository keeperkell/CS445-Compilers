* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  s05.c-
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
* FUNCTION cat
* TOFF set: -2
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -26
 40:    LDC  3,22(6)	load size of array b
 41:     ST  3,-3(1)	save size of array b
* Compound Body
* COMPOUND
* TOFF set: -61
 42:    LDC  3,33(6)	load size of array d
 43:     ST  3,-27(1)	save size of array d
* Compound Body
* EXPRESSION
* CALL output
 44:     ST  1,-61(1)	Store fp in ghost frame for output
* TOFF dec: -62
* TOFF dec: -63
* Param 1
 45:    LDA  3,-2(0)	Load address of base of array h
 46:     LD  3,1(3)	Load array size 
 47:     ST  3,-63(1)	Push parameter 
* TOFF dec: -64
* Param end output
 48:    LDA  1,-61(1)	Ghost frame becomes new active frame 
 49:    LDA  3,1(7)	Return address in ac 
 50:    JMP  7,-45(7)	CALL output
 51:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -61
* EXPRESSION
* CALL output
 52:     ST  1,-61(1)	Store fp in ghost frame for output
* TOFF dec: -62
* TOFF dec: -63
* Param 1
 53:    LDA  3,-4(1)	Load address of base of array b
 54:     LD  3,1(3)	Load array size 
 55:     ST  3,-63(1)	Push parameter 
* TOFF dec: -64
* Param end output
 56:    LDA  1,-61(1)	Ghost frame becomes new active frame 
 57:    LDA  3,1(7)	Return address in ac 
 58:    JMP  7,-53(7)	CALL output
 59:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -61
* EXPRESSION
* CALL output
 60:     ST  1,-61(1)	Store fp in ghost frame for output
* TOFF dec: -62
* TOFF dec: -63
* Param 1
 61:    LDA  3,-15(0)	Load address of base of array bs
 62:     LD  3,1(3)	Load array size 
 63:     ST  3,-63(1)	Push parameter 
* TOFF dec: -64
* Param end output
 64:    LDA  1,-61(1)	Ghost frame becomes new active frame 
 65:    LDA  3,1(7)	Return address in ac 
 66:    JMP  7,-61(7)	CALL output
 67:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -61
* EXPRESSION
* CALL output
 68:     ST  1,-61(1)	Store fp in ghost frame for output
* TOFF dec: -62
* TOFF dec: -63
* Param 1
 69:    LDA  3,-28(1)	Load address of base of array d
 70:     LD  3,1(3)	Load array size 
 71:     ST  3,-63(1)	Push parameter 
* TOFF dec: -64
* Param end output
 72:    LDA  1,-61(1)	Ghost frame becomes new active frame 
 73:    LDA  3,1(7)	Return address in ac 
 74:    JMP  7,-69(7)	CALL output
 75:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -61
* EXPRESSION
* CALL output
 76:     ST  1,-61(1)	Store fp in ghost frame for output
* TOFF dec: -62
* TOFF dec: -63
* Param 1
 77:    LDA  3,-40(0)	Load address of base of array ds
 78:     LD  3,1(3)	Load array size 
 79:     ST  3,-63(1)	Push parameter 
* TOFF dec: -64
* Param end output
 80:    LDA  1,-61(1)	Ghost frame becomes new active frame 
 81:    LDA  3,1(7)	Return address in ac 
 82:    JMP  7,-77(7)	CALL output
 83:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -61
* TOFF set: -26
* END COMPOUND
* COMPOUND
* TOFF set: -72
 84:    LDC  3,44(6)	load size of array d
 85:     ST  3,-27(1)	save size of array d
* Compound Body
* EXPRESSION
* CALL output
 86:     ST  1,-72(1)	Store fp in ghost frame for output
* TOFF dec: -73
* TOFF dec: -74
* Param 1
 87:    LDA  3,-2(0)	Load address of base of array h
 88:     LD  3,1(3)	Load array size 
 89:     ST  3,-74(1)	Push parameter 
* TOFF dec: -75
* Param end output
 90:    LDA  1,-72(1)	Ghost frame becomes new active frame 
 91:    LDA  3,1(7)	Return address in ac 
 92:    JMP  7,-87(7)	CALL output
 93:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -72
* EXPRESSION
* CALL output
 94:     ST  1,-72(1)	Store fp in ghost frame for output
* TOFF dec: -73
* TOFF dec: -74
* Param 1
 95:    LDA  3,-4(1)	Load address of base of array b
 96:     LD  3,1(3)	Load array size 
 97:     ST  3,-74(1)	Push parameter 
* TOFF dec: -75
* Param end output
 98:    LDA  1,-72(1)	Ghost frame becomes new active frame 
 99:    LDA  3,1(7)	Return address in ac 
100:    JMP  7,-95(7)	CALL output
101:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -72
* EXPRESSION
* CALL output
102:     ST  1,-72(1)	Store fp in ghost frame for output
* TOFF dec: -73
* TOFF dec: -74
* Param 1
103:    LDA  3,-15(0)	Load address of base of array bs
104:     LD  3,1(3)	Load array size 
105:     ST  3,-74(1)	Push parameter 
* TOFF dec: -75
* Param end output
106:    LDA  1,-72(1)	Ghost frame becomes new active frame 
107:    LDA  3,1(7)	Return address in ac 
108:    JMP  7,-103(7)	CALL output
109:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -72
* EXPRESSION
* CALL output
110:     ST  1,-72(1)	Store fp in ghost frame for output
* TOFF dec: -73
* TOFF dec: -74
* Param 1
111:    LDA  3,-28(1)	Load address of base of array d
112:     LD  3,1(3)	Load array size 
113:     ST  3,-74(1)	Push parameter 
* TOFF dec: -75
* Param end output
114:    LDA  1,-72(1)	Ghost frame becomes new active frame 
115:    LDA  3,1(7)	Return address in ac 
116:    JMP  7,-111(7)	CALL output
117:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -72
* EXPRESSION
* CALL output
118:     ST  1,-72(1)	Store fp in ghost frame for output
* TOFF dec: -73
* TOFF dec: -74
* Param 1
119:    LDA  3,-76(0)	Load address of base of array ds
120:     LD  3,1(3)	Load array size 
121:     ST  3,-74(1)	Push parameter 
* TOFF dec: -75
* Param end output
122:    LDA  1,-72(1)	Ghost frame becomes new active frame 
123:    LDA  3,1(7)	Return address in ac 
124:    JMP  7,-119(7)	CALL output
125:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -72
* TOFF set: -26
* END COMPOUND
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
126:    LDC  2,0(6)	Set return value to 0 
127:     LD  3,-1(1)	Load return address 
128:     LD  1,0(1)	Adjust fp 
129:    JMP  7,0(3)	Return 
* END FUNCTION cat
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION dog
* TOFF set: -2
130:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -2
* Compound Body
* EXPRESSION
* CALL output
131:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
132:    LDA  3,-123(0)	Load address of base of array j
133:     LD  3,1(3)	Load array size 
134:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
135:    LDA  1,-2(1)	Ghost frame becomes new active frame 
136:    LDA  3,1(7)	Return address in ac 
137:    JMP  7,-132(7)	CALL output
138:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
139:    LDC  2,0(6)	Set return value to 0 
140:     LD  3,-1(1)	Load return address 
141:     LD  1,0(1)	Adjust fp 
142:    JMP  7,0(3)	Return 
* END FUNCTION dog
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
143:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -2
* Compound Body
* EXPRESSION
* CALL cat
144:     ST  1,-2(1)	Store fp in ghost frame for cat
* TOFF dec: -3
* TOFF dec: -4
* Param end cat
145:    LDA  1,-2(1)	Ghost frame becomes new active frame 
146:    LDA  3,1(7)	Return address in ac 
147:    JMP  7,-109(7)	CALL cat
148:    LDA  3,0(2)	Save the result in ac 
* Call end cat
* TOFF set: -2
* EXPRESSION
* CALL dog
149:     ST  1,-2(1)	Store fp in ghost frame for dog
* TOFF dec: -3
* TOFF dec: -4
* Param end dog
150:    LDA  1,-2(1)	Ghost frame becomes new active frame 
151:    LDA  3,1(7)	Return address in ac 
152:    JMP  7,-23(7)	CALL dog
153:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -2
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
154:    LDC  2,0(6)	Set return value to 0 
155:     LD  3,-1(1)	Load return address 
156:     LD  1,0(1)	Adjust fp 
157:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,157(7)	Jump to init [backpatch] 
* INIT
158:    LDA  1,-178(0)	set first frame at end of globals 
159:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
160:    LDC  3,23(6)	load size of array bs
161:     ST  3,-14(0)	save size of array bs
162:    LDC  3,34(6)	load size of array ds
163:     ST  3,-39(0)	save size of array ds
164:    LDC  3,45(6)	load size of array ds
165:     ST  3,-75(0)	save size of array ds
166:    LDC  3,11(6)	load size of array h
167:     ST  3,-1(0)	save size of array h
168:    LDC  3,55(6)	load size of array j
169:     ST  3,-122(0)	save size of array j
* END INIT GLOBALS AND STATICS
170:    LDA  3,1(7)	Return address in ac 
171:    JMP  7,-29(7)	Jump to main 
172:   HALT  0,0,0	DONE! 
* END INIT
