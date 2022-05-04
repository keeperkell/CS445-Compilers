* START FUNC INPUT
  0:     ST  3,-1(1)	Store return addr 
  1:     IN  2,2,2	Get int input 
  2:     LD  3,-1(1)	Load return addr 
  3:     LD  1,0(1)	Adjust fp 
  4:    JMP  7,0(3)	Return 
* END FUNC INPUT
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* START FUNC INPUTB
  5:     ST  3,-1(1)	Store return addr 
  6:     IN  2,2,2	Get bool input 
  7:     LD  3,-1(1)	Load return addr 
  8:     LD  1,0(1)	Adjust fp 
  9:    JMP  7,0(3)	Return 
* END FUNC INPUTB
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* START FUNC INPUTC
 10:     ST  3,-1(1)	Store return addr 
 11:     IN  2,2,2	Get char input 
 12:     LD  3,-1(1)	Load return addr 
 13:     LD  1,0(1)	Adjust fp 
 14:    JMP  7,0(3)	Return 
* END FUNC INPUTC
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* START FUNC OUTPUT
 15:     ST  3,-1(1)	Store return addr 
 16:     LD  3,-2(1)	Load return addr 
 17:    OUT  3,3,3	Output int 
 18:     LD  3,-1(1)	Load return addr 
 19:     LD  1,0(1)	Adjust fp 
 20:    JMP  7,0(3)	Return 
* END FUNC OUTPUT
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* START FUNC OUTPUTB
 21:     ST  3,-1(1)	Store return addr 
 22:     LD  3,-2(1)	Load return addr 
 23:    OUT  3,3,3	Output int 
 24:     LD  3,-1(1)	Load return addr 
 25:     LD  1,0(1)	Adjust fp 
 26:    JMP  7,0(3)	Return 
* END FUNC OUTPUTB
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* START FUNC OUTPUTC
 27:     ST  3,-1(1)	Store return addr 
 28:     LD  3,-2(1)	Load return addr 
 29:    OUT  3,3,3	Output int 
 30:     LD  3,-1(1)	Load return addr 
 31:     LD  1,0(1)	Adjust fp 
 32:    JMP  7,0(3)	Return 
* END FUNC OUTPUTC
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FuncK main
 33:     ST  3,-1(1)	Store return addr 
* COMPOUND
* END COMPOUND
 34:    LDC  2,0(6)	Set return valuye to 0 
 35:     LD  3,-1(1)	Load return address 
 36:     LD  1,0(1)	Adjust file pointer 
 37:    JMP  7,0(3)	return 
* End of Function main
  0:    JMP  7,37(7)	Jump to init 
* START INIT
 38:    LDA  1,0(0)	Set first frame after globals 
 39:     ST  1,0(1)	Store old fp 
* START INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 40:    LDA  3,1(7)	Load return address 
 41:    JMP  7,-42(7)	Jump to main 
 42:   HALT  0,0,0	DONE 
* END INIT
