* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  array2.c-
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
* FUNCTION ford
* TOFF set: -3
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -4
* Compound Body
* EXPRESSION
 40:     LD  3,-2(1)	Load address of base of array x
 41:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 42:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -4
 43:     LD  4,-4(1)	Pop left into ac1 
 44:    SUB  3,4,3	compute location from index 
 45:     LD  3,0(3)	Load array element 
 46:     ST  3,-3(1)	Store variable y
* EXPRESSION
* CALL output
 47:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 48:     LD  3,-3(1)	Load variable y
 49:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
 50:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 51:    LDA  3,1(7)	Return address in ac 
 52:    JMP  7,-47(7)	CALL output
 53:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
 54:    LDC  3,3(6)	Load integer constant 
 55:     ST  3,-4(1)	Push index 
* TOFF dec: -5
 56:    LDC  3,777(6)	Load integer constant 
* TOFF inc: -4
 57:     LD  4,-4(1)	Pop index 
 58:     LD  5,-2(1)	Load address of base of array x
 59:    SUB  5,5,4	Compute offset of value 
 60:     ST  3,0(5)	Store variable x
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
 61:    LDC  2,0(6)	Set return value to 0 
 62:     LD  3,-1(1)	Load return address 
 63:     LD  1,0(1)	Adjust fp 
 64:    JMP  7,0(3)	Return 
* END FUNCTION ford
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
 65:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -8
 66:    LDC  3,5(6)	load size of array y
 67:     ST  3,-2(1)	save size of array y
* Compound Body
* EXPRESSION
 68:    LDC  3,3(6)	Load integer constant 
 69:     ST  3,-8(1)	Push index 
* TOFF dec: -9
 70:    LDC  3,666(6)	Load integer constant 
* TOFF inc: -8
 71:     LD  4,-8(1)	Pop index 
 72:    LDA  5,-3(1)	Load address of base of array y
 73:    SUB  5,5,4	Compute offset of value 
 74:     ST  3,0(5)	Store variable y
* EXPRESSION
* CALL ford
 75:     ST  1,-8(1)	Store fp in ghost frame for ford
* TOFF dec: -9
* TOFF dec: -10
* Param 1
 76:    LDA  3,-3(1)	Load address of base of array y
 77:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end ford
 78:    LDA  1,-8(1)	Ghost frame becomes new active frame 
 79:    LDA  3,1(7)	Return address in ac 
 80:    JMP  7,-42(7)	CALL ford
 81:    LDA  3,0(2)	Save the result in ac 
* Call end ford
* TOFF set: -8
* EXPRESSION
 82:    LDA  3,-3(1)	Load address of base of array y
 83:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
 84:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -8
 85:     LD  4,-8(1)	Pop left into ac1 
 86:    SUB  3,4,3	compute location from index 
 87:     LD  3,0(3)	Load array element 
* EXPRESSION
* CALL output
 88:     ST  1,-8(1)	Store fp in ghost frame for output
* TOFF dec: -9
* TOFF dec: -10
* Param 1
 89:    LDA  3,-3(1)	Load address of base of array y
 90:     ST  3,-10(1)	Push left side 
* TOFF dec: -11
 91:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -10
 92:     LD  4,-10(1)	Pop left into ac1 
 93:    SUB  3,4,3	compute location from index 
 94:     LD  3,0(3)	Load array element 
 95:     ST  3,-10(1)	Push parameter 
* TOFF dec: -11
* Param end output
 96:    LDA  1,-8(1)	Ghost frame becomes new active frame 
 97:    LDA  3,1(7)	Return address in ac 
 98:    JMP  7,-93(7)	CALL output
 99:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -8
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
100:    LDC  2,0(6)	Set return value to 0 
101:     LD  3,-1(1)	Load return address 
102:     LD  1,0(1)	Adjust fp 
103:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,103(7)	Jump to init [backpatch] 
* INIT
104:    LDA  1,0(0)	set first frame at end of globals 
105:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
106:    LDA  3,1(7)	Return address in ac 
107:    JMP  7,-43(7)	Jump to main 
108:   HALT  0,0,0	DONE! 
* END INIT
