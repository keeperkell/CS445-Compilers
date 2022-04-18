* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  pushpopcall3.c-
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
* TOFF set: -5
 40:    LDC  3,7(6)	Load integer constant 
 41:     ST  3,-4(1)	Store variable p
* Compound Body
* RETURN
 42:     LD  3,-2(1)	Load variable x
 43:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 44:     LD  3,-4(1)	Load variable p
* TOFF inc: -5
 45:     LD  4,-5(1)	Pop left into ac1 
 46:    MOD  3,4,3	Op % 
 47:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 48:     LD  3,-3(1)	Load variable y
 49:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
 50:     LD  3,-4(1)	Load variable p
* TOFF inc: -6
 51:     LD  4,-6(1)	Pop left into ac1 
 52:    MOD  3,4,3	Op % 
* TOFF inc: -5
 53:     LD  4,-5(1)	Pop left into ac1 
 54:    ADD  3,4,3	Op + 
 55:    LDA  2,0(3)	Copy result to return register 
 56:     LD  3,-1(1)	Load return address 
 57:     LD  1,0(1)	Adjust fp 
 58:    JMP  7,0(3)	Return 
* TOFF set: -4
* END COMPOUND
* Add standard closing in case there is no return statement
 59:    LDC  2,0(6)	Set return value to 0 
 60:     LD  3,-1(1)	Load return address 
 61:     LD  1,0(1)	Adjust fp 
 62:    JMP  7,0(3)	Return 
* END FUNCTION dog
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
 63:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -5
 64:    LDC  3,1000(6)	Load integer constant 
 65:     ST  3,-2(1)	Store variable a
 66:    LDC  3,2000(6)	Load integer constant 
 67:     ST  3,-3(1)	Store variable b
 68:    LDC  3,3000(6)	Load integer constant 
 69:     ST  3,-4(1)	Store variable c
* Compound Body
* EXPRESSION
* CALL output
 70:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
* CALL dog
 71:     ST  1,-7(1)	Store fp in ghost frame for dog
* TOFF dec: -8
* TOFF dec: -9
* Param 1
 72:     LD  3,-2(1)	Load variable a
 73:     ST  3,-9(1)	Push parameter 
* TOFF dec: -10
* Param 2
 74:    LDC  3,2(6)	Load integer constant 
 75:     ST  3,-10(1)	Push left side 
* TOFF dec: -11
 76:     LD  3,-3(1)	Load variable b
* TOFF inc: -10
 77:     LD  4,-10(1)	Pop left into ac1 
 78:    MUL  3,4,3	Op * 
 79:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end dog
 80:    LDA  1,-7(1)	Ghost frame becomes new active frame 
 81:    LDA  3,1(7)	Return address in ac 
 82:    JMP  7,-44(7)	CALL dog
 83:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -7
 84:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
 85:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 86:    LDA  3,1(7)	Return address in ac 
 87:    JMP  7,-82(7)	CALL output
 88:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* COMPOUND
* TOFF set: -8
* Compound Body
* EXPRESSION
 89:     LD  3,-2(1)	Load variable a
 90:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
 91:     LD  3,0(0)	Load variable g
* TOFF inc: -8
 92:     LD  4,-8(1)	Pop left into ac1 
 93:    ADD  3,4,3	Op + 
 94:     ST  3,-6(1)	Store variable y
* EXPRESSION
* CALL output
 95:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
* CALL dog
 96:     ST  1,-10(1)	Store fp in ghost frame for dog
* TOFF dec: -11
* TOFF dec: -12
* Param 1
 97:     LD  3,0(0)	Load variable g
 98:     ST  3,-12(1)	Push parameter 
* TOFF dec: -13
* Param 2
 99:     LD  3,-6(1)	Load variable y
100:     ST  3,-13(1)	Push parameter 
* TOFF dec: -14
* Param end dog
101:    LDA  1,-10(1)	Ghost frame becomes new active frame 
102:    LDA  3,1(7)	Return address in ac 
103:    JMP  7,-65(7)	CALL dog
104:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -10
105:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
106:    LDA  1,-8(1)	Ghost frame becomes new active frame 
107:    LDA  3,1(7)	Return address in ac 
108:    JMP  7,-103(7)	CALL output
109:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* EXPRESSION
* CALL output
110:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
111:     LD  3,0(0)	Load variable g
112:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
113:    LDA  1,-8(1)	Ghost frame becomes new active frame 
114:    LDA  3,1(7)	Return address in ac 
115:    JMP  7,-110(7)	CALL output
116:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* TOFF set: -5
* END COMPOUND
* EXPRESSION
* CALL output
117:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
118:    LDC  3,999(6)	Load integer constant 
119:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
* CALL dog
120:     ST  1,-8(1)	Store fp in ghost frame for dog
* TOFF dec: -9
* TOFF dec: -10
* Param 1
121:    LDC  3,333(6)	Load integer constant 
122:     ST  3,-10(1)	Push left side 
* TOFF dec: -11
123:    LDC  3,33(6)	Load integer constant 
124:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
125:     LD  3,0(0)	Load variable g
* TOFF inc: -11
126:     LD  4,-11(1)	Pop left into ac1 
127:    MUL  3,4,3	Op * 
* TOFF inc: -10
128:     LD  4,-10(1)	Pop left into ac1 
129:    ADD  3,4,3	Op + 
130:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param 2
131:     LD  3,-3(1)	Load variable b
132:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
133:    LDC  3,17(6)	Load integer constant 
* TOFF inc: -11
134:     LD  4,-11(1)	Pop left into ac1 
135:    MOD  3,4,3	Op % 
136:     ST  3,-11(1)	Push left side 
* TOFF dec: -12
137:     LD  3,-4(1)	Load variable c
* TOFF inc: -11
138:     LD  4,-11(1)	Pop left into ac1 
139:    ADD  3,4,3	Op + 
140:     ST  3,-11(1)	Push parameter 
* TOFF dec: -12
* Param end dog
141:    LDA  1,-8(1)	Ghost frame becomes new active frame 
142:    LDA  3,1(7)	Return address in ac 
143:    JMP  7,-105(7)	CALL dog
144:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -8
* TOFF inc: -7
145:     LD  4,-7(1)	Pop left into ac1 
146:    ADD  3,4,3	Op + 
147:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
148:    LDA  1,-5(1)	Ghost frame becomes new active frame 
149:    LDA  3,1(7)	Return address in ac 
150:    JMP  7,-145(7)	CALL output
151:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
152:    LDC  2,0(6)	Set return value to 0 
153:     LD  3,-1(1)	Load return address 
154:     LD  1,0(1)	Adjust fp 
155:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,155(7)	Jump to init [backpatch] 
* INIT
156:    LDA  1,-1(0)	set first frame at end of globals 
157:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
158:    LDC  3,4000(6)	Load integer constant 
159:     ST  3,0(0)	Store variable g
* END INIT GLOBALS AND STATICS
160:    LDA  3,1(7)	Return address in ac 
161:    JMP  7,-99(7)	Jump to main 
162:   HALT  0,0,0	DONE! 
* END INIT
