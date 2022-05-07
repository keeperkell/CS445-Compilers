* =================================================
* C- compiler version C-S22
* Built: Apr 17 - May 8
* Author: Keller Lawson
* File Compiled:  homework_7/UnitTests_KL/h06.tm
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
* LOFF Line96: -4
 39:     ST  3,-1(1)	Store return addr 
* COMPOUND
* LOFF Line188: -4
* START COMPOUND BODY
* START IF
* START OP  >=
* START ID
 40:     LD  3,-3(1)	Load var y
* END ID
 41:     ST  3,-4(1)	Push left side1 
* LOFF Line 289: -5
 42:    LDC  3,0(6)	Load int const 
* LOFF Line 292: -4
 43:     LD  4,-4(1)	Pop left into acl 1 
 44:    TGE  3,4,3	Op >=
* END OP  >=
* THEN
* COMPOUND
* LOFF Line188: -4
* START COMPOUND BODY
* START ASSIGN
* START ID
 46:     LD  3,-3(1)	Load var y
* END ID
 47:     ST  3,-4(1)	Push index on 
* LOFF Line 478: -5
* START ID
 48:     LD  3,-3(1)	Load var y
* END ID
* LOFF Line 481: -4
 49:     LD  4,-4(1)	Pop index off 
 50:     LD  5,-2(1)	Load address of base of array 395 x
 51:    SUB  5,5,4	Compute offset of value 
 52:     ST  3,0(5)	Store var x
* END ASSIGN
* START CALL cat
 53:     ST  1,-4(1)	Store fp in ghost frame for  cat
* LOFF Line698: -5
* LOFF Line704: -6
* START Param 1
 54:     LD  3,-2(1)	Load address of base of array 841 x
 55:     ST  3,-6(1)	Push Parameter 
* END Param 1
* LOFF Line704: -7
* START Param 2
* LUChild->non array
* START OP  -
* START ID
 56:     LD  3,-3(1)	Load var y
* END ID
 57:     ST  3,-7(1)	Push left side1 
* LOFF Line 289: -8
 58:    LDC  3,1(6)	Load int const 
* LOFF Line 292: -7
 59:     LD  4,-7(1)	Pop left into acl 1 
 60:    SUB  3,4,3	Op -
* END OP  -
 61:     ST  3,-7(1)	Push Parameter 
* END Param 2
 62:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 63:    LDA  3,1(7)	Load return addr 
* BackPatch 64
 64:    JMP  7,-26(7)	CALL OUTPUT cat
 65:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -4
* END COMPOUND BODY
* END COMPOUND
 45:    JZR  3,20(7)	Jump around THEN if false [backpatch] 
* END IF
* RETURN
 66:     LD  3,-1(1)	Load return address 
 67:     LD  1,0(1)	Adjust fp 
 68:    JMP  7,0(3)	Return 
* END RETURN
* END COMPOUND BODY
* END COMPOUND
 69:    LDC  2,0(6)	Set return value to 0 
 70:     LD  3,-1(1)	Load return address 
 71:     LD  1,0(1)	Adjust fp 
 72:    JMP  7,0(3)	return 
* End of Function cat
* 
* =========================================================
* FuncK main
* LOFF Line96: -4
 73:     ST  3,-1(1)	Store return addr 
* COMPOUND
* LOFF Line188: -22
* START COMPOUND BODY
 74:    LDC  3,18(6)	load array size x
 75:     ST  3,-2(1)	save array size x
* START ASSIGN
 76:    LDC  3,12(6)	Load int const 
* START ID
 77:     ST  3,-21(1)	Store var y
* END ID
* END ASSIGN
* START CALL cat
 78:     ST  1,-22(1)	Store fp in ghost frame for  cat
* LOFF Line698: -23
* LOFF Line704: -24
* START Param 1
 79:    LDA  3,-3(1)	Load address of base of array 844 x
 80:     ST  3,-24(1)	Push Parameter 
* END Param 1
* LOFF Line704: -25
* START Param 2
* LUChild->non array
* START ID
 81:     LD  3,-21(1)	Load var y
* END ID
 82:     ST  3,-25(1)	Push Parameter 
* END Param 2
 83:    LDA  1,-22(1)	Ghost frame becomes new active frame 
 84:    LDA  3,1(7)	Load return addr 
* BackPatch 85
 85:    JMP  7,-47(7)	CALL OUTPUT cat
 86:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -22
* WHILE
* START OP  >=
* START ID
 87:     LD  3,-21(1)	Load var y
* END ID
 88:     ST  3,-22(1)	Push left side1 
* LOFF Line 289: -23
 89:    LDC  3,0(6)	Load int const 
* LOFF Line 292: -22
 90:     LD  4,-22(1)	Pop left into acl 1 
 91:    TGE  3,4,3	Op >=
* END OP  >=
 92:    JNZ  3,1(7)	Jump to WHILE 
* DO
* COMPOUND
* LOFF Line188: -22
* START COMPOUND BODY
* START CALL output
 94:     ST  1,-22(1)	Store fp in ghost frame for  output
* START Param 1
* LOFF Line680: -23
* LOFF Line685: -24
* START ID
 95:     LD  3,-21(1)	Load var y
* END ID
 96:     ST  3,-24(1)	Push parameter 623 
* LOFF Line615: -25
* END Param 1
 97:    LDA  1,-22(1)	Ghost frame becomes new active frame 
 98:    LDA  3,1(7)	Load return addr 
* BackPatch 99
 99:    JMP  7,-94(7)	CALL OUTPUT output
100:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -22
* START CALL outnl
101:     ST  1,-22(1)	Store fp in ghost frame for outnl
102:    LDA  1,-22(1)	Ghost frame becomes new active frame 
103:    LDA  3,1(7)	Load return addr 
* BackPatch 104
104:    JMP  7,-71(7)	CALL OUTPUT outnl
105:    LDA  3,0(2)	Save the result in ac 
* END CALL
* LOFF Line749: -22
* START ASSIGN
* START OP  -
* START ID
106:     LD  3,-21(1)	Load var y
* END ID
107:     ST  3,-22(1)	Push left side1 
* LOFF Line 289: -23
108:    LDC  3,1(6)	Load int const 
* LOFF Line 292: -22
109:     LD  4,-22(1)	Pop left into acl 1 
110:    SUB  3,4,3	Op -
* END OP  -
* START ID
111:     ST  3,-21(1)	Store var y
* END ID
* END ASSIGN
* END COMPOUND BODY
* END COMPOUND
112:    JMP  6,-26(7)	Jump to beginning of loop 
 93:    JMP  7,19(7)	Jump past end of look [backpatch] 
* END WHILE
* END COMPOUND BODY
* END COMPOUND
113:    LDC  2,0(6)	Set return value to 0 
114:     LD  3,-1(1)	Load return address 
115:     LD  1,0(1)	Adjust fp 
116:    JMP  7,0(3)	return 
* End of Function main
* 
* =========================================================
  0:    JMP  7,116(7)	Jump to init 
* START INIT
117:    LDA  1,0(0)	Set first frame after globals 
118:     ST  1,0(1)	Store old fp 
* START INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
119:    LDA  3,1(7)	Load return address 
120:    JMP  7,-48(7)	Jump to main 
121:   HALT  0,0,0	DONE 
* END INIT
