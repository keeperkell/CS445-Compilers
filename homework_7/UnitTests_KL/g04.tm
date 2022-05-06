* =================================================
* C- compiler version C-S22
* Built: Apr 17 - May 8
* Author: Keller Lawson
* File Compiled:  homework_7/UnitTests_KL/g04.tm
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
* START OP  -
* START OP  *
* START ID
 40:     LD  3,-2(1)	Load var z
* END ID
 41:     ST  3,-4(1)	Push left side1 
* LOFF Line 289: -5
* START ID
 42:     LD  3,-3(1)	Load var x
* END ID
* LOFF Line 292: -4
 43:     LD  4,-4(1)	Pop left into acl 1 
 44:    MUL  3,4,3	Op *
* END OP  *
 45:     ST  3,-4(1)	Push left side1 
* LOFF Line 289: -5
* START ID
 46:     LD  3,-3(1)	Load var x
* END ID
* LOFF Line 292: -4
 47:     LD  4,-4(1)	Pop left into acl 1 
 48:    SUB  3,4,3	Op -
* END OP  -
 49:    LDA  2,0(3)	Copy to return register 
 50:     LD  3,-1(1)	Load return address 
 51:     LD  1,0(1)	Adjust fp 
 52:    JMP  7,0(3)	Return 
* END RETURN
* END COMPOUND BODY
* END COMPOUND
 53:    LDC  2,0(6)	Set return value to 0 
 54:     LD  3,-1(1)	Load return address 
 55:     LD  1,0(1)	Adjust fp 
 56:    JMP  7,0(3)	return 
* End of Function cat
* 
* =========================================================
* FuncK main
* LOFF Line96: -4
 57:     ST  3,-1(1)	Store return addr 
* COMPOUND
* LOFF Line188: -2
* START COMPOUND BODY
* START CALL
 58:     ST  1,-2(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -3
* LOFF Line685: -4
* START CALL
 59:     ST  1,-4(1)	Store fp in ghost frame for  cat
* LOFF Line698: -5
* LOFF Line704: -6
* START Param 1
 60:    LDC  3,33(6)	Load int const 
 61:     ST  3,-6(1)	Push paramter 
* END Param 1
* LOFF Line704: -7
* START Param 2
 62:    LDC  3,911(6)	Load int const 
 63:     ST  3,-7(1)	Push paramter 
* END Param 2
 64:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 65:    LDA  3,1(7)	Load return addr 
* BackPatch 66
 66:    JMP  7,-28(7)	CALL OUTPUT cat
 67:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -4
 68:     ST  3,-4(1)	Push parameter 623 
* LOFF Line615: -5
* END Param 1
 69:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 70:    LDA  3,1(7)	Load return addr 
* BackPatch 71
 71:    JMP  7,-66(7)	CALL OUTPUT output
 72:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -2
* END COMPOUND BODY
* END COMPOUND
 73:    LDC  2,0(6)	Set return value to 0 
 74:     LD  3,-1(1)	Load return address 
 75:     LD  1,0(1)	Adjust fp 
 76:    JMP  7,0(3)	return 
* End of Function main
* 
* =========================================================
  0:    JMP  7,76(7)	Jump to init 
* START INIT
 77:    LDA  1,-1(0)	Set first frame after globals 
 78:     ST  1,0(1)	Store old fp 
* START INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 79:    LDA  3,1(7)	Load return address 
 80:    JMP  7,-24(7)	Jump to main 
 81:   HALT  0,0,0	DONE 
* END INIT
