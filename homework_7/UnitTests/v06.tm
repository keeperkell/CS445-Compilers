* C- compiler version C-S21
* Built: Apr 18, 2021 (toffset telemetry)
* Author: Robert B. Heckendorn
* File compiled:  v06.c-
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION input
  1:     ST  3,-1(1)	Store return address 
  2:     IN  2,2,2	Grab int input 
  3:     LD  3,-1(1)	Load return address 
  4:     LD  1,0(1)	Adjust fp 
  5:    JMP  7,0(3)	Return 
* END FUNCTION input
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION output
  6:     ST  3,-1(1)	Store return address 
  7:     LD  3,-2(1)	Load parameter 
  8:    OUT  3,3,3	Output integer 
  9:     LD  3,-1(1)	Load return address 
 10:     LD  1,0(1)	Adjust fp 
 11:    JMP  7,0(3)	Return 
* END FUNCTION output
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION inputb
 12:     ST  3,-1(1)	Store return address 
 13:    INB  2,2,2	Grab bool input 
 14:     LD  3,-1(1)	Load return address 
 15:     LD  1,0(1)	Adjust fp 
 16:    JMP  7,0(3)	Return 
* END FUNCTION inputb
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION outputb
 17:     ST  3,-1(1)	Store return address 
 18:     LD  3,-2(1)	Load parameter 
 19:   OUTB  3,3,3	Output bool 
 20:     LD  3,-1(1)	Load return address 
 21:     LD  1,0(1)	Adjust fp 
 22:    JMP  7,0(3)	Return 
* END FUNCTION outputb
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION inputc
 23:     ST  3,-1(1)	Store return address 
 24:    INC  2,2,2	Grab char input 
 25:     LD  3,-1(1)	Load return address 
 26:     LD  1,0(1)	Adjust fp 
 27:    JMP  7,0(3)	Return 
* END FUNCTION inputc
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION outputc
 28:     ST  3,-1(1)	Store return address 
 29:     LD  3,-2(1)	Load parameter 
 30:   OUTC  3,3,3	Output char 
 31:     LD  3,-1(1)	Load return address 
 32:     LD  1,0(1)	Adjust fp 
 33:    JMP  7,0(3)	Return 
* END FUNCTION outputc
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION outnl
 34:     ST  3,-1(1)	Store return address 
 35:  OUTNL  3,3,3	Output a newline 
 36:     LD  3,-1(1)	Load return address 
 37:     LD  1,0(1)	Adjust fp 
 38:    JMP  7,0(3)	Return 
* END FUNCTION outnl
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION outputs
* TOFF set: -3
 39:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -3
* Compound Body
* TOFF set: -6
* FOR
 40:    LDC  3,0(6)	Load integer constant 
 41:     ST  3,-3(1)	save starting value in index variable 
 42:     LD  3,-2(1)	Load address of base of array s
 43:     LD  3,1(3)	Load array size 
 44:     ST  3,-4(1)	save stop value 
 45:    LDC  3,1(6)	default increment by 1 
 46:     ST  3,-5(1)	save step value 
 47:     LD  4,-3(1)	loop index 
 48:     LD  5,-4(1)	stop value 
 49:     LD  3,-5(1)	step value 
 50:    SLT  3,4,5	Op < 
 51:    JNZ  3,1(7)	Jump to loop body 
* EXPRESSION
* CALL outputc
 53:     ST  1,-6(1)	Store fp in ghost frame for outputc
* TOFF dec: -7
* TOFF dec: -8
* Param 1
 54:     LD  3,-2(1)	Load address of base of array s
 55:     ST  3,-8(1)	Push left side 
* TOFF dec: -9
 56:     LD  3,-3(1)	Load variable i
* TOFF inc: -8
 57:     LD  4,-8(1)	Pop left into ac1 
 58:    SUB  3,4,3	compute location from index 
 59:     LD  3,0(3)	Load array element 
 60:     ST  3,-8(1)	Push parameter 
* TOFF dec: -9
* Param end outputc
 61:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 62:    LDA  3,1(7)	Return address in ac 
 63:    JMP  7,-36(7)	CALL outputc
 64:    LDA  3,0(2)	Save the result in ac 
* Call end outputc
* TOFF set: -6
* Bottom of loop increment and jump
 65:     LD  3,-3(1)	Load index 
 66:     LD  5,-5(1)	Load step 
 67:    ADD  3,3,5	increment 
 68:     ST  3,-3(1)	store back to index 
 69:    JMP  7,-23(7)	go to beginning of loop 
 52:    JMP  7,17(7)	Jump past loop [backpatch] 
* END LOOP
* TOFF set: -3
* END COMPOUND
* Add standard closing in case there is no return statement
 70:    LDC  2,0(6)	Set return value to 0 
 71:     LD  3,-1(1)	Load return address 
 72:     LD  1,0(1)	Adjust fp 
 73:    JMP  7,0(3)	Return 
* END FUNCTION outputs
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
* TOFF set: -2
 74:     ST  3,-1(1)	Store return address 
* COMPOUND
* TOFF set: -2
* Compound Body
* EXPRESSION
* CALL outputs
 75:     ST  1,-2(1)	Store fp in ghost frame for outputs
* TOFF dec: -3
* TOFF dec: -4
* Param 1
  1:    LIT  "dogs are super cool!"
 76:    LDA  3,-1(0)	Load address of char array 
 77:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputs
 78:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 79:    LDA  3,1(7)	Return address in ac 
 80:    JMP  7,-42(7)	CALL outputs
 81:    LDA  3,0(2)	Save the result in ac 
* Call end outputs
* TOFF set: -2
* EXPRESSION
* CALL outnl
 82:     ST  1,-2(1)	Store fp in ghost frame for outnl
* TOFF dec: -3
* TOFF dec: -4
* Param end outnl
 83:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 84:    LDA  3,1(7)	Return address in ac 
 85:    JMP  7,-52(7)	CALL outnl
 86:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -2
* EXPRESSION
* CALL outputs
 87:     ST  1,-2(1)	Store fp in ghost frame for outputs
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 22:    LIT  "The answer is:"
 88:    LDA  3,-22(0)	Load address of char array 
 89:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end outputs
 90:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 91:    LDA  3,1(7)	Return address in ac 
 92:    JMP  7,-54(7)	CALL outputs
 93:    LDA  3,0(2)	Save the result in ac 
* Call end outputs
* TOFF set: -2
* EXPRESSION
* CALL output
 94:     ST  1,-2(1)	Store fp in ghost frame for output
* TOFF dec: -3
* TOFF dec: -4
* Param 1
 95:    LDC  3,42(6)	Load integer constant 
 96:     ST  3,-4(1)	Push parameter 
* TOFF dec: -5
* Param end output
 97:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 98:    LDA  3,1(7)	Return address in ac 
 99:    JMP  7,-94(7)	CALL output
100:    LDA  3,0(2)	Save the result in ac 
* Call end output
* TOFF set: -2
* EXPRESSION
* CALL outnl
101:     ST  1,-2(1)	Store fp in ghost frame for outnl
* TOFF dec: -3
* TOFF dec: -4
* Param end outnl
102:    LDA  1,-2(1)	Ghost frame becomes new active frame 
103:    LDA  3,1(7)	Return address in ac 
104:    JMP  7,-71(7)	CALL outnl
105:    LDA  3,0(2)	Save the result in ac 
* Call end outnl
* TOFF set: -2
* TOFF set: -2
* END COMPOUND
* Add standard closing in case there is no return statement
106:    LDC  2,0(6)	Set return value to 0 
107:     LD  3,-1(1)	Load return address 
108:     LD  1,0(1)	Adjust fp 
109:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,109(7)	Jump to init [backpatch] 
* INIT
110:    LDA  1,-36(0)	set first frame at end of globals 
111:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
112:    LDA  3,1(7)	Return address in ac 
113:    JMP  7,-40(7)	Jump to main 
114:   HALT  0,0,0	DONE! 
* END INIT
