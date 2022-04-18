* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  e0a.c-
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
* TOFF set: -3
* Compound Body
* EXPRESSION
 40:    LDC  3,0(6)	Load integer constant 
 41:     ST  3,-2(1)	Store variable x
* IF
 42:    LDC  3,1(6)	Load Boolean constant 
* THEN
* WHILE
 44:     LD  3,-2(1)	Load variable x
 45:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 46:    LDC  3,10(6)	Load integer constant 
* TOFF inc: -3
 47:     LD  4,-3(1)	Pop left into ac1 
 48:    TLT  3,4,3	Op < 
 49:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
* CALL output
 51:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 52:     LD  3,-2(1)	Load variable x
 53:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 54:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 55:    LDA  3,1(7)	Return address in ac 
 56:    JMP  7,-51(7)	CALL output
 57:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
 58:     LD  3,-2(1)	Load variable x
 59:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 60:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -3
 61:     LD  4,-3(1)	Pop left into ac1 
 62:    ADD  3,4,3	Op + 
 63:     ST  3,-2(1)	Store variable x
* TOFF set: -3
* END COMPOUND
 64:    JMP  7,-21(7)	go to beginning of loop 
 50:    JMP  7,14(7)	Jump past loop [backpatch] 
* END WHILE
 43:    JZR  3,22(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
* CALL output
 66:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 67:    LDC  3,666(6)	Load integer constant 
 68:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 69:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 70:    LDA  3,1(7)	Return address in ac 
 71:    JMP  7,-66(7)	CALL output
 72:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
 65:    JMP  7,7(7)	Jump around the ELSE [backpatch] 
* END IF
* EXPRESSION
 73:    LDC  3,0(6)	Load integer constant 
 74:     ST  3,-2(1)	Store variable x
* IF
 75:    LDC  3,0(6)	Load Boolean constant 
* THEN
* WHILE
 77:     LD  3,-2(1)	Load variable x
 78:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 79:    LDC  3,10(6)	Load integer constant 
* TOFF inc: -3
 80:     LD  4,-3(1)	Pop left into ac1 
 81:    TLT  3,4,3	Op < 
 82:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
* CALL output
 84:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 85:     LD  3,-2(1)	Load variable x
 86:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 87:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 88:    LDA  3,1(7)	Return address in ac 
 89:    JMP  7,-84(7)	CALL output
 90:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
 91:     LD  3,-2(1)	Load variable x
 92:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 93:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -3
 94:     LD  4,-3(1)	Pop left into ac1 
 95:    ADD  3,4,3	Op + 
 96:     ST  3,-2(1)	Store variable x
* TOFF set: -3
* END COMPOUND
 97:    JMP  7,-21(7)	go to beginning of loop 
 83:    JMP  7,14(7)	Jump past loop [backpatch] 
* END WHILE
 76:    JZR  3,22(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
* CALL output
 99:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
100:    LDC  3,666(6)	Load integer constant 
101:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
102:    LDA  1,-3(1)	Ghost frame becomes new active frame 
103:    LDA  3,1(7)	Return address in ac 
104:    JMP  7,-99(7)	CALL output
105:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
 98:    JMP  7,7(7)	Jump around the ELSE [backpatch] 
* END IF
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
106:    LDC  2,0(6)	Set return value to 0 
107:     LD  3,-1(1)	Load return address 
108:     LD  1,0(1)	Adjust fp 
109:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,109(7)	Jump to init [backpatch] 
* INIT
110:    LDA  1,0(0)	set first frame at end of globals 
111:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
112:    LDA  3,1(7)	Return address in ac 
113:    JMP  7,-75(7)	Jump to main 
114:   HALT  0,0,0	DONE! 
* END INIT
