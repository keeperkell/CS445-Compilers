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

extern SymbolTable symbolTable;
extern int numErrors;
extern int numWarnings;

int scopeDepth = 0;
int loopDepth = 1;
bool insideLoop = false;
bool stayInScope = true;
TreeNode *funcScope;



void semanticAnalysis(TreeNode *t, SymbolTable st){
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

                // change attempt here, name change from (TreeNode *) t ==> t
                if(t->subkind.decl != VarK){
                    if( !st.insert(t->attr.name, t)){
                        numErrors++;

                        currentNode = (TreeNode *)st.lookup(t->attr.name);
                        printf("ERROR(%d): Symbol '%s' is already declared at line %d.\n", t->linenum, t->attr.name, currentNode->linenum);
                    }
                }
                
                switch(t->subkind.decl){
                    case VarK:
                        for(int i = 0; i < MAXCHILDREN; i++){
                            if(t->child[0] != NULL){
                                semanticAnalysis(t->child[0], st);
                            }
                        }

                        if( !st.insert(t->attr.name, t)){
                            numErrors++;

                            currentNode = (TreeNode *)st.lookup(t->attr.name);
                            printf("ERROR(%d): Symbol '%s' is already declared at line %d.\n", t->linenum, t->attr.name, currentNode->linenum);
                         }

                        break;

                    case FuncK:
                        // start new function scope
                        funcScope = t;

                        //enter for scope
                        st.enter(t->attr.name);
                        for(int i = 0; i < MAXCHILDREN; i++){
                            if(t->child[i] != NULL){
                                semanticAnalysis(t->child[i], st);
                            }
                        }
                        st.leave();

                        break;

                    case ParamK:
                        currentNode = (TreeNode *)st.lookup(t->attr.name);

                        for(int i = 0; i < MAXCHILDREN; i++){
                            semanticAnalysis(t->child[i], st);
                        }

                        break;
                }

            case StmtK:

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
                        break;

                    case IfK:
                        break;

                    case WhileK:
                    case ForK:
                        
                        // find initial loop depth
                        if(!insideLoop){
                            insideLoop = true;
                            loopDepth = st.depth();
                        }

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
                            semanticAnalysis(t->child[i], st);
                        }

                        if(stayInScope){
                            st.leave();
                        }
                        break;

                    case ReturnK:

                        semanticAnalysis(childNode1, st);

                        if(childNode1){
                            if(!funcScope){
                                break;
                            }
                            else{
                                if(t->isArray){
                                    numErrors++;

                                    printf("ERROR(%d): Cannot return an array.\n", currentNode->linenum);
                                }
                            }
                        }
            
                        break;

                    case BreakK:
                        break;

                        break;
                    case RangeK:
                }

            case ExpK:
                switch(t->subkind.exp){
                    case OpK:
                        for(int i = 0; i < MAXCHILDREN; i++){
                            if(t->child[i]){
                                semanticAnalysis(t->child[i], st);
                            }
                        }
                        if(t->child[0] && t->child[1]){
                            // long set of checks, should move into function
                            binaryOps(t, t->subkind.exp, st);
                        }
                        else{
                            // long set of checks, should move into function
                            unaryOps(t, t->subkind.exp, st);
                        }
                        break;

                    case ConstantK:
                        for(int i = 0; i < MAXCHILDREN; i++){
                            semanticAnalysis(t->child[i], st);
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
                        for(int i = 0; i < MAXCHILDREN; i++){
                            if(t->child[i]){
                                semanticAnalysis(t->child[i], st);
                            }
                        }

                        if(!t->child[1]){
                            //unary, long check, should write into function
                            unaryOps(t, t->subkind.exp, st);
                        }
                        else{
                            //if not unary, then binary. long check, should write into function
                            binaryOps(t, t->subkind.exp, st);
                        }

                        currentNode;
                        if(t->child[0]->subkind.exp == IdK){
                            currentNode = (TreeNode *)st.lookup(t->child[0]->attr.name);
                        }

                        if(t->child[0]->subkind.exp == OpK){
                            if(t->child[0]->child[0]->subkind.exp == IdK){
                                currentNode = (TreeNode *)st.lookup(t->child[0]->child[0]->attr.name);
                            }
                        }

                        t->expType = t->child[0]->expType;
                        break;

                    case CallK:

                        for(int i = 0; i < MAXCHILDREN; i++){
                            semanticAnalysis(t->child[i], st);
                        }

                        currentNode = (TreeNode *)st.lookup(t->attr.name);

                        if(currentNode){
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
                }  
                break;
        }

        if(t->sibling){
            semanticAnalysis(t->sibling, st);
        }
    }
}

// moved logic from inside OpK & AssignK
void unaryOps(TreeNode *t, ExpKind subkind, SymbolTable st){
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
                    unaryOps(t, OpK, st);
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

void binaryOps(TreeNode *t, ExpKind subkind, SymbolTable st){

    TreeNode *childLeft;
    TreeNode *childRight;

    if(t->child[0]){
        childLeft = t->child[0];
    }
    if(t->child[1]){
        childRight = t->child[1];
    }

    switch(subkind){
        case OpK:
            // multiple cases without a break use the same code as last case before break
            if(!strcmp(t->attr.name, "or") || !strcmp(t->attr.name, "and")){
                if(childLeft->subkind.exp == IdK){
                    if(childLeft->expType != Boolean && childLeft->expType != Void && childLeft->expType != UndefinedType){
                        numErrors++;

                        printf("ERROR(%d): '%s' requires operands of %s but lhs is of %s.\n", t->linenum, t->attr.name, "bool", returnExpType(childLeft->expType));
                    }
                    if(childRight->expType != Boolean && childRight->expType != Void && childRight->expType != UndefinedType){
                        numErrors++;

                        printf("ERROR(%d): '%s' requires operands of %s but rhs is of %s.\n", t->linenum, t->attr.name, "bool", returnExpType(childRight->expType));
                    }
                    if(childLeft->isArray || childRight->isArray){
                        numErrors++;

                    printf("ERROR(%d): The operation '%s' does not work with arrays.\n", t->linenum, t->attr.name);
                    }
                }
                else if(childLeft->subkind.exp == CallK){
                    if(childLeft->expType != Boolean && childLeft->expType != Void && childLeft->expType != UndefinedType){
                        numErrors++;

                        printf("ERROR(%d): '%s' requires operands of %s but lhs is of %s.\n", t->linenum, t->attr.name, "bool", returnExpType(childLeft->expType));
                        }
                    if(childRight->expType != Boolean && childRight->expType != Void && childRight->expType != UndefinedType){
                        numErrors++;

                        printf("ERROR(%d): '%s' requires operands of %s but rhs is of %s.\n", t->linenum, t->attr.name, "bool", returnExpType(childRight->expType));
                    }
                }
            }

            else if(!strcmp(t->attr.name, "<") || !strcmp(t->attr.name, ">") || !strcmp(t->attr.name, "=") ||
                        !strcmp(t->attr.name, ">=") || !strcmp(t->attr.name, "<=")){

                    if(childLeft->expType != childRight->expType){
                        if(childLeft->expType != UndefinedType && childRight->expType != UndefinedType){
                            if(childLeft->expType != Void && childRight->expType != Void){
                                numErrors++;

                                printf("ERROR(%d): '%s' requires operands of the same type but lhs is %s and rhs is %s.\n", 
                                            t->linenum, t->attr.name, returnExpType(childLeft->expType), returnExpType(childRight->expType));
                            }
                        }
                    }

                    if(childLeft->isArray && !childRight->isArray){
                        numErrors++;

                        printf("ERROR(%d): '%s' requires both operands be arrays or not but lhs is %s an array and rhs is %s an array.\n", 
                                            t->linenum, t->attr.name, returnExpType(childLeft->expType), returnExpType(childRight->expType));
                    }
                    else if(!childLeft->isArray && childRight->isArray){
                        numErrors++;

                        printf("ERROR(%d): '%s' requires both operands be arrays or not but lhs is %s an array and rhs is %s an array.\n", 
                                            t->linenum, t->attr.name, returnExpType(childLeft->expType), returnExpType(childRight->expType));
                    }
            }

            else if(!strcmp(t->attr.name, "+") || !strcmp(t->attr.name, "-") || !strcmp(t->attr.name, "*") ||
                        !strcmp(t->attr.name, "/") || !strcmp(t->attr.name, "%")){

                if(!t->isArray){
                    if(childLeft->expType != Integer && childLeft->expType != Void && childLeft->expType != UndefinedType){
                        numErrors++;

                        printf("ERROR(%d): '%s' requires operands of %s but lhs is of %s.\n", t->linenum, t->attr.name, "int", returnExpType(childLeft->expType));
                        }
                    if(childRight->expType != Integer && childRight->expType != Void && childRight->expType != UndefinedType){
                        numErrors++;

                        printf("ERROR(%d): '%s' requires operands of %s but rhs is of %s.\n", t->linenum, t->attr.name, "int", returnExpType(childRight->expType));
                    }
                }

                if(childLeft->subkind.exp == CallK && childRight->subkind.exp == CallK){
                    if(childLeft->expType != Integer && childLeft->expType != UndefinedType){
                        numErrors++;

                        printf("ERROR(%d): '%s' requires operands of %s but lhs is of %s.\n", t->linenum, t->attr.name, "int", returnExpType(childLeft->expType));
                    }
                    if(childRight->expType != Integer && childRight->expType != UndefinedType){
                        numErrors++;

                        printf("ERROR(%d): '%s' requires operands of %s but rhs is of %s.\n", t->linenum, t->attr.name, "int", returnExpType(childRight->expType));
                    }
                }
            }

            else if(!strcmp(t->attr.name, "[")){

                if(childLeft->subkind.exp == IdK){
                    TreeNode *temp = (TreeNode *)st.lookup(childLeft->attr.name);

                    if(temp){
                        t->child[0]->expType = temp->expType;
                        t->expType = temp->expType;
                    }

                    if(!temp){
                        numErrors++;

                        printf("ERROR(%d): Cannot index nonarray '%s'.\n", t->linenum, t->child[0]->attr.name);
                    }
                    if(!temp->isArray){
                        numErrors++;
                        
                        printf("ERROR(%d): Cannot index nonarray '%s'.\n", t->linenum, temp->attr.name);
                    }
                }
                else{
                    numErrors++;
                        
                    printf("ERROR(%d): Cannot index nonarray '%s'.\n", t->linenum, childLeft->attr.name);
                }

                if(childRight){
                    if(childRight->expType != Integer && childRight->expType != UndefinedType){
                        numErrors++;

                        printf("ERROR(%d): Array '%s' should be indexed by type int but got %s.\n", t->linenum, childRight->attr.name, returnExpType(childRight->expType));
                    }

                    if(childRight->subkind.exp == IdK){
                        if(childRight->isArray){
                            numErrors++;

                            printf("ERROR(%d): Array index is the unindexed array '%s'.\n", t->linenum, childRight->attr.name);
                        }
                    }
                }
            }

            break;

        case AssignK:
            if(!strcmp(t->attr.name, "+") || !strcmp(t->attr.name, "-") || !strcmp(t->attr.name, "*") ||
                        !strcmp(t->attr.name, "/") || !strcmp(t->attr.name, "%")){

                if(childLeft->expType != Integer && childLeft->expType != UndefinedType){
                    numErrors++;

                    printf("ERROR(%d): '%s' requires operands of %s but lhs is of %s.\n", t->linenum, t->attr.name, "int", returnExpType(childLeft->expType));
                }
                if(childRight->expType != Integer && childRight->expType != UndefinedType){
                    numErrors++;

                    printf("ERROR(%d): '%s' requires operands of %s but rhs is of %s.\n", t->linenum, t->attr.name, "int", returnExpType(childRight->expType));
                }
            }

            else if(!strcmp(t->attr.name, ":=")){

                if(t->subkind.decl == ParamK){

                    if(childLeft->expType != childRight->expType){
                        if(childLeft->expType != UndefinedType && childRight->expType != UndefinedType){
                            numErrors++;

                            printf("ERROR(%d): '%s' requires operands of the same type but lhs is %s and rhs is %s.\n", 
                                        t->linenum, t->attr.name, returnExpType(childLeft->expType), returnExpType(childRight->expType));
                        }
                    }
                }

                if(t->subkind.exp == IdK){

                    if(childLeft->subkind.exp != IdK){
                        if(childLeft->expType != childRight->expType){
                            if(childLeft->expType != UndefinedType && childRight->expType != UndefinedType){
                                numErrors++;

                                printf("ERROR(%d): '%s' requires operands of the same type but lhs is %s and rhs is %s.\n", 
                                        t->linenum, t->attr.name, returnExpType(childLeft->expType), returnExpType(childRight->expType));
                            }
                        }
                    }
                    if(childLeft->expType != childRight->expType){
                        if(childLeft->expType != UndefinedType && childRight->expType != UndefinedType){
                            
                            numErrors++;

                            printf("ERROR(%d): '%s' requires operands of the same type but lhs is %s and rhs is %s.\n", 
                                        t->linenum, t->attr.name, returnExpType(childLeft->expType), returnExpType(childRight->expType));
                        }
                    }

                    if(childLeft->isArray && !childRight->isArray){
                        numErrors++;

                        printf("ERROR(%d): '%s' requires both operands be arrays or not but lhs is %s an array and rhs is %s an array.\n", 
                                    t->linenum, t->attr.name, returnExpType(childLeft->expType), returnExpType(childRight->expType));
                    }
                    else if(!childLeft->isArray && childRight->isArray){
                        numErrors++;

                        printf("ERROR(%d): '%s' requires both operands be arrays or not but lhs is %s an array and rhs is %s an array.\n", 
                                    t->linenum, t->attr.name, returnExpType(childLeft->expType), returnExpType(childRight->expType));
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