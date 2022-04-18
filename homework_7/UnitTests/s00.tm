* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  s00.c-
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
* TOFF set: -2
* Compound Body
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
 40:    LDC  2,0(6)	Set return value to 0 
 41:     LD  3,-1(1)	Load return address 
 42:     LD  1,0(1)	Adjust fp 
 43:    JMP  7,0(3)	Return 
* END FUNCTION main
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION dogs
* TOFF set: -6
 44:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -30
 45:    LDC  3,10(6)	load size of array ccc
 46:     ST  3,-8(1)	save size of array ccc
 47:    LDC  3,10(6)	load size of array ddd
 48:     ST  3,-19(1)	save size of array ddd
* Compound Body
* RETURN
 49:     LD  3,-6(1)	Load variable aaa
 50:    LDA  2,0(3)	Copy result to return register 
 51:     LD  3,-1(1)	Load return address 
 52:     LD  1,0(1)	Adjust fp 
 53:    JMP  7,0(3)	Return 
* TOFF set: -6
* END COMPOUND
* Add standard closing in case there is no return statement
 54:    LDC  2,0(6)	Set return value to 0 
 55:     LD  3,-1(1)	Load return address 
 56:     LD  1,0(1)	Adjust fp 
 57:    JMP  7,0(3)	Return 
* END FUNCTION dogs
  0:    JMP  7,57(7)	Jump to init [backpatch] 
* INIT
 58:    LDA  1,-48(0)	set first frame at end of globals 
 59:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
 60:    LDC  3,10(6)	load size of array ccc
 61:     ST  3,-2(0)	save size of array ccc
 62:    LDC  3,10(6)	load size of array ddd
 63:     ST  3,-13(0)	save size of array ddd
 64:    LDC  3,10(6)	load size of array sccc
 65:     ST  3,-26(0)	save size of array sccc
 66:    LDC  3,10(6)	load size of array sddd
 67:     ST  3,-37(0)	save size of array sddd
* END INIT GLOBALS AND STATICS
 68:    LDA  3,1(7)	Return address in ac 
 69:    JMP  7,-31(7)	Jump to main 
 70:   HALT  0,0,0	DONE! 
* END INIT
