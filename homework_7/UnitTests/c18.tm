* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  c18.c-
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
* TOFF set: -20
 40:    LDC  3,7(6)	load size of array x
 41:     ST  3,-2(1)	save size of array x
 42:    LDC  3,9(6)	load size of array y
 43:     ST  3,-10(1)	save size of array y
* Compound Body
* EXPRESSION
 44:    LDC  3,5(6)	Load integer constant 
 45:     ST  3,-20(1)	Push index 
* TOFF dec: -21
 46:    LDC  3,333(6)	Load integer constant 
* TOFF inc: -20
 47:     LD  4,-20(1)	Pop index 
 48:    LDA  5,-3(1)	Load address of base of array x
 49:    SUB  5,5,4	Compute offset of value 
 50:     ST  3,0(5)	Store variable x
* EXPRESSION
 51:    LDC  3,7(6)	Load integer constant 
 52:     ST  3,-20(1)	Push index 
* TOFF dec: -21
 53:    LDC  3,444(6)	Load integer constant 
* TOFF inc: -20
 54:     LD  4,-20(1)	Pop index 
 55:    LDA  5,-11(1)	Load address of base of array y
 56:    SUB  5,5,4	Compute offset of value 
 57:     ST  3,0(5)	Store variable y
* EXPRESSION
 58:    LDC  3,5(6)	Load integer constant 
 59:     ST  3,-20(1)	Push index 
* TOFF dec: -21
 60:    LDA  3,-11(1)	Load address of base of array y
 61:     ST  3,-21(1)	Push left side 
* TOFF dec: -22
 62:    LDC  3,7(6)	Load integer constant 
* TOFF inc: -21
 63:     LD  4,-21(1)	Pop left into ac1 
 64:    SUB  3,4,3	compute location from index 
 65:     LD  3,0(3)	Load array element 
* TOFF inc: -20
 66:     LD  4,-20(1)	Pop index 
 67:    LDA  5,-3(1)	Load address of base of array x
 68:    SUB  5,5,4	Compute offset of value 
 69:     LD  4,0(5)	load lhs variable x
 70:    ADD  3,4,3	op += 
 71:     ST  3,0(5)	Store variable x
* EXPRESSION
* CALL output
 72:     ST  1,-20(1)	Store fp in ghost frame for output
* TOFF dec: -21
* TOFF dec: -22
* Param 1
 73:    LDA  3,-3(1)	Load address of base of array x
 74:     ST  3,-22(1)	Push left side 
* TOFF dec: -23
 75:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -22
 76:     LD  4,-22(1)	Pop left into ac1 
 77:    SUB  3,4,3	compute location from index 
 78:     LD  3,0(3)	Load array element 
 79:     ST  3,-22(1)	Push parameter 
* TOFF dec: -23
* Param end output
 80:    LDA  1,-20(1)	Ghost frame becomes new active frame 
 81:    LDA  3,1(7)	Return address in ac 
 82:    JMP  7,-77(7)	CALL output
 83:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -20
* EXPRESSION
 84:    LDC  3,7(6)	Load integer constant 
 85:     ST  3,-20(1)	Push index 
* TOFF dec: -21
 86:    LDA  3,-3(1)	Load address of base of array x
 87:     ST  3,-21(1)	Push left side 
* TOFF dec: -22
 88:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -21
 89:     LD  4,-21(1)	Pop left into ac1 
 90:    SUB  3,4,3	compute location from index 
 91:     LD  3,0(3)	Load array element 
* TOFF inc: -20
 92:     LD  4,-20(1)	Pop index 
 93:    LDA  5,-11(1)	Load address of base of array y
 94:    SUB  5,5,4	Compute offset of value 
 95:     LD  4,0(5)	load lhs variable y
 96:    SUB  3,4,3	op -= 
 97:     ST  3,0(5)	Store variable y
* EXPRESSION
* CALL output
 98:     ST  1,-20(1)	Store fp in ghost frame for output
* TOFF dec: -21
* TOFF dec: -22
* Param 1
 99:    LDA  3,-11(1)	Load address of base of array y
100:     ST  3,-22(1)	Push left side 
* TOFF dec: -23
101:    LDC  3,7(6)	Load integer constant 
* TOFF inc: -22
102:     LD  4,-22(1)	Pop left into ac1 
103:    SUB  3,4,3	compute location from index 
104:     LD  3,0(3)	Load array element 
105:     ST  3,-22(1)	Push parameter 
* TOFF dec: -23
* Param end output
106:    LDA  1,-20(1)	Ghost frame becomes new active frame 
107:    LDA  3,1(7)	Return address in ac 
108:    JMP  7,-103(7)	CALL output
109:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -20
* EXPRESSION
* CALL outnl
110:     ST  1,-20(1)	Store fp in ghost frame for outnl
* TOFF dec: -21
* TOFF dec: -22
* Param end outnl
111:    LDA  1,-20(1)	Ghost frame becomes new active frame 
112:    LDA  3,1(7)	Return address in ac 
113:    JMP  7,-80(7)	CALL outnl
114:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -20
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
115:    LDC  2,0(6)	Set return value to 0 
116:     LD  3,-1(1)	Load return address 
117:     LD  1,0(1)	Adjust fp 
118:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,118(7)	Jump to init [backpatch] 
* INIT
119:    LDA  1,0(0)	set first frame at end of globals 
120:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
121:    LDA  3,1(7)	Return address in ac 
122:    JMP  7,-84(7)	Jump to main 
123:   HALT  0,0,0	DONE! 
* END INIT
