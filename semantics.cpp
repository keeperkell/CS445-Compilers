
// // // // // // // // // // // // // // // // // // // // // // // 
// CS445 - semantics.cpp
//
// Keller Lawson
// 
// Last Updated
// Mar 12, 2022   

#include "semantics.h"
#include "scanType.h"
#include "parser.tab.h"
#include "treeNode.h"
#include "symbolTable.h"
#include "IO.h"
#include <stdio.h>
#include <stdlib.h>

extern SymbolTable st;
extern int numErrors;
extern int numWarnings;

int scopeDepth = 0;
int loopDepth = 1;
int position = 0;
bool insideScope = false;
bool insideRange = false;
bool insideFor = false;
bool hasReturn = false;
bool sizeArrFlag = false;
char *curScope;

ExpType expectReturnType = Void;

extern void checkIfUsed(std::string, void *symbol);

TreeNode *funcScope;

void semanticAnalysis(TreeNode *t){

    TreeNode *currentNode;
    
    if(!t){
        return;
    }
    else{
        
        switch(t->nodekind){
            case DeclK:
                //printf("DeclK\n");
                

                // check if on a global score or not
                if(st.depth() != 1){
                    t->isGlobal = false;
                }
                else{
                    t->isGlobal = true;
                }
                
                //printf("Line: %d, Token: %s, DeclType: %s\n", t->linenum, t->attr.name, getDeclType(t->subkind.decl));
                //printf("IsGlobal: %d\n", t->isGlobal);

                // if symbol is already declared, print error and increase count
                if(t->subkind.decl != VarK){
                    if( !st.insert(t->attr.name, t)){
                        numErrors++;

                        currentNode = (TreeNode *)st.lookup(t->attr.name);
                        printf("ERROR(%d): Symbol '%s' is already declared at line %d.\n", t->linenum, t->attr.name, currentNode->linenum);
                    }
                }
                
                // check subkind and switch off of it
                switch(t->subkind.decl){
                    
                    case VarK:
                        //printf("VarK %s\n", t->attr.name);

                        for(int i = 0; i < MAXCHILDREN; i++){
                            if(t->child[0] != NULL){
                                semanticAnalysis(t->child[0]);
                            }
                        }

                        if( !st.insert(t->attr.name, t)){
                            numErrors++;

                            currentNode = (TreeNode *)st.lookup(t->attr.name);
                            printf("ERROR(%d): Symbol '%s' is already declared at line %d.\n", t->linenum, t->attr.name, currentNode->linenum);
                        }

                        // if multiple vars declared static on a line
                        if(t->sibling){
                            if(t->isStatic){
                                if(t->linenum == t->sibling->linenum){
                                    t->sibling->isStatic = t->isStatic;
                                }
                            }
                        }

                        // if varK is initialized, it has a child
                        if(t->child[0]){


                            // if var and init isArray do not match
                            if(t->isArray && !t->child[0]->isArray){
                                numErrors++;

                                printf("ERROR(%d): Initializer for variable '%s' requires both operands be arrays or not but variable is an array and rhs is not an array.\n", t->linenum, t->attr.name);
                            }
                            if(!t->isArray && t->child[0]->isArray){
                                numErrors++;

                                printf("ERROR(%d): Initializer for variable '%s' requires both operands be arrays or not but variable is not an array and rhs is an array.\n", t->linenum, t->attr.name);
                            }

                            // check if variable type and child type match
                            if(t->expType != t->child[0]->expType){
                                numErrors++;

                                printf("ERROR(%d): Initializer for variable '%s' of type '%s' is of type '%s'.\n", t->linenum, t->attr.name, returnExpType(t->expType), returnExpType(t->child[0]->expType));
                            }

                            /*
                            // check if child is a constant expression
                            if(t->child[0]->subkind.exp != ConstantK){
                                numErrors++;

                                printf("ERROR(%d): Initializer for variable '%s' is not a constant expression.\n", t->linenum, t->attr.name);
                            }
                            */

                            //check for OpK
                            if(t->child[0]->subkind.exp == OpK){
                                if(t->child[0] && t->child[0]->child[1]){
                                    t->isBinary;
                                }

                                if(!t->isBinary){
                                    if(!strcmp(t->child[0]->attr.name, "-")){
                                        //cannot be used on array
                                        if(!t->isArray){
                                            numErrors++;

                                            printf("ERROR(%d): Initializer for variable '%s' is not a constant expression.\n", t->linenum, t->attr.name);
                                        }
                                    }
                                }
                                else{
                                    // if child[0]->child[0] and child[0]->child[1] exist, then nonconsts on both sides
                                    checkRecursiveOps(t, t->child[0]);
                                }
                            }

                            //check for IDs, ID can not be used as init
                            else if(t->child[0]->subkind.exp == IdK){
                                numErrors++;

                                printf("ERROR(%d): Initializer for variable '%s' of type '%s' is of type '%s'.\n", t->linenum, t->attr.name, returnExpType(t->expType), returnExpType(t->child[0]->expType));
                            }
                            //check for CallK, CallK can not be used as init
                            else if(t->child[0]->subkind.exp == CallK){
                                numErrors++;

                                printf("ERROR(%d): Initializer for variable '%s' of type '%s' is of type '%s'.\n", t->linenum, t->attr.name, returnExpType(t->expType), returnExpType(t->child[0]->expType));
                            }

                            t->isInit = true;
                            t->isDeclared = true;
                        }
                        else{
                            //if no child then the var was not init but was declared
                            t->isDeclared = true;
                        }

                        break;

                    case FuncK:
                        //printf("DeclK->FuncK\n");

                        // assign function scope as current TreeNode
                        funcScope = t;
                        //default return flag to false
                        hasReturn = false;

                        //enter for scope
                        st.enter(t->attr.name);
                        insideScope = true;
                        expectReturnType = t->expType;
                        curScope = strdup(t->attr.name);

                        for(int i = 0; i < MAXCHILDREN; i++){
                            if(t->child[i] != NULL){
                                semanticAnalysis(t->child[i]);
                            }
                        }

                        // if func scope has no return and isn't declared void, print warning
                        if(!hasReturn && t->expType != Void){
                            numWarnings++;

                            printf("WARNING(%d): Expecting to return type %s but function '%s' has no return statement.\n", t->linenum, returnExpType(t->expType), t->attr.name);
                        }
                        
                        // Only leave scope if you are not in global
                        if(st.depth() > 1){
                            //check if vars were used
                            st.applyToAll(checkIfUsed);

                            st.leave();
                        }
                        insideScope = false;

                        break;

                    case ParamK:
                        
                        //printf("DeclK->ParamK\n");
                        t->isInit = true;

                        for(int i = 0; i < MAXCHILDREN; i++){

                            //init child if it exists for nested params
                            if(t->child[0]){
                                t->child[0]->isInit = true;
                            }
    
                            semanticAnalysis(t->child[i]);
                        }

                        break;
                }
                break;
            
            case StmtK:
                switch(t->subkind.stmt){
                    case NullK:
                        //placeholder for future errors/checks
                        break;

                    case IfK:
                        //printf("StmtK->IfK\n");

                        //enter loop
                        insideScope = true;
                        st.enter(t->attr.name);

                        for(int i = 0; i < MAXCHILDREN; i++){
                            if(t->child[0]){
                                semanticAnalysis(t->child[i]);
                            }
                        }

                        //cannot use array in if
                        if(t->child[0]->isArray){
                            numErrors++;

                            printf("ERROR(%d): Cannot use array as test condition in %s statement.\n", t->linenum, "if");
                        }

                        //if condition should be bool
                        if(t->child[0]->expType != Boolean){

                            // if child subtype is op, do not produce error
                            if(t->child[0]->subkind.exp != OpK){
                                if(!t->child[0]->declErrReport){
                                    numErrors++;

                                    printf("ERROR(%d): Expecting Boolean test condition in %s statement but got type %s.\n", t->linenum, "if", returnExpType(t->child[0]->expType));
                                }
                            }
                        }

                        //exit loop
                        insideScope = false;

                        //check if vars were used
                        st.applyToAll(checkIfUsed);

                        st.leave();
                        break;

                    // multiple cases in a row without a break default to the last cases code
                    case WhileK:

                        //enter loop
                        st.enter(t->attr.name);
                        insideScope = true;
                        loopDepth++;

                        for(int i = 0; i < MAXCHILDREN; i++){
                            if(t->child[i]){
                                semanticAnalysis(t->child[i]);
                            }
                        }

                        //cannot use array in while
                        if(t->child[0]->isArray){
                            numErrors++;

                            printf("ERROR(%d): Cannot use array as test condition in %s statement.\n", t->linenum, "while");
                        }

                        //if condition should be bool
                        if(t->child[0]->expType != Boolean){
                            if(t->child[0]->subkind.exp != OpK){
                                if(!t->child[0]->declErrReport){
                                    numErrors++;

                                    printf("ERROR(%d): Expecting Boolean test condition in %s statement but got type %s.\n", t->linenum, "while", returnExpType(t->child[0]->expType));
                                }
                            }
                        }

                        //exit loop
                        insideScope = false;

                        if(st.depth() > 1){
                            //check if vars were used
                            st.applyToAll(checkIfUsed);

                            st.leave();
                            loopDepth--;
                        }

                        break;

                    case ForK:
                    
                        //enter loop
                        st.enter(t->attr.name);
                        insideScope = true;
                        insideFor = true;
                        loopDepth++;

                        for(int i = 0; i < MAXCHILDREN; i++){
                            if(t->child[i]){
                                semanticAnalysis(t->child[i]);
                            }

                            //For requires first 2 param be init
                            //moved inside for loop to fix issues
                            t->child[0]->isInit = true;
                            t->child[1]->isInit = true;
                        }

                        //checkForKParams(t);

                        if(st.depth() > 1){
                            //check if vars were used
                            st.applyToAll(checkIfUsed);

                            st.leave();
                            loopDepth--;
                        }
                        //exit loop
                        insideFor = false;
                        insideScope = false;

                        break;

                    case CompoundK:
                    {
                        //printf("Compound %s\n", t->attr.name);
                        //printf("StmtK->CompoundK\n");
                        bool tempScope = insideScope;

                        if(!tempScope){
                            st.enter("compound");
                            scopeDepth++;
                        }
                        else{
                            insideScope = false;
                        }
                        
                        for(int i = 0; i < MAXCHILDREN; i++){
                            if(t->child[i]){
                                semanticAnalysis(t->child[i]);
                            }
                        }            
                        
                        if(!tempScope && st.depth() > 1){
                            //check if vars were used
                            st.applyToAll(checkIfUsed);

                            st.leave();
                            scopeDepth--;
                        }
                        
                        break;
                    }

                    case ReturnK:
                        // return should only have 1 child to return
                        TreeNode *scope; 

                        //look up current scope
                        scope = (TreeNode *)st.lookup(curScope);

                        // set return flag true since it was found
                        hasReturn = true;
                        
                        //return will only have 1 child
                        semanticAnalysis(t->child[0]);

                        if(scope){
                            // check for ID return
                            if(t->child[0]){

                                if(t->child[0]->subkind.exp == IdK){
                                    currentNode = (TreeNode *)st.lookup(t->child[0]->attr.name);

                                    //if node is exists, then it is used
                                    if(currentNode){
                                        currentNode->isUsed = true;

                                        // check if array
                                        if(t->child[0]->isArray){
                                            numErrors++;

                                            printf("ERROR(%d): Cannot return an array.\n", t->linenum);
                                        }
                                        else if(t->child[0]->child[0]){
                                            if(t->child[0]->child[0]->isArray){
                                                if(strcmp(t->child[0]->attr.name, "[")){
                                                    numErrors++;

                                                    printf("ERROR(%d): Cannot return an array.\n", t->linenum);
                                                }
                                            }
                                        }
                                        // check if func expects no return value
                                        if(scope->expType == Void){
                                            numErrors++;

                                            printf("ERROR(%d): Function '%s' at line %d is expecting no return value, but return has a value.\n", t->linenum, scope->attr.name, scope->linenum);
                                        }
                                        //check matching types and func expects a return
                                        else if(t->child[0]->expType != scope->expType){
                                    
                                            if(t->child[0]->expType != Void && scope->expType != Void){
                                                // char and char int are the same
                                                if(!(t->child[0]->expType == Char && scope->expType == CharInt)){
                                                     numErrors++;

                                                    printf("ERROR(%d): Function '%s' at line %d is expecting to return type %s but returns type %s.\n",
                                                                t->linenum, scope->attr.name, scope->linenum, returnExpType(scope->expType), returnExpType(t->child[0]->expType));

                                                }
                                            }

                                            else if(t->child[0]->subkind.exp == CallK && scope->expType != Void){
                                                // char and char int are the same
                                                if(!(t->child[0]->expType == Char && scope->expType == CharInt)){
                                                     numErrors++;

                                                    printf("ERROR(%d): Function '%s' at line %d is expecting to return type %s but returns type %s.\n",
                                                                t->linenum, scope->attr.name, scope->linenum, returnExpType(scope->expType), returnExpType(t->child[0]->expType));

                                                }
                                            }
                                        }                                        
                                    }
                                }
                            }
                            else if(scope->expType != Void && !t->child[0]){
                                numErrors++;

                                printf("ERROR(%d): Function '%s' at line %d is expecting to return type %s but return has no value.\n", t->linenum, scope->attr.name, scope->linenum, returnExpType(scope->expType));
                            }
                        }
                        else{
                            break;
                        }
            
                        break;

                    case BreakK:
                        
                        // if scope depth is less than or equal to 2, then on global or func scope
                        if(insideScope){
                            numErrors++;

                            printf("ERROR(%d): Cannot have a break statement outside of loop.\n", t->linenum);
                        }
                        break;

                    case RangeK:
                        
                        //enter range mini scope
                        insideRange = true;

                        for(int i = 0; i < MAXCHILDREN; i++){
                            position = i+1;

                            if(t->child[i]){

                                //check range for array
                                if(t->child[i]->child[0]){
                                    if(t->child[i]->child[0]->isArray){

                                        //set index found for array
                                        t->child[i]->child[0]->indexFound = true;
                                    }
                                }
                                else if(position == 1){
                                    // child is ID, lookup and mark as used
                                    if(t->child[0]->subkind.exp == IdK){
                                        currentNode = (TreeNode *)st.lookup(t->child[0]->attr.name);

                                        if(currentNode){
                                            currentNode->isUsed = true;
                                        }
                                        else{
                                            numErrors++;
                                            t->declErrReport = true;

                                            printf("ERROR(%d): Symbol '%s' is not declared.\n", t->linenum, t->child[0]->attr.name);                                            
                                        }
                                    }
                                }
                                
                                semanticAnalysis(t->child[i]);
                            }
                        }

                        //leave range mini scope
                        insideRange = false;
                        position = 0;

                        break;
                }
                break;

            case ExpK:
                switch(t->subkind.exp){
                    case AssignK:

                        // new function to perform only 
                        checkAssignOpK(t);

                        break;

                    case OpK:
                        // OpK will 1 or 2 child nodes(unary or binary)
                        // Need to have logic specific for each side, starting with left
                        // to account for unary

                        checkAssignOpK(t);

                        break;

                    case ConstantK:
                        // need to review this section
                        //printf("ExpK->ConstantK\n");

                        // range needs ints
                        if(insideRange){
                            if(insideFor){

                                if(t->expType != Integer){
                                    numErrors++;

                                    printf("ERROR(%d): Expecting type int in position %d in range of for statement but got type %s.\n", t->linenum, position, returnExpType(t->expType));
                                }
                            }
                        }
                        
                        break;

                    case IdK:
                        
                        checkIdK(t);

                        break;

                    case CallK:

                        for(int i = 0; i < MAXCHILDREN; i++){
                            semanticAnalysis(t->child[i]);
                        }

                        currentNode = (TreeNode *)st.lookup(t->attr.name);
                        
                        if(!currentNode){
                            if(!t->declErrReport){
                                numErrors++;
                                t->declErrReport = true;

                                printf("ERROR(%d): Symbol '%s' is not declared.\n", t->linenum, t->attr.name);
                            } 
                        }
                        else{
                            t->expType = currentNode->expType;
                            t->isArray = currentNode->isArray;
                            t->isGlobal = currentNode->isGlobal;
                            t->isStatic = currentNode->isStatic;

                            // call needs to be to a function
                            if(currentNode->subkind.decl != FuncK && !currentNode->isIO){
                                numErrors++;

                                printf("ERROR(%d): '%s' is a simple variable and cannot be called.\n", t->linenum, currentNode->attr.name);
                            }
                            else if(insideRange){
                                if(insideFor){
                                
                                    //specific case for main as a variable is needed
                                    if(t->expType != Integer){
                                        if(!strcmp(t->attr.name, "main")){
                                            numErrors++;

                                            printf("ERROR(%d): Cannot use function '%s' as a variable.\n", t->linenum, t->attr.name);
                                        }
                                        else{
                                            numErrors++;

                                            printf("ERROR(%d): Expecting type %s in position %d in range of for statement but got type %s.\n", t->linenum, "int", position, returnExpType(t->expType));
                                        }
                                    }
                                }
                            }
                            else{
                                // too many parameters
                                if(!currentNode->child[0] && t->child[0]){
                                    numErrors++;

                                    printf("ERROR(%d): Too many parameters passed for function '%s' declared on line %d.\n", t->linenum, currentNode->attr.name, currentNode->linenum);
                                }
                                // too few parameters
                                else if(currentNode->child[0] && !t->child[0]){
                                    numErrors++;

                                    printf("ERROR(%d): Too few parameters passed for function '%s' declared on line %d.\n", t->linenum, currentNode->attr.name, currentNode->linenum);
                                }
                                else{
                                    // check parameters of call
                                    checkCallParams(currentNode, currentNode->child[0], t, t->child[0], 1);
                                }
                            }
                        }
                        
                        break;

                    default:
                        break;
                }  
                break;

            default:
                //printf("I am in default \n");
                break;
        }

        if(t->sibling){
            semanticAnalysis(t->sibling);
        }
    }
}

//function to check for errors in AssignK
//Combined Assign and Ops
void checkAssignOpK(TreeNode *t){
    TreeNode *leftChild, *leftLU;       // LU is for lookup
    TreeNode *rightChild, *rightLU;
    
    if(!strcmp(t->attr.name, "<-")){
        if(t->child[0]){
            if(t->child[0]->child[0] && !strcmp(t->child[0]->attr.name, "[")){
                t->child[0]->child[0]->isInit = true;

                //This needs works, missing some inits. 
                // having to check more and more children to match files
                if(t->child[0]->child[1]){
                    if(t->child[0]->child[1]->child[0]){
                        if(t->child[0]->child[1]->child[1]){
                            // if 2 children exists, check for ops
                            if(t->child[0]->child[1]->subkind.exp == OpK){
                                t->child[0]->child[1]->child[0]->isInit = true;
                                t->child[0]->child[1]->child[1]->isInit = true;
                            }
                        }
                    }
                    t->child[0]->child[1]->isInit = true;
                }
                // check for multiple brackets in a row [[]]
                else if(t->child[0]->child[1]->child[0]){
                    t->child[0]->child[1]->child[0]->isInit = true;
                }
            }
            // more nested checks
            else if(t->child[1] && t->child[1]->expType == Void){
                if(t->child[1]->subkind.exp == CallK){
                    t->child[0]->isInit = true;
                }
                else if(t->child[0] && t->child[1]){
                    if(t->child[0]->subkind.exp == IdK ){
                        if(!t->child[0]->isInit){
                            if(t->child[1]->subkind.exp == IdK){
                                if(strcmp(t->child[0]->attr.name, t->child[1]->attr.name)){
                                    t->child[0]->isInit = true;
                                }
                            }
                        }
                    }
                    else if(t->child[1]->subkind.exp == AssignK){
                        t->child[0]->isInit = true;

                        if(t->child[1]->child[0]){
                            t->child[1]->child[0]->isInit = true;
                        }
                    }
                }
                else if(!strcmp(t->child[0]->attr.name, "[")){
                    if(t->child[1]->child[0]){
                        if(strcmp(t->child[0]->attr.name, t->child[1]->child[0]->attr.name)){
                            t->child[0]->isInit = true;
                        }
                    }
                }

                if(!strcmp(t->child[1]->attr.name, "<-")){
                    t->child[0]->isInit = true;
                }
            }
            else{
                //specific check for nested self assignment
                if(t->child[1] && t->child[1]->child[0]){
                    if(t->child[1]->child[0]->subkind.exp == IdK){
                        if(strcmp(t->child[0]->attr.name, t->child[1]->child[0]->attr.name)){
                            t->child[0]->isInit = true;
                        }
                    }
                    else{
                        t->child[0]->isInit = true;
                    }
                }
                else{
                    t->child[0]->isInit = true;
                }
            }
        }
    }
    ///////////////

    //check for sizeof array
    if(!strcmp(t->attr.name, "*")){
        // set this to check later
        sizeArrFlag = true;
    }

    // set used flag on ops. Assignment does not count as used
    if(strcmp(t->attr.name, "<-")){
        if(t->child[0]){
            t->child[0]->isUsed = true;
        }
        if(t->child[1]){
            t->child[1]->isUsed = true;
        }
    }

    for(int i = 0; i < MAXCHILDREN; i++){
        if(t->child[i]){
            semanticAnalysis(t->child[i]);
        }
    }

    //reset flag for size of array
    sizeArrFlag = false;

    // after used and init checks, need to check left and right childs of op/assign
    ExpType leftChildExp, rightChildExp;
    leftChildExp, rightChildExp = UndefinedType;

    // default all bools to false
    bool leftChildIsArr, rightChildIsArr;
    bool leftChildIndexed, rightChildIndexed;
    bool leftChildIsStr, rightChildIsStr;
    bool leftChildErr, rightChildErr;
    bool isBinaryOp, checkUnaryError;
    leftChildIsArr, rightChildIsArr, leftChildIndexed, rightChildIndexed, leftChildIsStr, rightChildIsStr, leftChildErr, rightChildErr, isBinaryOp, checkUnaryError = false;

    // check types of left child
    if(t->child[0]){
        leftChild = t->child[0];
        leftChildExp = t->child[0]->expType;
        leftChildIsArr = t->child[0]->isArray;

        // check for expression
        if(leftChild->nodekind == ExpK){
            if(leftChild->subkind.exp == ConstantK){
                leftChildIsStr = true;
            }
            else if(leftChild->subkind.exp == CallK){
                leftChildIsArr = false;
            }
        }

        // check if child exists for indexing, array
        if(leftChild->child[0]){
            leftChildIndexed = true;
            leftChildIsArr = false;
        }
    }

    // check types of right child
    if(t->child[1]){
        //if child 1 also exists, it is now a binary op
        isBinaryOp = true;
        
        rightChild = t->child[1];
        rightChildExp = t->child[1]->expType;
        rightChildIsArr = t->child[1]->isArray;

        // check for expression
        if(rightChild->nodekind == ExpK){
            if(rightChild->subkind.exp == ConstantK){
                rightChildIsStr = true;
            }
            else if(rightChild->subkind.exp == CallK){
                rightChildIsArr = false;
            }
        }

        // check if child exists for indexing, array
        if(rightChild->child[1]){
            rightChildIndexed = true;
            rightChildIsArr = false;
        }
    }

    // check for declaration errors on left and right side
    // left child
    if(leftChildExp == Void){
        if(!(leftChild->nodekind == ExpK && leftChild->subkind.exp == CallK)){
            leftChildErr = true;
        }
    }
    // right child
    if(rightChildExp == Void){
        if(!(rightChild->nodekind == ExpK && rightChild->subkind.exp == CallK)){
            rightChildErr = true;
        }
    }

    // check for expected return types
    ExpType leftType, rightType, returnType;
    leftType, rightType, returnType = UndefinedType;

    //unary types
    if(!isBinaryOp){
        if(!strcmp(t->attr.name, "not")){
            leftType = rightType = Boolean;
            returnType = Boolean;
        }
        if(!strcmp(t->attr.name, "*")){
            leftType = rightType = UndefinedType;
            returnType = Integer;
        }
        if(!strcmp(t->attr.name, "?") || !strcmp(t->attr.name, "-") || !strcmp(t->attr.name, "--") || !strcmp(t->attr.name, "++")){
            leftType = rightType = Integer;
            returnType = Integer;
        }
    }
    //binary types
    else{
        if(!strcmp(t->attr.name, "+") || !strcmp(t->attr.name, "-") || !strcmp(t->attr.name, "*") || !strcmp(t->attr.name, "/") || !strcmp(t->attr.name, "%") ||
            !strcmp(t->attr.name, "+=") || !strcmp(t->attr.name, "-=") || !strcmp(t->attr.name, "*=") || !strcmp(t->attr.name, "/=")){
            
            leftType = rightType = Integer;
            returnType = Integer;
            checkUnaryError = true;
        }
        if(!strcmp(t->attr.name, ">") || !strcmp(t->attr.name, "<") || !strcmp(t->attr.name, ">=") || !strcmp(t->attr.name, "<=")){
            leftType = rightType = CharInt;
            returnType = Boolean;
        }
        if(!strcmp(t->attr.name, "==") || !strcmp(t->attr.name, "!=") || !strcmp(t->attr.name, "=")){
            leftType = rightType = UndefinedType;
            returnType = Boolean;
        }
        if(!strcmp(t->attr.name, "and") || !strcmp(t->attr.name, "or")){
            leftType = rightType = Boolean;
            returnType = Boolean;
            checkUnaryError = true;
        }
    }

    // unary errors
    if(!isBinaryOp && !leftChildErr){
        if(leftChildExp != leftType && leftType != UndefinedType){
            if(!strcmp(t->attr.name, "-")){
                numErrors++;

                printf("ERROR(%d): Unary '%s' requires an operand of type %s but was given type %s.\n", t->linenum, "chsign", returnExpType(leftType), returnExpType(leftChildExp));
            }
            else{
                numErrors++;
            
                printf("ERROR(%d): Unary '%s' requires an operand of type %s but was given type %s.\n", t->linenum, t->attr.name, returnExpType(leftType), returnExpType(leftChildExp));
            }
        }
        //size of only works iwth arrays
        else if(!strcmp(t->attr.name, "*")){
            if(!leftChildIsArr){
                if(leftType != UndefinedType){
                    numErrors++;

                    printf("ERROR(%d): The operation '%s' only works with arrays.\n", t->linenum, "sizeof");
                }
            }
        }

        else if(!strcmp(t->attr.name, "not") && leftChildExp != leftType){
            numErrors++;

            printf("ERROR(%d): Unary '%s' requires an operand of type %s but was given type %s.\n", t->linenum, t->attr.name, returnExpType(leftType), returnExpType(leftChildExp));
        }

        if(leftChildIsArr){
            if(strcmp(t->attr.name, "*")){
                if(!strcmp(t->attr.name, "-")){
                    numErrors++;

                    printf("ERROR(%d): The operation '%s' does not work with arrays.\n", t->linenum, "chsign");
                }
                else{
                    numErrors++;

                    printf("ERROR(%d): The operation '%s' does not work with arrays.\n", t->linenum, t->attr.name);
                }
            }
        }
    }
    else{
        //
        if(!checkUnaryError){

            // check for array errors
            if(!strcmp(t->attr.name, "[")){
                TreeNode *leftArrChild, *rightArrChild;
                leftArrChild = rightArrChild = NULL;

                if(t->child[0]){
                    if(t->child[0]->subkind.exp == IdK){
                        leftArrChild = (TreeNode *)st.lookup(t->child[0]->attr.name);

                        if(leftArrChild){
                            t->child[0]->expType = leftArrChild->expType;
                            t->expType = leftArrChild->expType;
                        }
                        else if(!leftArrChild){
                            numErrors++;

                            printf("ERROR(%d): Cannot index nonarray '%s'.\n", t->linenum, t->child[0]->attr.name);
                        }
                        else if(!leftArrChild->isArray){
                            numErrors++;

                            printf("ERROR(%d): Cannot index nonarray '%s'.\n", t->linenum, t->child[0]->attr.name);
                        }
                    }
                }
                else{
                    numErrors++;

                    printf("ERROR(%d): Cannot index nonarray '%s'.\n", t->linenum, t->child[0]->attr.name);
                }
                if(t->child[1]){
                    rightArrChild = t->child[1];

                    if(rightArrChild->expType != Integer && rightArrChild->expType != UndefinedType){
                        if(!(rightArrChild->subkind.decl == ParamK && rightArrChild->subkind.exp != CallK && rightArrChild->expType == Void)){
                            printf("ERROR(%d): Array '%s' should be indexed by type int but got type %s.\n", t->linenum, rightArrChild->attr.name, returnExpType(rightArrChild->expType));
                        }
                    }

                    if(rightArrChild->subkind.exp == IdK){
                        if(rightArrChild->isArray == true){
                            printf("ERROR(%d): Array index is the unindexed array '%s'.\n", t->linenum, rightArrChild->attr.name);
                        }
                    }
                }
            }
            // check for matching types of left and right
            else if(leftChildExp != rightChildExp){
                if(!leftChildErr && !rightChildErr){

                    // check nested assignops
                    if(!strcmp(t->attr.name, "<-") && t->child[1]->subkind.exp == OpK){

                        ExpType childType = UndefinedType;

                        if(!strcmp(t->child[0]->attr.name, "+") || !strcmp(t->child[0]->attr.name, "-") || !strcmp(t->child[0]->attr.name, "*") || !strcmp(t->child[0]->attr.name, "/") || !strcmp(t->child[0]->attr.name, "%") ||
                            !strcmp(t->child[0]->attr.name, "+=") || !strcmp(t->child[0]->attr.name, "-=") || !strcmp(t->child[0]->attr.name, "*=") || !strcmp(t->child[0]->attr.name, "/=")){
                            
                            childType = Integer;
                        }
                        if(!strcmp(t->child[0]->attr.name, ">") || !strcmp(t->child[0]->attr.name, "<") || !strcmp(t->child[0]->attr.name, ">=") || !strcmp(t->child[0]->attr.name, "<=")){
                            childType = Boolean;
                        }
                        if(!strcmp(t->child[0]->attr.name, "==") || !strcmp(t->child[0]->attr.name, "!=") || !strcmp(t->child[0]->attr.name, "=")){
                            childType = Boolean;
                        }
                        if(!strcmp(t->child[0]->attr.name, "and") || !strcmp(t->child[0]->attr.name, "or")){
                            childType = Boolean;
                        }

                        if(childType != leftChildExp){
                            numErrors++;

                            printf("----> VS Code Line 1013 && LineNum: %d\n", t->linenum);

                            printf("ERROR(%d): '%s' requires operands of the same type but lhs is type %s and rhs is type %s.\n", 
                                t->linenum, t->attr.name, returnExpType(leftChildExp), returnExpType(childType));
                        }
                        //more nested checks on right side of op
                        else if(rightChild->child[1]){
                            if(rightChild->child[1]->subkind.exp == CallK){
                                numErrors++;

                                printf("----> VS Code Line 1023 && LineNum: %d\n", t->linenum);

                                printf("ERROR(%d): '%s' requires operands of the same type but lhs is type %s and rhs is type %s.\n", 
                                    t->linenum, t->attr.name, returnExpType(leftChildExp), returnExpType(childType));
                            }
                        }
                    }
                    // need extra check for int on left and charint on right
                    else if(leftChildExp == Integer && rightChildExp == CharInt){
                        //charInt prints as char
                        numErrors++;

                        printf("----> VS Code Line 1035 && LineNum: %d\n", t->linenum);

                        printf("ERROR(%d): '%s' requires operands of the same type but lhs is type %s and rhs is type %s.\n", 
                            t->linenum, t->attr.name, returnExpType(leftChildExp), "char");
                    }
                    else if(!((leftChildExp == Char && rightChildExp == CharInt) || leftChildExp == CharInt && rightChildExp == Char)){
                        
                        if(leftChild->subkind.exp != CallK){
                            numErrors++;

                            printf("----> VS Code Line 1045 && LineNum: %d\n", t->linenum);

                            printf("ERROR(%d): '%s' requires operands of the same type but lhs is type %s and rhs is type %s.\n", 
                                t->linenum, t->attr.name, returnExpType(leftChildExp), returnExpType(rightChildExp));
                        }
                    }
                }
            }
        }

        //////
        if(leftType != UndefinedType || rightType != UndefinedType){
            if(leftChildExp != rightChildExp && leftChild->subkind.exp == CallK && rightChild->subkind.exp == CallK){

                leftLU = (TreeNode *)st.lookup(leftChild->attr.name);
                rightLU = (TreeNode *)st.lookup(rightChild->attr.name);

                if(leftLU){
                    if(rightLU){
                        if(!leftLU->isIO && !rightLU->isIO){
                            if(leftLU->subkind.decl == FuncK && rightLU->subkind.decl == FuncK){

                                numErrors++;

                                //printf("----> leftChildExp: %s, leftType: %s\n", returnExpType(leftChildExp), returnExpType(leftType));
                                printf("----> VS Code Line 1070 && LineNum: %d\n", t->linenum);

                                printf("ERROR(%d): '%s' requires operands of type %s but lhs is of type %s.\n", t->linenum, t->attr.name, returnExpType(leftType), returnExpType(leftChildExp));


                                numErrors++;

                                //printf("----> rightChildExp: %s, rightType: %s\n", returnExpType(rightChildExp), returnExpType(rightType));
                                printf("----> VS Code Line 1078 && LineNum: %d\n", t->linenum);

                                printf("ERROR(%d): '%s' requires operands of type %s but rhs is of type %s.\n", t->linenum, t->attr.name, returnExpType(rightType), returnExpType(rightChildExp));
                            }
                        }
                    }
                }
            }
            else{
                if(!leftChildErr){
                    if(leftChildExp != leftType){
                        numErrors++;

                        //printf("----> leftChildExp: %s, leftType: %s\n", returnExpType(leftChildExp), returnExpType(leftType));
                        printf("----> VS Code Line 1092 && LineNum: %d\n", t->linenum);
                        printf("ERROR(%d): '%s' requires operands of type %s but lhs is of type %s.\n", t->linenum, t->attr.name, returnExpType(leftType), returnExpType(leftChildExp));
                    }
                }

                if(!rightChildErr){
                    if(rightChildExp != rightType){
                        if(rightChildExp != UndefinedType){
                            if(rightChildExp == Void){
                                if(rightChild->subkind.exp == CallK){
                                    if(returnType != Boolean){
                                        numErrors++;

                                        //printf("----> leftChildExp: %s, leftType: %s\n", returnExpType(leftChildExp), returnExpType(leftType));
                                        printf("----> VS Code Line 1106 && LineNum: %d\n", t->linenum);

                                        printf("ERROR(%d): '%s' requires operands of type %s but rhs is of type %s.\n", t->linenum, t->attr.name, returnExpType(rightType), returnExpType(rightChildExp));
                                    }
                                }
                            }
                            else{
                                if(rightChildExp && rightType){
                                    if(strcmp(returnExpType(rightChildExp),returnExpType(rightType))){
                                        numErrors++;

                                        printf("----> VS Code Line 1116 && LineNum: %d\n", t->linenum);
                                        printf("\t----> rightChildExp: %s, rightType: %s\n", returnExpType(rightChildExp), returnExpType(rightType));

                                        printf("ERROR(%d): '%s' requires operands of type %s but rhs is of type %s.\n", t->linenum, t->attr.name, returnExpType(rightType), returnExpType(rightChildExp));
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        if(leftChildIsArr || rightChildIsArr){
            if(!strcmp(t->attr.name, "<-")){
                if(leftChildIsArr && !rightChildIsArr){
                    numErrors++;

                    printf("ERROR(%d): '%s' requires both operands be arrays or not but lhs is an array and rhs is not an array.\n", t->linenum, t->attr.name);
                }
                else if(!leftChildIsArr && rightChildIsArr){
                    numErrors++;

                    printf("ERROR(%d): '%s' requires both operands be arrays or not but lhs is not an array and rhs is an array.\n", t->linenum, t->attr.name);
                }
            }
            else{
                if(leftType != UndefinedType){
                    if(!strcmp(t->attr.name, "<") || !strcmp(t->attr.name, ">") || !strcmp(t->attr.name, "=") || !strcmp(t->attr.name, ">=") 
                        || !strcmp(t->attr.name, "<=") || !strcmp(t->attr.name, "><")){
                            if(leftChildIsArr && !rightChildIsArr){
                                numErrors++;

                                printf("ERROR(%d): '%s' requires both operands be arrays or not but lhs is an array and rhs is not an array.\n", t->linenum, t->attr.name);
                            }
                            else if(!leftChildIsArr && rightChildIsArr){
                                numErrors++;

                                printf("ERROR(%d): '%s' requires both operands be arrays or not but lhs is not an array and rhs is an array.\n", t->linenum, t->attr.name);
                            }
                            else{
                                printf("ERROR(%d): The operation '%s' does not work with arrays.\n", t->linenum, t->attr.name);
                            }
                    }
                }
            }
        }
    }

    if(returnType == UndefinedType){
        t->expType = leftChildExp;
    }
    else{
        t->expType = returnType;
    }
}

//function to check for errors in IdK
void checkIdK(TreeNode *t){
    TreeNode *currentNode = (TreeNode *)st.lookup(t->attr.name);

    if(!currentNode){

        if(insideRange && position == 1){
            t->isDeclared = true;
        }
        else{
            t->declErrReport = true;
            numErrors++;

            printf("ERROR(%d): Symbol '%s' is not declared.\n", t->linenum, t->attr.name);
        }
    }
    else if(insideRange){
        if(!insideFor){
            if(currentNode->isDeclared){
                if(!currentNode->warningReported){
                    if(!currentNode->isInit && !currentNode->isStatic && !currentNode->isGlobal){
                        if(t->isInit){
                            currentNode->isInit = true;
                        }
                        else{
                            numErrors++;

                            printf("WARNING(%d): Variable '%s' may be uninitialized when used here.\n", t->linenum, t->attr.name);
                        }
                    }
                }
            }
        }
        else{
            t->expType = currentNode->expType;
            t->isArray = currentNode->isArray;

            if(position >= 1){
                if(t->expType != Integer){
                    if(!sizeArrFlag){
                        if(strcmp(t->attr.name, "main")){
                            numErrors++;

                            printf("ERROR(%d): Expecting type %s in position %d in range of for statement but got type %s.\n", t->linenum, "int", position, returnExpType(t->expType));
                        }
                        else{
                            numErrors++;

                            printf("ERROR(%d): Cannot use function '%s' as a variable.\n", t->linenum, t->attr.name);
                        }
                    }
                }
            }

            if(!currentNode->isInit){
                if(position >= 1){
                    if(currentNode->isDeclared){
                        if(!currentNode->warningReported){
                            if(!currentNode->isStatic && !currentNode->isGlobal){
                                if(!t->isInit){
                                    numWarnings++;

                                    printf("WARNING(%d): Variable '%s' may be uninitialized when used here.\n", t->linenum, t->attr.name);

                                    currentNode->warningReported = true;
                                    currentNode->isUsed = true;
                                }
                                else{
                                    currentNode->isInit = true;
                                }
                            }
                        }
                    }
                }
            }
            else if(currentNode->isInit){
                if(position > 1){
                    currentNode->isUsed = true;
                }
            }

            if(currentNode->isArray){
                if(!t->indexFound){
                    if(!sizeArrFlag){
                        numErrors++;

                        printf("ERROR(%d): Cannot use array in position %d in range of for statement.\n", t->linenum, position);
                    }
                }
            }

            t->indexFound = false;
        }

        t->isInit = true;
    }
    else{
        if(currentNode->subkind.decl != FuncK){
            t->expType = currentNode->expType;
            t->isArray = currentNode->isArray;
            t->isGlobal = currentNode->isGlobal;
            t->isStatic = currentNode->isStatic;

            if(!insideRange){
                if(currentNode->subkind.decl != FuncK){
                    currentNode->isUsed = true;
                }
            }
        }
        else{
            numErrors++;

            printf("ERROR(%d): Cannot use function '%s' as a variable.\n", t->linenum, t->attr.name);
            
            currentNode->isUsed = true;
        }

        if(currentNode->isDeclared){
            if(!currentNode->warningReported){
                if(!currentNode->isStatic && !currentNode->isGlobal){
                    if(!t->isInit){
                        numWarnings++;

                        printf("WARNING(%d): Variable '%s' may be uninitialized when used here.\n", t->linenum, t->attr.name);

                        currentNode->warningReported = true;
                    }
                    else{
                        currentNode->isInit = true;
                    }
                }
            }
        }

        if(t->child[0]){
            semanticAnalysis(t->child[0]);

            if(t->isArray){
                if(t->child[0]->isArray){
                    if(!t->child[0]->child[0]){
                        numErrors++;

                        printf("ERROR(%d): Array index is the unindexed array '%s'.\n", t->linenum, t->attr.name);
                    }
                }

                if(t->child[0]->expType != Integer){
                    numErrors++;

                    printf("ERROR(%d): Array '%s' should be indexed by type int but got type %s.\n", t->linenum, t->attr.name, returnExpType(t->child[0]->expType));
                }                
            }
        }
    }
}

char *returnExpType(ExpType t){
    char *returnStmt;

    switch(t){
        case Void:
            returnStmt = strdup("void");
            return returnStmt;
        case Integer:
            returnStmt = strdup("int");
            return returnStmt;
        case Boolean:
            returnStmt = strdup("bool");
            return returnStmt;
        case Char:
            returnStmt = strdup("char");
            return returnStmt;
        case CharInt:
            returnStmt = strdup("char");
            return returnStmt;
        case Equal:
            returnStmt = strdup("Equal");
            return returnStmt;
        case UndefinedType:
            returnStmt = strdup("undefined type");    
            return returnStmt;
        default:
            return returnStmt;

    }
}

// check for Param Errors
void checkCallParams(TreeNode *lookUp, TreeNode *lu_Child, TreeNode *t, TreeNode *t_Child, int paramNum){

    if(lu_Child && t_Child){
        // if param is expecting array
        if(lu_Child->isArray && !t_Child->isArray){
            numErrors++;

            printf("ERROR(%d): Expecting array in parameter %i of call to '%s' declared on line %d.\n", t->linenum, paramNum, lookUp->attr.name, lookUp->linenum);
        }
        // if param is NOT expecting array
        if(!lu_Child->isArray &&  t_Child->isArray){
            numErrors++;
            
            printf("ERROR(%d): Not expecting array in parameter %i of call to '%s' declared on line %d.\n", t->linenum, paramNum, lookUp->attr.name, lookUp->linenum);
        }

        // if param expected does not match type
        if(lu_Child != t_Child && !lookUp->isIO){
            numErrors++;

            printf("ERROR(%d): Expecting type %s in parameter %i of call to '%s' declared on line %d but got type %s.\n", t->linenum, 
                            returnExpType(lu_Child->expType), paramNum, lookUp->attr.name, lookUp->linenum, returnExpType(t_Child->expType));
        }

        // too few params passed for function
        if(!t_Child->sibling && lu_Child->sibling){
            numErrors++;

            printf("ERROR(%d): Too few parameters passed for function '%s' declared on line %d.\n", t->linenum, lookUp->attr.name, lookUp->linenum);
        }
        // too many params passed for function
        else if(t_Child->sibling && !lu_Child->sibling){
            numErrors++;

            printf("ERROR(%d): Too many parameters passed for function '%s' declared on line %d.\n", t->linenum, lookUp->attr.name, lookUp->linenum);
        }
        //if param has same siblings, 
        else if(t_Child->sibling && lu_Child->sibling){
            paramNum++;

            checkCallParams(lookUp, lu_Child, t, t_Child->sibling, paramNum);
        }
    }
    
}

// check errors of params in for statement
void checkForKParams(TreeNode *t){

    //check position 1
    if(t->child[1]->child[0]){
        // check position 1 for type int
        if(t->child[1]->child[0]->expType != Integer && t->child[1]->child[0]->expType != UndefinedType){
            numErrors++;

            printf("ERROR(%d): Expecting type int in position %d in range of for statement but got type %s.\n", t->linenum, 1, returnExpType(t->child[1]->child[0]->expType));
        }

        // check position 1 for isArray
        if(t->child[1]->child[0]->isArray){
            numErrors++;

            printf("ERROR(%d): Cannot use array in position %d of for statement.\n", t->linenum, 1);
        }
    }

    // check position 2
    if(t->child[1]->child[1]){
        // check position 2 for type int
        if(t->child[1]->child[1]->expType != Integer && t->child[1]->child[1]->expType != UndefinedType){
            numErrors++;

            printf("ERROR(%d): Expecting type int in position %d in range of for statement but got type %s.\n", t->linenum, 2, returnExpType(t->child[1]->child[1]->expType));
        }

        // check position 2 for isArray
        if(t->child[1]->child[1]->isArray){
            numErrors++;

            printf("ERROR(%d): Cannot use array in position %d of for statement.\n", t->linenum, 2);
        }
    }

    // check position 3
    if(t->child[1]->child[2]){
        // check position 1 for type int
        if(t->child[1]->child[2]->expType != Integer && t->child[1]->child[2]->expType != UndefinedType){
            numErrors++;

            printf("ERROR(%d): Expecting type int in position %d in range of for statement but got type %s.\n", t->linenum, 3, returnExpType(t->child[1]->child[2]->expType));
        }

        // check position for isArray
        if(t->child[1]->child[2]->isArray){
            numErrors++;

            printf("ERROR(%d): Cannot use array in position %d of for statement.\n", t->linenum, 3);
        }
    }
}

// helper function to recursively check ops until no more children exist
void checkRecursiveOps(TreeNode *t, TreeNode *t_Child){
    // left child is child[]->child[0]
    TreeNode *leftChild = t_Child->child[0];
    // right child is child[]->child[1]
    TreeNode *rightChild = t_Child->child[1];

    // all unaries fail except for not which just flips bool flag
    if(leftChild && !rightChild){
        if(strcmp(t_Child->attr.name, "not")){
            numErrors++;

            printf("ERROR(%d): Initializer for variable '%s' is not a constant expression.\n", t->linenum, t->attr.name);
        }
    }

    // recursively check children to see if they are IDs or Calls
    if(leftChild && rightChild){
        
        //check left child for op
        if(leftChild->subkind.exp == OpK){
            checkRecursiveOps(t, leftChild);
        }
        //check right child for op
        else if(rightChild->subkind.exp == OpK){
            checkRecursiveOps(t, rightChild);
        }
        // if no more recursive ops, print error if IdK
        else if(leftChild->subkind.exp == IdK || rightChild->subkind.exp == IdK){
            numErrors++;

            printf("ERROR(%d): Initializer for variable '%s' is not a constant expression.\n", t->linenum, t->attr.name);
        }
        // if no more recursive ops, print error if CallK
        else if(leftChild->subkind.exp == CallK || rightChild->subkind.exp == CallK){
            numErrors++;

            printf("ERROR(%d): Initializer for variable '%s' is not a constant expression.\n", t->linenum, t->attr.name);
        }
    }
}

//debug function to print decl types
char *getDeclType(DeclKind d){
    char *returnExp;

    switch(d){
        case DeclK:
            returnExp = strdup("DeclK");
            return returnExp;
        case FuncK:
            returnExp = strdup("FuncK");
            return returnExp;
        case ParamK:
            returnExp = strdup("ParamK");
            return returnExp;
        default:
            return returnExp;
    }
}