* =================================================
* C- compiler version C-S22
* Built: Apr 17 - May 8
* Author: Keller Lawson
* File Compiled:  homework_7/UnitTests_KL/c09.tm
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
* START ASSIGN
 44:     LD  3,-1(0)	Load variable  y
 45:     LD  4,0(0)	Load lhs variable  x
 46:    ADD  3,4,3	op +=
 47:     ST  3,0(0)	Store var x
* END ASSIGN
* START CALL
 48:     ST  1,-2(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -3
* LOFF Line685: -4
* START ID
 49:     LD  3,0(0)	Load var x
* END ID
 50:     ST  3,-4(1)	Push parameter 623 
* LOFF Line615: -5
* END Param 1
 51:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 52:    LDA  3,1(7)	Load return addr 
* BackPatch 53
 53:    JMP  7,-48(7)	CALL OUTPUT output
 54:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -2
* START ASSIGN
 55:     LD  3,0(0)	Load variable  x
 56:     LD  4,-1(0)	Load lhs variable  y
 57:    SUB  3,4,3	op -=
 58:     ST  3,-1(0)	Store var y
* END ASSIGN
* START CALL
 59:     ST  1,-2(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -3
* LOFF Line685: -4
* START ID
 60:     LD  3,-1(0)	Load var y
* END ID
 61:     ST  3,-4(1)	Push parameter 623 
* LOFF Line615: -5
* END Param 1
 62:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 63:    LDA  3,1(7)	Load return addr 
* BackPatch 64
 64:    JMP  7,-59(7)	CALL OUTPUT output
 65:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -2
* START CALL
 66:     ST  1,-2(1)	Store fp in ghost frame for outnl
 67:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 68:    LDA  3,1(7)	Load return addr 
* BackPatch 69
 69:    JMP  7,-36(7)	CALL OUTPUT outnl
 70:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -2
* END COMPOUND BODY
* END COMPOUND
 71:    LDC  2,0(6)	Set return value to 0 
 72:     LD  3,-1(1)	Load return address 
 73:     LD  1,0(1)	Adjust fp 
 74:    JMP  7,0(3)	return 
* End of Function main
* 
* =========================================================
  0:    JMP  7,74(7)	Jump to init 
* START INIT
 75:    LDA  1,-2(0)	Set first frame after globals 
 76:     ST  1,0(1)	Store old fp 
* START INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 77:    LDA  3,1(7)	Load return address 
 78:    JMP  7,-40(7)	Jump to main 
 79:   HALT  0,0,0	DONE 
* END INIT
