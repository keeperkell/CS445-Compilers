* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  e08.c-
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
* WHILE
 42:     LD  3,-2(1)	Load variable x
 43:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 44:    LDC  3,10(6)	Load integer constant 
* TOFF inc: -3
 45:     LD  4,-3(1)	Pop left into ac1 
 46:    TLT  3,4,3	Op < 
 47:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
* CALL output
 49:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 50:     LD  3,-2(1)	Load variable x
 51:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 52:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 53:    LDA  3,1(7)	Return address in ac 
 54:    JMP  7,-49(7)	CALL output
 55:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* IF
 56:     LD  3,-2(1)	Load variable x
 57:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 58:    LDC  3,5(6)	Load integer constant 
* TOFF inc: -3
 59:     LD  4,-3(1)	Pop left into ac1 
 60:    TNE  3,4,3	Op >< 
* THEN
* EXPRESSION
 62:     LD  3,-2(1)	Load variable x
 63:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 64:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -3
 65:     LD  4,-3(1)	Pop left into ac1 
 66:    ADD  3,4,3	Op + 
 67:     ST  3,-2(1)	Store variable x
 61:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* ELSE
* BREAK
 69:    JMP  7,-22(7)	break 
 68:    JMP  7,1(7)	Jump around the ELSE [backpatch] 
* END IF
* TOFF set: -3
* END COMPOUND
 70:    JMP  7,-29(7)	go to beginning of loop 
 48:    JMP  7,22(7)	Jump past loop [backpatch] 
* END WHILE
* EXPRESSION
* CALL output
 71:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 72:    LDC  3,666(6)	Load integer constant 
 73:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 74:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 75:    LDA  3,1(7)	Return address in ac 
 76:    JMP  7,-71(7)	CALL output
 77:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
 78:    LDC  2,0(6)	Set return value to 0 
 79:     LD  3,-1(1)	Load return address 
 80:     LD  1,0(1)	Adjust fp 
 81:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,81(7)	Jump to init [backpatch] 
* INIT
 82:    LDA  1,0(0)	set first frame at end of globals 
 83:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 84:    LDA  3,1(7)	Return address in ac 
 85:    JMP  7,-47(7)	Jump to main 
 86:   HALT  0,0,0	DONE! 
* END INIT
