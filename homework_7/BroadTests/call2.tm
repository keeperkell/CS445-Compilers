* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  call2.c-
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
* FUNCTION dog
* TOFF set: -4
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -4
* Compound Body
* EXPRESSION
 40:    LDC  3,444(6)	Load integer constant 
 41:     ST  3,-2(1)	Store variable a
* EXPRESSION
 42:    LDC  3,9(6)	Load integer constant 
 43:     ST  3,-4(1)	Push index 
* TOFF dec: -5
 44:    LDC  3,555(6)	Load integer constant 
* TOFF inc: -4
 45:     LD  4,-4(1)	Pop index 
 46:     LD  5,-3(1)	Load address of base of array b
 47:    SUB  5,5,4	Compute offset of value 
 48:     ST  3,0(5)	Store variable b
* RETURN
 49:     LD  3,-3(1)	Load address of base of array b
 50:     LD  3,1(3)	Load array size 
 51:    LDA  2,0(3)	Copy result to return register 
 52:     LD  3,-1(1)	Load return address 
 53:     LD  1,0(1)	Adjust fp 
 54:    JMP  7,0(3)	Return 
* TOFF set: -4
* END COMPOUND
* Add standard closing in case there is no return statement
 55:    LDC  2,0(6)	Set return value to 0 
 56:     LD  3,-1(1)	Load return address 
 57:     LD  1,0(1)	Adjust fp 
 58:    JMP  7,0(3)	Return 
* END FUNCTION dog
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
 59:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -14
 60:    LDC  3,10(6)	load size of array y
 61:     ST  3,-3(1)	save size of array y
* Compound Body
* EXPRESSION
 62:    LDC  3,1(6)	Load Boolean constant 
 63:     ST  3,0(0)	Store variable g
* EXPRESSION
 64:    LDC  3,9(6)	Load integer constant 
 65:     ST  3,-14(1)	Push index 
* TOFF dec: -15
 66:    LDC  3,0(6)	Load Boolean constant 
* TOFF inc: -14
 67:     LD  4,-14(1)	Pop index 
 68:    LDA  5,-2(0)	Load address of base of array h
 69:    SUB  5,5,4	Compute offset of value 
 70:     ST  3,0(5)	Store variable h
* EXPRESSION
 71:    LDC  3,111(6)	Load integer constant 
 72:     ST  3,-2(1)	Store variable x
* EXPRESSION
 73:    LDC  3,9(6)	Load integer constant 
 74:     ST  3,-14(1)	Push index 
* TOFF dec: -15
 75:    LDC  3,222(6)	Load integer constant 
* TOFF inc: -14
 76:     LD  4,-14(1)	Pop index 
 77:    LDA  5,-4(1)	Load address of base of array y
 78:    SUB  5,5,4	Compute offset of value 
 79:     ST  3,0(5)	Store variable y
* EXPRESSION
* CALL output
 80:     ST  1,-14(1)	Store fp in ghost frame for output
* TOFF dec: -15
* TOFF dec: -16
* Param 1
 81:    LDC  3,333(6)	Load integer constant 
 82:     ST  3,-16(1)	Push left side 
* TOFF dec: -17
* CALL dog
 83:     ST  1,-17(1)	Store fp in ghost frame for dog
* TOFF dec: -18
* TOFF dec: -19
* Param 1
 84:     LD  3,-2(1)	Load variable x
 85:     ST  3,-19(1)	Push parameter 
* TOFF dec: -20
* Param 2
 86:    LDA  3,-4(1)	Load address of base of array y
 87:     ST  3,-20(1)	Push parameter 
* TOFF dec: -21
* Param end dog
 88:    LDA  1,-17(1)	Ghost frame becomes new active frame 
 89:    LDA  3,1(7)	Return address in ac 
 90:    JMP  7,-52(7)	CALL dog
 91:    LDA  3,0(2)	Save the result in ac 
* Call end dog
* TOFF set: -17
* TOFF inc: -16
 92:     LD  4,-16(1)	Pop left into ac1 
 93:    ADD  3,4,3	Op + 
 94:     ST  3,-16(1)	Push parameter 
* TOFF dec: -17
* Param end output
 95:    LDA  1,-14(1)	Ghost frame becomes new active frame 
 96:    LDA  3,1(7)	Return address in ac 
 97:    JMP  7,-92(7)	CALL output
 98:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -14
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
 99:    LDC  2,0(6)	Set return value to 0 
100:     LD  3,-1(1)	Load return address 
101:     LD  1,0(1)	Adjust fp 
102:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,102(7)	Jump to init [backpatch] 
* INIT
103:    LDA  1,-12(0)	set first frame at end of globals 
104:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
105:    LDC  3,10(6)	load size of array h
106:     ST  3,-1(0)	save size of array h
* END INIT GLOBALS AND STATICS
107:    LDA  3,1(7)	Return address in ac 
108:    JMP  7,-50(7)	Jump to main 
109:   HALT  0,0,0	DONE! 
* END INIT
