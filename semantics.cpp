
// // // // // // // // // // // // // // // // // // // // // // // 
// CS445 - semantics.cpp
//
// Keller Lawson
// 
// Last Updated
// Feb 27, 2022   

#include "semantics.h"
#include "scanType.h"
#include "parser.tab.h"
#include "treeNode.h"
#include "symbolTable.h"

#include <stdio.h>
#include <stdlib.h>

SymbolTable st;
extern int numErrors;
extern int numWarnings;

int scopeDepth = 0;
int loopDepth = 1;
bool insideLoop = false;
bool stayInScope = true;

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

                        // if symbol is already declared, print error and increase count
                        if( !st.insert(t->attr.name, t)){
                            numErrors++;

                            currentNode = (TreeNode *)st.lookup(t->attr.name);
                            printf("ERROR(%d): Symbol '%s' is already declared at line %d.\n", t->linenum, t->attr.name, currentNode->linenum);
                         }

                        break;

                    case FuncK:
                        //printf("DeclK->FuncK\n");

                        // assign function scope as current TreeNode
                        funcScope = t;

                        //enter for scope
                        st.enter(t->attr.name);
                        stayInScope = false;

                        for(int i = 0; i < MAXCHILDREN; i++){
                            if(t->child[i] != NULL){
                                semanticAnalysis(t->child[i]);
                            }
                        }

                        // Only leave scope if you are not in global
                        if(st.depth() > 1){
                            st.leave();
                        }

                        break;

                    case ParamK:
                        
                        //printf("DeclK->ParamK\n");

                        for(int i = 0; i < MAXCHILDREN; i++){
                            //printf("DeclK->ParamK=> before semantic analysis\n");
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
                        insideLoop = true;
                        st.enter(t->attr.name);

                        for(int i = 0; i < MAXCHILDREN; i++){
                            if(t->child[0]){
                                semanticAnalysis(t->child[i]);
                            }
                        }

                        //exit loop
                        insideLoop = false;
                        st.leave();
                        break;

                    // multiple cases in a row without a break default to the last cases code
                    case WhileK:
                        //printf("Stmt->ForK, WhileK\n");

                        //enter loop
                        st.enter(t->attr.name);
                        insideLoop = true;
                        stayInScope = false;
                        loopDepth++;

                        for(int i = 0; i < MAXCHILDREN; i++){
                            if(t->child[i]){
                                semanticAnalysis(t->child[i]);
                            }
                        }

                        //exit loop
                        insideLoop = false;

                        stayInScope = true;
                        if(st.depth() > 1){
                            st.leave();
                            loopDepth--;
                        }

                        break;

                    case ForK:
                    
                        //printf("Stmt->ForK, WhileK\n");

                        //enter loop
                        insideLoop = true;

                        st.enter(t->attr.name);
                        stayInScope = false;
                        loopDepth++;

                        for(int i = 0; i < MAXCHILDREN; i++){
                            if(t->child[i]){
                                semanticAnalysis(t->child[i]);
                            }
                        }

                        //exit loop
                        insideLoop = false;

                        stayInScope = true;
                        if(st.depth() > 1){
                            st.leave();
                            loopDepth--;
                        }

                        break;

                    case CompoundK:
                    {
                        //printf("Compound %s\n", t->attr.name);
                        //printf("StmtK->CompoundK\n");
                        bool tempScope = stayInScope;

                        if(stayInScope){
                            st.enter("compound");
                            scopeDepth++;
                        }
                        else{
                            tempScope = true;
                        }
                        
                        for(int i = 0; i < MAXCHILDREN; i++){
                            if(t->child[i]){
                                semanticAnalysis(t->child[i]);
                            }
                        }            
                        
                        if(tempScope && st.depth() > 1){
                            st.leave();
                            scopeDepth--;
                        }
                        
                        break;
                    }

                    case ReturnK:
                        //printf("StmtK->ReturnK\n");

                        // return should only have 1 child to return
                        
                        semanticAnalysis(t->child[0]);
   
                        if(t->child[0]){
                            if(!funcScope){
                                break;
                            }
                            else{
                                // check if attempting to return an array, print error and increment count
                                if(t->child[0]->isArray){
                                    numErrors++;

                                    printf("ERROR(%d): Cannot return an array.\n", t->linenum);
                                }
                            }
                        }
            
                        break;

                    case BreakK:
                        //placeholder for future errors/checks
                        break;

                    case RangeK:
                        //printf("Stmt->RangeK\n");
                        
                        /*
                        for(int i = 0; i < MAXCHILDREN; i++){
                            if(t->child[i]){
                                semanticAnalysis(t->child[i]);
                            }
                        }
                        */
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

                        //remove this op after AssignK is working
                        //unaryBinaryOps(t, t->subkind.exp);

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

                        //remove this op after AssignK is working
                        //unaryBinaryOps(t, t->subkind.exp);

                        break;

                    case ConstantK:
                        // need to review this section
                        //printf("ExpK->ConstantK\n");

                        /*    
                        for(int i = 0; i < MAXCHILDREN; i++){
                            semanticAnalysis(t->child[i]);
                        }
                        */
                        
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
                            numErrors++;

                            printf("ERROR(%d): Symbol '%s' is not declared.\n", t->linenum, t->attr.name);
                        }
                        // if call is not to a func
                        else if(currentNode->subkind.decl != FuncK){
                            numErrors++;

                            printf("ERROR(%d): '%s' is a simple variable and cannot be called.\n", t->linenum, currentNode->attr.name);
                        }
                        else{
                            t->expType = currentNode->expType;
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

        // match assignment op
        if(!strcmp(t->attr.name, "<-")){
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
    }
    else{
        t->isBinary = false;
    }

    //if the op is unary
    if(!t->isBinary){

        if(!strcmp(t->attr.name, "-")){
            t->expType = Integer;

            //check typings for op
            if(t->child[0]->expType != UndefinedType){
                //t->expType is now Integer, child should be too
                if(t->expType != t->child[0]->expType){
                    numErrors++;

                    printf("ERROR(%d): Unary '%s' requires an operand of type %s but lhs was given type %s.\n", t->linenum, "chsign", "int", returnExpType(t->child[0]->expType));
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
            t->expType = Integer;

            //check for array
            if(!t->child[0]->isArray){
                numErrors++;

                printf("ERROR(%d): The operation '%s' does not work with arrays.\n", t->linenum, "sizeof");
            }
        }

        //check ? op
        if(!strcmp(t->attr.name, "?")){
            t->expType = Integer;

            //check typings for op
            if(t->child[0]->expType != UndefinedType){
                //t->expType is now Integer, child should be too
                if(t->expType != t->child[0]->expType){
                    numErrors++;

                    printf("ERROR(%d): Unary '%s' requires an operand of type %s but lhs was given type %s.\n", t->linenum, t->attr.name, "int", returnExpType(t->child[0]->expType));
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

                    printf("ERROR(%d): Unary '%s' requires operand of type %s but was given type %s.\n", t->linenum, t->attr.name, "bool", returnExpType(t->child[0]->expType));
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

                //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                printf("Line %d, Comparison Op: '%s'. \n",t->linenum, t->attr.name);
                if(t->child[0]){
                    printf("Line %d, Child 0: '%s'. \n", t->linenum, t->expType);
                }
                if(t->child[1]){
                    printf("Line %d, Child 1: '%s'. \n", t->linenum, t->expType);
                }

                //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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
}

//function to check for errors in IdK
void checkIdK(TreeNode *t){
    TreeNode *currentNode;

    t->expType = UndefinedType;
    currentNode = (TreeNode *)st.lookup(t->attr.name);

    // if t is not found in st
    if(!currentNode){
        numErrors++;

        printf("ERROR(%d): Symbol '%s' is not declared.\n", t->linenum, t->attr.name);
    }
    //node is found
    else{
        t->expType = currentNode->expType;
        t->subkind.decl = currentNode->subkind.decl;
        t->isArray = currentNode->isArray;

        // id cannot be a function
        if(t->subkind.decl == FuncK){
            numErrors++;

            printf("ERROR(%d): Cannot use function '%s' as a variable.\n", t->linenum, t->attr.name);
        }
    }
}

void unaryBinaryOps(TreeNode *t, ExpKind subkind){

    TreeNode *leftChild = t->child[0];
    ExpType leftChildExpType;
    bool leftChildIsArray, leftChildIsStr, leftChildError;

    TreeNode *rightChild = t->child[1];
    ExpType rightChildExpType;
    bool rightChildIsArray, rightChildIsStr, rightChildError;

    // LEFT CHILD
    if(leftChild){
        leftChildExpType = leftChild->expType;

        // check if array or not
        if(leftChild->child[0]){
            leftChildIsArray = false;
        }
        else{
            leftChildIsArray = leftChild->isArray;
        }

        // check if Exp, then what kind of exp
        if(leftChild->nodekind == ExpK){
            if(leftChild->subkind.exp == ConstantK){
                leftChildIsStr = true;
            }
            else if(leftChild->subkind.exp == CallK){
                leftChildIsArray = false;
            }
        }
    }

    // RIGHT CHILD, if it exists
    if(rightChild){
        rightChildExpType = rightChild->expType;

        // check if array or not
        if(rightChild->child[0]){
            rightChildIsArray = false;
        }
        else{
            rightChildIsArray = rightChild->isArray;
        }

        // check if Exp, then what kind of exp
        if(rightChild->nodekind == ExpK){
            if(rightChild->subkind.exp == ConstantK){
                rightChildIsStr = true;
            }
            else if(rightChild->subkind.exp == CallK){
                rightChildIsArray = false;
            }
        }

        // if the second child exists, then the Op is binary. 
        t->isBinary = true;
    }

    // check left child for Void Call Exp
    if(leftChildExpType == Void){
        if(!(leftChild->nodekind == ExpK && leftChild->subkind.exp == CallK)){
            leftChildError = true;
        }
    }

    // check right child for Void Call Exp
    if(rightChild){
        if(rightChildExpType == Void){
            if(!(rightChild->nodekind == ExpK && rightChild->subkind.exp == CallK)){
            rightChildError = true;
            }
        }
    }
    

    // start error check and print error functions

    // start with unary and check for error on left side of op
    if(!t->isBinary && !leftChildError){
        
        if(!strcmp(t->attr.name, "-")){
            //Integer
            if(t->child[0]->expType != Integer){
                //print error
                numErrors++;

                printf("ERROR(%d): Unary '%s' requires an operand of type %s but lhs was given type %s.\n", t->linenum, "chsign", "int", returnExpType(t->child[0]->expType));
            }
        }
        // size of, not multiply
        else if(!strcmp(t->attr.name, "*")){
            if(!t->child[0]->isArray){
                if(t->child[0]->expType != UndefinedType){
                    //print error
                    numErrors++;

                    printf("ERROR(%d): The operation '%s' only works with arrays.\n", t->linenum, "sizeof");
                }
            }
        }
        else if(!strcmp(t->attr.name, "?")){
            //Integer
            if(t->child[0]->expType != Integer){
                //print error
                numErrors++;

                printf("ERROR(%d): Unary '%s' requires operand of type %s but was given type %s.\n", t->linenum, t->attr.name, "int", returnExpType(t->child[0]->expType));
            }
        }
        else if(!strcmp(t->attr.name, "not")){
            //Boolean
            if(t->child[0]->expType != Boolean){
                //print error
                numErrors++;

                printf("ERROR(%d): Unary '%s' requires operand of type %s but was given type %s.\n", t->linenum, t->attr.name, "bool", returnExpType(t->child[0]->expType));
            }
        }
        else if(!strcmp(t->attr.name, "++")){
            //Integer
            if(t->child[0]->expType != Integer){
                //print error
                numErrors++;

                printf("ERROR(%d): Unary '%s' requires operand of type %s but was given type %s.\n", t->linenum, t->attr.name, "int", returnExpType(t->child[0]->expType));
            }
        }
        else if(!strcmp(t->attr.name, "--")){
            //Integer
            if(t->child[0]->expType != Integer){
                //print error
                numErrors++;

                printf("ERROR(%d): Unary '%s' requires operand of type %s but was given type %s.\n", t->linenum, t->attr.name, "int", returnExpType(t->child[0]->expType));
            }
        }

        // if the child is an array, then it only works with size of
        if(t->child[0]->isArray){
            if(strcmp(t->attr.name, "*")){
                numErrors++;

                printf("ERROR(%d): The operation '%s' does not work with arrays.\n", t->linenum, t->attr.name);
            }
        }
    }
    else if(t->isBinary){
        
         // if node is initialized, set flag
        if(!strcmp(t->attr.name, "<-")){
            if(t->child[0]->expType != t->child[1]->expType){
                numErrors++;

                printf("ERROR(%d): '%s' requires operands of the same type but lhs is type %s and rhs is type %s.\n", t->linenum, t->attr.name, returnExpType(t->child[0]->expType), returnExpType(t->child[1]->expType));
            }
            if(subkind == AssignK){
                t->child[0]->isInit = true;
            }
        }
        else{
            t->child[0]->isInit = false;
        }

        if(!strcmp(t->attr.name, "or") || !strcmp(t->attr.name, "and")){
            // Boolean

            // check left side of op
            if(t->child[0]->expType != Boolean){
                if(!leftChildError){
                    numErrors++;

                    printf("ERROR(%d): '%s' requires operands of type %s but lhs is of type %s.\n", t->linenum, t->attr.name, "bool", returnExpType(t->child[0]->expType));
                }
            }

            // check right side of op
            if(t->child[1]->expType != Boolean){
                if(!rightChildError){
                    numErrors++;

                    printf("ERROR(%d): '%s' requires operands of type %s but rhs is of type %s.\n", t->linenum, t->attr.name, "bool", returnExpType(t->child[1]->expType));
                }
            }

            // ddoes not work with arrays
            if(leftChildIsArray || rightChildIsArray){
                numErrors++;

                printf("ERROR(%d): The operation '%s' does not work with arrays.\n", t->linenum, t->attr.name);
            }
        }
        else if(!strcmp(t->attr.name, "<") || !strcmp(t->attr.name, ">") || !strcmp(t->attr.name, "=") ||
                    !strcmp(t->attr.name, ">=") || !strcmp(t->attr.name, "<=")){
            // CharInt

            // children types do not match
            if(t->child[0]->expType != t->child[1]->expType){
                if(!leftChildError && !rightChildError){
                    if(!strcmp(returnExpType(t->child[0]->expType), "int") && !strcmp(returnExpType(t->child[1]->expType), "CharInt")){
                        if(!strcmp(returnExpType(t->child[0]->expType), "int") && !strcmp(returnExpType(t->child[1]->expType), "CharInt")){
                            numErrors++;

                            printf("ERROR(%d): '%s' requires operands of the same type but lhs is type %s and rhs is type %s.\n", t->linenum, t->attr.name, "int", "char");
                        }
                    }
                    else if(!strcmp(returnExpType(t->child[0]->expType), "char") && !strcmp(returnExpType(t->child[1]->expType), "CharInt")){
                        // types match properly. 
                    }
                    else{
                        numErrors++;

                        printf("ERROR(%d): '%s' requires operands of the same type but lhs is type %s and rhs is type %s.\n", t->linenum, t->attr.name, returnExpType(t->child[0]->expType), returnExpType(t->child[1]->expType));
                    }
                }
            }

            //This one works with arrays
        }
        else if(!strcmp(t->attr.name, "+") || !strcmp(t->attr.name, "-") || !strcmp(t->attr.name, "*") || !strcmp(t->attr.name, "/") || !strcmp(t->attr.name, "%") ||
                    !strcmp(t->attr.name, "+=") || !strcmp(t->attr.name, "-=") || !strcmp(t->attr.name, "*=") || !strcmp(t->attr.name, "/=")){
            // Integer

            // check left side of op
            if(t->child[0]->expType != Integer){
                if(!leftChildError){
                    numErrors++;

                    printf("ERROR(%d): '%s' requires operands of type %s but lhs is of type %s.\n", t->linenum, t->attr.name, "int", returnExpType(t->child[0]->expType));
                }
            }

            // check right side of op
            if(t->child[1]->expType != Integer){
                if(!rightChildError){
                    numErrors++;

                    printf("ERROR(%d): '%s' requires operands of type %s but rhs is of type %s.\n", t->linenum, t->attr.name, "int", returnExpType(t->child[1]->expType));
                }
            }

            // ddoes not work with arrays
            if(leftChildIsArray || rightChildIsArray){
                numErrors++;

                printf("ERROR(%d): The operation '%s' does not work with arrays.\n", t->linenum, t->attr.name);
            }

        }
        else if(!strcmp(t->attr.name, "==") || !strcmp(t->attr.name, "!=")){
            // Undefined type
            // children types do not match
            if(t->child[0]->expType != t->child[1]->expType){
                if(!leftChildError && !rightChildError){
                    if(!strcmp(returnExpType(t->child[0]->expType), "int") && !strcmp(returnExpType(t->child[1]->expType), "CharInt")){
                        if(!strcmp(returnExpType(t->child[0]->expType), "int") && !strcmp(returnExpType(t->child[1]->expType), "CharInt")){
                            numErrors++;

                            printf("ERROR(%d): '%s' requires operands of the same type but lhs is type %s and rhs is type %s.\n", t->linenum, t->attr.name, "int", "char");
                        }
                    }
                    else if(!strcmp(returnExpType(t->child[0]->expType), "char") && !strcmp(returnExpType(t->child[1]->expType), "CharInt")){
                        // types match properly. 
                    }
                    else{
                        numErrors++;

                        printf("ERROR(%d): '%s' requires operands of the same type but lhs is type %s and rhs is type %s.\n", t->linenum, t->attr.name, returnExpType(t->child[0]->expType), returnExpType(t->child[1]->expType));
                    }
                }
            }

             // ddoes not work with arrays
            if(leftChildIsArray || rightChildIsArray){
                numErrors++;

                printf("ERROR(%d): The operation '%s' does not work with arrays.\n", t->linenum, t->attr.name);
            }
        }
        else if(!strcmp(t->attr.name, "=")){
            // Undefined type
            // children types do not match
            if(t->child[0]->expType != t->child[1]->expType){
                if(!leftChildError && !rightChildError){
                    if(!strcmp(returnExpType(t->child[0]->expType), "int") && !strcmp(returnExpType(t->child[1]->expType), "CharInt")){
                        if(!strcmp(returnExpType(t->child[0]->expType), "int") && !strcmp(returnExpType(t->child[1]->expType), "CharInt")){
                            numErrors++;

                            printf("ERROR(%d): '%s' requires operands of the same type but lhs is type %s and rhs is type %s.\n", t->linenum, t->attr.name, "int", "char");
                        }
                    }
                    else if(!strcmp(returnExpType(t->child[0]->expType), "char") && !strcmp(returnExpType(t->child[1]->expType), "CharInt")){
                        // types match properly. 
                    }
                    else{
                        numErrors++;

                        printf("ERROR(%d): '%s' requires operands of the same type but lhs is type %s and rhs is type %s.\n", t->linenum, t->attr.name, returnExpType(t->child[0]->expType), returnExpType(t->child[1]->expType));
                    }
                }
            }

            // checks for arrays
            else if(!strcmp(t->attr.name, "[")){
                if(leftChild && rightChild){
                    // if index of array is not another array
                    if(rightChild->expType != Integer && !rightChild->child[0]){
                        numErrors++;

                        printf("ERROR(%d): Array '%s' should be indexed by type int but got %s.\n", t->linenum, leftChild->attr.name, returnExpType(rightChild->expType));
                    }
                    // if index of array is another array
                    if(rightChild->expType != Integer && rightChild->child[0]){
                        // if there is no index to child array
                        if(!rightChild->child[1]){
                            numErrors++;

                            printf("ERROR(%d): Array index is the unindexed array '%s'.\n", t->linenum, rightChild->child[0]->attr.name);
                        }
                    }


                }
            }

             // ddoes not work with arrays
            if(leftChildIsArray || rightChildIsArray){
                numErrors++;

                printf("ERROR(%d): The operation '%s' does not work with arrays.\n", t->linenum, t->attr.name);
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