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

FILE *code;

void codeGen(char *outputFile, TreeNode *t){
    emitComment("Keller TM Output");
    char *temp = t->attr.name;
    //open file to write
    code = fopen(outputFile, "w");

    // init IO
    initIO();

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
            {
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
            }

        case WhileK:
            {
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
            }
            
        case ForK:
            {
                break;
            }

        case CompoundK:
            {
                int tempOffset = loffset;
                emitComment((char *)("COMPOUND"));

                for(int i = 0; i < MAXCHILDREN; i++){
                    genParse(t->child[i]);
                }

                loffset = tempOffset;
                emitComment((char *)("END COMPOUND"));
                break;
            }

        case ReturnK:
            {
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
            }

        case BreakK:
            {
                emitComment((char *)("BREAK"));
                emitRM((char *)"JMP", 7, breakLoc - emitSkip(0), 7, (char *)("break"));
                break;
            }

        case RangeK:
            break;
    }
}

void codeGenExp(TreeNode *t){
    switch(t->subkind.exp){
        case OpK:
            {
                emitComment((char *)("START OP"));
                
                //unary check
                if(!t->child[1]){
                    genParse(t->child[0]);

                    if(!strcmp(t->attr.name, "*")){
                        if(t->memKind == Global){
                            emitRM((char *)"LDA", 3, t->child[0]->offset, 0, (char *)("Load base of array addr"), (char *)t->child[0]->attr.name);
                        }
                        else if(t->memKind == Parameter){
                            emitRM((char *)"LD", 3, t->child[0]->offset, 1, (char *)("Load base of array addr"), (char *)t->child[0]->attr.name);
                        }
                        else{
                            emitRM((char *)"LDA", 3, t->child[0]->offset, 1, (char *)("Load base of array addr"), (char *)t->child[0]->attr.name);
                        }

                        emitRM((char *)"LD", 3, 1, 3, (char *)("Load array size"));
                    }
                    else if(!strcmp(t->attr.name, "-")){
                        emitRO((char *)"NEG", 3, 3, 3, (char *)("Unary Op"), (char *)t->attr.name);
                    }
                    else if(!strcmp(t->attr.name, "?")){
                        emitRO((char *)"RND", 3, 3, 3, (char *)("Unary Op"), (char *)t->attr.name);
                    }
                    else if(!strcmp(t->attr.name, "NOT")){
                        emitRM((char *)"LDC",4,1,6,(char *)("Load 1"));
                        emitRO((char *)"XOR",3,3,4,(char *)("Op XOR for logical not"));
                    }
                }
                // else if for binary
                else{
                    if(t->child[0]){
                        if(t->child[0]->child[0]){
                            // 2 sections needed. One for arrays, one for not an array
                            if(t->child[0]->child[0]->isArray){
                                // child 1
                                if(t->child[0]->child[0]->memKind == Global){
                                    emitRM((char *)"LDA", 3, t->child[0]->child[0]->offset, 0, (char *)("Load base of array addr"), (char *)t->child[0]->child[0]->attr.name);
                                }
                                else if(t->child[0]->child[0]->memKind == Parameter){
                                    emitRM((char *)"LD", 3, t->child[0]->child[0]->offset, 1, (char *)("Load base of array addr"), (char *)t->child[0]->child[0]->attr.name);
                                }
                                else{
                                    emitRM((char *)"LDA", 3, t->child[0]->child[0]->offset, 1, (char *)("Load base of array addr"), (char *)t->child[0]->child[0]->attr.name);
                                }

                                pushLeft();
                                loffset--;
                                genParse(t->child[0]->child[1]);
                                loffset++;
                                emitRM((char *)"LD", 4, loffset, 1, (char *)("Pop Left #1"));
                                emitRO((char *)"SUB", 3, 4, 4, (char *)("Get location from index"));
                                emitRM((char *)"LD", 3, 0, 3, (char *)("Load array element"));
                                pushLeft();
                                loffset--;

                                // child 2
                                if(t->child[1]->child[0]->memKind == Global){
                                    emitRM((char *)"LDA", 3, t->child[1]->child[0]->offset, 0, (char *)("Load base of array addr"), (char *)t->child[1]->child[0]->attr.name);
                                }
                                else if(t->child[1]->child[0]->memKind == Parameter){
                                    emitRM((char *)"LD", 3, t->child[1]->child[0]->offset, 1, (char *)("Load base of array addr"), (char *)t->child[1]->child[0]->attr.name);
                                }
                                else{
                                    emitRM((char *)"LDA", 3, t->child[1]->child[0]->offset, 1, (char *)("Load base of array addr"), (char *)t->child[1]->child[0]->attr.name);
                                }

                                pushLeft();
                                loffset--;
                                genParse(t->child[1]->child[1]);
                                loffset++;
                                emitRM((char *)"LD", 4, loffset, 1, (char *)("Pop Left #2"));
                                emitRO((char *)"SUB", 3, 4, 4, (char *)("Get location from index"));
                                emitRM((char *)"LD", 3, 0, 3, (char *)("Load array element"));
                                pushLeft();
                                loffset++;
                                emitRM((char *)"LD", 4, loffset, 1, (char *)("Pop Left #3"));

                                // check the ops
                                if(!strcmp(t->attr.name, "+")){
                                    emitRO((char *)"ADD", 3, 4, 4, (char *)("Op"), (char *)t->attr.name);
                                }
                                else if(!strcmp(t->attr.name, "-")){
                                    emitRO((char *)"SUB", 3, 4, 4, (char *)("Op"), (char *)t->attr.name);
                                }
                                else if(!strcmp(t->attr.name, "*")){
                                    emitRO((char *)"MUL", 3, 4, 4, (char *)("Op"), (char *)t->attr.name);
                                }
                                else if(!strcmp(t->attr.name, "/")){
                                    emitRO((char *)"DIV", 3, 4, 4, (char *)("Op"), (char *)t->attr.name);
                                }
                                else if(!strcmp(t->attr.name, "%")){
                                    emitRO((char *)"MOD", 3, 4, 4, (char *)("Op"), (char *)t->attr.name);
                                }
                                else if(!strcmp(t->attr.name, "+=")){
                                    emitRO((char *)"PEQ", 3, 4, 4, (char *)("Op"), (char *)t->attr.name);
                                }
                                else if(!strcmp(t->attr.name, "-=")){
                                    emitRO((char *)"SEQ", 3, 4, 4, (char *)("Op"), (char *)t->attr.name);
                                }
                                else if(!strcmp(t->attr.name, "*=")){
                                    emitRO((char *)"MEQ", 3, 4, 4, (char *)("Op"), (char *)t->attr.name);
                                }
                                else if(!strcmp(t->attr.name, "/=")){
                                    emitRO((char *)"DEQ", 3, 4, 4, (char *)("Op"), (char *)t->attr.name);
                                }
                                else if(!strcmp(t->attr.name, ">")){
                                    emitRO((char *)"TGT", 3, 4, 4, (char *)("Op"), (char *)t->attr.name);
                                }
                                else if(!strcmp(t->attr.name, "<")){
                                    emitRO((char *)"TLT", 3, 4, 4, (char *)("Op"), (char *)t->attr.name);
                                }
                                else if(!strcmp(t->attr.name, ">=")){
                                    emitRO((char *)"TGE", 3, 4, 4, (char *)("Op"), (char *)t->attr.name);
                                }
                                else if(!strcmp(t->attr.name, "<=")){
                                    emitRO((char *)"TLE", 3, 4, 4, (char *)("Op"), (char *)t->attr.name);
                                }
                                else if(!strcmp(t->attr.name, "==")){
                                    emitRO((char *)"TEQ", 3, 4, 4, (char *)("Op"), (char *)t->attr.name);
                                }
                                else if(!strcmp(t->attr.name, "!=")){
                                    emitRO((char *)"TNE", 3, 4, 4, (char *)("Op"), (char *)t->attr.name);
                                }
                                else if(!strcmp(t->attr.name, "and")){
                                    emitRO((char *)"AND", 3, 4, 4, (char *)("Op"), (char *)t->attr.name);
                                }
                                else if(!strcmp(t->attr.name, "or")){
                                    emitRO((char *)"OR", 3, 4, 4, (char *)("Op"), (char *)t->attr.name);
                                }
                            }

                            if(!strcmp(t->attr.name, "[")){
                                emitRM((char *)"SUB", 3, 4, 3, (char *)("Get location from index"));
                                emitRM((char *)"LD", 3, 0, 3, (char *)("Load array element"));
                                loffset++;
                            }
                        }
                        // not an array
                        else{
                            storeInMem = false;
                            genParse(t->child[0]);
                            pushLeft();
                            loffset--;
                            genParse(t->child[1]);
                            loffset--;
                            emitRM((char *)"LD", 4, loffset, 1, (char *)("Pop left #4"));

                            // check the ops
                            if(!strcmp(t->attr.name, "+")){
                                emitRO((char *)"ADD", 3, 4, 4, (char *)("Op"), (char *)t->attr.name);
                            }
                            else if(!strcmp(t->attr.name, "-")){
                                emitRO((char *)"SUB", 3, 4, 4, (char *)("Op"), (char *)t->attr.name);
                            }
                            else if(!strcmp(t->attr.name, "*")){
                                emitRO((char *)"MUL", 3, 4, 4, (char *)("Op"), (char *)t->attr.name);
                            }
                            else if(!strcmp(t->attr.name, "/")){
                                emitRO((char *)"DIV", 3, 4, 4, (char *)("Op"), (char *)t->attr.name);
                            }
                            else if(!strcmp(t->attr.name, "%")){
                                emitRO((char *)"MOD", 3, 4, 4, (char *)("Op"), (char *)t->attr.name);
                            }
                            else if(!strcmp(t->attr.name, "+=")){
                                emitRO((char *)"PEQ", 3, 4, 4, (char *)("Op"), (char *)t->attr.name);
                            }
                            else if(!strcmp(t->attr.name, "-=")){
                                emitRO((char *)"SEQ", 3, 4, 4, (char *)("Op"), (char *)t->attr.name);
                            }
                            else if(!strcmp(t->attr.name, "*=")){
                                emitRO((char *)"MEQ", 3, 4, 4, (char *)("Op"), (char *)t->attr.name);
                            }
                            else if(!strcmp(t->attr.name, "/=")){
                                emitRO((char *)"DEQ", 3, 4, 4, (char *)("Op"), (char *)t->attr.name);
                            }
                            else if(!strcmp(t->attr.name, ">")){
                                emitRO((char *)"TGT", 3, 4, 4, (char *)("Op"), (char *)t->attr.name);
                            }
                            else if(!strcmp(t->attr.name, "<")){
                                emitRO((char *)"TLT", 3, 4, 4, (char *)("Op"), (char *)t->attr.name);
                            }
                            else if(!strcmp(t->attr.name, ">=")){
                                emitRO((char *)"TGE", 3, 4, 4, (char *)("Op"), (char *)t->attr.name);
                            }
                            else if(!strcmp(t->attr.name, "<=")){
                                emitRO((char *)"TLE", 3, 4, 4, (char *)("Op"), (char *)t->attr.name);
                            }
                            else if(!strcmp(t->attr.name, "==")){
                                emitRO((char *)"TEQ", 3, 4, 4, (char *)("Op"), (char *)t->attr.name);
                            }
                            else if(!strcmp(t->attr.name, "!=")){
                                emitRO((char *)"TNE", 3, 4, 4, (char *)("Op"), (char *)t->attr.name);
                            }
                            else if(!strcmp(t->attr.name, "and")){
                                emitRO((char *)"AND", 3, 4, 4, (char *)("Op"), (char *)t->attr.name);
                            }
                            else if(!strcmp(t->attr.name, "or")){
                                emitRO((char *)"OR", 3, 4, 4, (char *)("Op"), (char *)t->attr.name);
                            }
                            else if(!strcmp(t->attr.name, "[")){
                                emitRM((char *)"SUB", 3, 4, 3, (char *)("Get location from index"));
                                emitRM((char *)"LD", 3, 0, 3, (char *)("Load array element"));
                                loffset++;
                            }
                        }
                    }
                }
                emitComment((char *)("ENBD OP"));
                break;
            }

        case AssignK:
        {
            emitComment((char *)("START ASSIGN"));
            TreeNode *lookup = (TreeNode *)st.lookup(t->attr.name);

            if(!strcmp(t->attr.name, "=")){
                if(strcmp(t->child[0]->attr.name, "[")){
                    genParse(t->child[1]);
                    storeInMem = true;
                    genParse(t->child[0]);
                    t->isBinary = false;
                }
                else{
                    genParse(t->child[0]->child[1]);
                    emitRM((char *)"ST", 3, loffset, 1, (char *)("Push index on"));
                    loffset--;
                    genParse(t->child[1]);
                    loffset++;
                    emitRM((char *)"LD", 4, loffset, 1, (char *)("Pop index off"));

                    if(t->child[0]->child[0]->memKind == Global){
                        emitRM((char *)"LDA", 5, t->child[0]->child[0]->offset, 0, (char *)("Load base of array addr"), (char *)t->child[0]->child[0]->attr.name);
                    }
                    else{
                        emitRM((char *)"LDA", 5, t->child[0]->child[0]->offset, 1, (char *)("Load base of array addr"), (char *)t->child[0]->child[0]->attr.name);
                    }

                    emitRO((char *)"SUB", 5, 5, 4, (char *)("Get value offset"));
                    emitRM((char *)"ST", 3, 0, 5, (char *)("Store var"), (char *)t->child[0]->child[0]->attr.name);
                }
            }
            else if(!t->child[1]){
                storeInMem = false;
                t->isBinary = false;
                
                genParse(t->child[0]);
                if(!strcmp(t->attr.name, "++")){
                    emitRM((char *)"LDA", 3, 1, 3, (char *)("Increment ++"), (char *)t->child[0]->attr.name);
                }
                else if(!strcmp(t->attr.name, "--")){
                    emitRM((char *)"LDA", 3, -1, 3, (char *)("Decrement --"), (char *)t->child[0]->attr.name);
                }

                emitRM((char *)"ST", 3 ,t->child[0]->offset, 1, (char *)("Store var"), (char *)t->child[0]->attr.name);
            }
            else{
                storeInMem = false;

                genParse(t->child[1]);
                t->isBinary = true;
                genParse(t->child[0]);

                if(!strcmp(t->attr.name, "+=")){
                    emitRO((char *)"ADD", 3, 4, 3, (char *)("op"), (char *)t->attr.name);
                }
                else if(!strcmp(t->attr.name, "-=")){
                    emitRO((char *)"SUB", 3, 4, 3, (char *)("op"), (char *)t->attr.name);
                }
                else if(!strcmp(t->attr.name, "*=")){
                    emitRO((char *)"MUL", 3, 4, 3, (char *)("op"), (char *)t->attr.name);
                }
                else if(!strcmp(t->attr.name, "/=")){
                    emitRO((char *)"DIV", 3, 4, 3, (char *)("op"), (char *)t->attr.name);
                }

                if(t->child[0]->memKind = Global){
                    emitRM((char *)"ST", 3, t->child[0]->offset, 0, (char *)("Store var"), (char *)t->child[0]->attr.name);
                }
                else{
                    emitRM((char *)"ST", 3, t->child[0]->offset, 1, (char *)("Store var"), (char *)t->child[0]->attr.name);
                }

                t->isBinary = false;
            }

            emitComment((char *)("END ASSIGN"));
            break;
        }
            
        case ConstantK:
        {
            emitComment((char *)("START CONSTANT"));
            if(t->expType == Boolean){
                emitRM((char *)"LDC", 3, t->attr.value, 6,(char *)"Load bool const");
            }
            else if(t->expType == Char){
                emitRM((char *)"LDC", 3, t->attr.value, 6,(char *)"Load char const");
            }
            else if(t->expType == Integer){
                emitRM((char *)"LDC", 3, t->attr.value, 6,(char *)"Load int const");
            }
            emitComment((char *)("END CONSTANT"));
            break;
        }

        case IdK:
        {
            emitComment((char *)("START ID"));
            // check if anything set to store in memory
            if(storeInMem){
                if(t->memKind == Global){
                    if(!t->isArray){
                        storeInMem = false;
                        emitRM((char *)"ST", 3, t->offset, 0, (char *)("Store var"), (char *)t->attr.name);
                    }
                }
                else if(t->memKind == Local){
                    if(t->isArray){
                        storeInMem = false;
                        emitRM((char *)"ST", 3, t->offset, 1, (char *)("Store var"), (char *)t->attr.name);
                    }
                }
                else if(t->memKind == LocalStatic){
                    if(t->isArray){
                        storeInMem = false;
                        emitRM((char *)"ST", 3, t->offset, 0, (char *)("Store var"), (char *)t->attr.name);
                    }
                }
            }
            // not store in memory
            else{
                if(t->memKind == Global){
                    if(!t->isBinary){
                        if(t->isArray){
                            emitRM((char *)"LD", 3, t->offset, 0, (char *)("Load base of array addr"), (char *)t->attr.name);
                            loffset--;
                        }
                        else{
                            emitRM((char *)"LD", 3, t->offset, 0, (char *)("Load var"), (char *)t->attr.name);
                        }
                    }
                    else{
                        emitRM((char *)"LD", 4, t->offset, 0, (char *)("Load LHS var"), (char *)t->attr.name);
                    }
                }
                else if(t->memKind == Local){
                    if(!t->isBinary){
                        if(t->isArray){
                            emitRM((char *)"LD", 3, t->offset, 1, (char *)("Load base of array addr"), (char *)t->attr.name);
                            loffset--;
                        }
                        else{
                            emitRM((char *)"LD", 3, t->offset, 1, (char *)("Load var"), (char *)t->attr.name);
                        }
                    }
                    else{
                        emitRM((char *)"LD", 4, t->offset, 1, (char *)("Load LHS var"), (char *)t->attr.name);
                    }
                }
                else if(t->memKind == Parameter){
                    if(!t->isBinary){
                        if(t->isArray){
                            emitRM((char *)"LD", 3, t->offset, 1, (char *)("Load base of array addr"), (char *)t->attr.name);
                            loffset--;
                        }
                        else{
                            emitRM((char *)"LD", 3, t->offset, 1, (char *)("Load var"), (char *)t->attr.name);
                        }
                    }
                    else{
                        emitRM((char *)"LD", 4, t->offset, 1, (char *)("Load LHS var"), (char *)t->attr.name);
                    }
                }
                else if(t->memKind == LocalStatic){
                    if(!t->isBinary){
                        if(t->isArray){
                            emitRM((char *)"LD", 3, t->offset, 0, (char *)("Load base of array addr"), (char *)t->attr.name);
                            loffset--;
                        }
                        else{
                            emitRM((char *)"LD", 3, t->offset, 0, (char *)("Load var"), (char *)t->attr.name);
                        }
                    }
                    else{
                        emitRM((char *)"LD", 4, t->offset, 0, (char *)("Load LHS var"), (char *)t->attr.name);
                    }
                }
            }
            emitComment((char *)("END ID"));
            break;
        }

        case CallK:
        {
            emitComment((char *)("START CALL"));

            int numParams = 1;
            int tempOff = 0;

            TreeNode *lookup = (TreeNode *)st.lookup(t->attr.name);
            tempOff = loffset;

            while(lookup->sibling){
                lookup = lookup->sibling;
                numParams++;
            }

            // there are no params
            if(!t->child[0]){
                emitRM((char *)"ST", 1, loffset, 1, (char *)("Store fp"), (char *)t->attr.name);
                emitRM((char *)"LDA", 1, loffset, 1, (char *)("Load fp"));
            }
            // params exists
            else{
                if(numParams == 1){
                    emitComment((char *)("START Param 1"));
                    emitRM((char *)"ST", 1, loffset, 1, (char *)("Store fp"), (char *)t->attr.name);
                    loffset -= 2;
                    genParse(t->child[0]);
                    if(!t->child[0]->isArray){
                        loffset  -= numParams;
                    }

                    pushLeft();
                    emitRM((char *)"LDA", 1, tempOff, 1, (char *)("Load fp"));
                    emitComment((char *)("END Param 1"));
                }
                // more than 1 param in call
                else{
                    emitRM((char *)"ST", 1, loffset, 1, (char *)("Store fp"), (char *)t->attr.name);
                    TreeNode *LUChild = t->child[0];
                    loffset--;

                    while(LUChild){
                        emitComment((char *)("START Param"));
                        loffset--;

                        if(LUChild->isArray){
                            if(LUChild->memKind == Global){
                                emitRM((char *)"LDA", 3, LUChild->offset, 0, (char *)("Load base of array addr"), (char *)LUChild->attr.name);
                            }
                            else{
                                emitRM((char *)"LDA", 3, LUChild->offset, 1, (char *)("Load base of array addr"), (char *)LUChild->attr.name);
                            }

                            pushLeft();
                        }
                        else{
                            if(LUChild->expType == Boolean){
                                emitRM((char *)"LDC", 3, t->attr.value, 6,(char *)("Load bool const"));
                            }
                            else if(LUChild->expType == Char){
                                emitRM((char *)"LDC", 3, t->attr.value, 6,(char *)("Load char const"));
                            }
                            else if(LUChild->expType == Integer){
                                emitRM((char *)"LDC", 3, t->attr.value, 6,(char *)("Load int const"));
                            }

                            pushLeft();
                        }

                        LUChild = LUChild->sibling;
                        emitComment((char *)("END Param"));
                    }

                    emitRM((char *)"LDA", 1, tempOff, 1, (char *)("Load fp"));
                }
            }

            //back patch
            int bp = emitSkip(0);

            lookup = (TreeNode *)st.lookup(t->attr.name);
            emitRM((char *)"LDA", 3, 1, 7, (char *)("Load return addr"));
            emitRM((char *)"JMP", 7, lookup->codeGenLineNum - bp - 1, 7, (char *)("CALL"), t->attr.name);
            emitRM((char *)"LDA", 3, 0, 2, (char *)("Store"));

            emitComment((char *)("END CALL"));
            loffset = tempOff;

            break;
        }
    }
}

void pushLeft(){
    emitRM((char *)"ST", 3, loffset, 1, (char *)("Push left side"));
}

void genMainFunc(TreeNode *t){

    TreeNode *lookup;
    //set backpatch and look for main
    int bp = emitSkip(0)-1;
    emitNewLoc(0);
    lookup = (TreeNode *)st.lookup("main");

    emitRM((char *)"JMP", 7, bp, 7, (char *)("Jump to init"));
    emitComment((char *)("START INIT"));
    emitSkip(bp);

    emitRM((char *)"LDA", 1, goffset, 0, (char *)("Set first frame after globals"));
    emitRM((char *)"ST", 1, 0, 1, (char *)("Store old fp"));    
    genGlobAndStatics(t);

    emitRM((char *)"LDA", 3, 1, 7, (char *)("Load return address"));
    bp = emitSkip(0);
    emitRM((char*)"JMP", 7, lookup->offset - bp - 1, 7, (char *)("Jump to main"));
    emitRO((char *)"HALT", 0, 0, 0, (char *)("DONE"));
    emitComment((char *)("END INIT"));
}

void genGlobAndStatics(TreeNode *t){
    emitComment((char *)("START INIT GLOBALS AND STATICS"));

    if(!t){
        return;
    }
    else{
        if(t->subkind.decl == VarK){
            if(t->memKind == Global){
                if(t->isArray){
                    emitRM((char *)"LDC", 3, t->memSize - 1, 6, (char *)("Load array size"), (char *)t->attr.name);
                    emitRM((char *)"ST", 3, t->offset + 1, 0, (char *)("Store array size"), (char *)t->attr.name);
                }
            }
        }
    }

    if(t->sibling){
        genGlobAndStatics(t->sibling);
    }
    emitComment((char *)("END INIT GLOBALS AND STATICS"));
}

void initIO(){
    TreeNode *tempLU;

    //INPUT Int
    tempLU = (TreeNode *)st.lookup("input");
    tempLU->offset = emitSkip(0) - 1;

    emitComment((char *)("START FUNC INPUT"));
    emitRM((char *)"ST", 3, -1, 1, (char *)"Store return addr");
    emitRO((char *)"IN", 2, 2, 2, (char *)"Get int input");
    emitRM((char *)"LD", 3, -1, 1, (char *)"Load return addr");
    emitRM((char *)"LD", 1, 0, 1, (char *)"Adjust fp");
    emitRM((char *)"JMP", 7, 0, 3, (char *)"Return");
    emitComment((char *)"END FUNC INPUT");
    emitComment((char *)"");
    emitComment((char *)"** ** ** ** ** ** ** ** ** ** ** **");

    //INPUT Bool
    tempLU = (TreeNode *)st.lookup("inputb");
    tempLU->offset = emitSkip(0) - 1;

    emitComment((char *)("START FUNC INPUTB"));
    emitRM((char *)"ST", 3, -1, 1, (char *)"Store return addr");
    emitRO((char *)"IN", 2, 2, 2, (char *)"Get bool input");
    emitRM((char *)"LD", 3, -1, 1, (char *)"Load return addr");
    emitRM((char *)"LD", 1, 0, 1, (char *)"Adjust fp");
    emitRM((char *)"JMP", 7, 0, 3, (char *)"Return");
    emitComment((char *)"END FUNC INPUTB");
    emitComment((char *)"");
    emitComment((char *)"** ** ** ** ** ** ** ** ** ** ** **");

    //INPUT Char
    tempLU = (TreeNode *)st.lookup("inputc");
    tempLU->offset = emitSkip(0) - 1;

    emitComment((char *)("START FUNC INPUTC"));
    emitRM((char *)"ST", 3, -1, 1, (char *)"Store return addr");
    emitRO((char *)"IN", 2, 2, 2, (char *)"Get char input");
    emitRM((char *)"LD", 3, -1, 1, (char *)"Load return addr");
    emitRM((char *)"LD", 1, 0, 1, (char *)"Adjust fp");
    emitRM((char *)"JMP", 7, 0, 3, (char *)"Return");
    emitComment((char *)"END FUNC INPUTC");
    emitComment((char *)"");
    emitComment((char *)"** ** ** ** ** ** ** ** ** ** ** **");


    //OUTPUT Int
    tempLU = (TreeNode *)st.lookup("output");
    tempLU->offset = emitSkip(0) - 1;

    emitComment((char *)("START FUNC OUTPUT"));
    emitRM((char *)"ST", 3, -1, 1, (char *)"Store return addr");
    emitRM((char *)"LD", 3, -2, 1, (char *)"Load return addr");
    emitRO((char *)"OUT", 3, 3, 3, (char *)"Output int");
    emitRM((char *)"LD", 3, -1, 1, (char *)"Load return addr");
    emitRM((char *)"LD", 1, 0, 1, (char *)"Adjust fp");
    emitRM((char *)"JMP", 7, 0, 3, (char *)"Return");
    emitComment((char *)"END FUNC OUTPUT");
    emitComment((char *)"");
    emitComment((char *)"** ** ** ** ** ** ** ** ** ** ** **");

    //OUTPUT Bool
    tempLU = (TreeNode *)st.lookup("outputb");
    tempLU->offset = emitSkip(0) - 1;

    emitComment((char *)("START FUNC OUTPUTB"));
    emitRM((char *)"ST", 3, -1, 1, (char *)"Store return addr");
    emitRM((char *)"LD", 3, -2, 1, (char *)"Load return addr");
    emitRO((char *)"OUT", 3, 3, 3, (char *)"Output int");
    emitRM((char *)"LD", 3, -1, 1, (char *)"Load return addr");
    emitRM((char *)"LD", 1, 0, 1, (char *)"Adjust fp");
    emitRM((char *)"JMP", 7, 0, 3, (char *)"Return");
    emitComment((char *)"END FUNC OUTPUTB");
    emitComment((char *)"");
    emitComment((char *)"** ** ** ** ** ** ** ** ** ** ** **");

    //OUTPUT Char
    tempLU = (TreeNode *)st.lookup("outputc");
    tempLU->offset = emitSkip(0) - 1;

    emitComment((char *)("START FUNC OUTPUTC"));
    emitRM((char *)"ST", 3, -1, 1, (char *)"Store return addr");
    emitRM((char *)"LD", 3, -2, 1, (char *)"Load return addr");
    emitRO((char *)"OUT", 3, 3, 3, (char *)"Output int");
    emitRM((char *)"LD", 3, -1, 1, (char *)"Load return addr");
    emitRM((char *)"LD", 1, 0, 1, (char *)"Adjust fp");
    emitRM((char *)"JMP", 7, 0, 3, (char *)"Return");
    emitComment((char *)"END FUNC OUTPUTC");
    emitComment((char *)"");
    emitComment((char *)"** ** ** ** ** ** ** ** ** ** ** **");
}