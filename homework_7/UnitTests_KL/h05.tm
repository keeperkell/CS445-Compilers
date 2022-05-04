* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  h05.c-
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
 41:     LD  3,-2(1)	Load address of base of array x
 42:     ST  3,-5(1)	Push left side 
* TOFF dec: -6
 43:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -5
 44:     LD  4,-5(1)	Pop left into ac1 
 45:    SUB  3,4,3	compute location from index 
 46:     LD  3,0(3)	Load array element 
 47:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end output
 48:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 49:    LDA  3,1(7)	Return address in ac 
 50:    JMP  7,-45(7)	CALL output
 51:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -3
* EXPRESSION
* CALL outnl
 52:     ST  1,-3(1)	Store fp in ghost frame for outnl
* TOFF dec: -4
* TOFF dec: -5
* Param end outnl
 53:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 54:    LDA  3,1(7)	Return address in ac 
 55:    JMP  7,-22(7)	CALL outnl
 56:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -3
* IF
 57:     LD  3,-2(1)	Load address of base of array x
 58:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 59:    LDC  3,3(6)	Load integer constant 
* TOFF inc: -3
 60:     LD  4,-3(1)	Pop left into ac1 
 61:    SUB  3,4,3	compute location from index 
 62:     LD  3,0(3)	Load array element 
 63:     ST  3,-3(1)	Push left side 
* TOFF dec: -4
 64:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -3
 65:     LD  4,-3(1)	Pop left into ac1 
 66:    TGT  3,4,3	Op > 
* THEN
* COMPOUND
* TOFF set: -3
* Compound Body
* EXPRESSION
 68:    LDC  3,3(6)	Load integer constant 
 69:     ST  3,-3(1)	Push index 
* TOFF dec: -4
 70:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -3
 71:     LD  4,-3(1)	Pop index 
 72:     LD  5,-2(1)	Load address of base of array x
 73:    SUB  5,5,4	Compute offset of value 
 74:     LD  4,0(5)	load lhs variable x
 75:    SUB  3,4,3	op -= 
 76:     ST  3,0(5)	Store variable x
* EXPRESSION
* CALL cat
 77:     ST  1,-3(1)	Store fp in ghost frame for cat
* TOFF dec: -4
* TOFF dec: -5
* Param 1
 78:     LD  3,-2(1)	Load address of base of array x
 79:     ST  3,-5(1)	Push parameter 
* TOFF dec: -6
* Param end cat
 80:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 81:    LDA  3,1(7)	Return address in ac 
 82:    JMP  7,-44(7)	CALL cat
 83:    LDA  3,0(2)	Save the result in ac 
* Call end cat
* TOFF set: -3
* TOFF set: -3
* END COMPOUND
 67:    JZR  3,16(7)	Jump around the THEN if false [backpatch] 
* END IF
* RETURN
 84:     LD  3,-1(1)	Load return address 
 85:     LD  1,0(1)	Adjust fp 
 86:    JMP  7,0(3)	Return 
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
 87:    LDC  2,0(6)	Set return value to 0 
 88:     LD  3,-1(1)	Load return address 
 89:     LD  1,0(1)	Adjust fp 
 90:    JMP  7,0(3)	Return 
* END FUNCTION cat
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
 91:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -2
* Compound Body
* EXPRESSION
 92:    LDC  3,3(6)	Load integer constant 
 93:     ST  3,-2(1)	Push index 
* TOFF dec: -3
 94:    LDC  3,12(6)	Load integer constant 
* TOFF inc: -2
 95:     LD  4,-2(1)	Pop index 
 96:    LDA  5,-1(0)	Load address of base of array x
 97:    SUB  5,5,4	Compute offset of value 
 98:     ST  3,0(5)	Store variable x
* EXPRESSION
* CALL cat
 99:     ST  1,-2(1)	Store fp in ghost frame for cat
* TOFF dec: -3
* TOFF dec: -4
* Param 1
100:    LDA  3,-1(0)	Load address of base of array x
101:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end cat
102:    LDA  1,-2(1)	Ghost frame becomes new active frame 
103:    LDA  3,1(7)	Return address in ac 
104:    JMP  7,-66(7)	CALL cat
105:    LDA  3,0(2)	Save the result in ac 
* Call end cat
* TOFF set: -2
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
110:    LDA  1,-19(0)	set first frame at end of globals 
111:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
112:    LDC  3,18(6)	load size of array x
113:     ST  3,0(0)	save size of array x
* END INIT GLOBALS AND STATICS
114:    LDA  3,1(7)	Return address in ac 
115:    JMP  7,-25(7)	Jump to main 
116:   HALT  0,0,0	DONE! 
* END INIT
