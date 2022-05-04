* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  s04.c-
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
* TOFF set: -3
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* IF
 40:     LD  3,-2(1)	Load variable d
 41:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 42:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -3
 43:     LD  4,-3(1)	Pop left into ac1 
 44:    TEQ  3,4,3	Op = 
* THEN
* EXPRESSION
* CALL output
 46:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 47:     LD  3,-1(0)	Load variable s
 48:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 49:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 50:    LDA  3,1(7)	Return address in ac 
 51:    JMP  7,-46(7)	CALL output
 52:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
 45:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
 54:     LD  3,-2(1)	Load variable d
 55:     ST  3,-1(0)	Store variable s
 53:    JMP  7,2(7)	Jump around the ELSE [backpatch] 
* END IF
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
 56:    LDC  2,0(6)	Set return value to 0 
 57:     LD  3,-1(1)	Load return address 
 58:     LD  1,0(1)	Adjust fp 
 59:    JMP  7,0(3)	Return 
* END FUNCTION dog
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION cat
* TOFF set: -3
 60:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* IF
 61:     LD  3,-2(1)	Load variable c
 62:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 63:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -3
 64:     LD  4,-3(1)	Pop left into ac1 
 65:    TEQ  3,4,3	Op = 
* THEN
* EXPRESSION
* CALL output
 67:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 68:     LD  3,-2(0)	Load variable s
 69:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 70:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 71:    LDA  3,1(7)	Return address in ac 
 72:    JMP  7,-67(7)	CALL output
 73:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
 66:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
 75:     LD  3,-2(1)	Load variable c
 76:     ST  3,-2(0)	Store variable s
 74:    JMP  7,2(7)	Jump around the ELSE [backpatch] 
* END IF
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
 77:    LDC  2,0(6)	Set return value to 0 
 78:     LD  3,-1(1)	Load return address 
 79:     LD  1,0(1)	Adjust fp 
 80:    JMP  7,0(3)	Return 
* END FUNCTION cat
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
 81:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -2
* Compound Body
* EXPRESSION
 82:    LDC  3,333(6)	Load integer constant 
 83:     ST  3,0(0)	Store variable s
* EXPRESSION
* CALL dog
 84:     ST  1,-2(1)	Store fp in ghost frame for dog
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 85:    LDC  3,111(6)	Load integer constant 
 86:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end dog
 87:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 88:    LDA  3,1(7)	Return address in ac 
 89:    JMP  7,-51(7)	CALL dog
 90:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -2
* EXPRESSION
* CALL cat
 91:     ST  1,-2(1)	Store fp in ghost frame for cat
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 92:    LDC  3,222(6)	Load integer constant 
 93:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end cat
 94:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 95:    LDA  3,1(7)	Return address in ac 
 96:    JMP  7,-37(7)	CALL cat
 97:    LDA  3,0(2)	Save the result in ac 
* Call end cat
* TOFF set: -2
* EXPRESSION
* CALL dog
 98:     ST  1,-2(1)	Store fp in ghost frame for dog
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 99:    LDC  3,0(6)	Load integer constant 
100:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end dog
101:    LDA  1,-2(1)	Ghost frame becomes new active frame 
102:    LDA  3,1(7)	Return address in ac 
103:    JMP  7,-65(7)	CALL dog
104:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -2
* EXPRESSION
* CALL cat
105:     ST  1,-2(1)	Store fp in ghost frame for cat
* TOFF dec: -3
* TOFF dec: -4
* Param 1
106:    LDC  3,0(6)	Load integer constant 
107:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end cat
108:    LDA  1,-2(1)	Ghost frame becomes new active frame 
109:    LDA  3,1(7)	Return address in ac 
110:    JMP  7,-51(7)	CALL cat
111:    LDA  3,0(2)	Save the result in ac 
* Call end cat
* TOFF set: -2
* EXPRESSION
* CALL output
112:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
113:     LD  3,0(0)	Load variable s
114:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
115:    LDA  1,-2(1)	Ghost frame becomes new active frame 
116:    LDA  3,1(7)	Return address in ac 
117:    JMP  7,-112(7)	CALL output
118:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
119:    LDC  2,0(6)	Set return value to 0 
120:     LD  3,-1(1)	Load return address 
121:     LD  1,0(1)	Adjust fp 
122:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,122(7)	Jump to init [backpatch] 
* INIT
123:    LDA  1,-3(0)	set first frame at end of globals 
124:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
125:    LDA  3,1(7)	Return address in ac 
126:    JMP  7,-46(7)	Jump to main 
127:   HALT  0,0,0	DONE! 
* END INIT
