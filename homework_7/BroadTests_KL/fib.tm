* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  fib.c-
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
 41:     LD  3,-2(1)	Load variable n
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
 52:     LD  3,-2(1)	Load variable n
 53:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 54:    LDC  3,3(6)	Load integer constant 
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
 57:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* RETURN
* CALL fib
 64:     ST  1,-3(1)	Store fp in ghost frame for fib
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 65:     LD  3,-2(1)	Load variable n
 66:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 67:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -5
 68:     LD  4,-5(1)	Pop left into ac1 
 69:    SUB  3,4,3	Op - 
 70:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end fib
 71:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 72:    LDA  3,1(7)	Return address in ac 
 73:    JMP  7,-35(7)	CALL fib
 74:    LDA  3,0(2)	Save the result in ac 
* Call end fib
* TOFF set: -3
 75:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
* CALL fib
 76:     ST  1,-4(1)	Store fp in ghost frame for fib
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 77:     LD  3,-2(1)	Load variable n
 78:     ST  3,-6(1)	Push left side 
* TOFF dec: -7
 79:    LDC  3,2(6)	Load integer constant 
* TOFF inc: -6
 80:     LD  4,-6(1)	Pop left into ac1 
 81:    SUB  3,4,3	Op - 
 82:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end fib
 83:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 84:    LDA  3,1(7)	Return address in ac 
 85:    JMP  7,-47(7)	CALL fib
 86:    LDA  3,0(2)	Save the result in ac 
* Call end fib
* TOFF set: -4
* TOFF inc: -3
 87:     LD  4,-3(1)	Pop left into ac1 
 88:    ADD  3,4,3	Op + 
 89:    LDA  2,0(3)	Copy result to return register 
 90:     LD  3,-1(1)	Load return address 
 91:     LD  1,0(1)	Adjust fp 
 92:    JMP  7,0(3)	Return 
 63:    JMP  7,29(7)	Jump around the ELSE [backpatch] 
* END IF
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
 93:    LDC  2,0(6)	Set return value to 0 
 94:     LD  3,-1(1)	Load return address 
 95:     LD  1,0(1)	Adjust fp 
 96:    JMP  7,0(3)	Return 
* END FUNCTION fib
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
 97:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -2
* Compound Body
* EXPRESSION
* CALL output
 98:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
* CALL fib
 99:     ST  1,-4(1)	Store fp in ghost frame for fib
* TOFF dec: -5
* TOFF dec: -6
* Param 1
* CALL input
100:     ST  1,-6(1)	Store fp in ghost frame for input
* TOFF dec: -7
* TOFF dec: -8
* Param end input
101:    LDA  1,-6(1)	Ghost frame becomes new active frame 
102:    LDA  3,1(7)	Return address in ac 
103:    JMP  7,-103(7)	CALL input
104:    LDA  3,0(2)	Save the result in ac 
* Call end input
* TOFF set: -6
105:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end fib
106:    LDA  1,-4(1)	Ghost frame becomes new active frame 
107:    LDA  3,1(7)	Return address in ac 
108:    JMP  7,-70(7)	CALL fib
109:    LDA  3,0(2)	Save the result in ac 
* Call end fib
* TOFF set: -4
110:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
111:    LDA  1,-2(1)	Ghost frame becomes new active frame 
112:    LDA  3,1(7)	Return address in ac 
113:    JMP  7,-108(7)	CALL output
114:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL outnl
115:     ST  1,-2(1)	Store fp in ghost frame for outnl
* TOFF dec: -3
* TOFF dec: -4
* Param end outnl
116:    LDA  1,-2(1)	Ghost frame becomes new active frame 
117:    LDA  3,1(7)	Return address in ac 
118:    JMP  7,-85(7)	CALL outnl
119:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -2
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
120:    LDC  2,0(6)	Set return value to 0 
121:     LD  3,-1(1)	Load return address 
122:     LD  1,0(1)	Adjust fp 
123:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,123(7)	Jump to init [backpatch] 
* INIT
124:    LDA  1,0(0)	set first frame at end of globals 
125:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
126:    LDA  3,1(7)	Return address in ac 
127:    JMP  7,-31(7)	Jump to main 
128:   HALT  0,0,0	DONE! 
* END INIT
