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
bool isBinary = false;

FILE *code;

void codeGen(char *outputFile, TreeNode *t){
    
    char *temp = t->attr.name;
    //open file to write
    code = fopen(outputFile, "w");
    // custom header
    emitComment((char *)("================================================="));
    emitComment((char *)("C- compiler version C-S22"));
    emitComment((char *)("Built: Apr 17 - May 8"));
    emitComment((char *)("Author: Keller Lawson"));
    emitComment((char *)("File Compiled: "),(char*) outputFile);
    emitComment((char *)("================================================="));
    emitComment((char *)(""));
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
        if(t->sibling && t->sibling->memKind != Parameter ){
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
                {   
                    if(t->child[0]){
                        if(t->memKind == Local){
                            genParse(t->child[0]);
                            emitRM((char *)"ST", 3, loffset + 1, 1, (char *)("Store Var"), (char *)t->attr.name);
                        }                        
                    }

                    
                    break;
                }

            case FuncK:
                {
                    t->codeGenLineNum = emitSkip(0) -1;
                    emitComment((char *)("FuncK"), (char *)t->attr.name);

                    TreeNode *LUChild = t->child[0];
                    
                    int numParams = 0;
                    while(LUChild){
                        LUChild = LUChild->sibling;
                        numParams++;
                    }

                    loffset -= numParams;
                    emitComment((char *)("LOFF Line96:"), loffset);
                    emitRM((char *)"ST", 3, -1, 1, (char *)"Store return addr");
                    for(int i = 0; i < MAXCHILDREN; i++){
                        if(t->child[i]){
                            genParse(t->child[i]);
                        }
                    }

                    emitRM((char *)"LDC", 2, 0, 6, (char *)"Set return value to 0");
                    emitRM((char *)"LD", 3, -1, 1, (char *)"Load return address");
                    emitRM((char *)"LD", 1, 0, 1, (char *)"Adjust fp");
                    emitRM((char *)"JMP", 7, 0, 3, (char *)"return");
                    emitComment((char *)("End of Function"), (char *)t->attr.name);
                    emitComment((char *)(""));
                    emitComment((char *)("========================================================="));
                    break;
                }

            case ParamK:
                {
                    for(int i = 0; i < MAXCHILDREN; i++){
                        genParse(t->child[i]);
                    }
                    break;
                }
        }
    }
}

void codeGenStmt(TreeNode *t){
    switch(t->subkind.stmt){
        case IfK:
            {
                int thenLineNum = 0;
                int elseLineNum = 0;
                
                if(!t->child[2]){
                    emitComment((char *)("START IF"));
                    genParse(t->child[0]);
                    thenLineNum = emitSkip(1);
                    emitComment((char *)("THEN"));
                    genParse(t->child[1]);

                    backPatchAJumpToHere((char *)("JZR"), 3, thenLineNum, (char *)("Jump around THEN if false [backpatch]"));

                    emitComment((char *)("END IF"));
                }
                else{
                    emitComment((char *)("START IF"));
                    genParse(t->child[0]);
                    thenLineNum = emitSkip(1);
                    emitComment((char *)("THEN"));
                    genParse(t->child[1]);
                    elseLineNum = emitSkip(1);

                    backPatchAJumpToHere((char *)("JZR"), 3, thenLineNum, (char *)("Jump around THEN if false [backpatch]"));

                    emitComment((char *)("ELSE"));
                    genParse(t->child[2]);
                    backPatchAJumpToHere((char *)("JMP"), 3, elseLineNum, (char *)("Jump around ELSE [backpatch]"));

                    emitComment((char *)("END IF"));
                }
                
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
                emitComment((char *)("COMPOUND"));
                loffset = t->memSize;
                emitComment((char *)("LOFF Line188:"), loffset);

                emitComment((char *)("START COMPOUND BODY"));
                for(int i = 0; i < MAXCHILDREN; i++){

                    genParse(t->child[i]);
                }
                emitComment((char *)("END COMPOUND BODY"));

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
                emitComment((char *)("START OP "), (char *)t->attr.name);
                
                //unary check
                if(!t->child[1]){
                    genParse(t->child[0]);

                    if(!strcmp(t->attr.name, "*")){
                        /*
                        if(t->memKind == Global){
                            emitRM((char *)"LDA", 3, t->child[0]->offset, 0, (char *)("Load address of base of array 270"), (char *)t->child[0]->attr.name);
                        }
                        else if(t->memKind == Parameter){
                            emitRM((char *)"LD", 3, t->child[0]->offset, 1, (char *)("Load address of base of array 273"), (char *)t->child[0]->attr.name);
                        }
                        else{
                            emitRM((char *)"LDA", 3, t->child[0]->offset, 1, (char *)("Load address of base of array 276"), (char *)t->child[0]->attr.name);
                        }
                        */

                        emitRM((char *)"LD", 3, 1, 3, (char *)("Load array size"));
                    }
                    else if(!strcmp(t->attr.name, "-")){
                        emitRO((char *)"NEG", 3, 3, 3, (char *)("Unary Op"), (char *)t->attr.name);
                    }
                    else if(!strcmp(t->attr.name, "?")){
                        emitRO((char *)"RND", 3, 3, 6, (char *)("Unary Op"), (char *)t->attr.name);
                    }
                    else if(!strcmp(t->attr.name, "not") || (!strcmp(t->attr.name, "NOT"))){
                        emitRM((char *)"LDC",4,1,6,(char *)("Load 1"));
                        emitRO((char *)"XOR",3,3,4,(char *)("Op XOR for logical not"));
                    }
                }
                // else if for binary
                else{
                    if(t->child[0] && t->child[1]){

                        genParse(t->child[0]);
                        int tempOff = loffset;
                        emitRM((char *)"ST", 3, loffset, 1, (char *)("Push left side1"));
                        loffset--;
                        emitComment((char *)("LOFF Line 289:"), loffset);
                        genParse(t->child[1]);
                        loffset++;
                        emitComment((char *)("LOFF Line 292:"), loffset);
                        emitRM((char *)"LD", 4 , loffset, 1, (char *)("Pop left into acl 1"));

                        if (!strcmp(t->attr.name, "[")){

                            //emitRM((char *)"LD", 4 , loffset, 1, (char *)("Pop left into acl 1"));
                            emitRO((char *)"SUB", 3, 4, 3, (char *)("compute location from index"));
                            emitRM((char *)"LD", 3, 0, 3, (char *)("Load array element"));
                            //loffset++;
                            //emitComment((char *)("LOFF Line 296:"), loffset);
                        }
                            
                        // check the ops
                        else if(!strcmp(t->attr.name, "+")){
                            emitRO((char *)"ADD", 3, 4, 3, (char *)("Op"), (char *)t->attr.name);
                        }
                        else if(!strcmp(t->attr.name, "-")){
                            emitRO((char *)"SUB", 3, 4, 3, (char *)("Op"), (char *)t->attr.name);
                        }
                        else if(!strcmp(t->attr.name, "*")){
                            emitRO((char *)"MUL", 3, 4, 3, (char *)("Op"), (char *)t->attr.name);
                        }
                        else if(!strcmp(t->attr.name, "/")){
                            emitRO((char *)"DIV", 3, 4, 3, (char *)("Op"), (char *)t->attr.name);
                        }
                        else if(!strcmp(t->attr.name, "%")){
                            emitRO((char *)"MOD", 3, 4, 3, (char *)("Op"), (char *)t->attr.name);
                        }
                        else if(!strcmp(t->attr.name, "+=")){
                            emitRO((char *)"ADD", 3, 4, 3, (char *)("Op"), (char *)t->attr.name);
                        }
                        else if(!strcmp(t->attr.name, "-=")){
                            emitRO((char *)"SUB", 3, 4, 3, (char *)("Op"), (char *)t->attr.name);
                        }
                        else if(!strcmp(t->attr.name, "*=")){
                            emitRO((char *)"MUL", 3, 4, 3, (char *)("Op"), (char *)t->attr.name);
                        }
                        else if(!strcmp(t->attr.name, "/=")){
                            emitRO((char *)"DIV", 3, 4, 3, (char *)("Op"), (char *)t->attr.name);
                        }
                        else if(!strcmp(t->attr.name, ">")){
                            emitRO((char *)"TGT", 3, 4, 3, (char *)("Op"), (char *)t->attr.name);
                        }
                        else if(!strcmp(t->attr.name, "<")){
                            emitRO((char *)"TLT", 3, 4, 3, (char *)("Op"), (char *)t->attr.name);
                        }
                        else if(!strcmp(t->attr.name, ">=")){
                            emitRO((char *)"TGE", 3, 4, 3, (char *)("Op"), (char *)t->attr.name);
                        }
                        else if(!strcmp(t->attr.name, "<=")){
                            emitRO((char *)"TLE", 3, 4, 3, (char *)("Op"), (char *)t->attr.name);
                        }
                        else if(!strcmp(t->attr.name, "=")){
                            emitRO((char *)"TEQ", 3, 4, 3, (char *)("Op"), (char *)t->attr.name);
                        }
                        else if(!strcmp(t->attr.name, "!=")){
                            emitRO((char *)"TNE", 3, 4, 3, (char *)("Op"), (char *)t->attr.name);
                        }
                        else if(!strcmp(t->attr.name, "and") || (!strcmp(t->attr.name, "AND"))){
                            emitRO((char *)"AND", 3, 4, 3, (char *)("Op"), (char *)t->attr.name);
                        }
                        else if(!strcmp(t->attr.name, "or") || (!strcmp(t->attr.name, "OR"))){
                            emitRO((char *)"OR", 3, 4, 3, (char *)("Op"), (char *)t->attr.name);
                        }
                        //loffset = tempOff;
                    }
                }
                emitComment((char *)("END OP "), (char *)t->attr.name);
                
                break;
            }

        case AssignK:
        {
            emitComment((char *)("START ASSIGN"));
            TreeNode *lookup = (TreeNode *)st.lookup(t->attr.name);

            if(!strcmp(t->attr.name, "<-")){
                if(!strcmp(t->child[0]->attr.name, "[")){
                    genParse(t->child[0]->child[1]);
                    emitRM((char *)"ST", 3, loffset, 1, (char *)("Push index on"));
                    loffset--;
                    emitComment((char *)("LOFF Line 478:"), loffset);
                    genParse(t->child[1]);
                    loffset++;
                    emitComment((char *)("LOFF Line 481:"), loffset);
                    emitRM((char *)"LD", 4, loffset, 1, (char *)("Pop index off"));

                    if(t->child[0]->child[0]->memKind == Global){
                        emitRM((char *)"LDA", 5, t->child[0]->child[0]->offset, 0, (char *)("Load address of base of array 392"), (char *)t->child[0]->child[0]->attr.name);
                    }
                    else if(t->child[0]->child[0]->memKind == Parameter){
                        emitRM((char *)"LD", 5, t->child[0]->child[0]->offset, 1, (char *)("Load address of base of array 395"), (char *)t->child[0]->child[0]->attr.name);
                    }
                    else{
                        emitRM((char *)"LDA", 5, t->child[0]->child[0]->offset, 1, (char *)("Load address of base of array 398"), (char *)t->child[0]->child[0]->attr.name);
                    }

                    emitRO((char *)"SUB", 5, 5, 4, (char *)("Compute offset of value"));
                    emitRM((char *)"ST", 3, 0, 5, (char *)("Store var"), (char *)t->child[0]->child[0]->attr.name);
                }
                else{
                    genParse(t->child[1]);
                    storeInMem = true;
                    genParse(t->child[0]);
                    isBinary = false;
                }
                
            }
            else if(!t->child[1]){
                storeInMem = false;
                isBinary = false;

                if(!strcmp(t->child[0]->attr.name, "[")){
                    genParse(t->child[0]->child[1]);

                    if(t->child[0]->child[0]->memKind == Global){
                        emitRM((char *)"LDA", 5, t->child[0]->child[0]->offset, 0, (char *)("Load address of base of array 406"), (char *)t->child[0]->child[0]->attr.name);
                    }
                    else if(t->child[0]->child[0]->memKind == Parameter){
                        emitRM((char *)"LD", 5, t->child[0]->child[0]->offset, 1, (char *)("Load address of base of array 406"), (char *)t->child[0]->child[0]->attr.name);
                    }
                    else{
                        emitRM((char *)"LDA", 5, t->child[0]->child[0]->offset, 1, (char *)("Load address of base of array 406"), (char *)t->child[0]->child[0]->attr.name);
                    }
                    emitRO((char *)"SUB", 5, 5, 3, (char *)("Compute offset of value"));
                    emitRM((char *)"LD", 3, 0, 5, (char *)("Load lhs variable 435"), (char *)t->child[0]->child[0]->attr.name);

                    if(!strcmp(t->attr.name, "++")){
                        emitRM((char *)"LDA", 3, 1, 3, (char *)("Increment ++"), (char *)t->child[0]->child[0]->attr.name);
                    }
                    else if(!strcmp(t->attr.name, "--")){
                        emitRM((char *)"LDA", 3, -1, 3, (char *)("Decrement --"), (char *)t->child[0]->child[0]->attr.name);
                    }

                    emitRM((char *)"ST", 3, 0, 5, (char *)("Store var"), (char *)t->child[0]->child[0]->attr.name);
                }
                else{

                    genParse(t->child[0]);
                    if(!strcmp(t->attr.name, "++")){
                        emitRM((char *)"LDA", 3, 1, 3, (char *)("Increment ++"), (char *)t->child[0]->attr.name);
                    }
                    else if(!strcmp(t->attr.name, "--")){
                        emitRM((char *)"LDA", 3, -1, 3, (char *)("Decrement --"), (char *)t->child[0]->attr.name);
                    }

                    emitRM((char *)"ST", 3 ,t->child[0]->offset, 1, (char *)("Store var"), (char *)t->child[0]->attr.name);
                }
            }
            else{
                storeInMem = false;
                isBinary = true;

                //constant on right
                if(t->child[1]->subkind.exp == ConstantK){
                    if(t->child[0]->subkind.exp == OpK){
                        if(!strcmp(t->child[0]->attr.name, "[")){
                            genParse(t->child[0]->child[1]);

                            emitRM((char *)"ST", 3, loffset, 1, (char *)("Push index on"));
                            loffset--;
                            emitComment((char *)("LOFF Line 465:"), loffset);

                            // parse child 1
                            genParse(t->child[1]);
                            loffset++;    
                            emitComment((char *)("LOFF Line 470:"), loffset); 

                            emitRM((char *)"LD", 4, loffset, 1, (char *)("Pop index"));

                            if(t->child[0]->child[0]->memKind == Global){
                                emitRM((char *)"LDA", 5, t->child[0]->child[0]->offset, 0, (char *)("Load address of base of array 475"), (char *)t->child[0]->child[0]->attr.name);
                            }
                            else if(t->child[0]->child[0]->memKind == Parameter){
                                emitRM((char *)"LD", 5, t->child[0]->child[0]->offset, 1, (char *)("Load address of base of array 478"), (char *)t->child[0]->child[0]->attr.name);
                            }
                            else{
                                emitRM((char *)"LDA", 5, t->child[0]->child[0]->offset, 1, (char *)("Load address of base of array 481"), (char *)t->child[0]->child[0]->attr.name);
                            }

                            emitRO((char *)"SUB", 5, 5, 4, (char *)("Compute offset of value"));
                            emitRM((char *)"LD", 4, 0, 5, (char *)("Load lhs variable 484"), (char *)t->child[0]->child[0]->attr.name);

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

                            emitRM((char *)"ST", 3, 0, 5, (char *)("Store var"), (char *)t->child[0]->child[0]->attr.name);
                            isBinary = false;
                        }
                    }
                }
                else{
                    if(!strcmp(t->child[1]->attr.name, "[")){
                        if(!strcmp(t->child[0]->attr.name, "[")){

                            genParse(t->child[0]->child[1]);

                            emitRM((char *)"ST", 3, loffset, 1, (char *)("Push index on"));
                            loffset--;
                            emitComment((char *)("LOFF Line 453:"), loffset);
                            
                            if(t->child[1]->child[0]->memKind == Global){
                                emitRM((char *)"LDA", 3, t->child[1]->child[0]->offset, 0, (char *)("Load address of base of array 455"), (char *)t->child[1]->child[0]->attr.name);
                            }
                            else if(t->child[1]->child[0]->memKind == Parameter){
                                emitRM((char *)"LD", 3, t->child[1]->child[0]->offset, 1, (char *)("Load address of base of array 457"), (char *)t->child[1]->child[0]->attr.name);
                            }
                            else{
                                emitRM((char *)"LDA", 3, t->child[1]->child[0]->offset, 1, (char *)("Load address of base of array 459"), (char *)t->child[1]->child[0]->attr.name);
                            }
                            emitRM((char *)"ST", 3, loffset, 1, (char *)("Push left side1"));
                            loffset--;
                            emitComment((char *)("LOFF Line 470:"), loffset);
                            genParse(t->child[1]->child[1]);
                            loffset++;    
                            emitComment((char *)("LOFF Line 471:"), loffset);             

                            emitRM((char *)"LD", 4 , loffset, 1, (char *)("Pop left into acl 1"));
                            emitRO((char *)"SUB", 3, 4, 3, (char *)("compute location from index"));
                            emitRM((char *)"LD", 3, 0, 3, (char *)("Load array element"));
                            loffset++;
                            emitComment((char *)("LOFF Line 475:"), loffset);
                            emitRM((char *)"LD", 4, loffset, 1, (char *)("Pop index"));

                            if(t->child[0]->child[0]->memKind == Global){
                                emitRM((char *)"LDA", 5, t->child[0]->child[0]->offset, 0, (char *)("Load address of base of array 472"), (char *)t->child[0]->child[0]->attr.name);
                            }
                            else if(t->child[0]->child[0]->memKind == Parameter){
                                emitRM((char *)"LD", 5, t->child[0]->child[0]->offset, 1, (char *)("Load address of base of array 476"), (char *)t->child[0]->child[0]->attr.name);
                            }
                            else{
                                emitRM((char *)"LDA", 5, t->child[0]->child[0]->offset, 1, (char *)("Load address of base of array 479"), (char *)t->child[0]->child[0]->attr.name);
                            }

                            emitRO((char *)"SUB", 5, 5, 4, (char *)("Compute offset of value"));
                            //genParse(t->child[0]->child[0]);

                            emitRM((char *)"LD", 4, 0, 5, (char *)("Load lhs variable 493"), (char *)t->child[0]->child[0]->attr.name);

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

                            emitRM((char *)"ST", 3, 0, 5, (char *)("Store var"), (char *)t->child[0]->child[0]->attr.name);
                            isBinary = false;

                        }
                    }
                    else{

                        if(t->child[1]->subkind.exp == OpK || t->child[1]->subkind.exp == AssignK){
                            genParse(t->child[1]);
                        }
                        else{
                            emitRM((char *)"LD", 3, t->child[1]->offset, 0, (char *)("Load variable "), t->child[1]->attr.name);
                        }

                        
                        //genParse(t->child[1]);
                        emitRM((char *)"LD", 4, t->child[0]->offset, 0, (char *)("Load lhs variable "), t->child[0]->attr.name);
                        //genParse(t->child[0]);

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

                        if(t->child[0]->memKind == Global){
                            emitRM((char *)"ST", 3, t->child[0]->offset, 0, (char *)("Store var"), (char *)t->child[0]->attr.name);
                        }
                        else{
                            emitRM((char *)"ST", 3, t->child[0]->offset, 1, (char *)("Store var"), (char *)t->child[0]->attr.name);
                        }

                        isBinary = false;
                        
                    }
                }
            }

            emitComment((char *)("END ASSIGN"));
            break;
        }
            
        case ConstantK:
        {
            if(t->expType == Boolean){
                emitRM((char *)"LDC", 3, t->attr.value, 6,(char *)"Load bool const");
            }
            else if(t->expType == Char){
                emitRM((char *)"LDC", 3, t->attr.value, 6,(char *)"Load char const");
            }
            else if(t->expType == Integer){
                emitRM((char *)"LDC", 3, t->attr.value, 6,(char *)"Load int const");
            }
            break;
        }

        case IdK:
        {
            emitComment((char *)("START ID"));
            //emitComment((char *)"storeInMem: ", (int)storeInMem);
            // check if anything set to store in memory
            if(storeInMem){
                if(t->memKind == Global){
                    if(!t->isArray){
                        storeInMem = false;
                        emitRM((char *)"ST", 3, t->offset, 0, (char *)("Store var"), (char *)t->attr.name);
                    }
                }
                else if(t->memKind == Local){
                    if(!t->isArray){
                        storeInMem = false;
                        emitRM((char *)"ST", 3, t->offset, 1, (char *)("Store var"), (char *)t->attr.name);
                    }
                }
                else if(t->memKind == LocalStatic){
                    if(!t->isArray){
                        storeInMem = false;
                        emitRM((char *)"ST", 3, t->offset, 0, (char *)("Store var"), (char *)t->attr.name);
                    }
                }
                else if(t->memKind == Parameter){
                    if(!t->isArray){
                        storeInMem = false;
                        emitRM((char *)"ST", 3, t->offset, 1, (char *)("Store var"), (char *)t->attr.name);
                    }
                }
            }
            // not store in memory
            else{
                if(t->memKind == Global){
                    if(!isBinary){
                        if(t->isArray){
                            emitRM((char *)"LDA", 3, t->offset, 0, (char *)("Load address of base of array1"), (char *)t->attr.name);
                        }
                        else{
                            emitRM((char *)"LD", 3, t->offset, 0, (char *)("Load var"), (char *)t->attr.name);
                        }
                    }
                    else{
                        emitRM((char *)"LD", 4, t->offset, 0, (char *)("Load lhs variable 1"), t->attr.name);
                    }
                }
                else if(t->memKind == Local){
                    if(!isBinary){
                        if(t->isArray){
                            emitRM((char *)"LDA", 3, t->offset, 1, (char *)("Load address of base of array2"), (char *)t->attr.name);
                        }
                        else{
                            emitRM((char *)"LD", 3, t->offset, 1, (char *)("Load var"), (char *)t->attr.name);
                        }
                    }
                    else{
                        emitRM((char *)"LD", 4, t->offset, 0, (char *)("Load lhs variable 2"), t->attr.name);
                    }
                }
                else if(t->memKind == Parameter){
                    if(!isBinary){
                        if(t->isArray){
                            emitRM((char *)"LD", 3, t->offset, 1, (char *)("Load address of base of array3"), (char *)t->attr.name);
                        }
                        else{
                            emitRM((char *)"LD", 3, t->offset, 1, (char *)("Load var"), (char *)t->attr.name);
                        }
                    }
                    else{
                        emitRM((char *)"LD", 4, t->offset, 0, (char *)("Load lhs variable 3"), t->attr.name);
                    }
                }
                else if(t->memKind == LocalStatic){
                    if(!isBinary){
                        if(t->isArray){
                            emitRM((char *)"LD", 3, t->offset, 0, (char *)("Load address of base of array4"), (char *)t->attr.name);
                        }
                        else{
                            emitRM((char *)"LD", 3, t->offset, 0, (char *)("Load var"), (char *)t->attr.name);
                        }
                    }
                    else{
                        emitRM((char *)"LD", 4, t->offset, 0, (char *)("Load lhs variable 4"), t->attr.name);
                    }
                }
            }
            emitComment((char *)("END ID"));
            break;
        }

        case CallK:
        {
            emitComment((char *)("START CALL"), (char*)t->attr.name);

            int numParams = 0;
            int tempOff = 0;
            tempOff = loffset;

            TreeNode *lookup = (TreeNode *)st.lookup(t->attr.name);

            // there are no params
            if(!t->child[0]){
                emitRM((char *)"ST", 1, tempOff, 1, (char *)("Store fp in ghost frame for"), (char *)t->attr.name);
                emitRM((char *)"LDA", 1, loffset, 1, (char *)("Ghost frame becomes new active frame"));
            }
            // params exists
            else{

                TreeNode *paramCounter = t->child[0];
                while(paramCounter){
                    paramCounter = paramCounter->sibling;
                    numParams++;
                }

                if(numParams == 1){
                    if(t->child[0]->subkind.exp == OpK || t->child[0]->subkind.exp == IdK){
                        if(t->child[0]->isArray){
                            storeInMem = false;
                            emitComment((char *)("START Param 1 array id 602"));
                            emitRM((char *)"ST", 1, loffset, 1, (char *)("Store fp in ghost frame for "), (char *)t->attr.name);
                            loffset -= 2;
                            emitComment((char *)("LOFF Line605:"), loffset);
                            genParse(t->child[0]);
                            emitRM((char *)"ST", 3, loffset, 1, (char *)("Push parameter 606"));
                            loffset--;
                            emitComment((char *)("LOFF Line609:"), loffset);
                            emitRM((char *)"LDA", 1, tempOff, 1, (char *)("Ghost frame becomes new active frame"));
                            
                        }
                        else if(!strcmp(t->child[0]->attr.name, "[")){
                            emitComment((char *)("START Param 1 array op 606"));

                            emitRM((char *)"ST", 1, loffset, 1, (char *)("Store fp in ghost frame for "), (char *)t->attr.name);
                            loffset -= 2;
                            genParse(t->child[0]->child[0]);
                            
                            emitRM((char *)"ST", 3, loffset, 1, (char *)("Push left 610"));
                            loffset--;
                            emitComment((char *)("LOFF Line614:"), loffset);
                            genParse(t->child[0]->child[1]);
                            loffset++;
                            emitRM((char *)"LD", 4 , loffset, 1, (char *)("Pop left into acl 1"));
                            emitRO((char *)"SUB", 3, 4, 3, (char *)("compute location from index"));
                            emitRM((char *)"LD", 3, 0, 3, (char *)("Load array element"));
                            emitRM((char *)"ST", 3, loffset, 1, (char *)("Push parameter 618"));
                            loffset--;
                            emitComment((char *)("LOFF Line622:"), loffset);

                            emitComment((char *)("END Param 1"));
                            emitRM((char *)"LDA", 1, tempOff, 1, (char *)("Ghost frame becomes new active frame"));

                        }
                        else{
                            emitRM((char *)"ST", 1, loffset, 1, (char *)("Store fp in ghost frame for "), (char *)t->attr.name);
                            emitComment((char *)("START Param 1"));
                            loffset--;
                            emitComment((char *)("LOFF Line680:"), loffset);

                            
                            loffset  -= numParams;
                            emitComment((char *)("LOFF Line685:"), loffset);
                            storeInMem = false;
                            genParse(t->child[0]);
                            
                            emitRM((char *)"ST", 3, loffset, 1, (char *)("Push parameter 623"));
                            loffset--;
                            emitComment((char *)("LOFF Line615:"), loffset);
                            emitComment((char *)("END Param 1"));
                            emitRM((char *)"LDA", 1, tempOff, 1, (char *)("Ghost frame becomes new active frame"));
                        }
                    }
                    else{
                        emitRM((char *)"ST", 1, loffset, 1, (char *)("Store fp in ghost frame for "), (char *)t->attr.name);
                        
                        loffset--;
                        emitComment((char *)("LOFF Line680:"), loffset);
                        loffset--;
                        emitComment((char *)("LOFF Line685:"), loffset);
                        emitComment((char *)("START Param 1"));
                        storeInMem = false;
                        genParse(t->child[0]);
                        
                        emitRM((char *)"ST", 3, loffset, 1, (char *)("Push parameter 623"));
                        loffset--;
                        emitComment((char *)("LOFF Line615:"), loffset);
                        emitComment((char *)("END Param 1"));
                        emitRM((char *)"LDA", 1, tempOff, 1, (char *)("Ghost frame becomes new active frame"));
                    }
                }
                // more than 1 param in call
                else{
                    
                    TreeNode *LUChild;
                    emitRM((char *)"ST", 1, loffset, 1, (char *)("Store fp in ghost frame for "), (char *)t->attr.name);

                    LUChild = t->child[0];

                    loffset--;
                    emitComment((char *)("LOFF Line698:"), loffset);
                    
                    int loopCount = 1;
                    while(LUChild){
                        loffset--;
                        emitComment((char *)("LOFF Line704:"), loffset);
                        emitComment((char *)("START Param"),loopCount);
                        
                        if(LUChild->subkind.exp == IdK || LUChild->subkind.exp == OpK){
                            if(LUChild->isArray){
                                if(LUChild->memKind == Global){
                                    emitRM((char *)"LDA", 3, LUChild->offset, 0, (char *)("Load address of base of array 838"), (char *)LUChild->attr.name);
                                }
                                else if(LUChild->memKind == Parameter){
                                    emitRM((char *)"LD", 3, LUChild->offset, 1, (char *)("Load address of base of array 841"), (char *)LUChild->attr.name);
                                }
                                else{
                                    emitRM((char *)"LDA", 3, LUChild->offset, 1, (char *)("Load address of base of array 844"), (char *)LUChild->attr.name);
                                }
                                emitRM((char *)"ST", 3, loffset, 1, (char *)"Push Parameter");
                            }
                            else if(!strcmp(LUChild->attr.name, "[")){

                                if(LUChild->memKind == Global){
                                    emitRM((char *)"LDA", 3, LUChild->child[0]->offset, 0, (char *)("Load address of base of array 804"), (char *)LUChild->child[0]->attr.name);
                                }
                                else if(LUChild->memKind == Parameter){
                                    emitRM((char *)"LD", 3, LUChild->child[0]->offset, 1, (char *)("Load address of base of array 807"), (char *)LUChild->child[0]->attr.name);
                                }
                                else{
                                    emitRM((char *)"LDA", 3, LUChild->child[0]->offset, 1, (char *)("Load address of base of array 810"), (char *)LUChild->child[0]->attr.name);
                                }

                                emitRM((char *)"ST", 3, loffset, 1, (char *)("Push left side 813"));
                                loffset--;
                                emitComment((char *)("LOFF Line 815:"), loffset);
                                genParse(LUChild->child[1]);
                                loffset++;
                                emitComment((char *)("LOFF Line 818:"), loffset);
                                emitRM((char *)"LD", 4 , loffset, 1, (char *)("Pop left into acl 819"));
                                emitRO((char *)"SUB", 3, 4, 3, (char *)("compute location from index"));
                                emitRM((char *)"LD", 3, 0, 3, (char *)("Load array element"));

                                emitRM((char *)"ST", 3, loffset, 1, (char *)"Push Parameter");
                            }
                            else{
                                emitComment((char *)("LUChild->non array"), (char *)LUChild->attr.name);
                                storeInMem = false;
                                genParse(LUChild);
                                /*
                                // need to explicity check stuff
                                if(LUChild->child[0]->subkind.exp == IdK){
                                    emitRM((char *)"LD", 3, LUChild->child[0]->offset, 1, (char *)("Load var"), (char *)LUChild->child[0]->attr.name);
                                    emitRM((char *)"ST", 3, loffset, 1, (char *)("Push left side 879"));

                                    loffset--;
                                    emitComment((char *)("LOFF Line 882:"), loffset);
                                }
                                else if(!strcmp(LUChild->child[0]->attr.name, "[")){

                                }

                                if(LUChild->child[1]->subkind.exp == ConstantK){
                                    if(t->expType == Boolean){
                                        emitRM((char *)"LDC", 3, LUChild->child[1]->attr.value, 6,(char *)"Load bool const");
                                    }
                                    else if(t->expType == Char){
                                        emitRM((char *)"LDC", 3, LUChild->child[1]->attr.value, 6,(char *)"Load char const");
                                    }
                                    else if(t->expType == Integer){
                                        emitRM((char *)"LDC", 3, LUChild->child[1]->attr.value, 6,(char *)"Load int const");
                                    }

                                    loffset++;
                                    emitComment((char *)("LOFF Line 906:"), loffset);
                                }
                                else if(LUChild->child[1]->subkind.exp == IdK){

                                }
                                else if(!strcmp(LUChild->child[1]->attr.name, "[")){

                                }

                                emitRM((char *)"LD", 4 , loffset, 1, (char *)("Pop left into acl 819"));
                                */
                                emitRM((char *)"ST", 3, loffset, 1, (char *)"Push Parameter");

                            }
                        }
                        else if(LUChild->subkind.exp == ConstantK){
                            if(t->expType == Boolean){
                                emitRM((char *)"LDC", 3, LUChild->attr.value, 6,(char *)"Load bool const");
                            }
                            else if(t->expType == Char){
                                emitRM((char *)"LDC", 3, LUChild->attr.value, 6,(char *)"Load char const");
                            }
                            else if(t->expType == Integer){
                                emitRM((char *)"LDC", 3, LUChild->attr.value, 6,(char *)"Load int const");
                            }

                            emitRM((char *)"ST", 3, loffset, 1, (char *)"Push Parameter");
                        }
                        

                        LUChild = LUChild->sibling;
                        emitComment((char *)("END Param"), loopCount);

                        loopCount++;
                    }

                    emitRM((char *)"LDA", 1, tempOff, 1, (char *)("Ghost frame becomes new active frame"));
                }
            }
             
            lookup = (TreeNode *)st.lookup(t->attr.name);
            emitRM((char *)"LDA", 3, 1, 7, (char *)("Load return addr"));
            int bp = emitSkip(0); 
            emitComment((char *)("BackPatch"), bp);
            emitRM((char *)"JMP", 7, (lookup->codeGenLineNum - bp), 7, (char *)("CALL OUTPUT"), t->attr.name);
            emitRM((char *)"LDA", 3, 0, 2, (char *)("Save the result in ac"));

            emitComment((char *)("END CALL"));
            loffset = tempOff;
            emitComment((char *)("LOFF Line749:"), loffset);

            break;
        }
    }
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

    emitComment((char *)("START INIT GLOBALS AND STATICS"));    
    genGlobAndStatics(t);
    emitComment((char *)("END INIT GLOBALS AND STATICS"));

    emitRM((char *)"LDA", 3, 1, 7, (char *)("Load return address"));
    bp = emitSkip(0);
    emitRM((char*)"JMP", 7, (lookup->codeGenLineNum - bp), 7, (char *)("Jump to main"));
    emitRO((char *)"HALT", 0, 0, 0, (char *)("DONE"));
    emitComment((char *)("END INIT"));
}

void genGlobAndStatics(TreeNode *t){

    if(!t){
        return;
    }
    else{
        if(t->subkind.decl == VarK){
            if(t->memKind == Global){
                if(t->child[0]){
                    if(!t->isArray){
                        genParse(t->child[0]);
                        emitRM((char *)"ST", 3, goffset+1, 0, (char *)("Store Var"), (char *)t->attr.name);
                    }
                    else{
                        emitRM((char *)"LDC", 3, t->memSize-1, 3, (char *)("Load array size"));
                        emitRM((char *)"ST", 3, goffset+1, 3, (char *)("Save size of "), (char *)t->attr.name);
                    }
                }
                else{
                    if(!t->isArray){
                        genParse(t->child[0]);
                        emitRM((char *)"ST", 3, goffset+1, 0, (char *)("Store Var"), (char *)t->attr.name);
                    }
                    else{
                        emitRM((char *)"LDC", 3, t->memSize-1, 6, (char *)("Load array size"));
                        emitRM((char *)"ST", 3, t->offset + 1, 0, (char *)("Save size of "), (char *)t->attr.name);
                    }
                }
            }
        }
    }

    if(t->sibling){
        genGlobAndStatics(t->sibling);
    }
}

void initIO(){
    emitSkip(1);
    TreeNode *tempLU;

    //INPUT Int
    tempLU = (TreeNode *)st.lookup("input");
    tempLU->codeGenLineNum = emitSkip(0)-1;

    emitComment((char *)("START FUNC INPUT"));
    emitRM((char *)"ST", 3, -1, 1, (char *)"Store return addr");
    emitRO((char *)"IN", 2, 2, 2, (char *)"Get int input");
    emitRM((char *)"LD", 3, -1, 1, (char *)"Load return addr");
    emitRM((char *)"LD", 1, 0, 1, (char *)"Adjust fp");
    emitRM((char *)"JMP", 7, 0, 3, (char *)"Return");
    emitComment((char *)"END FUNC INPUT");
    emitComment((char *)"");
    emitComment((char *)"** ** ** ** ** ** ** ** ** ** ** **");

    //OUTPUT Int
    tempLU = (TreeNode *)st.lookup("output");
    tempLU->codeGenLineNum = emitSkip(0)-1;

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
    
    //INPUT Bool
    tempLU = (TreeNode *)st.lookup("inputb");
    tempLU->codeGenLineNum = emitSkip(0)-1;

    emitComment((char *)("START FUNC INPUTB"));
    emitRM((char *)"ST", 3, -1, 1, (char *)"Store return addr");
    emitRO((char *)"INB", 2, 2, 2, (char *)"Get bool input");
    emitRM((char *)"LD", 3, -1, 1, (char *)"Load return addr");
    emitRM((char *)"LD", 1, 0, 1, (char *)"Adjust fp");
    emitRM((char *)"JMP", 7, 0, 3, (char *)"Return");
    emitComment((char *)"END FUNC INPUTB");
    emitComment((char *)"");
    emitComment((char *)"** ** ** ** ** ** ** ** ** ** ** **");

    //OUTPUT Bool
    tempLU = (TreeNode *)st.lookup("outputb");
    tempLU->codeGenLineNum = emitSkip(0)-1;

    emitComment((char *)("START FUNC OUTPUTB"));
    emitRM((char *)"ST", 3, -1, 1, (char *)"Store return addr");
    emitRM((char *)"LD", 3, -2, 1, (char *)"Load return addr");
    emitRO((char *)"OUTB", 3, 3, 3, (char *)"Output bool");
    emitRM((char *)"LD", 3, -1, 1, (char *)"Load return addr");
    emitRM((char *)"LD", 1, 0, 1, (char *)"Adjust fp");
    emitRM((char *)"JMP", 7, 0, 3, (char *)"Return");
    emitComment((char *)"END FUNC OUTPUTB");
    emitComment((char *)"");
    emitComment((char *)"** ** ** ** ** ** ** ** ** ** ** **");

    //INPUT Char
    tempLU = (TreeNode *)st.lookup("inputc");
    tempLU->codeGenLineNum = emitSkip(0)-1;

    emitComment((char *)("START FUNC INPUTC"));
    emitRM((char *)"ST", 3, -1, 1, (char *)"Store return addr");
    emitRO((char *)"INC", 2, 2, 2, (char *)"Get char input");
    emitRM((char *)"LD", 3, -1, 1, (char *)"Load return addr");
    emitRM((char *)"LD", 1, 0, 1, (char *)"Adjust fp");
    emitRM((char *)"JMP", 7, 0, 3, (char *)"Return");
    emitComment((char *)"END FUNC INPUTC");
    emitComment((char *)"");
    emitComment((char *)"** ** ** ** ** ** ** ** ** ** ** **");

    //OUTPUT Char
    tempLU = (TreeNode *)st.lookup("outputc");
    tempLU->codeGenLineNum = emitSkip(0)-1;

    emitComment((char *)("START FUNC OUTPUTC"));
    emitRM((char *)"ST", 3, -1, 1, (char *)"Store return addr");
    emitRM((char *)"LD", 3, -2, 1, (char *)"Load return addr");
    emitRO((char *)"OUTC", 3, 3, 3, (char *)"Output char");
    emitRM((char *)"LD", 3, -1, 1, (char *)"Load return addr");
    emitRM((char *)"LD", 1, 0, 1, (char *)"Adjust fp");
    emitRM((char *)"JMP", 7, 0, 3, (char *)"Return");
    emitComment((char *)"END FUNC OUTPUTC");
    emitComment((char *)"");
    emitComment((char *)"** ** ** ** ** ** ** ** ** ** ** **");

    //OUTPUT Char
    tempLU = (TreeNode *)st.lookup("outnl");
    tempLU->codeGenLineNum = emitSkip(0)-1;

    emitComment((char *)("START FUNC OUTNL"));
    emitRM((char *)"ST", 3, -1, 1, (char *)"Store return addr");
    emitRO((char *)"OUTNL", 3, 3, 3, (char *)"Output newline");
    emitRM((char *)"LD", 3, -1, 1, (char *)"Load return addr");
    emitRM((char *)"LD", 1, 0, 1, (char *)"Adjust fp");
    emitRM((char *)"JMP", 7, 0, 3, (char *)"Return");
    emitComment((char *)"END FUNC OUTNL");
    emitComment((char *)"");
    emitComment((char *)"** ** ** ** ** ** ** ** ** ** ** **");
}