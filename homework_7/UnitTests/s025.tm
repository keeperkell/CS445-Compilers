* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  s025.c-
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
* FUNCTION sum
* TOFF set: -3
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
 40:     LD  3,-2(1)	Load variable x
 41:     LD  4,-1(0)	load lhs variable runningSum
 42:    ADD  3,4,3	op += 
 43:     ST  3,-1(0)	Store variable runningSum
* RETURN
 44:     LD  3,-1(0)	Load variable runningSum
 45:    LDA  2,0(3)	Copy result to return register 
 46:     LD  3,-1(1)	Load return address 
 47:     LD  1,0(1)	Adjust fp 
 48:    JMP  7,0(3)	Return 
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
 49:    LDC  2,0(6)	Set return value to 0 
 50:     LD  3,-1(1)	Load return address 
 51:     LD  1,0(1)	Adjust fp 
 52:    JMP  7,0(3)	Return 
* END FUNCTION sum
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
 53:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -2
* Compound Body
* EXPRESSION
 54:    LDC  3,7000(6)	Load integer constant 
 55:     ST  3,0(0)	Store variable runningSum
* EXPRESSION
* CALL output
 56:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 57:     LD  3,0(0)	Load variable runningSum
 58:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
 59:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 60:    LDA  3,1(7)	Return address in ac 
 61:    JMP  7,-56(7)	CALL output
 62:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL sum
 63:     ST  1,-2(1)	Store fp in ghost frame for sum
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 64:    LDC  3,666(6)	Load integer constant 
 65:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end sum
 66:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 67:    LDA  3,1(7)	Return address in ac 
 68:    JMP  7,-30(7)	CALL sum
 69:    LDA  3,0(2)	Save the result in ac 
* Call end sum
* TOFF set: -2
* EXPRESSION
* CALL sum
 70:     ST  1,-2(1)	Store fp in ghost frame for sum
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 71:    LDC  3,3(6)	Load integer constant 
 72:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end sum
 73:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 74:    LDA  3,1(7)	Return address in ac 
 75:    JMP  7,-37(7)	CALL sum
 76:    LDA  3,0(2)	Save the result in ac 
* Call end sum
* TOFF set: -2
* EXPRESSION
* CALL output
 77:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
* CALL sum
 78:     ST  1,-4(1)	Store fp in ghost frame for sum
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 79:    LDC  3,0(6)	Load integer constant 
 80:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end sum
 81:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 82:    LDA  3,1(7)	Return address in ac 
 83:    JMP  7,-45(7)	CALL sum
 84:    LDA  3,0(2)	Save the result in ac 
* Call end sum
* TOFF set: -4
 85:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
 86:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 87:    LDA  3,1(7)	Return address in ac 
 88:    JMP  7,-83(7)	CALL output
 89:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL output
 90:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 91:     LD  3,0(0)	Load variable runningSum
 92:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
 93:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 94:    LDA  3,1(7)	Return address in ac 
 95:    JMP  7,-90(7)	CALL output
 96:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
 97:    LDC  2,0(6)	Set return value to 0 
 98:     LD  3,-1(1)	Load return address 
 99:     LD  1,0(1)	Adjust fp 
100:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,100(7)	Jump to init [backpatch] 
* INIT
101:    LDA  1,-2(0)	set first frame at end of globals 
102:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
103:    LDC  3,0(6)	Load integer constant 
104:     ST  3,-1(0)	Store variable runningSum
* END INIT GLOBALS AND STATICS
105:    LDA  3,1(7)	Return address in ac 
106:    JMP  7,-54(7)	Jump to main 
107:   HALT  0,0,0	DONE! 
* END INIT
