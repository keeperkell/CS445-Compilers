* =================================================
* C- compiler version C-S22
* Built: Apr 17 - May 8
* Author: Keller Lawson
* File Compiled:  homework_7/UnitTests_KL/c0a.tm
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
 40:    LDC  3,753(6)	Load int const 
* START ID
 41:     ST  3,0(0)	Store var x
* END ID
* END ASSIGN
* START ASSIGN
 42:    LDC  3,444(6)	Load int const 
* START ID
 43:     ST  3,-1(0)	Store var y
* END ID
* END ASSIGN
* START CALL
 44:     ST  1,-2(1)	Store fp in ghost frame for outnl output
* START Param 1
* LOFF Line680: -3
* LOFF Line685: -4
* START ASSIGN
* START ID
 45:     LD  3,-1(0)	Load var y
* END ID
* x
* START ID
 46:     LD  4,0(0)	Load lhs variable 1 x
* END ID
 47:    ADD  3,4,3	op +=
 48:     ST  3,0(0)	Store var x
* END ASSIGN
 49:     ST  3,-4(1)	Push parameter 
 50:    LDA  1,-2(1)	Ghost frame becomes new active frame 
* END Param 1
 51:    LDA  3,1(7)	Load return addr 
* BackPatch 52
 52:    JMP  7,-47(7)	CALL OUTPUT output
 53:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -2
* START CALL
 54:     ST  1,-2(1)	Store fp in ghost frame for outnl output
* START Param 1
* LOFF Line680: -3
* LOFF Line685: -4
* START ASSIGN
* START ID
 55:     LD  3,0(0)	Load var x
* END ID
* y
* START ID
 56:     LD  4,-1(0)	Load lhs variable 1 y
* END ID
 57:    SUB  3,4,3	op -=
 58:     ST  3,-1(0)	Store var y
* END ASSIGN
 59:     ST  3,-4(1)	Push parameter 
 60:    LDA  1,-2(1)	Ghost frame becomes new active frame 
* END Param 1
 61:    LDA  3,1(7)	Load return addr 
* BackPatch 62
 62:    JMP  7,-57(7)	CALL OUTPUT output
 63:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -2
* START CALL
 64:     ST  1,-2(1)	Store fp in ghost frame for outnl outnl
 65:    LDA  1,-2(1)	Load fp 
 66:    LDA  3,1(7)	Load return addr 
* BackPatch 67
 67:    JMP  7,-34(7)	CALL OUTPUT outnl
 68:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -2
* END COMPOUND BODY
* END COMPOUND
 69:    LDC  2,0(6)	Set return valuye to 0 
 70:     LD  3,-1(1)	Load return address 
 71:     LD  1,0(1)	Adjust file pointer 
 72:    JMP  7,0(3)	return 
* End of Function main
  0:    JMP  7,72(7)	Jump to init 
* START INIT
 73:    LDA  1,-2(0)	Set first frame after globals 
 74:     ST  1,0(1)	Store old fp 
* START INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 75:    LDA  3,1(7)	Load return address 
 76:    JMP  7,-38(7)	Jump to main 
 77:   HALT  0,0,0	DONE 
* END INIT
