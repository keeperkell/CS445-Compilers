* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  h06.c-
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
* TOFF set: -4
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -4
* Compound Body
* IF
 40:     LD  3,-3(1)	Load variable y
 41:     ST  3,-4(1)	Push left side 
* TOFF dec: -5
 42:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -4
 43:     LD  4,-4(1)	Pop left into ac1 
 44:    TGE  3,4,3	Op >= 
* THEN
* COMPOUND
* TOFF set: -4
* Compound Body
* EXPRESSION
 46:     LD  3,-3(1)	Load variable y
 47:     ST  3,-4(1)	Push index 
* TOFF dec: -5
 48:     LD  3,-3(1)	Load variable y
* TOFF inc: -4
 49:     LD  4,-4(1)	Pop index 
 50:     LD  5,-2(1)	Load address of base of array x
 51:    SUB  5,5,4	Compute offset of value 
 52:     ST  3,0(5)	Store variable x
* EXPRESSION
* CALL cat
 53:     ST  1,-4(1)	Store fp in ghost frame for cat
* TOFF dec: -5
* TOFF dec: -6
* Param 1
 54:     LD  3,-2(1)	Load address of base of array x
 55:     ST  3,-6(1)	Push parameter 
* TOFF dec: -7
* Param 2
 56:     LD  3,-3(1)	Load variable y
 57:     ST  3,-7(1)	Push left side 
* TOFF dec: -8
 58:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -7
 59:     LD  4,-7(1)	Pop left into ac1 
 60:    SUB  3,4,3	Op - 
 61:     ST  3,-7(1)	Push parameter 
* TOFF dec: -8
* Param end cat
 62:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 63:    LDA  3,1(7)	Return address in ac 
 64:    JMP  7,-26(7)	CALL cat
 65:    LDA  3,0(2)	Save the result in ac 
* Call end cat
* TOFF set: -4
* TOFF set: -4
* END COMPOUND
 45:    JZR  3,20(7)	Jump around the THEN if false [backpatch] 
* END IF
* RETURN
 66:     LD  3,-1(1)	Load return address 
 67:     LD  1,0(1)	Adjust fp 
 68:    JMP  7,0(3)	Return 
* TOFF set: -4
* END COMPOUND
* Add standard closing in case there is no return statement
 69:    LDC  2,0(6)	Set return value to 0 
 70:     LD  3,-1(1)	Load return address 
 71:     LD  1,0(1)	Adjust fp 
 72:    JMP  7,0(3)	Return 
* END FUNCTION cat
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
 73:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -22
 74:    LDC  3,18(6)	load size of array x
 75:     ST  3,-2(1)	save size of array x
* Compound Body
* EXPRESSION
 76:    LDC  3,12(6)	Load integer constant 
 77:     ST  3,-21(1)	Store variable y
* EXPRESSION
* CALL cat
 78:     ST  1,-22(1)	Store fp in ghost frame for cat
* TOFF dec: -23
* TOFF dec: -24
* Param 1
 79:    LDA  3,-3(1)	Load address of base of array x
 80:     ST  3,-24(1)	Push parameter 
* TOFF dec: -25
* Param 2
 81:     LD  3,-21(1)	Load variable y
 82:     ST  3,-25(1)	Push parameter 
* TOFF dec: -26
* Param end cat
 83:    LDA  1,-22(1)	Ghost frame becomes new active frame 
 84:    LDA  3,1(7)	Return address in ac 
 85:    JMP  7,-47(7)	CALL cat
 86:    LDA  3,0(2)	Save the result in ac 
* Call end cat
* TOFF set: -22
* WHILE
 87:     LD  3,-21(1)	Load variable y
 88:     ST  3,-22(1)	Push left side 
* TOFF dec: -23
 89:    LDC  3,0(6)	Load integer constant 
* TOFF inc: -22
 90:     LD  4,-22(1)	Pop left into ac1 
 91:    TGE  3,4,3	Op >= 
 92:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* TOFF set: -22
* Compound Body
* EXPRESSION
* CALL output
 94:     ST  1,-22(1)	Store fp in ghost frame for output
* TOFF dec: -23
* TOFF dec: -24
* Param 1
 95:     LD  3,-21(1)	Load variable y
 96:     ST  3,-24(1)	Push parameter 
* TOFF dec: -25
* Param end output
 97:    LDA  1,-22(1)	Ghost frame becomes new active frame 
 98:    LDA  3,1(7)	Return address in ac 
 99:    JMP  7,-94(7)	CALL output
100:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -22
* EXPRESSION
* CALL outnl
101:     ST  1,-22(1)	Store fp in ghost frame for outnl
* TOFF dec: -23
* TOFF dec: -24
* Param end outnl
102:    LDA  1,-22(1)	Ghost frame becomes new active frame 
103:    LDA  3,1(7)	Return address in ac 
104:    JMP  7,-71(7)	CALL outnl
105:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -22
* EXPRESSION
106:     LD  3,-21(1)	Load variable y
107:     ST  3,-22(1)	Push left side 
* TOFF dec: -23
108:    LDC  3,1(6)	Load integer constant 
* TOFF inc: -22
109:     LD  4,-22(1)	Pop left into ac1 
110:    SUB  3,4,3	Op - 
111:     ST  3,-21(1)	Store variable y
* TOFF set: -22
* END COMPOUND
112:    JMP  7,-26(7)	go to beginning of loop 
 93:    JMP  7,19(7)	Jump past loop [backpatch] 
* END WHILE
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
113:    LDC  2,0(6)	Set return value to 0 
114:     LD  3,-1(1)	Load return address 
115:     LD  1,0(1)	Adjust fp 
116:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,116(7)	Jump to init [backpatch] 
* INIT
117:    LDA  1,0(0)	set first frame at end of globals 
118:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
119:    LDA  3,1(7)	Return address in ac 
120:    JMP  7,-48(7)	Jump to main 
121:   HALT  0,0,0	DONE! 
* END INIT
