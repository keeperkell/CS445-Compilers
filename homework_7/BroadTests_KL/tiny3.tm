* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  tiny3.c-
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
* FUNCTION wolf
* TOFF set: -3
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -4
* Compound Body
* RETURN
 40:     LD  3,-2(1)	Load variable garion
 41:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 42:     LD  3,0(0)	Load variable g
* TOFF inc: -4
 43:     LD  4,-4(1)	Pop left into ac1 
 44:    ADD  3,4,3	Op + 
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
* END FUNCTION wolf
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION polgara
* TOFF set: -3
 53:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -4
* Compound Body
* RETURN
 54:     LD  3,-2(1)	Load variable silk
 55:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 56:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
 57:     LD  4,-4(1)	Pop left into ac1 
 58:    ADD  3,4,3	Op + 
 59:    LDA  2,0(3)	Copy result to return register 
 60:     LD  3,-1(1)	Load return address 
 61:     LD  1,0(1)	Adjust fp 
 62:    JMP  7,0(3)	Return 
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
 63:    LDC  2,0(6)	Set return value to 0 
 64:     LD  3,-1(1)	Load return address 
 65:     LD  1,0(1)	Adjust fp 
 66:    JMP  7,0(3)	Return 
* END FUNCTION polgara
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
 67:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
 68:    LDC  3,33(6)	Load integer constant 
 69:     ST  3,0(0)	Store variable g
* EXPRESSION
 70:    LDC  3,666(6)	Load integer constant 
 71:     ST  3,-2(1)	Store variable x
* EXPRESSION
* CALL wolf
 72:     ST  1,-3(1)	Store fp in ghost frame for wolf
* TOFF dec: -4
* TOFF dec: -5
* Param 1
* CALL polgara
 73:     ST  1,-5(1)	Store fp in ghost frame for polgara
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 74:     LD  3,-2(1)	Load variable x
 75:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end polgara
 76:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 77:    LDA  3,1(7)	Return address in ac 
 78:    JMP  7,-26(7)	CALL polgara
 79:    LDA  3,0(2)	Save the result in ac 
* Call end polgara
* TOFF set: -5
 80:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end wolf
 81:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 82:    LDA  3,1(7)	Return address in ac 
 83:    JMP  7,-45(7)	CALL wolf
 84:    LDA  3,0(2)	Save the result in ac 
* Call end wolf
* TOFF set: -3
 85:     ST  3,-2(1)	Store variable x
* EXPRESSION
* CALL output
 86:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 87:     LD  3,-2(1)	Load variable x
 88:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 89:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 90:    LDA  3,1(7)	Return address in ac 
 91:    JMP  7,-86(7)	CALL output
 92:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
 93:    LDC  2,0(6)	Set return value to 0 
 94:     LD  3,-1(1)	Load return address 
 95:     LD  1,0(1)	Adjust fp 
 96:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,96(7)	Jump to init [backpatch] 
* INIT
 97:    LDA  1,-1(0)	set first frame at end of globals 
 98:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 99:    LDA  3,1(7)	Return address in ac 
100:    JMP  7,-34(7)	Jump to main 
101:   HALT  0,0,0	DONE! 
* END INIT
