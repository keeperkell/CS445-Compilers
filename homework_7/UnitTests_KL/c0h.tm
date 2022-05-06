* =================================================
* C- compiler version C-S22
* Built: Apr 17 - May 8
* Author: Keller Lawson
* File Compiled:  homework_7/UnitTests_KL/c0h.tm
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
* FuncK dog
* LOFF Line96: -3
 39:     ST  3,-1(1)	Store return addr 
* COMPOUND
* LOFF Line188: -3
* START COMPOUND BODY
* START CALL
 40:     ST  1,-3(1)	Store fp in ghost frame for outnl output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
* START ASSIGN
* START OP  [
* START ID
 41:     LD  3,-2(1)	Load address of base of array3 x
* LOFF Line622: -6
* END ID
 42:     ST  3,-6(1)	Push left side1 
* LOFF Line 289: -7
 43:    LDC  3,3(6)	Load int const 
* LOFF Line 292: -6
 44:     LD  4,-6(1)	Pop left into acl 1 
 45:    SUB  3,4,3	compute location from index 
 46:     LD  3,0(3)	Load array element 
* LOFF Line 296: -5
* END OP  [
 47:    LDA  3,1(3)	Increment ++ [
 48:     ST  3,0(1)	Store var [
* END ASSIGN
 49:     ST  3,-6(1)	Push parameter 
 50:    LDA  1,-3(1)	Ghost frame becomes new active frame 
* END Param 1
 51:    LDA  3,1(7)	Load return addr 
* BackPatch 52
 52:    JMP  7,-47(7)	CALL OUTPUT output
 53:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
* START CALL
 54:     ST  1,-3(1)	Store fp in ghost frame for outnl outnl
 55:    LDA  1,-3(1)	Load fp 
 56:    LDA  3,1(7)	Load return addr 
* BackPatch 57
 57:    JMP  7,-24(7)	CALL OUTPUT outnl
 58:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
* START CALL
 59:     ST  1,-3(1)	Store fp in ghost frame for outnl output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
* START OP  [
* START ID
 60:     LD  3,-2(1)	Load address of base of array3 x
* LOFF Line622: -6
* END ID
 61:     ST  3,-6(1)	Push left side1 
* LOFF Line 289: -7
 62:    LDC  3,3(6)	Load int const 
* LOFF Line 292: -6
 63:     LD  4,-6(1)	Pop left into acl 1 
 64:    SUB  3,4,3	compute location from index 
 65:     LD  3,0(3)	Load array element 
* LOFF Line 296: -5
* END OP  [
 66:     ST  3,-6(1)	Push parameter 
 67:    LDA  1,-3(1)	Ghost frame becomes new active frame 
* END Param 1
 68:    LDA  3,1(7)	Load return addr 
* BackPatch 69
 69:    JMP  7,-64(7)	CALL OUTPUT output
 70:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
* START CALL
 71:     ST  1,-3(1)	Store fp in ghost frame for outnl outnl
 72:    LDA  1,-3(1)	Load fp 
 73:    LDA  3,1(7)	Load return addr 
* BackPatch 74
 74:    JMP  7,-41(7)	CALL OUTPUT outnl
 75:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
* START CALL
 76:     ST  1,-3(1)	Store fp in ghost frame for outnl output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
* START ASSIGN
* START OP  [
* START ID
 77:     LD  3,-2(1)	Load address of base of array3 x
* LOFF Line622: -6
* END ID
 78:     ST  3,-6(1)	Push left side1 
* LOFF Line 289: -7
 79:    LDC  3,3(6)	Load int const 
* LOFF Line 292: -6
 80:     LD  4,-6(1)	Pop left into acl 1 
 81:    SUB  3,4,3	compute location from index 
 82:     LD  3,0(3)	Load array element 
* LOFF Line 296: -5
* END OP  [
 83:    LDA  3,-1(3)	Decrement -- [
 84:     ST  3,0(1)	Store var [
* END ASSIGN
 85:     ST  3,-6(1)	Push parameter 
 86:    LDA  1,-3(1)	Ghost frame becomes new active frame 
* END Param 1
 87:    LDA  3,1(7)	Load return addr 
* BackPatch 88
 88:    JMP  7,-83(7)	CALL OUTPUT output
 89:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
* START CALL
 90:     ST  1,-3(1)	Store fp in ghost frame for outnl outnl
 91:    LDA  1,-3(1)	Load fp 
 92:    LDA  3,1(7)	Load return addr 
* BackPatch 93
 93:    JMP  7,-60(7)	CALL OUTPUT outnl
 94:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
* START CALL
 95:     ST  1,-3(1)	Store fp in ghost frame for outnl output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
* START OP  [
* START ID
 96:     LD  3,-2(1)	Load address of base of array3 x
* LOFF Line622: -6
* END ID
 97:     ST  3,-6(1)	Push left side1 
* LOFF Line 289: -7
 98:    LDC  3,3(6)	Load int const 
* LOFF Line 292: -6
 99:     LD  4,-6(1)	Pop left into acl 1 
100:    SUB  3,4,3	compute location from index 
101:     LD  3,0(3)	Load array element 
* LOFF Line 296: -5
* END OP  [
102:     ST  3,-6(1)	Push parameter 
103:    LDA  1,-3(1)	Ghost frame becomes new active frame 
* END Param 1
104:    LDA  3,1(7)	Load return addr 
* BackPatch 105
105:    JMP  7,-100(7)	CALL OUTPUT output
106:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
* START CALL
107:     ST  1,-3(1)	Store fp in ghost frame for outnl outnl
108:    LDA  1,-3(1)	Load fp 
109:    LDA  3,1(7)	Load return addr 
* BackPatch 110
110:    JMP  7,-77(7)	CALL OUTPUT outnl
111:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
* END COMPOUND BODY
* END COMPOUND
112:    LDC  2,0(6)	Set return valuye to 0 
113:     LD  3,-1(1)	Load return address 
114:     LD  1,0(1)	Adjust file pointer 
115:    JMP  7,0(3)	return 
* End of Function dog
* FuncK main
* LOFF Line96: -3
116:     ST  3,-1(1)	Store return addr 
* COMPOUND
* LOFF Line188: -10
* START COMPOUND BODY
117:    LDC  3,7(6)	load array size x
118:     ST  3,-2(1)	save array size x
* START ASSIGN
119:    LDC  3,3(6)	Load int const 
120:     ST  3,-10(1)	Push index on 
* LOFF Line 478: -11
121:    LDC  3,1023(6)	Load int const 
* LOFF Line 481: -10
122:     LD  4,-10(1)	Pop index off 
123:    LDA  5,-3(1)	Load address of base of array x
124:    SUB  5,5,4	Compute offset of value 
125:     ST  3,0(5)	Store var x
* END ASSIGN
* START CALL
126:     ST  1,-10(1)	Store fp in ghost frame for outnl dog
* START Param 1
* LOFF Line680: -11
* START ID
127:    LDA  3,-3(1)	Load address of base of array2 x
* END ID
128:     ST  3,-11(1)	Push parameter 
129:    LDA  1,-10(1)	Ghost frame becomes new active frame 
* END Param 1
130:    LDA  3,1(7)	Load return addr 
* BackPatch 131
131:    JMP  7,-129(7)	CALL OUTPUT dog
132:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -10
* START CALL
133:     ST  1,-10(1)	Store fp in ghost frame for outnl output
* START Param 1
* LOFF Line680: -11
* LOFF Line685: -12
* START OP  [
* START ID
134:    LDA  3,-3(1)	Load address of base of array2 x
* END ID
135:     ST  3,-12(1)	Push left side1 
* LOFF Line 289: -13
136:    LDC  3,3(6)	Load int const 
* LOFF Line 292: -12
137:     LD  4,-12(1)	Pop left into acl 1 
138:    SUB  3,4,3	compute location from index 
139:     LD  3,0(3)	Load array element 
* LOFF Line 296: -11
* END OP  [
140:     ST  3,-12(1)	Push parameter 
141:    LDA  1,-10(1)	Ghost frame becomes new active frame 
* END Param 1
142:    LDA  3,1(7)	Load return addr 
* BackPatch 143
143:    JMP  7,-138(7)	CALL OUTPUT output
144:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -10
* END COMPOUND BODY
* END COMPOUND
145:    LDC  2,0(6)	Set return valuye to 0 
146:     LD  3,-1(1)	Load return address 
147:     LD  1,0(1)	Adjust file pointer 
148:    JMP  7,0(3)	return 
* End of Function main
  0:    JMP  7,148(7)	Jump to init 
* START INIT
149:    LDA  1,0(0)	Set first frame after globals 
150:     ST  1,0(1)	Store old fp 
* START INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
151:    LDA  3,1(7)	Load return address 
152:    JMP  7,-37(7)	Jump to main 
153:   HALT  0,0,0	DONE 
* END INIT
