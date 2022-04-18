* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  e0c.c-
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
* TOFF set: -4
* Compound Body
* EXPRESSION
 40:    LDC  3,0(6)	Load integer constant 
 41:     ST  3,-2(1)	Store variable x
* WHILE
 42:     LD  3,-2(1)	Load variable x
 43:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 44:    LDC  3,6(6)	Load integer constant 
* TOFF inc: -4
 45:     LD  4,-4(1)	Pop left into ac1 
 46:    TLT  3,4,3	Op < 
 47:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -4
* Compound Body
* EXPRESSION
 49:    LDC  3,0(6)	Load integer constant 
 50:     ST  3,-3(1)	Store variable y
* WHILE
 51:     LD  3,-3(1)	Load variable y
 52:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 53:    LDC  3,6(6)	Load integer constant 
* TOFF inc: -4
 54:     LD  4,-4(1)	Pop left into ac1 
 55:    TLT  3,4,3	Op < 
 56:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -4
* Compound Body
* EXPRESSION
* CALL output
 58:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 59:     LD  3,-3(1)	Load variable y
 60:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
 61:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 62:    LDA  3,1(7)	Return address in ac 
 63:    JMP  7,-58(7)	CALL output
 64:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
 65:     LD  3,-3(1)	Load variable y
 66:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 67:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
 68:     LD  4,-4(1)	Pop left into ac1 
 69:    ADD  3,4,3	Op + 
 70:     ST  3,-3(1)	Store variable y
* TOFF set: -4
* END COMPOUND
 71:    JMP  7,-21(7)	go to beginning of loop 
 57:    JMP  7,14(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
* CALL outnl
 72:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
 73:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 74:    LDA  3,1(7)	Return address in ac 
 75:    JMP  7,-42(7)	CALL outnl
 76:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
* EXPRESSION
* CALL output
 77:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 78:     LD  3,-2(1)	Load variable x
 79:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
 80:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 81:    LDA  3,1(7)	Return address in ac 
 82:    JMP  7,-77(7)	CALL output
 83:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
* CALL outnl
 84:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
 85:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 86:    LDA  3,1(7)	Return address in ac 
 87:    JMP  7,-54(7)	CALL outnl
 88:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
* EXPRESSION
 89:     LD  3,-2(1)	Load variable x
 90:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 91:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
 92:     LD  4,-4(1)	Pop left into ac1 
 93:    ADD  3,4,3	Op + 
 94:     ST  3,-2(1)	Store variable x
* TOFF set: -4
* END COMPOUND
 95:    JMP  7,-54(7)	go to beginning of loop 
 48:    JMP  7,47(7)	Jump past loop [backpatch] 
* END WHILE
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
 96:    LDC  2,0(6)	Set return value to 0 
 97:     LD  3,-1(1)	Load return address 
 98:     LD  1,0(1)	Adjust fp 
 99:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,99(7)	Jump to init [backpatch] 
* INIT
100:    LDA  1,0(0)	set first frame at end of globals 
101:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
102:    LDA  3,1(7)	Return address in ac 
103:    JMP  7,-65(7)	Jump to main 
104:   HALT  0,0,0	DONE! 
* END INIT
