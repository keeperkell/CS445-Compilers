* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  t03.c-
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
* IF
 40:     LD  3,-2(1)	Load variable n
 41:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 42:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -3
 43:     LD  4,-3(1)	Pop left into ac1 
 44:    TLT  3,4,3	Op < 
* THEN
* RETURN
 46:    LDC  3,1(6)	Load integer constant 
 47:    LDA  2,0(3)	Copy result to return register 
 48:     LD  3,-1(1)	Load return address 
 49:     LD  1,0(1)	Adjust fp 
 50:    JMP  7,0(3)	Return 
 45:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* RETURN
* CALL fib
 52:     ST  1,-3(1)	Store fp in ghost frame for fib
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 53:     LD  3,-2(1)	Load variable n
 54:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 55:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -5
 56:     LD  4,-5(1)	Pop left into ac1 
 57:    SUB  3,4,3	Op - 
 58:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end fib
 59:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 60:    LDA  3,1(7)	Return address in ac 
 61:    JMP  7,-23(7)	CALL fib
 62:    LDA  3,0(2)	Save the result in ac 
* Call end fib
* TOFF set: -3
 63:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
* CALL fib
 64:     ST  1,-4(1)	Store fp in ghost frame for fib
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 65:     LD  3,-2(1)	Load variable n
 66:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
 67:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -6
 68:     LD  4,-6(1)	Pop left into ac1 
 69:    SUB  3,4,3	Op - 
 70:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end fib
 71:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 72:    LDA  3,1(7)	Return address in ac 
 73:    JMP  7,-35(7)	CALL fib
 74:    LDA  3,0(2)	Save the result in ac 
* Call end fib
* TOFF set: -4
* TOFF inc: -3
 75:     LD  4,-3(1)	Pop left into ac1 
 76:    ADD  3,4,3	Op + 
 77:    LDA  2,0(3)	Copy result to return register 
 78:     LD  3,-1(1)	Load return address 
 79:     LD  1,0(1)	Adjust fp 
 80:    JMP  7,0(3)	Return 
 51:    JMP  7,29(7)	Jump around the ELSE [backpatch] 
* END IF
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
 81:    LDC  2,0(6)	Set return value to 0 
 82:     LD  3,-1(1)	Load return address 
 83:     LD  1,0(1)	Adjust fp 
 84:    JMP  7,0(3)	Return 
* END FUNCTION fib
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
 85:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
* CALL fib
 86:     ST  1,-3(1)	Store fp in ghost frame for fib
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 87:    LDC  3,12(6)	Load integer constant 
 88:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end fib
 89:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 90:    LDA  3,1(7)	Return address in ac 
 91:    JMP  7,-53(7)	CALL fib
 92:    LDA  3,0(2)	Save the result in ac 
* Call end fib
* TOFF set: -3
 93:     ST  3,-2(1)	Store variable n
* EXPRESSION
* CALL output
 94:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 95:     LD  3,-2(1)	Load variable n
 96:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 97:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 98:    LDA  3,1(7)	Return address in ac 
 99:    JMP  7,-94(7)	CALL output
100:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL outnl
101:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
102:    LDA  1,-3(1)	Ghost frame becomes new active frame 
103:    LDA  3,1(7)	Return address in ac 
104:    JMP  7,-71(7)	CALL outnl
105:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
106:    LDC  2,0(6)	Set return value to 0 
107:     LD  3,-1(1)	Load return address 
108:     LD  1,0(1)	Adjust fp 
109:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,109(7)	Jump to init [backpatch] 
* INIT
110:    LDA  1,0(0)	set first frame at end of globals 
111:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
112:    LDA  3,1(7)	Return address in ac 
113:    JMP  7,-29(7)	Jump to main 
114:   HALT  0,0,0	DONE! 
* END INIT
