* =================================================
* C- compiler version C-S22
* Built: Apr 17 - May 8
* Author: Keller Lawson
* File Compiled:  homework_7/UnitTests_KL/g01.tm
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
* LOFF Line96: -3
 39:     ST  3,-1(1)	Store return addr 
* COMPOUND
* LOFF Line188: -3
* START COMPOUND BODY
* START CALL
 40:     ST  1,-3(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
* START ID
 41:     LD  3,-2(1)	Load var z
* END ID
 42:     ST  3,-5(1)	Push parameter 623 
* LOFF Line615: -6
* END Param 1
 43:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 44:    LDA  3,1(7)	Load return addr 
* BackPatch 45
 45:    JMP  7,-40(7)	CALL OUTPUT output
 46:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
* START ASSIGN
 47:    LDC  3,122(6)	Load int const 
* START ID
 48:     ST  3,-2(1)	Store var z
* END ID
* END ASSIGN
* START CALL
 49:     ST  1,-3(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
* START ID
 50:     LD  3,-2(1)	Load var z
* END ID
 51:     ST  3,-5(1)	Push parameter 623 
* LOFF Line615: -6
* END Param 1
 52:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 53:    LDA  3,1(7)	Load return addr 
* BackPatch 54
 54:    JMP  7,-49(7)	CALL OUTPUT output
 55:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
* END COMPOUND BODY
* END COMPOUND
 56:    LDC  2,0(6)	Set return value to 0 
 57:     LD  3,-1(1)	Load return address 
 58:     LD  1,0(1)	Adjust fp 
 59:    JMP  7,0(3)	return 
* End of Function cat
* 
* =========================================================
* FuncK main
* LOFF Line96: -3
 60:     ST  3,-1(1)	Store return addr 
* COMPOUND
* LOFF Line188: -3
* START COMPOUND BODY
* START ASSIGN
 61:    LDC  3,637(6)	Load int const 
* START ID
 62:     ST  3,-2(1)	Store var z
* END ID
* END ASSIGN
* START CALL
 63:     ST  1,-3(1)	Store fp in ghost frame for  cat
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
* START ID
 64:     LD  3,-2(1)	Load var z
* END ID
 65:     ST  3,-5(1)	Push parameter 623 
* LOFF Line615: -6
* END Param 1
 66:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 67:    LDA  3,1(7)	Load return addr 
* BackPatch 68
 68:    JMP  7,-30(7)	CALL OUTPUT cat
 69:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
* START CALL
 70:     ST  1,-3(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
* START ID
 71:     LD  3,-2(1)	Load var z
* END ID
 72:     ST  3,-5(1)	Push parameter 623 
* LOFF Line615: -6
* END Param 1
 73:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 74:    LDA  3,1(7)	Load return addr 
* BackPatch 75
 75:    JMP  7,-70(7)	CALL OUTPUT output
 76:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
* END COMPOUND BODY
* END COMPOUND
 77:    LDC  2,0(6)	Set return value to 0 
 78:     LD  3,-1(1)	Load return address 
 79:     LD  1,0(1)	Adjust fp 
 80:    JMP  7,0(3)	return 
* End of Function main
* 
* =========================================================
  0:    JMP  7,80(7)	Jump to init 
* START INIT
 81:    LDA  1,0(0)	Set first frame after globals 
 82:     ST  1,0(1)	Store old fp 
* START INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 83:    LDA  3,1(7)	Load return address 
 84:    JMP  7,-25(7)	Jump to main 
 85:   HALT  0,0,0	DONE 
* END INIT
