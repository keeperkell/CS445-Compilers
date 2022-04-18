* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  factorialr.c-
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
* RETURN
 46:    LDC  3,1(6)	Load integer constant 
 47:    LDA  2,0(3)	Copy result to return register 
 48:     LD  3,-1(1)	Load return address 
 49:     LD  1,0(1)	Adjust fp 
 50:    JMP  7,0(3)	Return 
 45:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* RETURN
 52:     LD  3,-2(1)	Load variable n
 53:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
* CALL factorial
 54:     ST  1,-4(1)	Store fp in ghost frame for factorial
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 55:     LD  3,-2(1)	Load variable n
 56:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
 57:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -6
 58:     LD  4,-6(1)	Pop left into ac1 
 59:    SUB  3,4,3	Op - 
 60:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end factorial
 61:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 62:    LDA  3,1(7)	Return address in ac 
 63:    JMP  7,-25(7)	CALL factorial
 64:    LDA  3,0(2)	Save the result in ac 
* Call end factorial
* TOFF set: -4
* TOFF inc: -3
 65:     LD  4,-3(1)	Pop left into ac1 
 66:    MUL  3,4,3	Op * 
 67:    LDA  2,0(3)	Copy result to return register 
 68:     LD  3,-1(1)	Load return address 
 69:     LD  1,0(1)	Adjust fp 
 70:    JMP  7,0(3)	Return 
 51:    JMP  7,19(7)	Jump around the ELSE [backpatch] 
* END IF
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
 71:    LDC  2,0(6)	Set return value to 0 
 72:     LD  3,-1(1)	Load return address 
 73:     LD  1,0(1)	Adjust fp 
 74:    JMP  7,0(3)	Return 
* END FUNCTION factorial
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
 75:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
* CALL input
 76:     ST  1,-3(1)	Store fp in ghost frame for input
* TOFF dec: -4
* TOFF dec: -5
* Param end input
 77:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 78:    LDA  3,1(7)	Return address in ac 
 79:    JMP  7,-79(7)	CALL input
 80:    LDA  3,0(2)	Save the result in ac 
* Call end input
* TOFF set: -3
 81:     ST  3,-2(1)	Store variable n
* EXPRESSION
* CALL factorial
 82:     ST  1,-3(1)	Store fp in ghost frame for factorial
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 83:     LD  3,-2(1)	Load variable n
 84:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end factorial
 85:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 86:    LDA  3,1(7)	Return address in ac 
 87:    JMP  7,-49(7)	CALL factorial
 88:    LDA  3,0(2)	Save the result in ac 
* Call end factorial
* TOFF set: -3
 89:     ST  3,-2(1)	Store variable n
* EXPRESSION
* CALL output
 90:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 91:     LD  3,-2(1)	Load variable n
 92:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 93:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 94:    LDA  3,1(7)	Return address in ac 
 95:    JMP  7,-90(7)	CALL output
 96:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL outnl
 97:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
 98:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 99:    LDA  3,1(7)	Return address in ac 
100:    JMP  7,-67(7)	CALL outnl
101:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
102:    LDC  2,0(6)	Set return value to 0 
103:     LD  3,-1(1)	Load return address 
104:     LD  1,0(1)	Adjust fp 
105:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,105(7)	Jump to init [backpatch] 
* INIT
106:    LDA  1,0(0)	set first frame at end of globals 
107:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
108:    LDA  3,1(7)	Return address in ac 
109:    JMP  7,-35(7)	Jump to main 
110:   HALT  0,0,0	DONE! 
* END INIT
