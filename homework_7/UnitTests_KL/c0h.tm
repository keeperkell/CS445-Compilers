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
 40:     ST  1,-3(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
* START ASSIGN
 41:    LDC  3,3(6)	Load int const 
 42:     LD  5,-2(1)	Load address of base of array 406 x
 43:    SUB  5,5,3	Compute offset of value 
 44:     LD  3,0(5)	Load lhs variable 435 x
 45:    LDA  3,1(3)	Increment ++ x
 46:     ST  3,0(5)	Store var x
* END ASSIGN
 47:     ST  3,-5(1)	Push parameter 623 
* LOFF Line615: -6
* END Param 1
 48:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 49:    LDA  3,1(7)	Load return addr 
* BackPatch 50
 50:    JMP  7,-45(7)	CALL OUTPUT output
 51:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
* START CALL
 52:     ST  1,-3(1)	Store fp in ghost frame for outnl
 53:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 54:    LDA  3,1(7)	Load return addr 
* BackPatch 55
 55:    JMP  7,-22(7)	CALL OUTPUT outnl
 56:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
* START CALL
* START Param 1 array op 606
 57:     ST  1,-3(1)	Store fp in ghost frame for  output
* START ID
 58:     LD  3,-2(1)	Load address of base of array3 x
* END ID
 59:     ST  3,-5(1)	Push left 610 
* LOFF Line614: -6
 60:    LDC  3,3(6)	Load int const 
 61:     LD  4,-5(1)	Pop left into acl 1 
 62:    SUB  3,4,3	compute location from index 
 63:     LD  3,0(3)	Load array element 
 64:     ST  3,-5(1)	Push parameter 618 
* LOFF Line622: -6
* END Param 1
 65:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 66:    LDA  3,1(7)	Load return addr 
* BackPatch 67
 67:    JMP  7,-62(7)	CALL OUTPUT output
 68:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
* START CALL
 69:     ST  1,-3(1)	Store fp in ghost frame for outnl
 70:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 71:    LDA  3,1(7)	Load return addr 
* BackPatch 72
 72:    JMP  7,-39(7)	CALL OUTPUT outnl
 73:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
* START CALL
 74:     ST  1,-3(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
* START ASSIGN
 75:    LDC  3,3(6)	Load int const 
 76:     LD  5,-2(1)	Load address of base of array 406 x
 77:    SUB  5,5,3	Compute offset of value 
 78:     LD  3,0(5)	Load lhs variable 435 x
 79:    LDA  3,-1(3)	Decrement -- x
 80:     ST  3,0(5)	Store var x
* END ASSIGN
 81:     ST  3,-5(1)	Push parameter 623 
* LOFF Line615: -6
* END Param 1
 82:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 83:    LDA  3,1(7)	Load return addr 
* BackPatch 84
 84:    JMP  7,-79(7)	CALL OUTPUT output
 85:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
* START CALL
 86:     ST  1,-3(1)	Store fp in ghost frame for outnl
 87:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 88:    LDA  3,1(7)	Load return addr 
* BackPatch 89
 89:    JMP  7,-56(7)	CALL OUTPUT outnl
 90:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
* START CALL
* START Param 1 array op 606
 91:     ST  1,-3(1)	Store fp in ghost frame for  output
* START ID
 92:     LD  3,-2(1)	Load address of base of array3 x
* END ID
 93:     ST  3,-5(1)	Push left 610 
* LOFF Line614: -6
 94:    LDC  3,3(6)	Load int const 
 95:     LD  4,-5(1)	Pop left into acl 1 
 96:    SUB  3,4,3	compute location from index 
 97:     LD  3,0(3)	Load array element 
 98:     ST  3,-5(1)	Push parameter 618 
* LOFF Line622: -6
* END Param 1
 99:    LDA  1,-3(1)	Ghost frame becomes new active frame 
100:    LDA  3,1(7)	Load return addr 
* BackPatch 101
101:    JMP  7,-96(7)	CALL OUTPUT output
102:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
* START CALL
103:     ST  1,-3(1)	Store fp in ghost frame for outnl
104:    LDA  1,-3(1)	Ghost frame becomes new active frame 
105:    LDA  3,1(7)	Load return addr 
* BackPatch 106
106:    JMP  7,-73(7)	CALL OUTPUT outnl
107:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
* END COMPOUND BODY
* END COMPOUND
108:    LDC  2,0(6)	Set return value to 0 
109:     LD  3,-1(1)	Load return address 
110:     LD  1,0(1)	Adjust fp 
111:    JMP  7,0(3)	return 
* End of Function dog
* 
* =========================================================
* FuncK main
* LOFF Line96: -3
112:     ST  3,-1(1)	Store return addr 
* COMPOUND
* LOFF Line188: -10
* START COMPOUND BODY
113:    LDC  3,7(6)	load array size x
114:     ST  3,-2(1)	save array size x
* START ASSIGN
115:    LDC  3,3(6)	Load int const 
116:     ST  3,-10(1)	Push index on 
* LOFF Line 478: -11
117:    LDC  3,1023(6)	Load int const 
* LOFF Line 481: -10
118:     LD  4,-10(1)	Pop index off 
119:    LDA  5,-3(1)	Load address of base of array x
120:    SUB  5,5,4	Compute offset of value 
121:     ST  3,0(5)	Store var x
* END ASSIGN
* START CALL
* START Param 1 array id 602
122:     ST  1,-10(1)	Store fp in ghost frame for  dog
* LOFF Line605: -12
* START ID
123:    LDA  3,-3(1)	Load address of base of array2 x
* END ID
124:     ST  3,-12(1)	Push parameter 606 
* LOFF Line609: -13
125:    LDA  1,-10(1)	Ghost frame becomes new active frame 
126:    LDA  3,1(7)	Load return addr 
* BackPatch 127
127:    JMP  7,-89(7)	CALL OUTPUT dog
128:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -10
* START CALL
* START Param 1 array op 606
129:     ST  1,-10(1)	Store fp in ghost frame for  output
* START ID
130:    LDA  3,-3(1)	Load address of base of array2 x
* END ID
131:     ST  3,-12(1)	Push left 610 
* LOFF Line614: -13
132:    LDC  3,3(6)	Load int const 
133:     LD  4,-12(1)	Pop left into acl 1 
134:    SUB  3,4,3	compute location from index 
135:     LD  3,0(3)	Load array element 
136:     ST  3,-12(1)	Push parameter 618 
* LOFF Line622: -13
* END Param 1
137:    LDA  1,-10(1)	Ghost frame becomes new active frame 
138:    LDA  3,1(7)	Load return addr 
* BackPatch 139
139:    JMP  7,-134(7)	CALL OUTPUT output
140:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -10
* END COMPOUND BODY
* END COMPOUND
141:    LDC  2,0(6)	Set return value to 0 
142:     LD  3,-1(1)	Load return address 
143:     LD  1,0(1)	Adjust fp 
144:    JMP  7,0(3)	return 
* End of Function main
* 
* =========================================================
  0:    JMP  7,144(7)	Jump to init 
* START INIT
145:    LDA  1,0(0)	Set first frame after globals 
146:     ST  1,0(1)	Store old fp 
* START INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
147:    LDA  3,1(7)	Load return address 
148:    JMP  7,-37(7)	Jump to main 
149:   HALT  0,0,0	DONE 
* END INIT
