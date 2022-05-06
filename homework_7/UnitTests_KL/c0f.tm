* =================================================
* C- compiler version C-S22
* Built: Apr 17 - May 8
* Author: Keller Lawson
* File Compiled:  homework_7/UnitTests_KL/c0f.tm
* =================================================
* 
* START FUNC INPUT
  1:     ST  3,-1(1)	Store return addr 
  2:     IN  2,2,2	Get int input 
  3:     LD  3,-1(1)	Load return addr 
  4:     LD  1,0(1)	Adjust fp 
  5:    JMP  7,0(3)	Return 
* END FUNC INPUT
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* START FUNC OUTPUT
  6:     ST  3,-1(1)	Store return addr 
  7:     LD  3,-2(1)	Load return addr 
  8:    OUT  3,3,3	Output int 
  9:     LD  3,-1(1)	Load return addr 
 10:     LD  1,0(1)	Adjust fp 
 11:    JMP  7,0(3)	Return 
* END FUNC OUTPUT
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* START FUNC INPUTB
 12:     ST  3,-1(1)	Store return addr 
 13:    INB  2,2,2	Get bool input 
 14:     LD  3,-1(1)	Load return addr 
 15:     LD  1,0(1)	Adjust fp 
 16:    JMP  7,0(3)	Return 
* END FUNC INPUTB
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* START FUNC OUTPUTB
 17:     ST  3,-1(1)	Store return addr 
 18:     LD  3,-2(1)	Load return addr 
 19:   OUTB  3,3,3	Output bool 
 20:     LD  3,-1(1)	Load return addr 
 21:     LD  1,0(1)	Adjust fp 
 22:    JMP  7,0(3)	Return 
* END FUNC OUTPUTB
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* START FUNC INPUTC
 23:     ST  3,-1(1)	Store return addr 
 24:    INC  2,2,2	Get char input 
 25:     LD  3,-1(1)	Load return addr 
 26:     LD  1,0(1)	Adjust fp 
 27:    JMP  7,0(3)	Return 
* END FUNC INPUTC
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* START FUNC OUTPUTC
 28:     ST  3,-1(1)	Store return addr 
 29:     LD  3,-2(1)	Load return addr 
 30:   OUTC  3,3,3	Output char 
 31:     LD  3,-1(1)	Load return addr 
 32:     LD  1,0(1)	Adjust fp 
 33:    JMP  7,0(3)	Return 
* END FUNC OUTPUTC
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* START FUNC OUTNL
 34:     ST  3,-1(1)	Store return addr 
 35:  OUTNL  3,3,3	Output newline 
 36:     LD  3,-1(1)	Load return addr 
 37:     LD  1,0(1)	Adjust fp 
 38:    JMP  7,0(3)	Return 
* END FUNC OUTNL
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FuncK main
* LOFF Line96: -2
 39:     ST  3,-1(1)	Store return addr 
* COMPOUND
* LOFF Line188: -10
* START COMPOUND BODY
 40:    LDC  3,7(6)	load array size x
 41:     ST  3,-2(1)	save array size x
* START ASSIGN
 42:    LDC  3,3(6)	Load int const 
 43:     ST  3,-10(1)	Push index on 
* LOFF Line 478: -11
 44:    LDC  3,1023(6)	Load int const 
* LOFF Line 481: -10
 45:     LD  4,-10(1)	Pop index off 
 46:    LDA  5,-3(1)	Load address of base of array x
 47:    SUB  5,5,4	Compute offset of value 
 48:     ST  3,0(5)	Store var x
* END ASSIGN
* START CALL
 49:     ST  1,-10(1)	Store fp in ghost frame for outnl output
* START Param 1
* LOFF Line680: -11
* LOFF Line685: -12
* START ASSIGN
 50:    LDC  3,3(6)	Load int const 
 51:    LDA  5,-3(1)	Load address of base of array 406 x
 52:    SUB  5,5,3	Compute offset of value 
 53:     LD  3,0(5)	Load lhs variable 435 x
 54:    LDA  3,1(3)	Increment ++ x
 55:     ST  3,0(5)	Store var x
* END ASSIGN
 56:     ST  3,-12(1)	Push parameter 
* END Param 1
 57:    LDA  1,-10(1)	Ghost frame becomes new active frame 
 58:    LDA  3,1(7)	Load return addr 
* BackPatch 59
 59:    JMP  7,-54(7)	CALL OUTPUT output
 60:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -10
* START CALL
 61:     ST  1,-10(1)	Store fp in ghost frame for outnl outnl
 62:    LDA  1,-10(1)	Load fp 
 63:    LDA  3,1(7)	Load return addr 
* BackPatch 64
 64:    JMP  7,-31(7)	CALL OUTPUT outnl
 65:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -10
* START CALL
 66:     ST  1,-10(1)	Store fp in ghost frame for outnl output
* START Param 1
* LOFF Line680: -11
* LOFF Line685: -12
* START OP  [
* START ID
 67:    LDA  3,-3(1)	Load address of base of array2 x
* END ID
 68:     ST  3,-12(1)	Push left side1 
* LOFF Line 289: -13
 69:    LDC  3,3(6)	Load int const 
* LOFF Line 292: -12
 70:     LD  4,-12(1)	Pop left into acl 1 
 71:    SUB  3,4,3	compute location from index 
 72:     LD  3,0(3)	Load array element 
* LOFF Line 296: -11
* END OP  [
 73:     ST  3,-12(1)	Push parameter 
* END Param 1
 74:    LDA  1,-10(1)	Ghost frame becomes new active frame 
 75:    LDA  3,1(7)	Load return addr 
* BackPatch 76
 76:    JMP  7,-71(7)	CALL OUTPUT output
 77:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -10
* START CALL
 78:     ST  1,-10(1)	Store fp in ghost frame for outnl outnl
 79:    LDA  1,-10(1)	Load fp 
 80:    LDA  3,1(7)	Load return addr 
* BackPatch 81
 81:    JMP  7,-48(7)	CALL OUTPUT outnl
 82:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -10
* START CALL
 83:     ST  1,-10(1)	Store fp in ghost frame for outnl output
* START Param 1
* LOFF Line680: -11
* LOFF Line685: -12
* START ASSIGN
 84:    LDC  3,3(6)	Load int const 
 85:    LDA  5,-3(1)	Load address of base of array 406 x
 86:    SUB  5,5,3	Compute offset of value 
 87:     LD  3,0(5)	Load lhs variable 435 x
 88:    LDA  3,-1(3)	Decrement -- x
 89:     ST  3,0(5)	Store var x
* END ASSIGN
 90:     ST  3,-12(1)	Push parameter 
* END Param 1
 91:    LDA  1,-10(1)	Ghost frame becomes new active frame 
 92:    LDA  3,1(7)	Load return addr 
* BackPatch 93
 93:    JMP  7,-88(7)	CALL OUTPUT output
 94:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -10
* START CALL
 95:     ST  1,-10(1)	Store fp in ghost frame for outnl outnl
 96:    LDA  1,-10(1)	Load fp 
 97:    LDA  3,1(7)	Load return addr 
* BackPatch 98
 98:    JMP  7,-65(7)	CALL OUTPUT outnl
 99:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -10
* START CALL
100:     ST  1,-10(1)	Store fp in ghost frame for outnl output
* START Param 1
* LOFF Line680: -11
* LOFF Line685: -12
* START OP  [
* START ID
101:    LDA  3,-3(1)	Load address of base of array2 x
* END ID
102:     ST  3,-12(1)	Push left side1 
* LOFF Line 289: -13
103:    LDC  3,3(6)	Load int const 
* LOFF Line 292: -12
104:     LD  4,-12(1)	Pop left into acl 1 
105:    SUB  3,4,3	compute location from index 
106:     LD  3,0(3)	Load array element 
* LOFF Line 296: -11
* END OP  [
107:     ST  3,-12(1)	Push parameter 
* END Param 1
108:    LDA  1,-10(1)	Ghost frame becomes new active frame 
109:    LDA  3,1(7)	Load return addr 
* BackPatch 110
110:    JMP  7,-105(7)	CALL OUTPUT output
111:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -10
* START CALL
112:     ST  1,-10(1)	Store fp in ghost frame for outnl outnl
113:    LDA  1,-10(1)	Load fp 
114:    LDA  3,1(7)	Load return addr 
* BackPatch 115
115:    JMP  7,-82(7)	CALL OUTPUT outnl
116:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -10
* END COMPOUND BODY
* END COMPOUND
117:    LDC  2,0(6)	Set return value to 0 
118:     LD  3,-1(1)	Load return address 
119:     LD  1,0(1)	Adjust fp 
120:    JMP  7,0(3)	return 
* End of Function main
  0:    JMP  7,120(7)	Jump to init 
* START INIT
121:    LDA  1,0(0)	Set first frame after globals 
122:     ST  1,0(1)	Store old fp 
* START INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
123:    LDA  3,1(7)	Load return address 
124:    JMP  7,-86(7)	Jump to main 
125:   HALT  0,0,0	DONE 
* END INIT
