* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  s01.c-
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
* FUNCTION save
* TOFF set: -3
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
 40:     LD  3,-1(0)	Load variable y
 41:     ST  3,0(0)	Store variable x
* EXPRESSION
 42:     LD  3,-2(1)	Load variable z
 43:     ST  3,-1(0)	Store variable y
* RETURN
 44:     LD  3,0(0)	Load variable x
 45:    LDA  2,0(3)	Copy result to return register 
 46:     LD  3,-1(1)	Load return address 
 47:     LD  1,0(1)	Adjust fp 
 48:    JMP  7,0(3)	Return 
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
 49:    LDC  2,0(6)	Set return value to 0 
 50:     LD  3,-1(1)	Load return address 
 51:     LD  1,0(1)	Adjust fp 
 52:    JMP  7,0(3)	Return 
* END FUNCTION save
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
* CALL save
 55:     ST  1,-4(1)	Store fp in ghost frame for save
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 56:    LDC  3,1(6)	Load integer constant 
 57:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end save
 58:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 59:    LDA  3,1(7)	Return address in ac 
 60:    JMP  7,-22(7)	CALL save
 61:    LDA  3,0(2)	Save the result in ac 
* Call end save
* TOFF set: -4
 62:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
 63:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 64:    LDA  3,1(7)	Return address in ac 
 65:    JMP  7,-60(7)	CALL output
 66:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL output
 67:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
* CALL save
 68:     ST  1,-4(1)	Store fp in ghost frame for save
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 69:    LDC  3,2(6)	Load integer constant 
 70:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end save
 71:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 72:    LDA  3,1(7)	Return address in ac 
 73:    JMP  7,-35(7)	CALL save
 74:    LDA  3,0(2)	Save the result in ac 
* Call end save
* TOFF set: -4
 75:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
 76:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 77:    LDA  3,1(7)	Return address in ac 
 78:    JMP  7,-73(7)	CALL output
 79:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL output
 80:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
* CALL save
 81:     ST  1,-4(1)	Store fp in ghost frame for save
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 82:    LDC  3,3(6)	Load integer constant 
 83:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end save
 84:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 85:    LDA  3,1(7)	Return address in ac 
 86:    JMP  7,-48(7)	CALL save
 87:    LDA  3,0(2)	Save the result in ac 
* Call end save
* TOFF set: -4
 88:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
 89:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 90:    LDA  3,1(7)	Return address in ac 
 91:    JMP  7,-86(7)	CALL output
 92:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL output
 93:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
* CALL save
 94:     ST  1,-4(1)	Store fp in ghost frame for save
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 95:    LDC  3,4(6)	Load integer constant 
 96:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end save
 97:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 98:    LDA  3,1(7)	Return address in ac 
 99:    JMP  7,-61(7)	CALL save
100:    LDA  3,0(2)	Save the result in ac 
* Call end save
* TOFF set: -4
101:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
102:    LDA  1,-2(1)	Ghost frame becomes new active frame 
103:    LDA  3,1(7)	Return address in ac 
104:    JMP  7,-99(7)	CALL output
105:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* RETURN
106:    LDC  3,0(6)	Load integer constant 
107:    LDA  2,0(3)	Copy result to return register 
108:     LD  3,-1(1)	Load return address 
109:     LD  1,0(1)	Adjust fp 
110:    JMP  7,0(3)	Return 
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
111:    LDC  2,0(6)	Set return value to 0 
112:     LD  3,-1(1)	Load return address 
113:     LD  1,0(1)	Adjust fp 
114:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,114(7)	Jump to init [backpatch] 
* INIT
115:    LDA  1,-2(0)	set first frame at end of globals 
116:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
117:    LDA  3,1(7)	Return address in ac 
118:    JMP  7,-66(7)	Jump to main 
119:   HALT  0,0,0	DONE! 
* END INIT
