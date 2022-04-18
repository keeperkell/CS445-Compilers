* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  pushpopcall2.c-
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
* RETURN
 40:     LD  3,-2(1)	Load variable x
 41:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 42:     LD  3,-3(1)	Load variable y
* TOFF inc: -4
 43:     LD  4,-4(1)	Pop left into ac1 
 44:    MUL  3,4,3	Op * 
 45:    LDA  2,0(3)	Copy result to return register 
 46:     LD  3,-1(1)	Load return address 
 47:     LD  1,0(1)	Adjust fp 
 48:    JMP  7,0(3)	Return 
* TOFF set: -4
* END COMPOUND
* Add standard closing in case there is no return statement
 49:    LDC  2,0(6)	Set return value to 0 
 50:     LD  3,-1(1)	Load return address 
 51:     LD  1,0(1)	Adjust fp 
 52:    JMP  7,0(3)	Return 
* END FUNCTION dog
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
 53:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -2
* Compound Body
* EXPRESSION
* CALL output
 54:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
* CALL dog
 55:     ST  1,-4(1)	Store fp in ghost frame for dog
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 56:    LDC  3,111(6)	Load integer constant 
 57:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param 2
 58:    LDC  3,222(6)	Load integer constant 
 59:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end dog
 60:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 61:    LDA  3,1(7)	Return address in ac 
 62:    JMP  7,-24(7)	CALL dog
 63:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -4
 64:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
 65:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 66:    LDA  3,1(7)	Return address in ac 
 67:    JMP  7,-62(7)	CALL output
 68:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* COMPOUND
* TOFF set: -5
* Compound Body
* EXPRESSION
 69:    LDC  3,333(6)	Load integer constant 
 70:     ST  3,-2(1)	Store variable x
* EXPRESSION
 71:    LDC  3,444(6)	Load integer constant 
 72:     ST  3,-3(1)	Store variable y
* EXPRESSION
 73:    LDC  3,555(6)	Load integer constant 
 74:     ST  3,-4(1)	Store variable z
* EXPRESSION
* CALL output
 75:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
* CALL dog
 76:     ST  1,-7(1)	Store fp in ghost frame for dog
* TOFF dec: -8
* TOFF dec: -9
* Param 1
 77:     LD  3,-2(1)	Load variable x
 78:     ST  3,-9(1)	Push parameter 
* TOFF dec: -10
* Param 2
 79:     LD  3,-3(1)	Load variable y
 80:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end dog
 81:    LDA  1,-7(1)	Ghost frame becomes new active frame 
 82:    LDA  3,1(7)	Return address in ac 
 83:    JMP  7,-45(7)	CALL dog
 84:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -7
 85:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
 86:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 87:    LDA  3,1(7)	Return address in ac 
 88:    JMP  7,-83(7)	CALL output
 89:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* TOFF set: -2
* END COMPOUND
* EXPRESSION
* CALL output
 90:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
* CALL dog
 91:     ST  1,-4(1)	Store fp in ghost frame for dog
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 92:    LDC  3,333(6)	Load integer constant 
 93:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
 94:    LDC  3,33(6)	Load integer constant 
* TOFF inc: -6
 95:     LD  4,-6(1)	Pop left into ac1 
 96:    ADD  3,4,3	Op + 
 97:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param 2
 98:    LDC  3,444(6)	Load integer constant 
 99:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
100:    LDC  3,44(6)	Load integer constant 
* TOFF inc: -7
101:     LD  4,-7(1)	Pop left into ac1 
102:    MUL  3,4,3	Op * 
103:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end dog
104:    LDA  1,-4(1)	Ghost frame becomes new active frame 
105:    LDA  3,1(7)	Return address in ac 
106:    JMP  7,-68(7)	CALL dog
107:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -4
108:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
109:    LDA  1,-2(1)	Ghost frame becomes new active frame 
110:    LDA  3,1(7)	Return address in ac 
111:    JMP  7,-106(7)	CALL output
112:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
113:    LDC  2,0(6)	Set return value to 0 
114:     LD  3,-1(1)	Load return address 
115:     LD  1,0(1)	Adjust fp 
116:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,116(7)	Jump to init [backpatch] 
* INIT
117:    LDA  1,-1(0)	set first frame at end of globals 
118:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
119:    LDA  3,1(7)	Return address in ac 
120:    JMP  7,-68(7)	Jump to main 
121:   HALT  0,0,0	DONE! 
* END INIT
