* =================================================
* C- compiler version C-S22
* Built: Apr 17 - May 8
* Author: Keller Lawson
* File Compiled:  homework_7/UnitTests_KL/c17.tm
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
* LOFF Line188: -2
* START COMPOUND BODY
* START ASSIGN
 40:    LDC  3,5(6)	Load int const 
 41:     ST  3,-2(1)	Push index on 
* LOFF Line 478: -3
 42:    LDC  3,333(6)	Load int const 
* LOFF Line 481: -2
 43:     LD  4,-2(1)	Pop index off 
 44:    LDA  5,-1(0)	Load address of base of array x
 45:    SUB  5,5,4	Compute offset of value 
 46:     ST  3,0(5)	Store var x
* END ASSIGN
* START ASSIGN
 47:    LDC  3,7(6)	Load int const 
 48:     ST  3,-2(1)	Push index on 
* LOFF Line 478: -3
 49:    LDC  3,444(6)	Load int const 
* LOFF Line 481: -2
 50:     LD  4,-2(1)	Pop index off 
 51:    LDA  5,-9(0)	Load address of base of array y
 52:    SUB  5,5,4	Compute offset of value 
 53:     ST  3,0(5)	Store var y
* END ASSIGN
* START ASSIGN
* START OP  [
* START ID
 54:    LDA  3,-9(0)	Load address of base of array1 y
* END ID
 55:     ST  3,-2(1)	Push left side1 
* LOFF Line 289: -3
 56:    LDC  3,7(6)	Load int const 
* LOFF Line 292: -2
 57:     LD  4,-2(1)	Pop left into acl 1 
 58:    SUB  3,4,3	compute location from index 
 59:     LD  3,0(3)	Load array element 
* END OP  [
* [
* START OP  [
* START ID
 60:     LD  4,-1(0)	Load lhs variable 1 x
* END ID
 61:     ST  3,-2(1)	Push left side1 
* LOFF Line 289: -3
 62:    LDC  3,5(6)	Load int const 
* LOFF Line 292: -2
 63:     LD  4,-2(1)	Pop left into acl 1 
 64:    SUB  3,4,3	compute location from index 
 65:     LD  3,0(3)	Load array element 
* END OP  [
 66:    ADD  3,4,3	op +=
 67:     ST  3,0(1)	Store var [
* END ASSIGN
* START CALL
* START Param 1 array op 606
 68:     ST  1,-2(1)	Store fp in ghost frame for  output
* START ID
 69:    LDA  3,-1(0)	Load address of base of array1 x
* END ID
 70:     ST  3,-4(1)	Push left 610 
* LOFF Line614: -5
 71:    LDC  3,5(6)	Load int const 
 72:     LD  4,-4(1)	Pop left into acl 1 
 73:    SUB  3,4,3	compute location from index 
 74:     LD  3,0(3)	Load array element 
 75:     ST  3,-4(1)	Push parameter 618 
* LOFF Line622: -5
* END Param 1
 76:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 77:    LDA  3,1(7)	Load return addr 
* BackPatch 78
 78:    JMP  7,-73(7)	CALL OUTPUT output
 79:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -2
* START ASSIGN
* START OP  [
* START ID
 80:    LDA  3,-1(0)	Load address of base of array1 x
* END ID
 81:     ST  3,-2(1)	Push left side1 
* LOFF Line 289: -3
 82:    LDC  3,5(6)	Load int const 
* LOFF Line 292: -2
 83:     LD  4,-2(1)	Pop left into acl 1 
 84:    SUB  3,4,3	compute location from index 
 85:     LD  3,0(3)	Load array element 
* END OP  [
* [
* START OP  [
* START ID
 86:     LD  4,-9(0)	Load lhs variable 1 y
* END ID
 87:     ST  3,-2(1)	Push left side1 
* LOFF Line 289: -3
 88:    LDC  3,7(6)	Load int const 
* LOFF Line 292: -2
 89:     LD  4,-2(1)	Pop left into acl 1 
 90:    SUB  3,4,3	compute location from index 
 91:     LD  3,0(3)	Load array element 
* END OP  [
 92:    SUB  3,4,3	op -=
 93:     ST  3,0(1)	Store var [
* END ASSIGN
* START CALL
* START Param 1 array op 606
 94:     ST  1,-2(1)	Store fp in ghost frame for  output
* START ID
 95:    LDA  3,-9(0)	Load address of base of array1 y
* END ID
 96:     ST  3,-4(1)	Push left 610 
* LOFF Line614: -5
 97:    LDC  3,7(6)	Load int const 
 98:     LD  4,-4(1)	Pop left into acl 1 
 99:    SUB  3,4,3	compute location from index 
100:     LD  3,0(3)	Load array element 
101:     ST  3,-4(1)	Push parameter 618 
* LOFF Line622: -5
* END Param 1
102:    LDA  1,-2(1)	Ghost frame becomes new active frame 
103:    LDA  3,1(7)	Load return addr 
* BackPatch 104
104:    JMP  7,-99(7)	CALL OUTPUT output
105:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -2
* START CALL
106:     ST  1,-2(1)	Store fp in ghost frame for outnl
107:    LDA  1,-2(1)	Ghost frame becomes new active frame 
108:    LDA  3,1(7)	Load return addr 
* BackPatch 109
109:    JMP  7,-76(7)	CALL OUTPUT outnl
110:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -2
* END COMPOUND BODY
* END COMPOUND
111:    LDC  2,0(6)	Set return value to 0 
112:     LD  3,-1(1)	Load return address 
113:     LD  1,0(1)	Adjust fp 
114:    JMP  7,0(3)	return 
* End of Function main
* 
* =========================================================
  0:    JMP  7,114(7)	Jump to init 
* START INIT
115:    LDA  1,-18(0)	Set first frame after globals 
116:     ST  1,0(1)	Store old fp 
* START INIT GLOBALS AND STATICS
117:    LDC  3,7(6)	Load array size x
118:     ST  3,0(0)	Store array size x
119:    LDC  3,9(6)	Load array size y
120:     ST  3,-8(0)	Store array size y
* END INIT GLOBALS AND STATICS
121:    LDA  3,1(7)	Load return address 
122:    JMP  7,-84(7)	Jump to main 
123:   HALT  0,0,0	DONE 
* END INIT
