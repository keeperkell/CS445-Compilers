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
* START CONSTANT
 40:    LDC  3,2(6)	Load int const 
* END CONSTANT
 41:     ST  3,-2(1)	Push index on 
* LOFF Line478: -3
* START CONSTANT
 42:    LDC  3,73(6)	Load int const 
* END CONSTANT
* LOFF Line481: -2
 43:     LD  4,-2(1)	Pop index off 
 44:    LDA  5,-1(0)	Load base of array addr x
 45:    SUB  5,5,4	Get value offset 
 46:     ST  3,0(5)	Store var x
* END ASSIGN
* START ASSIGN
* START CONSTANT
 47:    LDC  3,1(6)	Load int const 
* END CONSTANT
 48:     ST  3,-2(1)	Push index on 
* LOFF Line478: -3
* START CONSTANT
 49:    LDC  3,211(6)	Load int const 
* END CONSTANT
* LOFF Line481: -2
 50:     LD  4,-2(1)	Pop index off 
 51:    LDA  5,-5(0)	Load base of array addr y
 52:    SUB  5,5,4	Get value offset 
 53:     ST  3,0(5)	Store var y
* END ASSIGN
* START CALL
 54:     ST  1,-2(1)	Store fp in ghost frame output
* START Param 1
* LOFF Line680: -3
* LOFF Line685: -4
* START OP  +
* START OP  [
* START ID
 55:     LD  3,-1(0)	Load base of array addr x
* LOFF Line590: -5
* END ID
 56:     ST  3,-5(1)	Push left side 
* START CONSTANT
 57:    LDC  3,2(6)	Load int const 
* END CONSTANT
 58:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -5
* END OP  [
 59:     ST  3,-5(1)	Push left side 
* START OP  [
* START ID
 60:     LD  3,-5(0)	Load base of array addr y
* LOFF Line590: -6
* END ID
 61:     ST  3,-6(1)	Push left side 
* START CONSTANT
 62:    LDC  3,1(6)	Load int const 
* END CONSTANT
 63:     LD  4,-6(1)	Load into 1 
* LOFF Line394: -6
* END OP  [
 64:     LD  4,-5(1)	Load into 1 
* LOFF Line394: -5
 65:    ADD  3,4,3	Op +
* END OP  +
 66:     ST  3,-6(1)	Push left side 
 67:    LDA  1,-2(1)	Load fp of ghost frame 
* END Param 1
 68:    LDA  3,1(7)	Load return addr 
* BackPatch 69
 69:    JMP  7,-64(7)	CALL OUTPUT output
 70:    LDA  3,0(2)	Store 
* END CALL
* LOFF Line749: -2
* START CALL
 71:     ST  1,-2(1)	Store fp outnl
 72:    LDA  1,-2(1)	Load fp 
 73:    LDA  3,1(7)	Load return addr 
* BackPatch 74
 74:    JMP  7,-41(7)	CALL OUTPUT outnl
 75:    LDA  3,0(2)	Store 
* END CALL
* LOFF Line749: -2
* END COMPOUND BODY
* LOFF Line188: -2
* END COMPOUND
 76:    LDC  2,0(6)	Set return valuye to 0 
 77:     LD  3,-1(1)	Load return address 
 78:     LD  1,0(1)	Adjust file pointer 
 79:    JMP  7,0(3)	return 
* End of Function main
  0:    JMP  7,79(7)	Jump to init 
* START INIT
 80:    LDA  1,-9(0)	Set first frame after globals 
 81:     ST  1,0(1)	Store old fp 
* START INIT GLOBALS AND STATICS
 82:    LDC  3,3(6)	Load array size x
 83:     ST  3,0(0)	Store array size x
* START INIT GLOBALS AND STATICS
 84:    LDC  3,4(6)	Load array size y
 85:     ST  3,-4(0)	Store array size y
* START INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 86:    LDA  3,1(7)	Load return address 
 87:    JMP  7,-49(7)	Jump to main 
 88:   HALT  0,0,0	DONE 
* END INIT
