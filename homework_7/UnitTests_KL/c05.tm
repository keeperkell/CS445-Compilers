* =================================================
* C- compiler version C-S22
* Built: Apr 17 - May 8
* Author: Keller Lawson
* File Compiled:  homework_7/UnitTests_KL/c05.tm
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
* LOFF Line87: -2
* LOFF Line96: -2
 39:     ST  3,-1(1)	Store return addr 
* COMPOUND
* START COMPOUND BODY
* START ASSIGN
 40:    LDC  3,2(6)	Load int const 
 41:     ST  3,-2(1)	Push index on 
* LOFF Line478: -3
 42:    LDC  3,73(6)	Load int const 
* LOFF Line481: -2
 43:     LD  4,-2(1)	Pop index off 
 44:    LDA  5,-1(0)	Load address of base of array x
 45:    SUB  5,5,4	Get value offset 
 46:     ST  3,0(5)	Store var x
* END ASSIGN
* START ASSIGN
 47:    LDC  3,1(6)	Load int const 
 48:     ST  3,-2(1)	Push index on 
* LOFF Line478: -3
 49:    LDC  3,211(6)	Load int const 
* LOFF Line481: -2
 50:     LD  4,-2(1)	Pop index off 
 51:    LDA  5,-5(0)	Load address of base of array y
 52:    SUB  5,5,4	Get value offset 
 53:     ST  3,0(5)	Store var y
* END ASSIGN
* START CALL
 54:     ST  1,-2(1)	Store fp in ghost frame for outnl output
* START Param 1
* LOFF Line680: -3
* LOFF Line685: -4
* START OP  +
* START OP  [
* START ID
 55:    LDA  3,-1(0)	Load address of base of array1 x
* END ID
 56:     ST  3,-4(1)	Push left side1 
 57:    LDC  3,2(6)	Load int const 
 58:     LD  4,-4(1)	Pop left into acl 1 
 59:    SUB  3,4,3	compute location from index 
 60:     LD  3,0(3)	Load array element 
* LOFF Line 296: -4
* END OP  [
 61:     ST  3,-4(1)	Push left side1 
* START OP  [
* START ID
 62:    LDA  3,-5(0)	Load address of base of array1 y
* END ID
 63:     ST  3,-5(1)	Push left side1 
 64:    LDC  3,1(6)	Load int const 
 65:     LD  4,-5(1)	Pop left into acl 1 
 66:    SUB  3,4,3	compute location from index 
 67:     LD  3,0(3)	Load array element 
* LOFF Line 296: -5
* END OP  [
 68:     LD  4,-4(1)	Pop left into acl 1 
 69:    ADD  3,4,3	Op +
* END OP  +
 70:     ST  3,-4(1)	Push left side 
 71:    LDA  1,-2(1)	Ghost frame becomes new active frame 
* END Param 1
 72:    LDA  3,1(7)	Load return addr 
* BackPatch 73
 73:    JMP  7,-68(7)	CALL OUTPUT output
 74:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -2
* START CALL
 75:     ST  1,-2(1)	Store fp in ghost frame for outnl outnl
 76:    LDA  1,-2(1)	Load fp 
 77:    LDA  3,1(7)	Load return addr 
* BackPatch 78
 78:    JMP  7,-45(7)	CALL OUTPUT outnl
 79:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -2
* END COMPOUND BODY
* LOFF Line188: -2
* END COMPOUND
 80:    LDC  2,0(6)	Set return valuye to 0 
 81:     LD  3,-1(1)	Load return address 
 82:     LD  1,0(1)	Adjust file pointer 
 83:    JMP  7,0(3)	return 
* End of Function main
  0:    JMP  7,83(7)	Jump to init 
* START INIT
 84:    LDA  1,-9(0)	Set first frame after globals 
 85:     ST  1,0(1)	Store old fp 
* START INIT GLOBALS AND STATICS
 86:    LDC  3,3(6)	Load array size x
 87:     ST  3,0(0)	Store array size x
 88:    LDC  3,4(6)	Load array size y
 89:     ST  3,-4(0)	Store array size y
* END INIT GLOBALS AND STATICS
 90:    LDA  3,1(7)	Load return address 
 91:    JMP  7,-53(7)	Jump to main 
 92:   HALT  0,0,0	DONE 
* END INIT
