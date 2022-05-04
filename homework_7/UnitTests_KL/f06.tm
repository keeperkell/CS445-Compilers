* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  f06.c-
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
* FUNCTION cat
* TOFF set: -2
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -2
* Compound Body
* RETURN
 40:    LDC  3,1(6)	Load Boolean constant 
 41:    LDA  2,0(3)	Copy result to return register 
 42:     LD  3,-1(1)	Load return address 
 43:     LD  1,0(1)	Adjust fp 
 44:    JMP  7,0(3)	Return 
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
 45:    LDC  2,0(6)	Set return value to 0 
 46:     LD  3,-1(1)	Load return address 
 47:     LD  1,0(1)	Adjust fp 
 48:    JMP  7,0(3)	Return 
* END FUNCTION cat
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
 49:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
* CALL cat
 50:     ST  1,-3(1)	Store fp in ghost frame for cat
* TOFF dec: -4
* TOFF dec: -5
* Param end cat
 51:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 52:    LDA  3,1(7)	Return address in ac 
 53:    JMP  7,-15(7)	CALL cat
 54:    LDA  3,0(2)	Save the result in ac 
* Call end cat
* TOFF set: -3
 55:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 56:    LDC  3,0(6)	Load Boolean constant 
* TOFF inc: -3
 57:     LD  4,-3(1)	Pop left into ac1 
 58:    AND  3,4,3	Op AND 
 59:     ST  3,-2(1)	Store variable x
* EXPRESSION
* CALL outputb
 60:     ST  1,-3(1)	Store fp in ghost frame for outputb
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 61:     LD  3,-2(1)	Load variable x
 62:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end outputb
 63:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 64:    LDA  3,1(7)	Return address in ac 
 65:    JMP  7,-49(7)	CALL outputb
 66:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -3
* EXPRESSION
* CALL cat
 67:     ST  1,-3(1)	Store fp in ghost frame for cat
* TOFF dec: -4
* TOFF dec: -5
* Param end cat
 68:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 69:    LDA  3,1(7)	Return address in ac 
 70:    JMP  7,-32(7)	CALL cat
 71:    LDA  3,0(2)	Save the result in ac 
* Call end cat
* TOFF set: -3
 72:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 73:    LDC  3,0(6)	Load Boolean constant 
* TOFF inc: -3
 74:     LD  4,-3(1)	Pop left into ac1 
 75:     OR  3,4,3	Op OR 
 76:     ST  3,-2(1)	Store variable x
* EXPRESSION
* CALL outputb
 77:     ST  1,-3(1)	Store fp in ghost frame for outputb
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 78:     LD  3,-2(1)	Load variable x
 79:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end outputb
 80:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 81:    LDA  3,1(7)	Return address in ac 
 82:    JMP  7,-66(7)	CALL outputb
 83:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -3
* EXPRESSION
* CALL cat
 84:     ST  1,-3(1)	Store fp in ghost frame for cat
* TOFF dec: -4
* TOFF dec: -5
* Param end cat
 85:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 86:    LDA  3,1(7)	Return address in ac 
 87:    JMP  7,-49(7)	CALL cat
 88:    LDA  3,0(2)	Save the result in ac 
* Call end cat
* TOFF set: -3
 89:    LDC  4,1(6)	Load 1 
 90:    XOR  3,3,4	Op XOR to get logical not 
 91:     ST  3,-2(1)	Store variable x
* EXPRESSION
* CALL outputb
 92:     ST  1,-3(1)	Store fp in ghost frame for outputb
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 93:     LD  3,-2(1)	Load variable x
 94:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end outputb
 95:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 96:    LDA  3,1(7)	Return address in ac 
 97:    JMP  7,-81(7)	CALL outputb
 98:    LDA  3,0(2)	Save the result in ac 
* Call end outputb
* TOFF set: -3
* EXPRESSION
* CALL outnl
 99:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
100:    LDA  1,-3(1)	Ghost frame becomes new active frame 
101:    LDA  3,1(7)	Return address in ac 
102:    JMP  7,-69(7)	CALL outnl
103:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
104:    LDC  2,0(6)	Set return value to 0 
105:     LD  3,-1(1)	Load return address 
106:     LD  1,0(1)	Adjust fp 
107:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,107(7)	Jump to init [backpatch] 
* INIT
108:    LDA  1,0(0)	set first frame at end of globals 
109:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
110:    LDA  3,1(7)	Return address in ac 
111:    JMP  7,-63(7)	Jump to main 
112:   HALT  0,0,0	DONE! 
* END INIT
