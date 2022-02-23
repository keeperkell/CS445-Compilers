// // // // // // // // // // // // // // // // // // // // // // // 
// CS445 - semantics.cpp
//
// Keller Lawson
// 
// Last Updated
// Feb 19, 2022   

#include "semantics.h"
#include "scanType.h"
#include "parser.tab.h"
#include "treeNode.h"
#include "symbolTable.h"

#include <stdio.h>
#include <stdlib.h>

extern SymbolTable st;
extern int numErrors;
extern int numWarnings;

int scopeDepth = 0;
int loopDepth = 1;
bool insideLoop = false;
bool stayInScope = true;

TreeNode *funcScope;

void semanticAnalysis(TreeNode *t){
    TreeNode *currentNode;
    TreeNode *childNode1 = t->child[0];
    TreeNode *childNode2 = t->child[1];
    TreeNode *childNode3 = t->child[2];
    
    if(!t){
        return;
    }
    else{
        switch(t->nodekind){
            
            
            case DeclK:

                /*
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

                */
                
                // check subkind and switch off of it
                switch(t->subkind.decl){
                    case VarK:
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
                        // assign function scope as current TreeNode
                        funcScope = t;

                        //enter for scope
                        st.enter(t->attr.name);
                        for(int i = 0; i < MAXCHILDREN; i++){
                            if(t->child[i] != NULL){
                                semanticAnalysis(t->child[i]);
                            }
                        }
                        st.leave();

                        break;

                    case ParamK:
                        //currentNode = (TreeNode *)st.lookup(t->attr.name);

                        for(int i = 0; i < MAXCHILDREN; i++){
                            semanticAnalysis(t->child[i]);
                        }

                        break;
                }
                break;
            
            case StmtK:

                // check if childnodes 1 through 3 exist. If they exists, check if their children exist
                // if children of children do exist, then they cannot be an array
                if(childNode1){
                    if(childNode1->child[0]){
                        childNode1->isArray = false;
                    }
                }

                if(childNode2){
                    if(childNode2->child[0]){
                        childNode2->isArray = false;
                    }
                }

                if(childNode2){
                    if(childNode2->child[0]){
                        childNode2->isArray = false;
                    }
                }

                switch(t->subkind.stmt){
                    case NullK:
                        //placeholder for future errors/checks
                        break;

                    case IfK:
                        //placeholder for future errors/checks
                        break;

                    // multiple cases in a row without a break default to the last cases code
                    case WhileK:
                    case ForK:
                        
                        // find initial loop depth and enter loop
                        if(!insideLoop){
                            insideLoop = true;
                            loopDepth = st.depth();
                        }

                        // if current loopDepth is the same as symbol table, exit loop
                        if(loopDepth == st.depth()){
                            insideLoop = false;
                        }
                        break;

                    case CompoundK:
                        

                        if(stayInScope){
                            st.enter("compound");
                        }
                        else{
                            stayInScope = true;
                        }

                        for(int i = 0; i < MAXCHILDREN; i++){
                            semanticAnalysis(t->child[i]);
                        }

                        if(stayInScope){
                            st.leave();
                        }
                        break;

                    case ReturnK:

                        // return should only have 1 child to return
                        semanticAnalysis(childNode1);

                        if(childNode1){
                            if(!funcScope){
                                break;
                            }
                            else{
                                // check if attempting to return an array, print error and increment count
                                if(t->isArray){
                                    numErrors++;

                                    printf("ERROR(%d): Cannot return an array.\n", currentNode->linenum);
                                }
                            }
                        }
            
                        break;

                    case BreakK:
                        //placeholder for future errors/checks
                        break;

                    case RangeK:
                        //placeholder for future errors/checks
                        break;
                }
                break;

            case ExpK:
                switch(t->subkind.exp){
                    case OpK:
                        // OpK will 1 or 2 child nodes(unary or binary)
                        // Need to have logic specific for each side, starting with left
                        // to account for unary

                        for(int i = 0; i < MAXCHILDREN; i++){
                            if(t->child[i]){
                                semanticAnalysis(t->child[i]);
                            }
                        }

                        if(childNode1 && childNode2){
                            t->isBinary = true;
                        }

                        if(t->isBinary){
                            binaryOps(t, t->subkind.exp);
                        }
                        else{
                            unaryOps(t, t->subkind.exp);
                        }

                        break;

                    case ConstantK:
                        for(int i = 0; i < MAXCHILDREN; i++){
                            semanticAnalysis(t->child[i]);
                        }
                        break;

                    case IdK:
                        currentNode = (TreeNode *)st.lookup(t->attr.name);

                        if(!currentNode){
                            numErrors++;

                            printf("ERROR(%d): Symbol '%s' is not declared.\n", t->linenum, t->attr.name);
                            t->expType = UndefinedType;
                        }
                        else if(currentNode){
                            if(currentNode->subkind.decl == FuncK){
                                numErrors++;

                                printf("ERROR(%d): Cannot use function '%s' as a variable.\n", currentNode->linenum, currentNode->attr.name);
                                t->expType = UndefinedType;
                            }
                        }
                        break;

                    case AssignK:
                        //placeholder for future errors/checks
                        break;

                    case CallK:

                        for(int i = 0; i < MAXCHILDREN; i++){
                            semanticAnalysis(t->child[i]);
                        }

                        currentNode = (TreeNode *)st.lookup(t->attr.name);

                        if(currentNode){
                            // if call is not to a func
                            if(currentNode->subkind.decl == VarK || currentNode->subkind.decl == ParamK){
                                numErrors++;

                                printf("ERROR(%d): '%s' is a simple variable and cannot be called.\n", currentNode->linenum, currentNode->attr.name);
                            } 
                            else{
                                t->expType = currentNode->expType;
                                t->isStatic = currentNode->isStatic;
                                t->isArray = currentNode->isArray;
                            }    
                        }
                        else{
                            numErrors++;

                            printf("ERROR(%d): Symbol '%s' is not declared.\n", t->linenum, t->attr.name);
                        }

                        break;

                    default:
                        break;
                }  
                break;

            default:
                printf("I am in default \n");
                break;
        }

        if(t->sibling){
            semanticAnalysis(t->sibling);
        }
    }
}

// moved logic from inside OpK & AssignK
void unaryOps(TreeNode *t, ExpKind subkind){
    switch(subkind){
        case OpK:
            TreeNode *childNode;

            if(t->child[0]){
                childNode = t->child[0];
            }

            if(!strcmp(t->attr.name, "-")){
                if(childNode->subkind.exp == ConstantK){
                    if(childNode->child[0]){
                        if(childNode->child[0]->subkind.exp != ConstantK){
                            numErrors++;

                            printf("ERROR(%d): Unary '%s' requires an operand of %s but was given %s.\n",
                                        t->linenum, t->attr.name, "int", returnExpType(childNode->expType));
                        }
                        if(childNode->expType != Integer){
                            numErrors++;

                            printf("ERROR(%d): Unary '%s' requires an operand of %s but was given %s.\n",
                                        t->linenum, t->attr.name, "int", returnExpType(childNode->expType));
                        }
                    }
                }
                if(childNode->subkind.exp == IdK){
                    TreeNode *currentChildNode = (TreeNode *)st.lookup(childNode->attr.name);

                    if(currentChildNode){
                        if(currentChildNode->expType != Integer){
                            numErrors++;

                            printf("ERROR(%d): Unary '%s' requires an operand of %s but was given %s.\n",
                                        t->linenum, t->attr.name, "int", returnExpType(childNode->expType));
                        }
                    }
                }
            }

            else if(!strcmp(t->attr.name, "*")){

            }

            else if(!strcmp(t->attr.name, "?")){
                if(childNode->subkind.exp == IdK){
                    TreeNode *currentChildNode = (TreeNode *)st.lookup(childNode->attr.name);

                    if(currentChildNode){
                        if(currentChildNode->expType != Integer){
                            numErrors++;

                            printf("ERROR(%d): Unary '%s' requires an operand of %s but was given %s.\n",
                                        t->linenum, t->attr.name, "int", returnExpType(childNode->expType));
                            }
                    }
                }
                else{
                    if(childNode->expType != Integer){
                        numErrors++;

                        printf("ERROR(%d): Unary '%s' requires an operand of %s but was given %s.\n",
                                    t->linenum, t->attr.name, "int", returnExpType(childNode->expType));
                    }
                }
            }

            else if(!strcmp(t->attr.name, "not")){
                if(childNode->child[0]){
                    numErrors++;

                    printf("ERROR(%d): Unary '%s' requires an operand of %s but was given %s.\n",
                                t->linenum, t->attr.name, "bool", returnExpType(childNode->expType));
                }
                else{
                    switch(childNode->subkind.exp){

                        case ConstantK:
                            if(childNode->expType != Boolean){
                                numErrors++;

                                printf("ERROR(%d): Unary '%s' requires an operand of %s but was given %s.\n",
                                            t->linenum, t->attr.name, "bool", returnExpType(childNode->expType));
                            }
                            else if(t->expType != childNode->expType){
                                numErrors++;

                                printf("ERROR(%d): Unary '%s' requires an operand of %s but was given %s.\n",
                                            t->linenum, t->attr.name, "bool", returnExpType(childNode->expType));
                            }

                        break;

                        case IdK:
                            TreeNode *currentChildNode = (TreeNode *)st.lookup(childNode->attr.name);

                            if(currentChildNode){
                                if(currentChildNode->expType != Boolean){
                                    numErrors++;

                                    printf("ERROR(%d): Unary '%s' requires an operand of %s but was given %s.\n",
                                                t->linenum, t->attr.name, "bool", returnExpType(childNode->expType));
                                }
                            }
                    }
                }
            }

            else if(!strcmp(t->attr.name, "++")){
            
            }

            else if(!strcmp(t->attr.name, "--")){

            }

            break;

        case AssignK:

            if(t->child[0]){
                childNode = t->child[0];
            }

            if(!strcmp(t->attr.name, "-")){

                if(childNode->expType != Integer && childNode->expType != UndefinedType){
                    numErrors++;

                    printf("ERROR(%d): Unary '%s' requires an operand of %s but was given %s.\n",
                                        t->linenum, "chsign", "int", returnExpType(childNode->expType));
                }

            }

            else if(!strcmp(t->attr.name, "*")){

                if(!childNode->isArray){
                    unaryOps(t, OpK);
                }
            }

            else if(!strcmp(t->attr.name, "?")){

                if(childNode->expType != Integer && childNode->expType != UndefinedType){
                    numErrors++;

                    printf("ERROR(%d): Unary '%s' requires an operand of %s but was given %s.\n",
                                        t->linenum, t->attr.name, "int", returnExpType(childNode->expType));
                }
            }

            else if(!strcmp(t->attr.name, "not")){

                if(childNode->expType != Integer && childNode->expType != UndefinedType){
                    numErrors++;

                    printf("ERROR(%d): Unary '%s' requires an operand of %s but was given %s.\n",
                                        t->linenum, t->attr.name, "bool", returnExpType(childNode->expType));
                }
            }                  

            else if(!strcmp(t->attr.name, "++")){

                if(childNode->expType != Integer && childNode->expType != UndefinedType){
                    numErrors++;

                    printf("ERROR(%d): Unary '%s' requires an operand of %s but was given %s.\n",
                                        t->linenum, t->attr.name, "int", returnExpType(childNode->expType));
                }
            }

            else if(!strcmp(t->attr.name, "--")){

                if(childNode->expType != Integer && childNode->expType != UndefinedType){
                    numErrors++;

                    printf("ERROR(%d): Unary '%s' requires an operand of %s but was given %s.\n",
                                        t->linenum, t->attr.name, "int", returnExpType(childNode->expType));
                }
            }
            break;
    }
}

void binaryOps(TreeNode *t, ExpKind subkind){

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

    switch(subkind){ 
        // multiple cases without a break use the same code as last case before break
        case OpK:
        case AssignK:

            // check left child for Void Call Exp
            if(leftChildExpType == Void){
                if(!(leftChild->nodekind == ExpK && leftChild->subkind.exp == CallK)){
                    leftChildError = true;
                }
            }

            // check right child for Void Call Exp
            if(rightChildExpType == Void){
                if(!(rightChild->nodekind == ExpK && rightChild->subkind.exp == CallK)){
                    rightChildError = true;
                }
            }
           
            // "or" and "and" have same logic. Check if types are not boolean on either side
            if(!strcmp(t->attr.name, "or") || !strcmp(t->attr.name, "and")){
                if(leftChild->subkind.exp == IdK){

                    // If left of Op is not boolean, produce error
                    if(leftChildExpType != Boolean){
                        numErrors++;

                        printf("ERROR(%d): '%s' requires operands of %s but lhs is of %s.\n", t->linenum, t->attr.name, "bool", returnExpType(leftChildExpType));
                    }
                    // If right of Op is not boolean, produce error
                    if(rightChildExpType != Boolean){
                        numErrors++;

                        printf("ERROR(%d): '%s' requires operands of %s but rhs is of %s.\n", t->linenum, t->attr.name, "bool", returnExpType(rightChildExpType));
                    }
                    // if either child is an array, produce error
                    if(leftChildExpType || rightChildExpType){
                        numErrors++;

                        printf("ERROR(%d): The operation '%s' does not work with arrays.\n", t->linenum, t->attr.name);
                    }
                }
            }
            // The following operators require both children be of the same type, Int, bool, char, CharInt. 
            else if(!strcmp(t->attr.name, "<") || !strcmp(t->attr.name, ">") || !strcmp(t->attr.name, "=") ||
                        !strcmp(t->attr.name, ">=") || !strcmp(t->attr.name, "<=")){

                    if(leftChildExpType != rightChildExpType){
                        if(leftChildExpType != UndefinedType && rightChildExpType != UndefinedType){
                            if(leftChildExpType != Void && rightChildExpType != Void){
                                numErrors++;

                                printf("ERROR(%d): '%s' requires operands of the same type but lhs is %s and rhs is %s.\n", 
                                            t->linenum, t->attr.name, returnExpType(leftChildExpType), returnExpType(rightChildExpType));
                            }
                        }
                    }

                    // operands must match being arrays if one of them is, then ther other must be as well. 
                    if(leftChildExpType && !rightChildExpType){
                        numErrors++;

                        printf("ERROR(%d): '%s' requires both operands be arrays or not but lhs is %s an array and rhs is %s an array.\n", 
                                            t->linenum, t->attr.name, returnExpType(leftChildExpType), returnExpType(rightChildExpType));
                    }
                    else if(!leftChildExpType && rightChildExpType){
                        numErrors++;

                        printf("ERROR(%d): '%s' requires both operands be arrays or not but lhs is %s an array and rhs is %s an array.\n", 
                                            t->linenum, t->attr.name, returnExpType(leftChildExpType), returnExpType(rightChildExpType));
                    }
            }
            // the following operands require type int and cannot be an array
            else if(!strcmp(t->attr.name, "+") || !strcmp(t->attr.name, "-") || !strcmp(t->attr.name, "*") ||
                        !strcmp(t->attr.name, "/") || !strcmp(t->attr.name, "%")){
                
                if(!t->isArray){
                    if(leftChildExpType != Integer){
                        numErrors++;

                        printf("ERROR(%d): '%s' requires operands of %s but lhs is of %s.\n", t->linenum, t->attr.name, "int", returnExpType(leftChildExpType));
                        }
                    if(rightChildExpType != Integer){
                        numErrors++;

                        printf("ERROR(%d): '%s' requires operands of %s but rhs is of %s.\n", t->linenum, t->attr.name, "int", returnExpType(rightChildExpType));
                    }
                }
            }

            else if(!strcmp(t->attr.name, "[")){

                if(leftChild->subkind.exp == IdK){
                    TreeNode *temp = (TreeNode *)st.lookup(leftChild->attr.name);

                    if(temp){
                        t->child[0]->expType = temp->expType;
                        t->expType = temp->expType;
                    }

                    if(!temp){
                        numErrors++;

                        printf("ERROR(%d): Cannot index nonarray '%s'.\n", t->linenum, temp->attr.name);
                    }
                    if(!temp->isArray){
                        numErrors++;
                        
                        printf("ERROR(%d): Cannot index nonarray '%s'.\n", t->linenum, temp->attr.name);
                    }
                }
                else{
                    numErrors++;
                        
                    printf("ERROR(%d): Cannot index nonarray '%s'.\n", t->linenum, leftChild->attr.name);
                }

                if(rightChild){
                    if(rightChildExpType != Integer && rightChildExpType != UndefinedType){
                        numErrors++;

                        printf("ERROR(%d): Array '%s' should be indexed by type int but got %s.\n", t->linenum, rightChild->attr.name, returnExpType(rightChildExpType));
                    }

                    if(rightChild->subkind.exp == IdK){
                        if(rightChildExpType){
                            numErrors++;

                            printf("ERROR(%d): Array index is the unindexed array '%s'.\n", t->linenum, rightChild->attr.name);
                        }
                    }
                }
            }

            break;
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
            returnStmt = strdup("CharInt");
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