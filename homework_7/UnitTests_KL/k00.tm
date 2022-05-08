* =================================================
* C- compiler version C-S22
* Built: Apr 17 - May 8
* Author: Keller Lawson
* File Compiled:  homework_7/UnitTests_KL/k00.tm
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
* LOFF Line188: -3
* START COMPOUND BODY
* START FOR
* LOFF Line 202: -6
 40:    LDC  3,300(6)	Load int const 
* LOFF Line 300: -5
 41:     ST  3,-2(1)	save starting value in index variable 
 42:    LDC  3,313(6)	Load int const 
 43:     ST  3,-3(1)	save stop value 303 
 44:    LDC  3,1(6)	default increment by 1 
 45:     ST  3,-4(1)	save step value 314 
* LOFF Line 318: -4
* LOFF Line 211: -5
 46:     LD  4,-2(1)	loop index 
 47:     LD  5,-3(1)	Stop value 
 48:     LD  3,-4(1)	Step value 
 49:    SLT  3,4,5	Op < 
 50:    JNZ  3,1(7)	Jump to loop body 
* COMPOUND
* LOFF Line188: -5
* START COMPOUND BODY
* START CALL output
 52:     ST  1,-5(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -6
* LOFF Line685: -7
* START ID
 53:     LD  3,-2(1)	Load var i
* END ID
 54:     ST  3,-7(1)	Push parameter 623 
* LOFF Line615: -8
* END Param 1
 55:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 56:    LDA  3,1(7)	Load return addr 
* BackPatch 57
 57:    JMP  7,-52(7)	CALL OUTPUT output
 58:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -5
* START CALL outnl
 59:     ST  1,-5(1)	Store fp in ghost frame for outnl
 60:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 61:    LDA  3,1(7)	Load return addr 
* BackPatch 62
 62:    JMP  7,-29(7)	CALL OUTPUT outnl
 63:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -5
* END COMPOUND BODY
* END COMPOUND
 64:     LD  3,-2(1)	Load index 
 65:     LD  5,-4(1)	Load step 
 66:    ADD  3,3,5	increment 
 67:     ST  3,-2(1)	store back to index 
* LOFF Line 234: -5
 68:    JMP  7,-23(7)	go to beginning of loop 
 51:    JMP  7,17(7)	Jump past loop [backpatch] 
* END FOR
* END COMPOUND BODY
* END COMPOUND
 69:    LDC  2,0(6)	Set return value to 0 
 70:     LD  3,-1(1)	Load return address 
 71:     LD  1,0(1)	Adjust fp 
 72:    JMP  7,0(3)	return 
* End of Function main
* 
* =========================================================
  0:    JMP  7,72(7)	Jump to init 
* START INIT
 73:    LDA  1,0(0)	Set first frame after globals 
 74:     ST  1,0(1)	Store old fp 
* START INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 75:    LDA  3,1(7)	Load return address 
 76:    JMP  7,-38(7)	Jump to main 
 77:   HALT  0,0,0	DONE 
* END INIT
