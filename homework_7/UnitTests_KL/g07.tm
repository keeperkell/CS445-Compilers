* =================================================
* C- compiler version C-S22
* Built: Apr 17 - May 8
* Author: Keller Lawson
* File Compiled:  homework_7/UnitTests_KL/g07.tm
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
* START OP  [
* START ID
 40:     LD  3,-2(1)	Load address of base of array3 z
* END ID
 41:     ST  3,-4(1)	Push left side1 
* LOFF Line 289: -5
* START ID
 42:     LD  3,-3(1)	Load var x
* END ID
* LOFF Line 292: -4
 43:     LD  4,-4(1)	Pop left into acl 1 
 44:    SUB  3,4,3	compute location from index 
 45:     LD  3,0(3)	Load array element 
* END OP  [
 46:    LDA  2,0(3)	Copy to return register 
 47:     LD  3,-1(1)	Load return address 
 48:     LD  1,0(1)	Adjust fp 
 49:    JMP  7,0(3)	Return 
* END RETURN
* END COMPOUND BODY
* END COMPOUND
 50:    LDC  2,0(6)	Set return value to 0 
 51:     LD  3,-1(1)	Load return address 
 52:     LD  1,0(1)	Adjust fp 
 53:    JMP  7,0(3)	return 
* End of Function cat
* 
* =========================================================
* FuncK main
* LOFF Line96: -4
 54:     ST  3,-1(1)	Store return addr 
* COMPOUND
* LOFF Line188: -13
* START COMPOUND BODY
 55:    LDC  3,10(6)	load array size z
 56:     ST  3,-2(1)	save array size z
* START ASSIGN
 57:    LDC  3,3(6)	Load int const 
 58:     ST  3,-13(1)	Push index on 
* LOFF Line 478: -14
 59:    LDC  3,445(6)	Load int const 
* LOFF Line 481: -13
 60:     LD  4,-13(1)	Pop index off 
 61:    LDA  5,-3(1)	Load address of base of array 398 z
 62:    SUB  5,5,4	Compute offset of value 
 63:     ST  3,0(5)	Store var z
* END ASSIGN
* START CALL output
 64:     ST  1,-13(1)	Store fp in ghost frame for  output
* LOFF Line680: -14
* LOFF Line685: -15
* START Param 1
* START CALL cat
 65:     ST  1,-15(1)	Store fp in ghost frame for  cat
* LOFF Line698: -16
* LOFF Line704: -17
* START Param 1
 66:    LDA  3,-3(1)	Load address of base of array z
 67:     ST  3,-17(1)	Push Parameter 
* END Param 1
* LOFF Line704: -18
* START Param 2
 68:    LDC  3,3(6)	Load int const 
 69:     ST  3,-18(1)	Push Parameter 
* END Param 2
 70:    LDA  1,-15(1)	Ghost frame becomes new active frame 
 71:    LDA  3,1(7)	Load return addr 
* BackPatch 72
 72:    JMP  7,-34(7)	CALL OUTPUT cat
 73:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -15
 74:     ST  3,-15(1)	Push parameter 623 
* LOFF Line615: -16
* END Param 1
 75:    LDA  1,-13(1)	Ghost frame becomes new active frame 
 76:    LDA  3,1(7)	Load return addr 
* BackPatch 77
 77:    JMP  7,-72(7)	CALL OUTPUT output
 78:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -13
* END COMPOUND BODY
* END COMPOUND
 79:    LDC  2,0(6)	Set return value to 0 
 80:     LD  3,-1(1)	Load return address 
 81:     LD  1,0(1)	Adjust fp 
 82:    JMP  7,0(3)	return 
* End of Function main
* 
* =========================================================
  0:    JMP  7,82(7)	Jump to init 
* START INIT
 83:    LDA  1,0(0)	Set first frame after globals 
 84:     ST  1,0(1)	Store old fp 
* START INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 85:    LDA  3,1(7)	Load return address 
 86:    JMP  7,-33(7)	Jump to main 
 87:   HALT  0,0,0	DONE 
* END INIT
