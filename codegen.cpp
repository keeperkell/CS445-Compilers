#include "treeNode.h"
#include "symbolTable.h"
#include "codegen.h"
#include "emitcode.h"
#include <stdio.h>
#include <stdlib.h>

extern SymbolTable st;
extern int foffset;
extern int goffset;
int loffset = -2;
bool storeInMem = false;
int breakLoc = 0;

FILE *genFile;

void codeGen(char *outputFile, TreeNode *t){
    char *temp = t->attr.name;
    //open file to write
    genFile = fopen(outputFile, "w");

    t->attr.name = temp;
    genParse(t);
    genMainFunc(t);
}

void genParse(TreeNode *t){
    if(!t){
        return;
    }
    else{
        switch(t->nodekind){
            case DeclK:
                codeGenDecl(t);
                break;
            case StmtK:
                codeGenStmt(t);
                break;
            case ExpK:
                codeGenExp(t);
                break;
        }
        if(t->sibling){
            genParse(t->sibling);
        }
    }
}

void codeGenDecl(TreeNode *t){
    if(!t){
        return;
    }
    else{
        switch(t->subkind.decl){
            case VarK:
                //check for locals first
                if(t->memKind == Local){
                    if(!t->isArray){
                        loffset -= t->memSize;
                        emitComment((char *)("LOFF dec: "), loffset);
                    }
                    else{
                        emitRM((char *)"LDC", 3, t->memSize - 1, 6, (char *)("load array size"), (char *)t->attr.name);
                        emitRM((char *)"ST", 3, loffset, 1, (char *)("save array size"), (char *)t->attr.name);
                        loffset -= t->memSize;
                    }
                }
                break;

            case FuncK:
                t->codeGenLineNum = emitSkip(0);
                emitComment((char *)("FuncK"), (char *)t->attr.name);

                TreeNode *LUChild = t->child[0];
                loffset = -2;
                emitComment((char *)("LOFF set: "), loffset);
                
                int numParams = 0;
                while(LUChild){
                    LUChild = LUChild->sibling;
                    numParams++;
                }

                loffset -= numParams;
                emitRM((char *)"ST", 3, -1, 1, (char *)"Store return addr");
                for(int i = 0; i < MAXCHILDREN; i++){
                    if(t->child[i]){
                        genParse(t->child[i]);
                    }
                }

                emitRM((char *)"LDC", 2, 0, 6, (char *)"Set return valuye to 0");
                emitRM((char *)"LD", 3, -1, 1, (char *)"Load return address");
                emitRM((char *)"LD", 1, 0, 1, (char *)"Adjust file pointer");
                emitRM((char *)"JMP", 7, 0, 3, (char *)"return");
                emitComment((char *)("End of Function"), (char *)t->attr.name);
                break;
        }
    }
}

void codeGenStmt(TreeNode *t){
    switch(t->subkind.stmt){
        case IfK:
            int thenLineNum = 0;
            int elseLineNum = 0;
            storeInMem = false;

            emitComment((char *)("IF"));
            genParse(t->child[0]);
            emitComment((char *)("THEN"));
            thenLineNum = emitSkip(1);

            // second child exists if else is used
            if(t->child[2]){
                elseLineNum = emitSkip(1);
            }

            backPatchAJumpToHere((char *)("JZR"), 3, thenLineNum, (char *)("Jump around THEN if false [backpatch]"));

            if(t->child[2]){
                emitComment((char *)("ELSE"));
                genParse(t->child[2]);
                backPatchAJumpToHere((char *)("JMP"), 3, elseLineNum, (char *)("Jump around ELSE [backpatch]"));
            }
            emitComment((char *)("END IF"));
            break;

        case WhileK:
            int bP = emitSkip(0);
            int whileJump = 0;
            int jumpLoc = 0;
            storeInMem = false;

            emitComment((char *)("WHILE"));
            genParse(t->child[0]);
            int bB = breakLoc;
            breakLoc = emitSkip(0);

            emitRM((char *)"JNZ", 3, 1, 7, (char *)("Jump to WHILE"));
            emitComment((char *)("DO"));

            whileJump = emitSkip(1);
            genParse(t->child[1]);
            emitRM((char *)"JMP", 6, bP - emitSkip(0) - 1, 7, (char *)("Jump to beginning of loop"));
            
            jumpLoc = emitSkip(0);
            backPatchAJumpToHere(whileJump, (char *)("Jump past end of look [backpatch]"));
            breakLoc = bB;
            emitNewLoc(jumpLoc);
            emitComment((char *)("END WHILE"));
            break;
            
        case ForK:
            break;

        case CompoundK:
            int tempOffset = loffset;
            emitComment((char *)("COMPOUND"));
            emitComment((char *)("Compound Body"));

            for(int i = 0; i < MAXCHILDREN; i++){
                genParse(t->child[i]);
            }

            loffset = tempOffset;
            emitComment((char *)("END COMPOUND"));
            break;

        case ReturnK:
            emitComment((char *)("RETURN"));
			if(t->child[0] != NULL)
			{
				if(t->isArray)
				{
					if(!strcmp(t->child[0]->attr.name, "["))
					{
						
					}
					else
					{
						storeInMem = false;
						genParse(t->child[0]);
						emitRM((char *)"LDA", 2, 0, 3, (char *)("Copy to return register"));
					}
					
				}
				else
				{
					storeInMem = false;
					genParse(t->child[0]);
					emitRM((char *)"LDA", 2, 0, 3, (char *)("Copy to return register"));
				}
			}
			emitRM((char *)"LD", 3, -1, 1, (char *)("Load return address"));
			emitRM((char *)"LD", 1, 0, 1, (char *)("Adjust fp"));
			emitRM((char *)"JMP", 7, 0, 3, (char *)("Return"));
            emitComment((char *)("END RETURN"));
          	break;

        case BreakK:
            emitComment((char *)("BREAK"));
            emitRM((char *)"JMP", 7, breakLoc - emitSkip(0), 7, (char *)("break"));
            break;

        case RangeK:
            break;
    }
}

void codeGenExp(TreeNode *t){
    switch(t->subkind.exp){
        case OpK:
        case ConstantK:
        case IdK:
        case AssignK:
        case CallK:
    }
}

void genMainFunc(TreeNode *t){
    TreeNode *lookup;

    //set backpatch and look for main
    int bp = emitSkip(0)-1;
    emitNewLoc(0);
    lookup = (TreeNode *)st.lookup("main");

    emitRM((char *)"JMP", 7, bp, 7, (char *)("Jump to init [backpatch]"));
    emitComment((char *)("INIT"));
    emitSkip(bp);

    emitRM((char *)"LDA", 1, goffset, 0, (char *)("Set first frame at end of globals"));
    emitRM((char *)"ST", 1, 0, 1, (char *)("store old fp (point to self)"));
    emitComment((char *)("START INIT GLOBALS AND STATICS"));
    genGlobAndStatics(t);
    emitComment((char *)("END INIT GLOBALS AND STATICS"));

    emitRM((char *)"LDA", 3, 1, 7, (char *)("Return address in ac"));
    bp = emitSkip(0);
    emitRM((char*)"JMP", 7, lookup->codeGenLineNum - bp - 1, 7, (char *)("Jump to main"));
    emitRO((char *)"HALT", 0, 0, 0, (char *)("DONE"));
    emitComment((char *)("END INIT"));
}

void genGlobAndStatics(TreeNode *t){

}