* =================================================
* C- compiler version C-S22
* Built: Apr 17 - May 8
* Author: Keller Lawson
* File Compiled:  homework_7/UnitTests_KL/i09.tm
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
* LOFF Line188: -4
* START COMPOUND BODY
* START OP  +
* START OP  *
 40:    LDC  3,4(6)	Load int const 
 41:     ST  3,-4(1)	Push left side1 
* LOFF Line 289: -5
 42:    LDC  3,5(6)	Load int const 
* LOFF Line 292: -4
 43:     LD  4,-4(1)	Pop left into acl 1 
 44:    MUL  3,4,3	Op *
* END OP  *
 45:     ST  3,-4(1)	Push left side1 
* LOFF Line 289: -5
* START OP  *
 46:    LDC  3,3(6)	Load int const 
 47:     ST  3,-5(1)	Push left side1 
* LOFF Line 289: -6
 48:    LDC  3,2(6)	Load int const 
* LOFF Line 292: -5
 49:     LD  4,-5(1)	Pop left into acl 1 
 50:    MUL  3,4,3	Op *
* END OP  *
* LOFF Line 292: -4
 51:     LD  4,-4(1)	Pop left into acl 1 
 52:    ADD  3,4,3	Op +
* END OP  +
 53:     ST  3,-2(1)	Store Var kk
* START OP  -
 54:    LDC  3,46(6)	Load int const 
 55:    NEG  3,3,3	Unary Op -
* END OP  -
 56:     ST  3,-3(1)	Store Var ll
* START CALL output
 57:     ST  1,-4(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -5
* LOFF Line685: -6
* START ID
 58:     LD  3,-2(1)	Load var kk
* END ID
 59:     ST  3,-6(1)	Push parameter 623 
* LOFF Line615: -7
* END Param 1
 60:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 61:    LDA  3,1(7)	Load return addr 
* BackPatch 62
 62:    JMP  7,-57(7)	CALL OUTPUT output
 63:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -4
* COMPOUND
* LOFF Line188: -4
* START COMPOUND BODY
* END COMPOUND BODY
* END COMPOUND
* END COMPOUND BODY
* END COMPOUND
 64:    LDC  2,0(6)	Set return value to 0 
 65:     LD  3,-1(1)	Load return address 
 66:     LD  1,0(1)	Adjust fp 
 67:    JMP  7,0(3)	return 
* End of Function main
* 
* =========================================================
  0:    JMP  7,67(7)	Jump to init 
* START INIT
 68:    LDA  1,0(0)	Set first frame after globals 
 69:     ST  1,0(1)	Store old fp 
* START INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 70:    LDA  3,1(7)	Load return address 
 71:    JMP  7,-33(7)	Jump to main 
 72:   HALT  0,0,0	DONE 
* END INIT
