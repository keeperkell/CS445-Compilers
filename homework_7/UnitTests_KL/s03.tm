* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  s03.c-
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
* TOFF set: -13
 40:    LDC  3,10(6)	load size of array cat
 41:     ST  3,-2(1)	save size of array cat
* Compound Body
* EXPRESSION
* CALL output
 42:     ST  1,-13(1)	Store fp in ghost frame for output
* TOFF dec: -14
* TOFF dec: -15
* Param 1
 43:    LDA  3,-3(1)	Load address of base of array cat
 44:     LD  3,1(3)	Load array size 
 45:     ST  3,-15(1)	Push parameter 
* TOFF dec: -16
* Param end output
 46:    LDA  1,-13(1)	Ghost frame becomes new active frame 
 47:    LDA  3,1(7)	Return address in ac 
 48:    JMP  7,-43(7)	CALL output
 49:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -13
* EXPRESSION
* CALL output
 50:     ST  1,-13(1)	Store fp in ghost frame for output
* TOFF dec: -14
* TOFF dec: -15
* Param 1
 51:    LDA  3,-1(0)	Load address of base of array dog
 52:     LD  3,1(3)	Load array size 
 53:     ST  3,-15(1)	Push parameter 
* TOFF dec: -16
* Param end output
 54:    LDA  1,-13(1)	Ghost frame becomes new active frame 
 55:    LDA  3,1(7)	Return address in ac 
 56:    JMP  7,-51(7)	CALL output
 57:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -13
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
 58:    LDC  2,0(6)	Set return value to 0 
 59:     LD  3,-1(1)	Load return address 
 60:     LD  1,0(1)	Adjust fp 
 61:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,61(7)	Jump to init [backpatch] 
* INIT
 62:    LDA  1,-11(0)	set first frame at end of globals 
 63:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
 64:    LDC  3,10(6)	load size of array dog
 65:     ST  3,0(0)	save size of array dog
* END INIT GLOBALS AND STATICS
 66:    LDA  3,1(7)	Return address in ac 
 67:    JMP  7,-29(7)	Jump to main 
 68:   HALT  0,0,0	DONE! 
* END INIT
