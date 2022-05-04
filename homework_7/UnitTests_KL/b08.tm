* =================================================
* C- compiler version C-S22
* Built: Apr 17 - May 8
* Author: Keller Lawson
* File Compiled:  homework_7/UnitTests_KL/b08.tm
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
* START CALL
 40:     ST  1,-2(1)	Store fp in ghost frame outputb
* START Param 1
* LOFF Line680: -3
* LOFF Line685: -4
* START OP
* START CONSTANT
 41:    LDC  3,1(6)	Load bool const 
* END CONSTANT
 42:    LDC  4,1(6)	Load 1 
 43:    XOR  3,3,4	Op XOR for logical not 
* ENBD OP
 44:     ST  3,-4(1)	Push left side 
 45:    LDA  1,-2(1)	Load fp of ghost frame 
* END Param 1
 46:    LDA  3,1(7)	Load return addr 
* BackPatch 47
 47:    JMP  7,-31(7)	CALL OUTPUT outputb
 48:    LDA  3,0(2)	Store 
* END CALL
* LOFF Line749: -2
* START CALL
 49:     ST  1,-2(1)	Store fp outnl
 50:    LDA  1,-2(1)	Load fp 
 51:    LDA  3,1(7)	Load return addr 
* BackPatch 52
 52:    JMP  7,-19(7)	CALL OUTPUT outnl
 53:    LDA  3,0(2)	Store 
* END CALL
* LOFF Line749: -2
* START CALL
 54:     ST  1,-2(1)	Store fp in ghost frame outputb
* START Param 1
* LOFF Line680: -3
* LOFF Line685: -4
* START OP
* START CONSTANT
 55:    LDC  3,0(6)	Load bool const 
* END CONSTANT
 56:    LDC  4,1(6)	Load 1 
 57:    XOR  3,3,4	Op XOR for logical not 
* ENBD OP
 58:     ST  3,-4(1)	Push left side 
 59:    LDA  1,-2(1)	Load fp of ghost frame 
* END Param 1
 60:    LDA  3,1(7)	Load return addr 
* BackPatch 61
 61:    JMP  7,-45(7)	CALL OUTPUT outputb
 62:    LDA  3,0(2)	Store 
* END CALL
* LOFF Line749: -2
* START CALL
 63:     ST  1,-2(1)	Store fp outnl
 64:    LDA  1,-2(1)	Load fp 
 65:    LDA  3,1(7)	Load return addr 
* BackPatch 66
 66:    JMP  7,-33(7)	CALL OUTPUT outnl
 67:    LDA  3,0(2)	Store 
* END CALL
* LOFF Line749: -2
* END COMPOUND BODY
* LOFF Line188: -2
* END COMPOUND
 68:    LDC  2,0(6)	Set return valuye to 0 
 69:     LD  3,-1(1)	Load return address 
 70:     LD  1,0(1)	Adjust file pointer 
 71:    JMP  7,0(3)	return 
* End of Function main
  0:    JMP  7,71(7)	Jump to init 
* START INIT
 72:    LDA  1,0(0)	Set first frame after globals 
 73:     ST  1,0(1)	Store old fp 
* START INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 74:    LDA  3,1(7)	Load return address 
 75:    JMP  7,-37(7)	Jump to main 
 76:   HALT  0,0,0	DONE 
* END INIT
