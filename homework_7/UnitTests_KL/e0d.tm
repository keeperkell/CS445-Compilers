* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  e0d.c-
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
* IF
 65:     LD  3,-3(1)	Load variable y
 66:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 67:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -4
 68:     LD  4,-4(1)	Pop left into ac1 
 69:    TEQ  3,4,3	Op = 
* THEN
* BREAK
 71:    JMP  7,-15(7)	break 
 70:    JZR  3,1(7)	Jump around the THEN if false [backpatch] 
* END IF
* EXPRESSION
 72:     LD  3,-3(1)	Load variable y
 73:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 74:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
 75:     LD  4,-4(1)	Pop left into ac1 
 76:    ADD  3,4,3	Op + 
 77:     ST  3,-3(1)	Store variable y
* TOFF set: -4
* END COMPOUND
 78:    JMP  7,-28(7)	go to beginning of loop 
 57:    JMP  7,21(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
* CALL output
 79:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 80:     LD  3,-2(1)	Load variable x
 81:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
 82:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 83:    LDA  3,1(7)	Return address in ac 
 84:    JMP  7,-79(7)	CALL output
 85:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* IF
 86:     LD  3,-2(1)	Load variable x
 87:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 88:    LDC  3,4(6)	Load integer constant 
* TOFF inc: -4
 89:     LD  4,-4(1)	Pop left into ac1 
 90:    TEQ  3,4,3	Op = 
* THEN
* BREAK
 92:    JMP  7,-45(7)	break 
 91:    JZR  3,1(7)	Jump around the THEN if false [backpatch] 
* END IF
* EXPRESSION
 93:     LD  3,-2(1)	Load variable x
 94:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 95:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -4
 96:     LD  4,-4(1)	Pop left into ac1 
 97:    ADD  3,4,3	Op + 
 98:     ST  3,-2(1)	Store variable x
* TOFF set: -4
* END COMPOUND
 99:    JMP  7,-58(7)	go to beginning of loop 
 48:    JMP  7,51(7)	Jump past loop [backpatch] 
* END WHILE
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
107:    JMP  7,-69(7)	Jump to main 
108:   HALT  0,0,0	DONE! 
* END INIT
