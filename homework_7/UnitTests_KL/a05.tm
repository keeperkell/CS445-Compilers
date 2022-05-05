* =================================================
* C- compiler version C-S22
* Built: Apr 17 - May 8
* Author: Keller Lawson
* File Compiled:  homework_7/UnitTests_KL/a05.tm
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
 39:     ST  3,-1(1)	Save result in ac 
* COMPOUND
* LOFF Line70: -3
* START ASSIGN <-
* START CONSTANT
 40:    LDC  3,273(6)	Load int const 
* END CONSTANT
* START ID x
 41:     ST  3,-2(1)	Store var x
* END ID x
* END ASSIGN <-
* START CALL  output
 42:     ST  1,-3(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -4
* LOFF Line685: -5
* START ID x
 43:     LD  3,-2(1)	Load var x
* END ID x
 44:     ST  3,-5(1)	Push left side 
 45:    LDA  1,-3(1)	Ghost frame becomes new active frame 
* END Param 1
 46:    LDA  3,1(7)	Load return addr 
* BackPatch 47
 47:    JMP  7,-42(7)	CALL OUTPUT output
 48:    LDA  3,0(2)	Store 
* END CALL output
* LOFF Line749: -3
* LOFF Line188: -3
* END COMPOUND
 49:    LDC  2,0(6)	Set return value to 0 
 50:     LD  3,-1(1)	Load return address 
 51:     LD  1,0(1)	Adjust fp 
 52:    JMP  7,0(3)	Return 
* End of Function main
  0:    JMP  7,52(7)	Jump to init [backpatch] 
* START INIT
 53:    LDA  1,0(0)	Set first frame at end of globals 
 54:     ST  1,0(1)	Store old fp (point to self) 
* START INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 55:    LDA  3,1(7)	Return address in ac 
 56:    JMP  7,-18(7)	Jump to main 
 57:   HALT  0,0,0	DONE 
* END INIT
