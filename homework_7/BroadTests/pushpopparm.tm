* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  pushpopparm.c-
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
* FUNCTION dog
* TOFF set: -4
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -4
* Compound Body
* EXPRESSION
* CALL output
 40:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 41:     LD  3,-2(1)	Load variable a
 42:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
 43:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 44:    LDA  3,1(7)	Return address in ac 
 45:    JMP  7,-40(7)	CALL output
 46:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
* CALL output
 47:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 48:     LD  3,-3(1)	Load address of base of array b
 49:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
 50:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -6
 51:     LD  4,-6(1)	Pop left into ac1 
 52:    SUB  3,4,3	compute location from index 
 53:     LD  3,0(3)	Load array element 
 54:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
 55:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 56:    LDA  3,1(7)	Return address in ac 
 57:    JMP  7,-52(7)	CALL output
 58:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
* CALL outnl
 59:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
 60:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 61:    LDA  3,1(7)	Return address in ac 
 62:    JMP  7,-29(7)	CALL outnl
 63:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
* RETURN
 64:     LD  3,-2(1)	Load variable a
 65:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 66:     LD  3,-3(1)	Load address of base of array b
 67:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 68:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -5
 69:     LD  4,-5(1)	Pop left into ac1 
 70:    SUB  3,4,3	compute location from index 
 71:     LD  3,0(3)	Load array element 
* TOFF inc: -4
 72:     LD  4,-4(1)	Pop left into ac1 
 73:    ADD  3,4,3	Op + 
 74:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 75:    LDA  3,-2(0)	Load address of base of array h
 76:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 77:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -5
 78:     LD  4,-5(1)	Pop left into ac1 
 79:    SUB  3,4,3	compute location from index 
 80:     LD  3,0(3)	Load array element 
* TOFF inc: -4
 81:     LD  4,-4(1)	Pop left into ac1 
 82:    ADD  3,4,3	Op + 
 83:    LDA  2,0(3)	Copy result to return register 
 84:     LD  3,-1(1)	Load return address 
 85:     LD  1,0(1)	Adjust fp 
 86:    JMP  7,0(3)	Return 
* TOFF set: -4
* END COMPOUND
* Add standard closing in case there is no return statement
 87:    LDC  2,0(6)	Set return value to 0 
 88:     LD  3,-1(1)	Load return address 
 89:     LD  1,0(1)	Adjust fp 
 90:    JMP  7,0(3)	Return 
* END FUNCTION dog
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
 91:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -12
 92:    LDC  3,8(6)	load size of array q
 93:     ST  3,-3(1)	save size of array q
* Compound Body
* EXPRESSION
 94:    LDC  3,100(6)	Load integer constant 
 95:     ST  3,-2(1)	Store variable p
* EXPRESSION
 96:    LDC  3,3(6)	Load integer constant 
 97:     ST  3,-12(1)	Push index 
* TOFF dec: -13
 98:    LDC  3,1000(6)	Load integer constant 
* TOFF inc: -12
 99:     LD  4,-12(1)	Pop index 
100:    LDA  5,-4(1)	Load address of base of array q
101:    SUB  5,5,4	Compute offset of value 
102:     ST  3,0(5)	Store variable q
* EXPRESSION
103:    LDC  3,200(6)	Load integer constant 
104:     ST  3,0(0)	Store variable g
* EXPRESSION
105:    LDC  3,3(6)	Load integer constant 
106:     ST  3,-12(1)	Push index 
* TOFF dec: -13
107:    LDC  3,2000(6)	Load integer constant 
* TOFF inc: -12
108:     LD  4,-12(1)	Pop index 
109:    LDA  5,-2(0)	Load address of base of array h
110:    SUB  5,5,4	Compute offset of value 
111:     ST  3,0(5)	Store variable h
* EXPRESSION
112:    LDC  3,0(6)	Load integer constant 
113:     ST  3,-12(1)	Push index 
* TOFF dec: -13
114:    LDC  3,8(6)	Load integer constant 
* TOFF inc: -12
115:     LD  4,-12(1)	Pop index 
116:    LDA  5,-2(0)	Load address of base of array h
117:    SUB  5,5,4	Compute offset of value 
118:     ST  3,0(5)	Store variable h
* EXPRESSION
* CALL output
119:     ST  1,-12(1)	Store fp in ghost frame for output
* TOFF dec: -13
* TOFF dec: -14
* Param 1
* CALL dog
120:     ST  1,-14(1)	Store fp in ghost frame for dog
* TOFF dec: -15
* TOFF dec: -16
* Param 1
121:     LD  3,-2(1)	Load variable p
122:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param 2
123:    LDA  3,-4(1)	Load address of base of array q
124:     ST  3,-17(1)	Push parameter 
* TOFF dec: -18
* Param end dog
125:    LDA  1,-14(1)	Ghost frame becomes new active frame 
126:    LDA  3,1(7)	Return address in ac 
127:    JMP  7,-89(7)	CALL dog
128:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -14
129:     ST  3,-14(1)	Push parameter 
* TOFF dec: -15
* Param end output
130:    LDA  1,-12(1)	Ghost frame becomes new active frame 
131:    LDA  3,1(7)	Return address in ac 
132:    JMP  7,-127(7)	CALL output
133:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -12
* EXPRESSION
* CALL outnl
134:     ST  1,-12(1)	Store fp in ghost frame for outnl
* TOFF dec: -13
* TOFF dec: -14
* Param end outnl
135:    LDA  1,-12(1)	Ghost frame becomes new active frame 
136:    LDA  3,1(7)	Return address in ac 
137:    JMP  7,-104(7)	CALL outnl
138:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -12
* EXPRESSION
* CALL output
139:     ST  1,-12(1)	Store fp in ghost frame for output
* TOFF dec: -13
* TOFF dec: -14
* Param 1
* CALL dog
140:     ST  1,-14(1)	Store fp in ghost frame for dog
* TOFF dec: -15
* TOFF dec: -16
* Param 1
141:     LD  3,0(0)	Load variable g
142:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param 2
143:    LDA  3,-2(0)	Load address of base of array h
144:     ST  3,-17(1)	Push parameter 
* TOFF dec: -18
* Param end dog
145:    LDA  1,-14(1)	Ghost frame becomes new active frame 
146:    LDA  3,1(7)	Return address in ac 
147:    JMP  7,-109(7)	CALL dog
148:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -14
149:     ST  3,-14(1)	Push parameter 
* TOFF dec: -15
* Param end output
150:    LDA  1,-12(1)	Ghost frame becomes new active frame 
151:    LDA  3,1(7)	Return address in ac 
152:    JMP  7,-147(7)	CALL output
153:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -12
* EXPRESSION
* CALL outnl
154:     ST  1,-12(1)	Store fp in ghost frame for outnl
* TOFF dec: -13
* TOFF dec: -14
* Param end outnl
155:    LDA  1,-12(1)	Ghost frame becomes new active frame 
156:    LDA  3,1(7)	Return address in ac 
157:    JMP  7,-124(7)	CALL outnl
158:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -12
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
159:    LDC  2,0(6)	Set return value to 0 
160:     LD  3,-1(1)	Load return address 
161:     LD  1,0(1)	Adjust fp 
162:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,162(7)	Jump to init [backpatch] 
* INIT
163:    LDA  1,-12(0)	set first frame at end of globals 
164:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
165:    LDC  3,10(6)	load size of array h
166:     ST  3,-1(0)	save size of array h
* END INIT GLOBALS AND STATICS
167:    LDA  3,1(7)	Return address in ac 
168:    JMP  7,-78(7)	Jump to main 
169:   HALT  0,0,0	DONE! 
* END INIT
