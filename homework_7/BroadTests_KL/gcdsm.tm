* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  gcdsm.c-
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
* FUNCTION gcd
* TOFF set: -4
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -4
* Compound Body
* IF
 40:     LD  3,-3(1)	Load variable v
 41:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 42:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -4
 43:     LD  4,-4(1)	Pop left into ac1 
 44:    TEQ  3,4,3	Op = 
* THEN
* RETURN
 46:     LD  3,-2(1)	Load variable u
 47:    LDA  2,0(3)	Copy result to return register 
 48:     LD  3,-1(1)	Load return address 
 49:     LD  1,0(1)	Adjust fp 
 50:    JMP  7,0(3)	Return 
 45:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* RETURN
* CALL gcd
 52:     ST  1,-4(1)	Store fp in ghost frame for gcd
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 53:     LD  3,-3(1)	Load variable v
 54:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param 2
 55:     LD  3,-2(1)	Load variable u
 56:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
 57:     LD  3,-2(1)	Load variable u
 58:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
 59:     LD  3,-3(1)	Load variable v
* TOFF inc: -8
 60:     LD  4,-8(1)	Pop left into ac1 
 61:    DIV  3,4,3	Op / 
 62:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
 63:     LD  3,-3(1)	Load variable v
* TOFF inc: -8
 64:     LD  4,-8(1)	Pop left into ac1 
 65:    MUL  3,4,3	Op * 
* TOFF inc: -7
 66:     LD  4,-7(1)	Pop left into ac1 
 67:    SUB  3,4,3	Op - 
 68:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end gcd
 69:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 70:    LDA  3,1(7)	Return address in ac 
 71:    JMP  7,-33(7)	CALL gcd
 72:    LDA  3,0(2)	Save the result in ac 
* Call end gcd
* TOFF set: -4
 73:    LDA  2,0(3)	Copy result to return register 
 74:     LD  3,-1(1)	Load return address 
 75:     LD  1,0(1)	Adjust fp 
 76:    JMP  7,0(3)	Return 
 51:    JMP  7,25(7)	Jump around the ELSE [backpatch] 
* END IF
* TOFF set: -4
* END COMPOUND
* Add standard closing in case there is no return statement
 77:    LDC  2,0(6)	Set return value to 0 
 78:     LD  3,-1(1)	Load return address 
 79:     LD  1,0(1)	Adjust fp 
 80:    JMP  7,0(3)	Return 
* END FUNCTION gcd
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
 81:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -4
* Compound Body
* EXPRESSION
* CALL input
 82:     ST  1,-4(1)	Store fp in ghost frame for input
* TOFF dec: -5
* TOFF dec: -6
* Param end input
 83:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 84:    LDA  3,1(7)	Return address in ac 
 85:    JMP  7,-85(7)	CALL input
 86:    LDA  3,0(2)	Save the result in ac 
* Call end input
* TOFF set: -4
 87:     ST  3,-2(1)	Store variable x
* EXPRESSION
* CALL input
 88:     ST  1,-4(1)	Store fp in ghost frame for input
* TOFF dec: -5
* TOFF dec: -6
* Param end input
 89:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 90:    LDA  3,1(7)	Return address in ac 
 91:    JMP  7,-91(7)	CALL input
 92:    LDA  3,0(2)	Save the result in ac 
* Call end input
* TOFF set: -4
 93:     ST  3,-3(1)	Store variable y
* EXPRESSION
* CALL output
 94:     ST  1,-4(1)	Store fp in ghost frame for output
* TOFF dec: -5
* TOFF dec: -6
* Param 1
* CALL gcd
 95:     ST  1,-6(1)	Store fp in ghost frame for gcd
* TOFF dec: -7
* TOFF dec: -8
* Param 1
 96:     LD  3,-2(1)	Load variable x
 97:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param 2
 98:     LD  3,-3(1)	Load variable y
 99:     ST  3,-9(1)	Push parameter 
* TOFF dec: -10
* Param end gcd
100:    LDA  1,-6(1)	Ghost frame becomes new active frame 
101:    LDA  3,1(7)	Return address in ac 
102:    JMP  7,-64(7)	CALL gcd
103:    LDA  3,0(2)	Save the result in ac 
* Call end gcd
* TOFF set: -6
104:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param end output
105:    LDA  1,-4(1)	Ghost frame becomes new active frame 
106:    LDA  3,1(7)	Return address in ac 
107:    JMP  7,-102(7)	CALL output
108:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -4
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
109:    LDC  2,0(6)	Set return value to 0 
110:     LD  3,-1(1)	Load return address 
111:     LD  1,0(1)	Adjust fp 
112:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,112(7)	Jump to init [backpatch] 
* INIT
113:    LDA  1,0(0)	set first frame at end of globals 
114:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
115:    LDA  3,1(7)	Return address in ac 
116:    JMP  7,-36(7)	Jump to main 
117:   HALT  0,0,0	DONE! 
* END INIT
