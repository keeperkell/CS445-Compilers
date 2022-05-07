* =================================================
* C- compiler version C-S22
* Built: Apr 17 - May 8
* Author: Keller Lawson
* File Compiled:  homework_7/UnitTests_KL/g09.tm
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
* FuncK cat
* LOFF Line96: -4
 39:     ST  3,-1(1)	Store return addr 
* COMPOUND
* LOFF Line188: -4
* START COMPOUND BODY
* RETURN
* START OP  +
 40:    LDC  3,77(6)	Load int const 
 41:     ST  3,-4(1)	Push left side1 
* LOFF Line 289: -5
* START OP  *
* START OP  [
* START ID
 42:     LD  3,-2(1)	Load address of base of array3 z
* END ID
 43:     ST  3,-5(1)	Push left side1 
* LOFF Line 289: -6
* START ID
 44:     LD  3,-3(1)	Load var x
* END ID
* LOFF Line 292: -5
 45:     LD  4,-5(1)	Pop left into acl 1 
 46:    SUB  3,4,3	compute location from index 
 47:     LD  3,0(3)	Load array element 
* END OP  [
 48:     ST  3,-5(1)	Push left side1 
* LOFF Line 289: -6
* START OP  [
* START ID
 49:     LD  3,-2(1)	Load address of base of array3 z
* END ID
 50:     ST  3,-6(1)	Push left side1 
* LOFF Line 289: -7
* START ID
 51:     LD  3,-3(1)	Load var x
* END ID
* LOFF Line 292: -6
 52:     LD  4,-6(1)	Pop left into acl 1 
 53:    SUB  3,4,3	compute location from index 
 54:     LD  3,0(3)	Load array element 
* END OP  [
* LOFF Line 292: -5
 55:     LD  4,-5(1)	Pop left into acl 1 
 56:    MUL  3,4,3	Op *
* END OP  *
* LOFF Line 292: -4
 57:     LD  4,-4(1)	Pop left into acl 1 
 58:    ADD  3,4,3	Op +
* END OP  +
 59:    LDA  2,0(3)	Copy to return register 
 60:     LD  3,-1(1)	Load return address 
 61:     LD  1,0(1)	Adjust fp 
 62:    JMP  7,0(3)	Return 
* END RETURN
* END COMPOUND BODY
* END COMPOUND
 63:    LDC  2,0(6)	Set return value to 0 
 64:     LD  3,-1(1)	Load return address 
 65:     LD  1,0(1)	Adjust fp 
 66:    JMP  7,0(3)	return 
* End of Function cat
* 
* =========================================================
* FuncK main
* LOFF Line96: -4
 67:     ST  3,-1(1)	Store return addr 
* COMPOUND
* LOFF Line188: -13
* START COMPOUND BODY
 68:    LDC  3,10(6)	load array size z
 69:     ST  3,-2(1)	save array size z
* START ASSIGN
 70:    LDC  3,3(6)	Load int const 
 71:     ST  3,-13(1)	Push index on 
* LOFF Line 478: -14
 72:    LDC  3,445(6)	Load int const 
* LOFF Line 481: -13
 73:     LD  4,-13(1)	Pop index off 
 74:    LDA  5,-3(1)	Load address of base of array 398 z
 75:    SUB  5,5,4	Compute offset of value 
 76:     ST  3,0(5)	Store var z
* END ASSIGN
* START CALL output
 77:     ST  1,-13(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -14
* LOFF Line685: -15
* START OP  %
* START CALL cat
 78:     ST  1,-15(1)	Store fp in ghost frame for  cat
* LOFF Line698: -16
* LOFF Line704: -17
* START Param 1
 79:    LDA  3,-3(1)	Load address of base of array z
 80:     ST  3,-17(1)	Push Parameter 
* END Param 1
* LOFF Line704: -18
* START Param 2
 81:    LDC  3,3(6)	Load int const 
 82:     ST  3,-18(1)	Push Parameter 
* END Param 2
 83:    LDA  1,-15(1)	Ghost frame becomes new active frame 
 84:    LDA  3,1(7)	Load return addr 
* BackPatch 85
 85:    JMP  7,-47(7)	CALL OUTPUT cat
 86:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -15
 87:     ST  3,-15(1)	Push left side1 
* LOFF Line 289: -16
 88:    LDC  3,100(6)	Load int const 
* LOFF Line 292: -15
 89:     LD  4,-15(1)	Pop left into acl 1 
 90:    MOD  3,4,3	Op %
* END OP  %
 91:     ST  3,-15(1)	Push parameter 623 
* LOFF Line615: -16
* END Param 1
 92:    LDA  1,-13(1)	Ghost frame becomes new active frame 
 93:    LDA  3,1(7)	Load return addr 
* BackPatch 94
 94:    JMP  7,-89(7)	CALL OUTPUT output
 95:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -13
* END COMPOUND BODY
* END COMPOUND
 96:    LDC  2,0(6)	Set return value to 0 
 97:     LD  3,-1(1)	Load return address 
 98:     LD  1,0(1)	Adjust fp 
 99:    JMP  7,0(3)	return 
* End of Function main
* 
* =========================================================
  0:    JMP  7,99(7)	Jump to init 
* START INIT
100:    LDA  1,0(0)	Set first frame after globals 
101:     ST  1,0(1)	Store old fp 
* START INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
102:    LDA  3,1(7)	Load return address 
103:    JMP  7,-37(7)	Jump to main 
104:   HALT  0,0,0	DONE 
* END INIT
