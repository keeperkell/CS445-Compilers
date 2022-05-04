* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  h07.c-
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
* FUNCTION fib
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
 54:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -3
 55:     LD  4,-3(1)	Pop left into ac1 
 56:    TLT  3,4,3	Op < 
* THEN
* RETURN
 58:    LDC  3,1(6)	Load integer constant 
 59:    LDA  2,0(3)	Copy result to return register 
 60:     LD  3,-1(1)	Load return address 
 61:     LD  1,0(1)	Adjust fp 
 62:    JMP  7,0(3)	Return 
 57:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* END IF
* RETURN
* CALL fib
 63:     ST  1,-3(1)	Store fp in ghost frame for fib
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 64:     LD  3,-2(1)	Load variable x
 65:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 66:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -5
 67:     LD  4,-5(1)	Pop left into ac1 
 68:    SUB  3,4,3	Op - 
 69:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end fib
 70:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 71:    LDA  3,1(7)	Return address in ac 
 72:    JMP  7,-34(7)	CALL fib
 73:    LDA  3,0(2)	Save the result in ac 
* Call end fib
* TOFF set: -3
 74:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
* CALL fib
 75:     ST  1,-4(1)	Store fp in ghost frame for fib
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 76:     LD  3,-2(1)	Load variable x
 77:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
 78:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -6
 79:     LD  4,-6(1)	Pop left into ac1 
 80:    SUB  3,4,3	Op - 
 81:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end fib
 82:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 83:    LDA  3,1(7)	Return address in ac 
 84:    JMP  7,-46(7)	CALL fib
 85:    LDA  3,0(2)	Save the result in ac 
* Call end fib
* TOFF set: -4
* TOFF inc: -3
 86:     LD  4,-3(1)	Pop left into ac1 
 87:    ADD  3,4,3	Op + 
 88:    LDA  2,0(3)	Copy result to return register 
 89:     LD  3,-1(1)	Load return address 
 90:     LD  1,0(1)	Adjust fp 
 91:    JMP  7,0(3)	Return 
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
 92:    LDC  2,0(6)	Set return value to 0 
 93:     LD  3,-1(1)	Load return address 
 94:     LD  1,0(1)	Adjust fp 
 95:    JMP  7,0(3)	Return 
* END FUNCTION fib
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
 96:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -2
* Compound Body
* EXPRESSION
* CALL output
 97:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
* CALL fib
 98:     ST  1,-4(1)	Store fp in ghost frame for fib
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 99:    LDC  3,6(6)	Load integer constant 
100:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end fib
101:    LDA  1,-4(1)	Ghost frame becomes new active frame 
102:    LDA  3,1(7)	Return address in ac 
103:    JMP  7,-65(7)	CALL fib
104:    LDA  3,0(2)	Save the result in ac 
* Call end fib
* TOFF set: -4
105:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
106:    LDA  1,-2(1)	Ghost frame becomes new active frame 
107:    LDA  3,1(7)	Return address in ac 
108:    JMP  7,-103(7)	CALL output
109:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL outnl
110:     ST  1,-2(1)	Store fp in ghost frame for outnl
* TOFF dec: -3
* TOFF dec: -4
* Param end outnl
111:    LDA  1,-2(1)	Ghost frame becomes new active frame 
112:    LDA  3,1(7)	Return address in ac 
113:    JMP  7,-80(7)	CALL outnl
114:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -2
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
115:    LDC  2,0(6)	Set return value to 0 
116:     LD  3,-1(1)	Load return address 
117:     LD  1,0(1)	Adjust fp 
118:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,118(7)	Jump to init [backpatch] 
* INIT
119:    LDA  1,0(0)	set first frame at end of globals 
120:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
121:    LDA  3,1(7)	Return address in ac 
122:    JMP  7,-27(7)	Jump to main 
123:   HALT  0,0,0	DONE! 
* END INIT
