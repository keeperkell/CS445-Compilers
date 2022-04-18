* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  h02.c-
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
* FUNCTION cat
* TOFF set: -3
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
* CALL output
 40:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 41:     LD  3,-2(1)	Load variable x
 42:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 43:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 44:    LDA  3,1(7)	Return address in ac 
 45:    JMP  7,-40(7)	CALL output
 46:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL outnl
 47:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
 48:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 49:    LDA  3,1(7)	Return address in ac 
 50:    JMP  7,-17(7)	CALL outnl
 51:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* IF
 52:     LD  3,-2(1)	Load variable x
 53:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 54:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -3
 55:     LD  4,-3(1)	Pop left into ac1 
 56:    TGT  3,4,3	Op > 
* THEN
* EXPRESSION
* CALL cat
 58:     ST  1,-3(1)	Store fp in ghost frame for cat
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 59:     LD  3,-2(1)	Load variable x
 60:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 61:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -5
 62:     LD  4,-5(1)	Pop left into ac1 
 63:    SUB  3,4,3	Op - 
 64:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end cat
 65:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 66:    LDA  3,1(7)	Return address in ac 
 67:    JMP  7,-29(7)	CALL cat
 68:    LDA  3,0(2)	Save the result in ac 
* Call end cat
* TOFF set: -3
 57:    JZR  3,11(7)	Jump around the THEN if false [backpatch] 
* END IF
* RETURN
 69:     LD  3,-1(1)	Load return address 
 70:     LD  1,0(1)	Adjust fp 
 71:    JMP  7,0(3)	Return 
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
 72:    LDC  2,0(6)	Set return value to 0 
 73:     LD  3,-1(1)	Load return address 
 74:     LD  1,0(1)	Adjust fp 
 75:    JMP  7,0(3)	Return 
* END FUNCTION cat
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
 76:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -2
* Compound Body
* EXPRESSION
* CALL cat
 77:     ST  1,-2(1)	Store fp in ghost frame for cat
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 78:    LDC  3,10(6)	Load integer constant 
 79:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end cat
 80:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 81:    LDA  3,1(7)	Return address in ac 
 82:    JMP  7,-44(7)	CALL cat
 83:    LDA  3,0(2)	Save the result in ac 
* Call end cat
* TOFF set: -2
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
 84:    LDC  2,0(6)	Set return value to 0 
 85:     LD  3,-1(1)	Load return address 
 86:     LD  1,0(1)	Adjust fp 
 87:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,87(7)	Jump to init [backpatch] 
* INIT
 88:    LDA  1,0(0)	set first frame at end of globals 
 89:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 90:    LDA  3,1(7)	Return address in ac 
 91:    JMP  7,-16(7)	Jump to main 
 92:   HALT  0,0,0	DONE! 
* END INIT
