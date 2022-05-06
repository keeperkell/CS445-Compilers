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
* START OP  [
* START ID
 50:    LDA  3,-3(1)	Load address of base of array2 x
* END ID
 51:     ST  3,-12(1)	Push left side1 
* LOFF Line 289: -13
 52:    LDC  3,3(6)	Load int const 
* LOFF Line 292: -12
 53:     LD  4,-12(1)	Pop left into acl 1 
 54:    SUB  3,4,3	compute location from index 
 55:     LD  3,0(3)	Load array element 
* LOFF Line 296: -11
* END OP  [
 56:    LDA  3,1(3)	Increment ++ [
 57:     ST  3,0(1)	Store var [
* END ASSIGN
 58:     ST  3,-12(1)	Push parameter 
 59:    LDA  1,-10(1)	Ghost frame becomes new active frame 
* END Param 1
 60:    LDA  3,1(7)	Load return addr 
* BackPatch 61
 61:    JMP  7,-56(7)	CALL OUTPUT output
 62:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -10
* START CALL
 63:     ST  1,-10(1)	Store fp in ghost frame for outnl outnl
 64:    LDA  1,-10(1)	Load fp 
 65:    LDA  3,1(7)	Load return addr 
* BackPatch 66
 66:    JMP  7,-33(7)	CALL OUTPUT outnl
 67:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -10
* START CALL
 68:     ST  1,-10(1)	Store fp in ghost frame for outnl output
* START Param 1
* LOFF Line680: -11
* LOFF Line685: -12
* START OP  [
* START ID
 69:    LDA  3,-3(1)	Load address of base of array2 x
* END ID
 70:     ST  3,-12(1)	Push left side1 
* LOFF Line 289: -13
 71:    LDC  3,3(6)	Load int const 
* LOFF Line 292: -12
 72:     LD  4,-12(1)	Pop left into acl 1 
 73:    SUB  3,4,3	compute location from index 
 74:     LD  3,0(3)	Load array element 
* LOFF Line 296: -11
* END OP  [
 75:     ST  3,-12(1)	Push parameter 
 76:    LDA  1,-10(1)	Ghost frame becomes new active frame 
* END Param 1
 77:    LDA  3,1(7)	Load return addr 
* BackPatch 78
 78:    JMP  7,-73(7)	CALL OUTPUT output
 79:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -10
* START CALL
 80:     ST  1,-10(1)	Store fp in ghost frame for outnl outnl
 81:    LDA  1,-10(1)	Load fp 
 82:    LDA  3,1(7)	Load return addr 
* BackPatch 83
 83:    JMP  7,-50(7)	CALL OUTPUT outnl
 84:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -10
* START CALL
 85:     ST  1,-10(1)	Store fp in ghost frame for outnl output
* START Param 1
* LOFF Line680: -11
* LOFF Line685: -12
* START ASSIGN
* START OP  [
* START ID
 86:    LDA  3,-3(1)	Load address of base of array2 x
* END ID
 87:     ST  3,-12(1)	Push left side1 
* LOFF Line 289: -13
 88:    LDC  3,3(6)	Load int const 
* LOFF Line 292: -12
 89:     LD  4,-12(1)	Pop left into acl 1 
 90:    SUB  3,4,3	compute location from index 
 91:     LD  3,0(3)	Load array element 
* LOFF Line 296: -11
* END OP  [
 92:    LDA  3,-1(3)	Decrement -- [
 93:     ST  3,0(1)	Store var [
* END ASSIGN
 94:     ST  3,-12(1)	Push parameter 
 95:    LDA  1,-10(1)	Ghost frame becomes new active frame 
* END Param 1
 96:    LDA  3,1(7)	Load return addr 
* BackPatch 97
 97:    JMP  7,-92(7)	CALL OUTPUT output
 98:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -10
* START CALL
 99:     ST  1,-10(1)	Store fp in ghost frame for outnl outnl
100:    LDA  1,-10(1)	Load fp 
101:    LDA  3,1(7)	Load return addr 
* BackPatch 102
102:    JMP  7,-69(7)	CALL OUTPUT outnl
103:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -10
* START CALL
104:     ST  1,-10(1)	Store fp in ghost frame for outnl output
* START Param 1
* LOFF Line680: -11
* LOFF Line685: -12
* START OP  [
* START ID
105:    LDA  3,-3(1)	Load address of base of array2 x
* END ID
106:     ST  3,-12(1)	Push left side1 
* LOFF Line 289: -13
107:    LDC  3,3(6)	Load int const 
* LOFF Line 292: -12
108:     LD  4,-12(1)	Pop left into acl 1 
109:    SUB  3,4,3	compute location from index 
110:     LD  3,0(3)	Load array element 
* LOFF Line 296: -11
* END OP  [
111:     ST  3,-12(1)	Push parameter 
112:    LDA  1,-10(1)	Ghost frame becomes new active frame 
* END Param 1
113:    LDA  3,1(7)	Load return addr 
* BackPatch 114
114:    JMP  7,-109(7)	CALL OUTPUT output
115:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -10
* START CALL
116:     ST  1,-10(1)	Store fp in ghost frame for outnl outnl
117:    LDA  1,-10(1)	Load fp 
118:    LDA  3,1(7)	Load return addr 
* BackPatch 119
119:    JMP  7,-86(7)	CALL OUTPUT outnl
120:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -10
* END COMPOUND BODY
* END COMPOUND
121:    LDC  2,0(6)	Set return valuye to 0 
122:     LD  3,-1(1)	Load return address 
123:     LD  1,0(1)	Adjust file pointer 
124:    JMP  7,0(3)	return 
* End of Function main
  0:    JMP  7,124(7)	Jump to init 
* START INIT
125:    LDA  1,0(0)	Set first frame after globals 
126:     ST  1,0(1)	Store old fp 
* START INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
127:    LDA  3,1(7)	Load return address 
128:    JMP  7,-90(7)	Jump to main 
129:   HALT  0,0,0	DONE 
* END INIT
