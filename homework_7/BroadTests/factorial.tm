* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  factorial.c-
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
* TOFF set: -5
* Compound Body
* EXPRESSION
 40:    LDC  3,1(6)	Load integer constant 
 41:     ST  3,-3(1)	Store variable i
 42:     ST  3,-4(1)	Store variable f
* WHILE
 43:     LD  3,-3(1)	Load variable i
 44:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 45:     LD  3,-2(1)	Load variable n
* TOFF inc: -5
 46:     LD  4,-5(1)	Pop left into ac1 
 47:    TLE  3,4,3	Op <= 
 48:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -5
* Compound Body
* EXPRESSION
* CALL output
 50:     ST  1,-5(1)	Store fp in ghost frame for output
* TOFF dec: -6
* TOFF dec: -7
* Param 1
 51:     LD  3,-3(1)	Load variable i
 52:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end output
 53:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 54:    LDA  3,1(7)	Return address in ac 
 55:    JMP  7,-50(7)	CALL output
 56:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -5
* EXPRESSION
 57:     LD  3,-4(1)	Load variable f
 58:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 59:     LD  3,-3(1)	Load variable i
* TOFF inc: -5
 60:     LD  4,-5(1)	Pop left into ac1 
 61:    MUL  3,4,3	Op * 
 62:     ST  3,-4(1)	Store variable f
* EXPRESSION
 63:     LD  3,-3(1)	load lhs variable i
 64:    LDA  3,1(3)	increment value of i
 65:     ST  3,-3(1)	Store variable i
* TOFF set: -5
* END COMPOUND
 66:    JMP  7,-24(7)	go to beginning of loop 
 49:    JMP  7,17(7)	Jump past loop [backpatch] 
* END WHILE
* RETURN
 67:     LD  3,-4(1)	Load variable f
 68:    LDA  2,0(3)	Copy result to return register 
 69:     LD  3,-1(1)	Load return address 
 70:     LD  1,0(1)	Adjust fp 
 71:    JMP  7,0(3)	Return 
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
 72:    LDC  2,0(6)	Set return value to 0 
 73:     LD  3,-1(1)	Load return address 
 74:     LD  1,0(1)	Adjust fp 
 75:    JMP  7,0(3)	Return 
* END FUNCTION factorial
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
 76:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
* CALL input
 77:     ST  1,-3(1)	Store fp in ghost frame for input
* TOFF dec: -4
* TOFF dec: -5
* Param end input
 78:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 79:    LDA  3,1(7)	Return address in ac 
 80:    JMP  7,-80(7)	CALL input
 81:    LDA  3,0(2)	Save the result in ac 
* Call end input
* TOFF set: -3
 82:     ST  3,-2(1)	Store variable n
* EXPRESSION
* CALL factorial
 83:     ST  1,-3(1)	Store fp in ghost frame for factorial
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 84:     LD  3,-2(1)	Load variable n
 85:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end factorial
 86:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 87:    LDA  3,1(7)	Return address in ac 
 88:    JMP  7,-50(7)	CALL factorial
 89:    LDA  3,0(2)	Save the result in ac 
* Call end factorial
* TOFF set: -3
 90:     ST  3,-2(1)	Store variable n
* EXPRESSION
* CALL output
 91:     ST  1,-3(1)	Store fp in ghost frame for output
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 92:     LD  3,-2(1)	Load variable n
 93:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 94:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 95:    LDA  3,1(7)	Return address in ac 
 96:    JMP  7,-91(7)	CALL output
 97:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL outnl
 98:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
 99:    LDA  1,-3(1)	Ghost frame becomes new active frame 
100:    LDA  3,1(7)	Return address in ac 
101:    JMP  7,-68(7)	CALL outnl
102:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
103:    LDC  2,0(6)	Set return value to 0 
104:     LD  3,-1(1)	Load return address 
105:     LD  1,0(1)	Adjust fp 
106:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,106(7)	Jump to init [backpatch] 
* INIT
107:    LDA  1,0(0)	set first frame at end of globals 
108:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
109:    LDA  3,1(7)	Return address in ac 
110:    JMP  7,-35(7)	Jump to main 
111:   HALT  0,0,0	DONE! 
* END INIT
