* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  s02.c-
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
* TOFF set: -4
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -6
* Compound Body
* IF
 40:     LD  3,-2(1)	Load variable init
* THEN
* EXPRESSION
 42:    LDC  3,0(6)	Load integer constant 
 43:     ST  3,-1(0)	Store variable runningSum
 41:    JZR  3,2(7)	Jump around the THEN if false [backpatch] 
* END IF
* EXPRESSION
 44:     LD  3,-3(1)	Load variable x
 45:     LD  4,-1(0)	load lhs variable runningSum
 46:    ADD  3,4,3	op += 
 47:     ST  3,-1(0)	Store variable runningSum
* RETURN
 48:     LD  3,-1(0)	Load variable runningSum
 49:    LDA  2,0(3)	Copy result to return register 
 50:     LD  3,-1(1)	Load return address 
 51:     LD  1,0(1)	Adjust fp 
 52:    JMP  7,0(3)	Return 
* TOFF set: -4
* END COMPOUND
* Add standard closing in case there is no return statement
 53:    LDC  2,0(6)	Set return value to 0 
 54:     LD  3,-1(1)	Load return address 
 55:     LD  1,0(1)	Adjust fp 
 56:    JMP  7,0(3)	Return 
* END FUNCTION sum
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
 57:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -2
* Compound Body
* EXPRESSION
 58:    LDC  3,7000(6)	Load integer constant 
 59:     ST  3,0(0)	Store variable runningSum
* EXPRESSION
* CALL output
 60:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 61:     LD  3,0(0)	Load variable runningSum
 62:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
 63:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 64:    LDA  3,1(7)	Return address in ac 
 65:    JMP  7,-60(7)	CALL output
 66:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL sum
 67:     ST  1,-2(1)	Store fp in ghost frame for sum
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 68:    LDC  3,1(6)	Load Boolean constant 
 69:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param 2
 70:    LDC  3,666(6)	Load integer constant 
 71:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end sum
 72:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 73:    LDA  3,1(7)	Return address in ac 
 74:    JMP  7,-36(7)	CALL sum
 75:    LDA  3,0(2)	Save the result in ac 
* Call end sum
* TOFF set: -2
* EXPRESSION
* CALL sum
 76:     ST  1,-2(1)	Store fp in ghost frame for sum
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 77:    LDC  3,0(6)	Load Boolean constant 
 78:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param 2
 79:    LDC  3,3(6)	Load integer constant 
 80:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end sum
 81:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 82:    LDA  3,1(7)	Return address in ac 
 83:    JMP  7,-45(7)	CALL sum
 84:    LDA  3,0(2)	Save the result in ac 
* Call end sum
* TOFF set: -2
* EXPRESSION
* CALL output
 85:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
* CALL sum
 86:     ST  1,-4(1)	Store fp in ghost frame for sum
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 87:    LDC  3,0(6)	Load Boolean constant 
 88:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param 2
 89:    LDC  3,0(6)	Load integer constant 
 90:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end sum
 91:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 92:    LDA  3,1(7)	Return address in ac 
 93:    JMP  7,-55(7)	CALL sum
 94:    LDA  3,0(2)	Save the result in ac 
* Call end sum
* TOFF set: -4
 95:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
 96:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 97:    LDA  3,1(7)	Return address in ac 
 98:    JMP  7,-93(7)	CALL output
 99:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL output
100:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
101:     LD  3,0(0)	Load variable runningSum
102:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
103:    LDA  1,-2(1)	Ghost frame becomes new active frame 
104:    LDA  3,1(7)	Return address in ac 
105:    JMP  7,-100(7)	CALL output
106:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
107:    LDC  2,0(6)	Set return value to 0 
108:     LD  3,-1(1)	Load return address 
109:     LD  1,0(1)	Adjust fp 
110:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,110(7)	Jump to init [backpatch] 
* INIT
111:    LDA  1,-2(0)	set first frame at end of globals 
112:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
113:    LDA  3,1(7)	Return address in ac 
114:    JMP  7,-58(7)	Jump to main 
115:   HALT  0,0,0	DONE! 
* END INIT
