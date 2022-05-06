* =================================================
* C- compiler version C-S22
* Built: Apr 17 - May 8
* Author: Keller Lawson
* File Compiled:  homework_7/UnitTests_KL/c06.tm
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
* LOFF Line188: -11
* START COMPOUND BODY
 40:    LDC  3,3(6)	load array size x
 41:     ST  3,-2(1)	save array size x
 42:    LDC  3,4(6)	load array size y
 43:     ST  3,-6(1)	save array size y
* START ASSIGN
 44:    LDC  3,2(6)	Load int const 
 45:     ST  3,-11(1)	Push index on 
* LOFF Line 478: -12
 46:    LDC  3,73(6)	Load int const 
* LOFF Line 481: -11
 47:     LD  4,-11(1)	Pop index off 
 48:    LDA  5,-3(1)	Load address of base of array x
 49:    SUB  5,5,4	Compute offset of value 
 50:     ST  3,0(5)	Store var x
* END ASSIGN
* START ASSIGN
 51:    LDC  3,1(6)	Load int const 
 52:     ST  3,-11(1)	Push index on 
* LOFF Line 478: -12
 53:    LDC  3,211(6)	Load int const 
* LOFF Line 481: -11
 54:     LD  4,-11(1)	Pop index off 
 55:    LDA  5,-7(1)	Load address of base of array y
 56:    SUB  5,5,4	Compute offset of value 
 57:     ST  3,0(5)	Store var y
* END ASSIGN
* START CALL
 58:     ST  1,-11(1)	Store fp in ghost frame for outnl output
* START Param 1
* LOFF Line680: -12
* LOFF Line685: -13
* START OP  +
* START OP  [
* START ID
 59:    LDA  3,-3(1)	Load address of base of array2 x
* END ID
 60:     ST  3,-13(1)	Push left side1 
* LOFF Line 289: -14
 61:    LDC  3,2(6)	Load int const 
* LOFF Line 292: -13
 62:     LD  4,-13(1)	Pop left into acl 1 
 63:    SUB  3,4,3	compute location from index 
 64:     LD  3,0(3)	Load array element 
* LOFF Line 296: -12
* END OP  [
 65:     ST  3,-13(1)	Push left side1 
* LOFF Line 289: -14
* START OP  [
* START ID
 66:    LDA  3,-7(1)	Load address of base of array2 y
* END ID
 67:     ST  3,-14(1)	Push left side1 
* LOFF Line 289: -15
 68:    LDC  3,1(6)	Load int const 
* LOFF Line 292: -14
 69:     LD  4,-14(1)	Pop left into acl 1 
 70:    SUB  3,4,3	compute location from index 
 71:     LD  3,0(3)	Load array element 
* LOFF Line 296: -13
* END OP  [
* LOFF Line 292: -13
 72:     LD  4,-13(1)	Pop left into acl 1 
 73:    ADD  3,4,3	Op +
* END OP  +
 74:     ST  3,-13(1)	Push parameter 
 75:    LDA  1,-11(1)	Ghost frame becomes new active frame 
* END Param 1
 76:    LDA  3,1(7)	Load return addr 
* BackPatch 77
 77:    JMP  7,-72(7)	CALL OUTPUT output
 78:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -11
* START CALL
 79:     ST  1,-11(1)	Store fp in ghost frame for outnl outnl
 80:    LDA  1,-11(1)	Load fp 
 81:    LDA  3,1(7)	Load return addr 
* BackPatch 82
 82:    JMP  7,-49(7)	CALL OUTPUT outnl
 83:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -11
* END COMPOUND BODY
* END COMPOUND
 84:    LDC  2,0(6)	Set return valuye to 0 
 85:     LD  3,-1(1)	Load return address 
 86:     LD  1,0(1)	Adjust file pointer 
 87:    JMP  7,0(3)	return 
* End of Function main
  0:    JMP  7,87(7)	Jump to init 
* START INIT
 88:    LDA  1,0(0)	Set first frame after globals 
 89:     ST  1,0(1)	Store old fp 
* START INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 90:    LDA  3,1(7)	Load return address 
 91:    JMP  7,-53(7)	Jump to main 
 92:   HALT  0,0,0	DONE 
* END INIT
