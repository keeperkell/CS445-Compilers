* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  charout.c-
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
* TOFF set: -6
 40:    LDC  3,30(6)	Load integer constant 
 41:     ST  3,-5(1)	Store variable max
* Compound Body
* EXPRESSION
 42:    LDC  3,1(6)	Load integer constant 
 43:     ST  3,-4(1)	Store variable k
* WHILE
 44:     LD  3,-4(1)	Load variable k
 45:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
 46:     LD  3,-5(1)	Load variable max
* TOFF inc: -6
 47:     LD  4,-6(1)	Pop left into ac1 
 48:    TLT  3,4,3	Op < 
 49:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -6
* Compound Body
* EXPRESSION
 51:    LDC  3,0(6)	Load integer constant 
 52:     ST  3,-3(1)	Store variable i
* WHILE
 53:     LD  3,-3(1)	Load variable i
 54:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
 55:     LD  3,-5(1)	Load variable max
* TOFF inc: -6
 56:     LD  4,-6(1)	Pop left into ac1 
 57:    TLT  3,4,3	Op < 
 58:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -6
* Compound Body
* IF
 60:     LD  3,-3(1)	Load variable i
 61:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
 62:     LD  3,-4(1)	Load variable k
* TOFF inc: -6
 63:     LD  4,-6(1)	Pop left into ac1 
 64:    MOD  3,4,3	Op % 
 65:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
 66:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -6
 67:     LD  4,-6(1)	Pop left into ac1 
 68:    TEQ  3,4,3	Op = 
* THEN
* EXPRESSION
* CALL outputc
 70:     ST  1,-6(1)	Store fp in ghost frame for outputc
* TOFF dec: -7
* TOFF dec: -8
* Param 1
 71:    LDC  3,88(6)	Load char constant 
 72:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputc
 73:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 74:    LDA  3,1(7)	Return address in ac 
 75:    JMP  7,-48(7)	CALL outputc
 76:    LDA  3,0(2)	Save the result in ac 
* Call end outputc
* TOFF set: -6
 69:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
* CALL outputc
 78:     ST  1,-6(1)	Store fp in ghost frame for outputc
* TOFF dec: -7
* TOFF dec: -8
* Param 1
 79:    LDC  3,32(6)	Load char constant 
 80:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputc
 81:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 82:    LDA  3,1(7)	Return address in ac 
 83:    JMP  7,-56(7)	CALL outputc
 84:    LDA  3,0(2)	Save the result in ac 
* Call end outputc
* TOFF set: -6
 77:    JMP  7,7(7)	Jump around the ELSE [backpatch] 
* END IF
* EXPRESSION
 85:     LD  3,-3(1)	load lhs variable i
 86:    LDA  3,1(3)	increment value of i
 87:     ST  3,-3(1)	Store variable i
* TOFF set: -6
* END COMPOUND
 88:    JMP  7,-36(7)	go to beginning of loop 
 59:    JMP  7,29(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
* CALL outputc
 89:     ST  1,-6(1)	Store fp in ghost frame for outputc
* TOFF dec: -7
* TOFF dec: -8
* Param 1
 90:    LDC  3,10(6)	Load char constant 
 91:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputc
 92:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 93:    LDA  3,1(7)	Return address in ac 
 94:    JMP  7,-67(7)	CALL outputc
 95:    LDA  3,0(2)	Save the result in ac 
* Call end outputc
* TOFF set: -6
* EXPRESSION
 96:     LD  3,-4(1)	load lhs variable k
 97:    LDA  3,1(3)	increment value of k
 98:     ST  3,-4(1)	Store variable k
* TOFF set: -6
* END COMPOUND
 99:    JMP  7,-56(7)	go to beginning of loop 
 50:    JMP  7,49(7)	Jump past loop [backpatch] 
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
