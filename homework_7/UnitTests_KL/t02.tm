* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  t02.c-
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
* FUNCTION factorial
* TOFF set: -3
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* IF
 40:     LD  3,-2(1)	Load variable n
 41:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 42:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
 43:     LD  4,-3(1)	Pop left into ac1 
 44:    TLT  3,4,3	Op < 
* THEN
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
 46:     LD  3,-2(1)	Load variable n
 47:     ST  3,-3(1)	Push index 
* TOFF dec: -4
 48:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -3
 49:     LD  4,-3(1)	Pop index 
 50:    LDA  5,-1(0)	Load address of base of array k
 51:    SUB  5,5,4	Compute offset of value 
 52:     ST  3,0(5)	Store variable k
* TOFF set: -3
* END COMPOUND
 45:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
 54:     LD  3,-2(1)	Load variable n
 55:     ST  3,-3(1)	Push index 
* TOFF dec: -4
 56:     LD  3,-2(1)	Load variable n
 57:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
* CALL factorial
 58:     ST  1,-5(1)	Store fp in ghost frame for factorial
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 59:     LD  3,-2(1)	Load variable n
 60:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
 61:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -7
 62:     LD  4,-7(1)	Pop left into ac1 
 63:    SUB  3,4,3	Op - 
 64:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end factorial
 65:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 66:    LDA  3,1(7)	Return address in ac 
 67:    JMP  7,-29(7)	CALL factorial
 68:    LDA  3,0(2)	Save the result in ac 
* Call end factorial
* TOFF set: -5
* TOFF inc: -4
 69:     LD  4,-4(1)	Pop left into ac1 
 70:    MUL  3,4,3	Op * 
* TOFF inc: -3
 71:     LD  4,-3(1)	Pop index 
 72:    LDA  5,-1(0)	Load address of base of array k
 73:    SUB  5,5,4	Compute offset of value 
 74:     ST  3,0(5)	Store variable k
* TOFF set: -3
* END COMPOUND
 53:    JMP  7,21(7)	Jump around the ELSE [backpatch] 
* END IF
* RETURN
 75:    LDA  3,-1(0)	Load address of base of array k
 76:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 77:     LD  3,-2(1)	Load variable n
* TOFF inc: -3
 78:     LD  4,-3(1)	Pop left into ac1 
 79:    SUB  3,4,3	compute location from index 
 80:     LD  3,0(3)	Load array element 
 81:    LDA  2,0(3)	Copy result to return register 
 82:     LD  3,-1(1)	Load return address 
 83:     LD  1,0(1)	Adjust fp 
 84:    JMP  7,0(3)	Return 
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
 85:    LDC  2,0(6)	Set return value to 0 
 86:     LD  3,-1(1)	Load return address 
 87:     LD  1,0(1)	Adjust fp 
 88:    JMP  7,0(3)	Return 
* END FUNCTION factorial
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
 89:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
 90:    LDC  3,10(6)	Load integer constant 
 91:     ST  3,-2(1)	Store variable n
* EXPRESSION
* CALL factorial
 92:     ST  1,-3(1)	Store fp in ghost frame for factorial
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 93:     LD  3,-2(1)	Load variable n
 94:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end factorial
 95:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 96:    LDA  3,1(7)	Return address in ac 
 97:    JMP  7,-59(7)	CALL factorial
 98:    LDA  3,0(2)	Save the result in ac 
* Call end factorial
* TOFF set: -3
 99:     ST  3,-2(1)	Store variable n
* EXPRESSION
* CALL output
100:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
101:     LD  3,-2(1)	Load variable n
102:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
103:    LDA  1,-3(1)	Ghost frame becomes new active frame 
104:    LDA  3,1(7)	Return address in ac 
105:    JMP  7,-100(7)	CALL output
106:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL outnl
107:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
108:    LDA  1,-3(1)	Ghost frame becomes new active frame 
109:    LDA  3,1(7)	Return address in ac 
110:    JMP  7,-77(7)	CALL outnl
111:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
112:    LDC  2,0(6)	Set return value to 0 
113:     LD  3,-1(1)	Load return address 
114:     LD  1,0(1)	Adjust fp 
115:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,115(7)	Jump to init [backpatch] 
* INIT
116:    LDA  1,-21(0)	set first frame at end of globals 
117:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
118:    LDC  3,20(6)	load size of array k
119:     ST  3,0(0)	save size of array k
* END INIT GLOBALS AND STATICS
120:    LDA  3,1(7)	Return address in ac 
121:    JMP  7,-33(7)	Jump to main 
122:   HALT  0,0,0	DONE! 
* END INIT
