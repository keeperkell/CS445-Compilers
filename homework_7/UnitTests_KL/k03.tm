* =================================================
* C- compiler version C-S22
* Built: Apr 17 - May 8
* Author: Keller Lawson
* File Compiled:  homework_7/UnitTests_KL/k03.tm
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
* Inside compound for
* Vark Off:  -2
* Vark Off:  -2
* START COMPOUND BODY
* START FOR
* LOFF Line 202: -5
 40:    LDC  3,0(6)	Load int const 
 41:     ST  3,-2(1)	save starting value in index variable 
 42:    LDC  3,3(6)	Load int const 
 43:     ST  3,-3(1)	save stop value 303 
 44:    LDC  3,1(6)	default increment by 1 
 45:     ST  3,-4(1)	save step value 314 
 46:     LD  4,-2(1)	loop index 
 47:     LD  5,-3(1)	Stop value 
 48:     LD  3,-4(1)	Step value 
 49:    SLT  3,4,5	Op < 
 50:    JNZ  3,1(7)	Jump to loop body 
* COMPOUND
* Inside compound for
* Vark Off:  -3
* Vark Off:  -5
* START COMPOUND BODY
* START FOR
* LOFF Line 202: -8
 52:    LDC  3,0(6)	Load int const 
 53:     ST  3,-5(1)	save starting value in index variable 
 54:    LDC  3,3(6)	Load int const 
 55:     ST  3,-6(1)	save stop value 303 
 56:    LDC  3,1(6)	default increment by 1 
 57:     ST  3,-7(1)	save step value 314 
 58:     LD  4,-5(1)	loop index 
 59:     LD  5,-6(1)	Stop value 
 60:     LD  3,-7(1)	Step value 
 61:    SLT  3,4,5	Op < 
 62:    JNZ  3,1(7)	Jump to loop body 
* COMPOUND
* START COMPOUND BODY
* START CALL output
 64:     ST  1,-8(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -9
* LOFF Line685: -10
* START ID
 65:     LD  3,-2(1)	Load var i
* END ID
 66:     ST  3,-10(1)	Push parameter 623 
* LOFF Line615: -11
* END Param 1
 67:    LDA  1,-8(1)	Ghost frame becomes new active frame 
 68:    LDA  3,1(7)	Load return addr 
* BackPatch 69
 69:    JMP  7,-64(7)	CALL OUTPUT output
 70:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -8
* START CALL output
 71:     ST  1,-8(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -9
* LOFF Line685: -10
* START ID
 72:     LD  3,-3(1)	Load var j
* END ID
 73:     ST  3,-10(1)	Push parameter 623 
* LOFF Line615: -11
* END Param 1
 74:    LDA  1,-8(1)	Ghost frame becomes new active frame 
 75:    LDA  3,1(7)	Load return addr 
* BackPatch 76
 76:    JMP  7,-71(7)	CALL OUTPUT output
 77:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -8
* START CALL outnl
 78:     ST  1,-8(1)	Store fp in ghost frame for outnl
 79:    LDA  1,-8(1)	Ghost frame becomes new active frame 
 80:    LDA  3,1(7)	Load return addr 
* BackPatch 81
 81:    JMP  7,-48(7)	CALL OUTPUT outnl
 82:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -8
* END COMPOUND BODY
* END COMPOUND
 83:     LD  3,-5(1)	Load index 
 84:     LD  5,-7(1)	Load step 
 85:    ADD  3,3,5	increment 
 86:     ST  3,-5(1)	store back to index 
* LOFF Line 234: -7
 87:    JMP  7,-30(7)	go to beginning of loop 
 63:    JMP  7,24(7)	Jump past loop [backpatch] 
* END FOR
* END COMPOUND BODY
* END COMPOUND
 88:     LD  3,-4(1)	Load index 
 89:     LD  5,-6(1)	Load step 
 90:    ADD  3,3,5	increment 
 91:     ST  3,-4(1)	store back to index 
* LOFF Line 234: -4
 92:    JMP  7,-47(7)	go to beginning of loop 
 51:    JMP  7,41(7)	Jump past loop [backpatch] 
* END FOR
* END COMPOUND BODY
* END COMPOUND
 93:    LDC  2,0(6)	Set return value to 0 
 94:     LD  3,-1(1)	Load return address 
 95:     LD  1,0(1)	Adjust fp 
 96:    JMP  7,0(3)	return 
* End of Function main
* 
* =========================================================
  0:    JMP  7,96(7)	Jump to init 
* START INIT
 97:    LDA  1,0(0)	Set first frame after globals 
 98:     ST  1,0(1)	Store old fp 
* START INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 99:    LDA  3,1(7)	Load return address 
100:    JMP  7,-62(7)	Jump to main 
101:   HALT  0,0,0	DONE 
* END INIT
