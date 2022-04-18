* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  if.c-
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
 40:    LDC  3,23(6)	Load integer constant 
 41:     ST  3,-3(1)	Store variable j
 42:     ST  3,-2(1)	Store variable i
* IF
 43:     LD  3,-2(1)	Load variable i
 44:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 45:     LD  3,-3(1)	Load variable j
* TOFF inc: -4
 46:     LD  4,-4(1)	Pop left into ac1 
 47:    TGT  3,4,3	Op > 
* THEN
* EXPRESSION
 49:    LDC  3,666(6)	Load integer constant 
 50:     ST  3,-2(1)	Store variable i
 48:    JZR  3,2(7)	Jump around the THEN if false [backpatch] 
* END IF
* IF
 51:     LD  3,-3(1)	Load variable j
 52:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 53:     LD  3,-2(1)	Load variable i
* TOFF inc: -4
 54:     LD  4,-4(1)	Pop left into ac1 
 55:    TEQ  3,4,3	Op = 
* THEN
* EXPRESSION
 57:    LDC  3,666(6)	Load integer constant 
 58:     ST  3,-2(1)	Store variable i
 56:    JZR  3,3(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
 60:    LDC  3,777(6)	Load integer constant 
 61:     ST  3,-3(1)	Store variable j
 59:    JMP  7,2(7)	Jump around the ELSE [backpatch] 
* END IF
* EXPRESSION
* CALL output
 62:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 63:     LD  3,-2(1)	Load variable i
 64:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
 65:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 66:    LDA  3,1(7)	Return address in ac 
 67:    JMP  7,-62(7)	CALL output
 68:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
* CALL output
 69:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 70:     LD  3,-3(1)	Load variable j
 71:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
 72:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 73:    LDA  3,1(7)	Return address in ac 
 74:    JMP  7,-69(7)	CALL output
 75:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* EXPRESSION
* CALL outnl
 76:     ST  1,-4(1)	Store fp in ghost frame for outnl
* TOFF dec: -5
* TOFF dec: -6
* Param end outnl
 77:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 78:    LDA  3,1(7)	Return address in ac 
 79:    JMP  7,-46(7)	CALL outnl
 80:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -4
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
 81:    LDC  2,0(6)	Set return value to 0 
 82:     LD  3,-1(1)	Load return address 
 83:     LD  1,0(1)	Adjust fp 
 84:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,84(7)	Jump to init [backpatch] 
* INIT
 85:    LDA  1,0(0)	set first frame at end of globals 
 86:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 87:    LDA  3,1(7)	Return address in ac 
 88:    JMP  7,-50(7)	Jump to main 
 89:   HALT  0,0,0	DONE! 
* END INIT
