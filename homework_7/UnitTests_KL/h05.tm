* =================================================
* C- compiler version C-S22
* Built: Apr 17 - May 8
* Author: Keller Lawson
* File Compiled:  homework_7/UnitTests_KL/h05.tm
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
* START CALL output
* START Param 1 array op 606
 40:     ST  1,-3(1)	Store fp in ghost frame for  output
* START ID
 41:     LD  3,-2(1)	Load address of base of array3 x
* END ID
 42:     ST  3,-5(1)	Push left 610 
* LOFF Line614: -6
 43:    LDC  3,3(6)	Load int const 
 44:     LD  4,-5(1)	Pop left into acl 1 
 45:    SUB  3,4,3	compute location from index 
 46:     LD  3,0(3)	Load array element 
 47:     ST  3,-5(1)	Push parameter 618 
* LOFF Line622: -6
* END Param 1
 48:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 49:    LDA  3,1(7)	Load return addr 
* BackPatch 50
 50:    JMP  7,-45(7)	CALL OUTPUT output
 51:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
* START CALL outnl
 52:     ST  1,-3(1)	Store fp in ghost frame for outnl
 53:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 54:    LDA  3,1(7)	Load return addr 
* BackPatch 55
 55:    JMP  7,-22(7)	CALL OUTPUT outnl
 56:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
* START IF
* START OP  >
* START OP  [
* START ID
 57:     LD  3,-2(1)	Load address of base of array3 x
* END ID
 58:     ST  3,-3(1)	Push left side1 
* LOFF Line 289: -4
 59:    LDC  3,3(6)	Load int const 
* LOFF Line 292: -3
 60:     LD  4,-3(1)	Pop left into acl 1 
 61:    SUB  3,4,3	compute location from index 
 62:     LD  3,0(3)	Load array element 
* END OP  [
 63:     ST  3,-3(1)	Push left side1 
* LOFF Line 289: -4
 64:    LDC  3,0(6)	Load int const 
* LOFF Line 292: -3
 65:     LD  4,-3(1)	Pop left into acl 1 
 66:    TGT  3,4,3	Op >
