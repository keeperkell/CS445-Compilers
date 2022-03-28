
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

SymbolTable st;
extern int numErrors;
extern int numWarnings;

int scopeDepth = 0;
int loopDepth = 1;
int position = 0;
bool insideScope = false;
bool insideRange = false;
bool insideFor = false;
bool hasReturn = false;
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
                
                // check subkind and switch off of it
                switch(t->subkind.decl){
                    
                    case VarK:
                        //printf("VarK %s\n", t->attr.name);

                        for(int i = 0; i < MAXCHILDREN; i++){
                            if(t->child[0] != NULL){
                                semanticAnalysis(t->child[0]);
                            }
                        }

                        // if symbol is already declared, print error and increase count
                        if( !st.insert(t->attr.name, t)){
                            numErrors++;

                            currentNode = (TreeNode *)st.lookup(t->attr.name);
                            printf("ERROR(%d): Symbol '%s' is already declared at line %d.\n", t->linenum, t->attr.name, currentNode->linenum);
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

                        // if multiple vars declared static on a line
                        if(t->sibling){
                            if(t->isStatic){
                                if(t->linenum == t->sibling->linenum){
                                    t->sibling->isStatic = t->isStatic;
                                }
                            }
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
                            if(!t->child[0]->declErrReport){
                                numErrors++;

                                printf("ERROR(%d): Expecting Boolean test condition in %s statement but got type %s.\n", t->linenum, "while", returnExpType(t->child[0]->expType));
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
                        }

                        //For requires first 2 param be init
                        t->child[0]->isInit = true;
                        t->child[1]->isInit = true;

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

                                        //check matching types and func expects a return
                                        if(t->child[0]->expType != scope->expType){
                                            if(t->child[0]->expType != Void && scope->expType != Void){
                                                // char and char int are the same
                                                if(!(t->child[0]->expType == Char && scope->expType == CharInt) || !(t->child[0]->expType == CharInt && scope->expType == Char)){
                                                     numErrors++;

                                                    printf("ERROR(%d): Function '%s' at line %d is expecting to return type %s but returns type %s.\n",
                                                                t->linenum, scope->attr.name, scope->linenum, returnExpType(scope->expType), returnExpType(currentNode->expType));

                                                }
                                            }
                                        }
                                            
                                        // check if func expects no return value
                                        else if(scope->expType == Void){
                                            numErrors++;

                                            printf("ERROR(%d): Function '%s' at line %d is expecting no return value, but return has a value.\n", t->linenum, scope->attr.name, scope->linenum);
                                        }
                                    }
                                }

                                if(t->child[0]->subkind.exp == CallK){
                                    currentNode = (TreeNode *)st.lookup(t->child[0]->attr.name);

                                    if(currentNode){
                                        currentNode->isUsed = true;

                                        // check if array
                                        if(t->child[0]->isArray){
                                            numErrors++;

                                            printf("ERROR(%d): Cannot return an array.\n", t->linenum);
                                        }

                                        //check matching types and func expects a return
                                        if(t->child[0]->expType != scope->expType && scope->expType != Void){
                                            numErrors++;

                                            printf("ERROR(%d): Function '%s' at line %d is expecting to return type %s but returns type %s.\n",
                                                            t->linenum, scope->attr.name, scope->linenum, returnExpType(scope->expType), returnExpType(currentNode->expType));
                                        }
                                        // check if func expects no return value
                                        else if(scope->expType == Void){
                                            numErrors++;

                                            printf("ERROR(%d): Function '%s' at line %d is expecting no return value, but return has a value.\n", t->linenum, scope->attr.name, scope->linenum);
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
                        if(st.depth() <= 2){
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
                                            if(!t->declErrReport){
                                                numErrors++;
                                                t->declErrReport = true;

                                                printf("ERROR(%d): Symbol '%s' is not declared.\n", t->linenum, t->child[0]->attr.name);
                                            }
                                            
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
                        for(int i = 0; i < MAXCHILDREN; i++){
                            if(t->child[i]){
                                semanticAnalysis(t->child[i]);
                            }
                        }

                        // new function to perform only 
                        checkAssignK(t);

                        break;

                    case OpK:
                        // OpK will 1 or 2 child nodes(unary or binary)
                        // Need to have logic specific for each side, starting with left
                        // to account for unary
                        
                        
                        for(int i = 0; i < MAXCHILDREN; i++){
                            if(t->child[i]){
                                semanticAnalysis(t->child[i]);
                            }
                        }

                        checkOpK(t);

                        break;

                    case ConstantK:
                        // need to review this section
                        //printf("ExpK->ConstantK\n");

                        // range needs ints
                        if(insideRange){
                            if(t->expType != Integer){
                                numErrors++;

                                printf("ERROR(%d): Expecting type int in position %d in range of for statement but got type %s", t->linenum, position, returnExpType(t->expType));
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
void checkAssignK(TreeNode *t){
    TreeNode *leftChild;
    TreeNode *rightChild;

    if(t->child[0]){
        leftChild = (TreeNode *)st.lookup(t->child[0]->attr.name);

        if(leftChild){
            t->child[0]->expType = leftChild->expType;
            t->child[0]->isArray = leftChild->isArray;

            leftChild->isInit = true;
        }
    }
    // Assign is not a unary funcion
    if(!t->child[1]){
        if(t->child[0]->isArray){
            numErrors++;

            printf("ERROR(%d): The operation '%s' does not work with arrays.\n", t->linenum, t->attr.name);
        }

        if(t->child[0]->expType != Integer){
            numErrors++;

            printf("ERROR(%d): Unary '%s' requires an operand of type int but was given type %s.\n", t->linenum, t->attr.name, returnExpType(t->child[0]->expType));
        }
    }
    else{
        if(t->child[0]){
            // match assignment op
            if(!strcmp(t->attr.name, "<-") || !strcmp(t->attr.name, ":")){

                //check if assign right child is id
                if(t->child[1] && t->child[1]->subkind.exp == IdK){
                    t->child[0]->isInit = true;

                    rightChild = (TreeNode *)st.lookup(t->child[1]->attr.name);

                    if(rightChild){
                        rightChild->isUsed = true;
                        
                        if(!rightChild->isInit && !rightChild->warningReported){
                            rightChild->warningReported = true;

                            numWarnings++;

                            printf("WARNING(%d): Variable '%s' may be uninitialized when used here.\n", t->linenum, rightChild->attr.name);
                        }
                    }
                }

                // array assign checks
                if(t->child[0]->child[0]){
                    if(!strcmp(t->child[0]->attr.name, "[")){

                        // check if non const inside indeces
                        if(t->child[0]->child[1]){
                            t->child[0]->child[1]->isInit = true;

                            // op can be inside index as well
                            // ugly but brute force method for now
                            if(t->child[0]->child[1]->child[0]){
                                if(t->child[0]->child[1]->subkind.exp == OpK){
                                    t->child[0]->child[1]->child[0]->isInit = true;

                                    // op can be unary or binary, check other child
                                    if(t->child[0]->child[1]->child[1]){
                                        t->child[0]->child[1]->child[1]->isInit = true;
                                    }
                                }
                            }
                        }


                        t->child[0]->child[0]->isInit = true;
                    }
                }

                //assign childs typing to t node
                t->expType = t->child[0]->expType;

                //check for matching types for both children
                if(t->child[0]->expType != UndefinedType && t->child[1]->expType != UndefinedType){
                    if(t->child[0]->expType != t->child[1]->expType){
                        numErrors++;

                        printf("ERROR(%d): '%s' requires operands of the same type but lhs is type %s and rhs is type %s.\n", t->child[0]->linenum, t->attr.name, returnExpType(t->child[0]->expType), returnExpType(t->child[1]->expType));
                    }
                }

                // check if one of children is an arry but not the other
                if(t->child[0]->isArray && !t->child[1]->isArray){
                    numErrors++;

                    printf("ERROR(%d): '%s' requires both operands be arrays or not but lhs is an array and rhs is not an array.\n", t->linenum, t->attr.name);
                }
                if(!t->child[0]->isArray && t->child[1]->isArray){
                    numErrors++;

                    printf("ERROR(%d): '%s' requires both operands be arrays or not but lhs is not an array and rhs is an array.\n", t->linenum, t->attr.name);
                }
            }
            else{
                // review this section. possible issues
                t->expType = Integer;

                // assign ops besides <- must be of type int
                // Ex: *= += ++
                if(t->child[0]->expType != UndefinedType && t->child[1]->expType != UndefinedType){
                    if(t->child[0]->expType != Integer){
                        numErrors++;

                        printf("ERROR(%d): '%s' requires operands of type int but lhs is of type %s.\n", t->child[0]->linenum, t->attr.name, returnExpType(t->child[0]->expType));
                    }

                    if(t->child[1]->expType != Integer){
                        numErrors++;

                        printf("ERROR(%d): '%s' requires operands of type int but rhs is of type %s.\n", t->child[1]->linenum, t->attr.name, returnExpType(t->child[1]->expType));
                    }
                }

                // cannot increment-assign arrays or by arrays
                if(t->child[0]->isArray){
                    numErrors++;

                    printf("ERROR(%d): The operation '%s' does not work with arrays.\n", t->child[0]->linenum, t->attr.name);
                }

                if(t->child[1]->isArray){
                    numErrors++;

                    printf("ERROR(%d): The operation '%s' does not work with arrays.\n", t->child[1]->linenum, t->attr.name);
                }
            }
        }
    }

    // check if 1st assign child is Var, if yes then isInit True
    if(t->child[0]){
            t->child[0]->isInit = true;
    }

    // check if var is used, "<-" does not count as used
    if(t->child[0]){
        if(strcmp(t->attr.name, "<-")){
            t->child[0]->isUsed = true;

            if(t->child[1]){
                t->child[1]->isUsed = true;
            }
        } 
    }
}

//function to check for errors in OpK
void checkOpK(TreeNode *t){
    TreeNode *leftChild;
    TreeNode *rightChild;

    if(t->child[0]){
        if(t->child[0]->subkind.exp == IdK){
            leftChild = (TreeNode *)st.lookup(t->child[0]->attr.name);

            if(leftChild){
                t->child[0]->expType = leftChild->expType;
                t->child[0]->isArray = leftChild->isArray;
            }
        }
    }

    if(t->child[0] && t->child[1]){
        t->isBinary = true;
        t->child[0]->isUsed = true;
        t->child[1]->isUsed = true;
    }
    else{
        t->isBinary = false;
        t->child[0]->isUsed = true;
    }

    //if the op is unary
    if(!t->isBinary){

        if(!strcmp(t->attr.name, "-")){
            //t->expType = Integer;

            //check typings for op
            if(t->child[0]->expType != UndefinedType){
                //t->expType is now Integer, child should be too
                if(t->expType != t->child[0]->expType){
                    numErrors++;

                    printf("ERROR(%d): Unary '%s' requires an operand of type %s but was given type %s.\n", t->linenum, "chsign", "int", returnExpType(t->child[0]->expType));
                }
            }

            //check for array
            if(t->child[0]->isArray){
                numErrors++;

                printf("ERROR(%d): The operation '%s' does not work with arrays.\n", t->linenum, "chsign");
            }

            t->isArray = t->child[0]->isArray;
        }

        // check sizeof op
        if(!strcmp(t->attr.name, "*")){
            //t->expType = Integer;

            //check for array
            if(!t->child[0]->isArray){
                numErrors++;

                printf("ERROR(%d): The operation '%s' only works with arrays.\n", t->linenum, "sizeof");
            }
        }

        //check ? op
        if(!strcmp(t->attr.name, "?")){
            //t->expType = Integer;

            //check typings for op
            if(t->child[0]->expType != UndefinedType){
                //t->expType is now Integer, child should be too
                if(t->expType != t->child[0]->expType){
                    numErrors++;

                    printf("ERROR(%d): Unary '%s' requires an operand of type %s but was given type %s.\n", t->linenum, t->attr.name, "int", returnExpType(t->child[0]->expType));
                }
            }

            //check for array
            if(t->child[0]->isArray){
                numErrors++;

                printf("ERROR(%d): The operation '%s' does not work with arrays.\n", t->linenum, t->attr.name);
            }

            t->isArray = t->child[0]->isArray;
        }

        // checks for not operation
        if(!strcmp(t->attr.name, "not")){
            t->expType = Boolean;

            // check typings
            if(t->child[0]->expType != UndefinedType){
                //t->expType is now Boolean, child should be too
                if(t->expType != t->child[0]->expType){
                    numErrors++;

                    printf("ERROR(%d): Unary '%s' requires an operand of type %s but was given type %s.\n", t->linenum, t->attr.name, "bool", returnExpType(t->child[0]->expType));
                }
            }

            //check for array
            if(t->child[0]->isArray){
                numErrors++;

                printf("ERROR(%d): The operation '%s' does not work with arrays.\n", t->linenum, "not");
            }

            t->isArray = t->child[0]->isArray;
        }

        // END OF UNARY
    }
    else{
        // START OF BINARY

        if(t->child[1]->subkind.exp == IdK){

            rightChild = (TreeNode *)st.lookup(t->child[1]->attr.name);

            if(rightChild){

                t->child[1]->expType = rightChild->expType;
                t->child[1]->isArray = rightChild->isArray;
            }

            // or/and have the same errors and checks
            if(!strcmp(t->attr.name, "or") || !strcmp(t->attr.name, "and")){

                t->expType = Boolean;

                // check if left and right children are boolean
                if(t->child[0]->expType != Boolean){
                    numErrors++;

                    printf("ERROR(%d): '%s' requires operands of type %s but lhs is of type %s.\n", t->linenum, t->attr.name, "bool", returnExpType(t->child[0]->expType));
                }

                if(t->child[1]->expType != Boolean){
                    numErrors++;

                    printf("ERROR(%d): '%s' requires operands of type %s but rhs is of type %s.\n", t->linenum, t->attr.name, "bool", returnExpType(t->child[1]->expType));
                }

                //check if either child is an array
                if(t->child[0]->isArray || t->child[1]->isArray){
                    numErrors++;

                    printf("ERROR(%d): The operation '%s' does not work with arrays.\n", t->linenum, t->attr.name);
                }
            }
            // all comparison operators are the same
            else if(!strcmp(t->attr.name, "<") || !strcmp(t->attr.name, ">") || !strcmp(t->attr.name, "=") ||
                    !strcmp(t->attr.name, ">=") || !strcmp(t->attr.name, "<=") || !strcmp(t->attr.name, "!=")){

                t->expType = Boolean;

                //check for mathcing types of children
                if(t->child[0]->expType != UndefinedType && t->child[1]->expType != UndefinedType){
                    if(t->child[0]->expType != t->child[1]->expType){
                        numErrors++;

                        printf("ERROR(%d): '%s' requires operands of the same type but lhs is type %s and rhs is type %s.\n", t->linenum, t->attr.name, returnExpType(t->child[0]->expType), returnExpType(t->child[1]->expType));
                    }
                }

                //check if 1 child is array but other isnt
                if(t->child[0]->isArray && !t->child[1]->isArray){
                    numErrors++;

					printf("ERROR(%d): '%s' requires both operands be arrays or not but lhs is an array and rhs is not an array.\n", t->linenum, t->attr.name);
                }

                if(!t->child[0]->isArray && t->child[1]->isArray){
                    numErrors++;

					printf("ERROR(%d): '%s' requires both operands be arrays or not but lhs is not an array and rhs is an array.\n", t->linenum, t->attr.name);
                }
            }
            // check for arrays
            else if(!strcmp(t->attr.name, "[")){

                t->expType = t->child[0]->expType;

                //check if child is an array
                if(!t->child[0]->isArray){
                    numErrors++;

                    printf("ERROR(%d): Cannot index nonarray '%s'.\n", t->linenum, t->child[0]->attr.name);
                }

                // check for index of array
                if(t->child[1]->isArray){
                    numErrors++;

                    printf("ERROR(%d): Array index is the unindexed array '%s'.\n", t->linenum, t->child[1]->attr.name);
                }

                // check if index is Int
                if(t->child[0]->expType != UndefinedType && t->child[1]->expType != UndefinedType){
                    if(t->child[1]->expType != Integer){
                        numErrors++;

                        printf("ERROR(%d): Array '%s' should be indexed by type int but got type %s.\n", t->linenum, t->child[0]->attr.name, returnExpType(t->child[1]->expType));
                    }
                }
            }
            // the rest of the cases are the same
            else{

                //t->expType = Integer;

                //check left and right typings
                if(t->child[0]->expType != Integer){
                    numErrors++;

				    printf("ERROR(%d): '%s' requires operands of type int but lhs is of type %s.\n", t->linenum, t->attr.name, returnExpType(t->child[0]->expType));
                }

                if(t->child[1]->expType != Integer){
                    numErrors++;
                    
				    printf("ERROR(%d): '%s' requires operands of type int but rhs is of type %s.\n", t->linenum, t->attr.name, returnExpType(t->child[1]->expType));
                }

                //check for arrays
                if(t->child[0]->isArray || t->child[1]->isArray){
                    numErrors++;

                    printf("ERROR(%d): The operation '%s' does not work with arrays.\n", t->linenum, t->attr.name);
                }
            }
        }
        else{
            
            // or/and have the same errors and checks
            if(!strcmp(t->attr.name, "or") || !strcmp(t->attr.name, "and")){

                t->expType = Boolean;

                // check if left and right children are boolean
                if(t->child[0]->expType != Boolean){
                    numErrors++;

                    printf("ERROR(%d): '%s' requires operands of type %s but lhs is of type %s.\n", t->linenum, t->attr.name, "bool", returnExpType(t->child[0]->expType));
                }

                if(t->child[1]->expType != Boolean){
                    numErrors++;

                    printf("ERROR(%d): '%s' requires operands of type %s but rhs is of type %s.\n", t->linenum, t->attr.name, "bool", returnExpType(t->child[1]->expType));
                }

                //check if either child is an array
                if(t->child[0]->isArray || t->child[1]->isArray){
                    numErrors++;

                    printf("ERROR(%d): The operation '%s' does not work with arrays.\n", t->linenum, t->attr.name);
                }
            }
            // all comparison operators are the same
            else if(!strcmp(t->attr.name, "<") || !strcmp(t->attr.name, ">") || !strcmp(t->attr.name, "=") ||
                    !strcmp(t->attr.name, ">=") || !strcmp(t->attr.name, "<=") || !strcmp(t->attr.name, "!=")){

                t->expType = Boolean;

                //check for mathcing types of children
                if(t->child[0]->expType != UndefinedType && t->child[1]->expType != UndefinedType){
                    if(t->child[0]->expType != t->child[1]->expType){
                        numErrors++;

                        printf("ERROR(%d): '%s' requires operands of the same type but lhs is type %s and rhs is type %s.\n", t->linenum, t->attr.name, returnExpType(t->child[0]->expType), returnExpType(t->child[1]->expType));
                    }
                }

                //check if 1 child is array but other isnt
                if(t->child[0]->isArray && !t->child[1]->isArray){
                    numErrors++;

					printf("ERROR(%d): '%s' requires both operands be arrays or not but lhs is an array and rhs is not an array.\n", t->linenum, t->attr.name);
                }

                if(!t->child[0]->isArray && t->child[1]->isArray){
                    numErrors++;

					printf("ERROR(%d): '%s' requires both operands be arrays or not but lhs is not an array and rhs is an array.\n", t->linenum, t->attr.name);
                }
            }
            // check for arrays
            else if(!strcmp(t->attr.name, "[")){

                t->expType = t->child[0]->expType;

                //check if child is an array
                if(!t->child[0]->isArray){
                    numErrors++;

                    printf("ERROR(%d): Cannot index nonarray '%s'.\n", t->linenum, t->child[0]->attr.name);
                }

                // check for index of array
                if(t->child[1]->isArray){
                    numErrors++;

                    printf("ERROR(%d): Array index is the unindexed array '%s'.\n", t->linenum, t->child[1]->attr.name);
                }

                // check if index is Int
                if(t->child[0]->expType != UndefinedType && t->child[1]->expType != UndefinedType){
                    if(t->child[1]->expType != Integer){
                        numErrors++;

                        printf("ERROR(%d): Array '%s' should be indexed by type int but got type %s.\n", t->linenum, t->child[0]->attr.name, returnExpType(t->child[1]->expType));
                    }
                }
            }
            // the rest of the cases are the same
            else{

                t->expType = Integer;

                //check left and right typings
                if(t->child[0]->expType != Integer){
                    numErrors++;

				    printf("ERROR(%d): '%s' requires operands of type int but lhs is of type %s.\n", t->linenum, t->attr.name, returnExpType(t->child[0]->expType));
                }

                if(t->child[1]->expType != Integer){
                    numErrors++;
                    
				    printf("ERROR(%d): '%s' requires operands of type int but rhs is of type %s.\n", t->linenum, t->attr.name, returnExpType(t->child[1]->expType));
                }

                //check for arrays
                if(t->child[0]->isArray || t->child[1]->isArray){
                    numErrors++;

                    printf("ERROR(%d): The operation '%s' does not work with arrays.\n", t->linenum, t->attr.name);
                }
            }
        }

        //END OF BINARY
    }

    //assign flags for vars of child[0]
    if(t->child[0]){
        
        if(t->child[0]->subkind.decl == VarK || t->child[0]->subkind.decl == ParamK || t->child[0]->subkind.exp == IdK){
            TreeNode *currentNode = (TreeNode *)st.lookup(t->child[0]->attr.name);

            if(currentNode){
                currentNode->isUsed = true;

                // check if var is inititalized
                if(!currentNode->isInit && !currentNode->warningReported){
                    currentNode->warningReported = true;

                    numWarnings++;

                    printf("WARNING(%d): Variable '%s' may be uninitialized when used here.\n", t->linenum, currentNode->attr.name);
                }
            }
        }
    }

    //assign flags for vars of child[1]
    if(t->child[1]){

        if(t->child[1]->subkind.decl == VarK || t->child[1]->subkind.decl == ParamK || t->child[1]->subkind.exp == IdK){
            TreeNode *currentNode = (TreeNode *)st.lookup(t->child[1]->attr.name);

            if(currentNode){
                currentNode->isUsed = true;

                // check if var is inititalized
                if(!currentNode->isInit && !currentNode->warningReported){
                    currentNode->warningReported = true;

                    numWarnings++;

                    printf("WARNING(%d): Variable '%s' may be uninitialized when used here.\n", t->linenum, currentNode->attr.name);
                }
            }
        }
    }
}

//function to check for errors in IdK
void checkIdK(TreeNode *t){
    TreeNode *currentNode;

    t->expType = UndefinedType;
    currentNode = (TreeNode *)st.lookup(t->attr.name);

    // if t is not found in st
    if(!currentNode){
        if(!t->declErrReport){
            numErrors++;
            t->declErrReport = true;

            printf("ERROR(%d): Symbol '%s' is not declared.\n", t->linenum, t->attr.name);
        }
    }
    //node is found
    else{
        t->expType = currentNode->expType;
        t->isArray = currentNode->isArray;
        t->isInit = currentNode->isInit;

        // id cannot be a function
        if(currentNode->subkind.decl == FuncK){
            numErrors++;

            printf("ERROR(%d): Cannot use function '%s' as a variable.\n", t->linenum, t->attr.name);
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

            printf("ERROR(%d): Expecting type int in position %d in range of for statement but got type %s", t->linenum, 1, returnExpType(t->child[1]->child[0]->expType));
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

            printf("ERROR(%d): Expecting type int in position %d in range of for statement but got type %s", t->linenum, 2, returnExpType(t->child[1]->child[1]->expType));
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

            printf("ERROR(%d): Expecting type int in position %d in range of for statement but got type %s", t->linenum, 3, returnExpType(t->child[1]->child[2]->expType));
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