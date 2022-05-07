* =================================================
* C- compiler version C-S22
* Built: Apr 17 - May 8
* Author: Keller Lawson
* File Compiled:  homework_7/UnitTests_KL/i08.tm
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
* LOFF Line188: -13
* START COMPOUND BODY
 40:    LDC  3,10(6)	Load array size 
 41:     ST  3,-2(0)	Save size of  xx
* COMPOUND
* LOFF Line188: -13
* START COMPOUND BODY
* START CALL output
* START Param 1 array op 606
 42:     ST  1,-13(1)	Store fp in ghost frame for  output
* START ID
 43:    LDA  3,-3(1)	Load address of base of array2 xx
* END ID
 44:     ST  3,-15(1)	Push left 610 
* LOFF Line614: -16
* START OP  -
 45:    LDC  3,1(6)	Load int const 
 46:    NEG  3,3,3	Unary Op -
* END OP  -
 47:     LD  4,-15(1)	Pop left into acl 1 
 48:    SUB  3,4,3	compute location from index 
 49:     LD  3,0(3)	Load array element 
 50:     ST  3,-15(1)	Push parameter 618 
* LOFF Line622: -16
* END Param 1
 51:    LDA  1,-13(1)	Ghost frame becomes new active frame 
 52:    LDA  3,1(7)	Load return addr 
* BackPatch 53
 53:    JMP  7,-48(7)	CALL OUTPUT output
 54:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -13
* START CALL outnl
 55:     ST  1,-13(1)	Store fp in ghost frame for outnl
 56:    LDA  1,-13(1)	Ghost frame becomes new active frame 
 57:    LDA  3,1(7)	Load return addr 
* BackPatch 58
 58:    JMP  7,-25(7)	CALL OUTPUT outnl
 59:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -13
* END COMPOUND BODY
* END COMPOUND
* END COMPOUND BODY
* END COMPOUND
 60:    LDC  2,0(6)	Set return value to 0 
 61:     LD  3,-1(1)	Load return address 
 62:     LD  1,0(1)	Adjust fp 
 63:    JMP  7,0(3)	return 
* End of Function main
* 
* =========================================================
  0:    JMP  7,63(7)	Jump to init 
* START INIT
 64:    LDA  1,0(0)	Set first frame after globals 
 65:     ST  1,0(1)	Store old fp 
* START INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 66:    LDA  3,1(7)	Load return address 
 67:    JMP  7,-29(7)	Jump to main 
 68:   HALT  0,0,0	DONE 
* END INIT
