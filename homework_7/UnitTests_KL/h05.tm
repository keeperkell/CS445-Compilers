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
* END OP  >
* THEN
* COMPOUND
* LOFF Line188: -3
* START COMPOUND BODY
* START ASSIGN
 68:    LDC  3,3(6)	Load int const 
 69:     ST  3,-3(1)	Push index on 
* LOFF Line 465: -4
 70:    LDC  3,1(6)	Load int const 
* LOFF Line 470: -3
 71:     LD  4,-3(1)	Pop index 
 72:     LD  5,-2(1)	Load address of base of array 478 x
 73:    SUB  5,5,4	Compute offset of value 
 74:     LD  4,0(5)	Load lhs variable 484 x
 75:    SUB  3,4,3	op -=
 76:     ST  3,0(5)	Store var x
* END ASSIGN
* START CALL cat
* START Param 1 array id 602
 77:     ST  1,-3(1)	Store fp in ghost frame for  cat
* LOFF Line605: -5
* START ID
 78:     LD  3,-2(1)	Load address of base of array3 x
* END ID
 79:     ST  3,-5(1)	Push parameter 606 
* LOFF Line609: -6
 80:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 81:    LDA  3,1(7)	Load return addr 
* BackPatch 82
 82:    JMP  7,-44(7)	CALL OUTPUT cat
 83:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -3
* END COMPOUND BODY
* END COMPOUND
 67:    JZR  3,16(7)	Jump around THEN if false [backpatch] 
* END IF
* RETURN
 84:     LD  3,-1(1)	Load return address 
 85:     LD  1,0(1)	Adjust fp 
 86:    JMP  7,0(3)	Return 
* END RETURN
* END COMPOUND BODY
* END COMPOUND
 87:    LDC  2,0(6)	Set return value to 0 
 88:     LD  3,-1(1)	Load return address 
 89:     LD  1,0(1)	Adjust fp 
 90:    JMP  7,0(3)	return 
* End of Function cat
* 
* =========================================================
* FuncK main
* LOFF Line96: -3
 91:     ST  3,-1(1)	Store return addr 
* COMPOUND
* LOFF Line188: -2
* START COMPOUND BODY
* START ASSIGN
 92:    LDC  3,3(6)	Load int const 
 93:     ST  3,-2(1)	Push index on 
* LOFF Line 478: -3
 94:    LDC  3,12(6)	Load int const 
* LOFF Line 481: -2
 95:     LD  4,-2(1)	Pop index off 
 96:    LDA  5,-1(0)	Load address of base of array 392 x
 97:    SUB  5,5,4	Compute offset of value 
 98:     ST  3,0(5)	Store var x
* END ASSIGN
* START CALL cat
* START Param 1 array id 602
 99:     ST  1,-2(1)	Store fp in ghost frame for  cat
* LOFF Line605: -4
* START ID
100:    LDA  3,-1(0)	Load address of base of array1 x
* END ID
101:     ST  3,-4(1)	Push parameter 606 
* LOFF Line609: -5
102:    LDA  1,-2(1)	Ghost frame becomes new active frame 
103:    LDA  3,1(7)	Load return addr 
* BackPatch 104
104:    JMP  7,-66(7)	CALL OUTPUT cat
105:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -2
* END COMPOUND BODY
* END COMPOUND
106:    LDC  2,0(6)	Set return value to 0 
107:     LD  3,-1(1)	Load return address 
108:     LD  1,0(1)	Adjust fp 
109:    JMP  7,0(3)	return 
* End of Function main
* 
* =========================================================
  0:    JMP  7,109(7)	Jump to init 
* START INIT
110:    LDA  1,-19(0)	Set first frame after globals 
111:     ST  1,0(1)	Store old fp 
* START INIT GLOBALS AND STATICS
112:    LDC  3,18(6)	Load array size x
113:     ST  3,0(0)	Store array size x
* END INIT GLOBALS AND STATICS
114:    LDA  3,1(7)	Load return address 
115:    JMP  7,-25(7)	Jump to main 
116:   HALT  0,0,0	DONE 
* END INIT
