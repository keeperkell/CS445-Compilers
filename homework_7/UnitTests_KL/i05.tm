* =================================================
* C- compiler version C-S22
* Built: Apr 17 - May 8
* Author: Keller Lawson
* File Compiled:  homework_7/UnitTests_KL/i05.tm
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
* LOFF Line188: -5
* START COMPOUND BODY
 40:    LDC  3,1(6)	Load bool const 
 41:     ST  3,-2(1)	Store Var ba
* START OP  and
 42:    LDC  3,1(6)	Load bool const 
 43:     ST  3,-5(1)	Push left side1 
* LOFF Line 289: -6
* START OP  not
 44:    LDC  3,0(6)	Load bool const 
 45:    LDC  4,1(6)	Load 1 
 46:    XOR  3,3,4	Op XOR for logical not 
* END OP  not
* LOFF Line 292: -5
 47:     LD  4,-5(1)	Pop left into acl 1 
 48:    AND  3,4,3	Op and
* END OP  and
 49:     ST  3,-3(1)	Store Var bb
* START OP  >
 50:    LDC  3,5(6)	Load int const 
 51:     ST  3,-5(1)	Push left side1 
* LOFF Line 289: -6
 52:    LDC  3,4(6)	Load int const 
* LOFF Line 292: -5
 53:     LD  4,-5(1)	Pop left into acl 1 
 54:    TGT  3,4,3	Op >
* END OP  >
 55:     ST  3,-4(1)	Store Var bc
* START CALL outputb
 56:     ST  1,-5(1)	Store fp in ghost frame for  outputb
* START Param 1
* LOFF Line680: -6
* LOFF Line685: -7
* START ID
 57:     LD  3,-2(1)	Load var ba
* END ID
 58:     ST  3,-7(1)	Push parameter 623 
* LOFF Line615: -8
* END Param 1
 59:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 60:    LDA  3,1(7)	Load return addr 
* BackPatch 61
 61:    JMP  7,-45(7)	CALL OUTPUT outputb
 62:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -5
* END COMPOUND BODY
* END COMPOUND
 63:    LDC  2,0(6)	Set return value to 0 
 64:     LD  3,-1(1)	Load return address 
 65:     LD  1,0(1)	Adjust fp 
 66:    JMP  7,0(3)	return 
* End of Function main
* 
* =========================================================
  0:    JMP  7,66(7)	Jump to init 
* START INIT
 67:    LDA  1,0(0)	Set first frame after globals 
 68:     ST  1,0(1)	Store old fp 
* START INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 69:    LDA  3,1(7)	Load return address 
 70:    JMP  7,-32(7)	Jump to main 
 71:   HALT  0,0,0	DONE 
* END INIT
