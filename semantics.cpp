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

void semanticAnalysis(TreeNode *t, SymbolTable st){

    while(t){
        if(t->nodekind == DeclK)
        switch(t->nodekind){
            case DeclK:
                if( !st.insert(tree->atrr.name, (TreeNode *) t)){
                    numErrors++;

                    TreeNode *currentNode = (TreeNode *)st.lookup(tree->attr.name);
                    printf("ERROR(%d): Symbol '%s' is already declared at line %d.\n", t->linenum, t->attr.name, currentNode->linenum);
                }
                
                // while
                switch(t->subkind.decl){
                    case VarK:
                        for(int i = 0; i < MAXCHILDREN; i++){
                            if(t->child[0] != NULL){
                                semanticAnalysis(t->child[i]);
                            }
                        }

                        break;

                    case FuncK:
                        TreeNode *currentNode = st.lookup(t->attr.name);

                        if(!currentNode){
                            st.insert(t->attr.name, (TreeNode *) t);
                        }

                        //enter for scope
                        st.enter(t->attr.name);
                        for(int i = 0; i < MAXCHILDREN; i++){
                            if(t->child[0] != NULL){
                                semanticAnalysis(t->child[i]);
                            }
                        }
                        st.leave();

                        break;

                    case ParamK:
                        TreeNode *currentNode = st.lookup(t->attr.name);

                        if(t->isArray){
                            if(!currentNode){
                                st.insert(t->attr.name, (TreeNode *) t);
                            }
                        }
                        else{
                            st.insert(t->attr.name, (TreeNode *) t);
                        }
                        break;
                }

            case StmtK:
                switch(t->subkind.stmt){
                    case NullK:
                        break;

                    case IfK:
                        // enter if scope
                        st.enter(t->attr.name);
                        for(int i = 0; i < MAXCHILDREN; i++){
                            if(t->child[i]){
                                semanticAnalysis(t->child[i]);
                            }
                        }
                        st.leave();

                        break;

                    case WhileK:

                        scopeDepth ++;

                        st.enter(t->attr.name);
                        for(int i = 0; i < MAXCHILDREN; i++){
                            if(t->child[i]){
                                semanticAnalysis(t->child[i]);
                            }
                        }
                        st.leave();

                        scopeDepth--;
                        break;

                    case ForK:

                        scopeDepth ++;

                        st.enter(t->attr.name);
                        for(int i = 0; i < MAXCHILDREN; i++){
                            if(t->child[i]){
                                semanticAnalysis(t->child[i]);
                            }
                        }
                        st.leave();

                        scopeDepth--;
                        break;

                    case CompoundK:
                        // not sure for now
                        break;

                    case ReturnK:

                        for(int i = 0; i < MAXCHILDREN; i++){
                            if(t->child[i]){
                                semanticAnalysis(t->child[i]);
                            }
                        }

                        if(t->child[0]){
                            if(t->child[0]->nodekind == ExpK && t->child[0]->subkind.exp == IdK){
                                TreeNode *currentNode = st.lookup(t->child[0]->attr.name);

                                if(currentNode && currentNode->isArray){
                                    numErrors++;

                                    printf("ERROR(%d): Cannot return an array.\n", currentNode->linenum);
                                }
                            }

                            if(t->child[0]->subkind.exp == AssignK){
                                if(t->child[0]->child[0] && t->child[0]->child[1]){
                                    if(t->child[0]->child[0]->isArray){
                                        numErrors++;

                                        printf("ERROR(%d): Cannot return an array.\n", currentNode->linenum);
                                    }
                                }
                            }
                        }
            
                        break;

                    case BreakK:
                        break;

                    case RangeK:
                        for(int i = 0; i < MAXCHILDREN; i++){
                            if(t->child[i]){
                                semanticAnalysis(t->child[i]);
                            }
                        }

                        break;
                }

            case ExpK:
                switch(t->subkind.exp){
                    case OpK:
                        for(int i = 0; i < MAXCHILDREN; i++){
                            if(t->child[i]){
                                semanticAnalysis(t->child[i])
                            }
                        }

                        if(t->child[1]){
                            // long set of checks, should move into function
                            binaryOps(t, t->subkind.exp);
                        }
                        else{
                            // long set of checks, should move into function
                            unaryOps(t, t->subkind.exp);
                        }
                        break;

                    case ConstantK:
                        break;

                    case IdK:
                        TreeNode *currentNode = st.lookup(tree->attr.name);

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
                                semanticAnalysis(t->child[i]);
                            }
                        }

                        if(!t->child[1]){
                            //unary, long check, should write into function
                            unaryOps(t, t->subkind.exp);
                        }
                        else{
                            //if not unary, then binary. long check, should write into function
                            binaryOps(t, t->subkind.exp);
                        }

                        TreeNode *currentNode;
                        if(t->child[0]->subkind.exp == IdK){
                            currentNode = st.lookup(t->child[0]->attr.name);
                        }

                        if(t->child[0]->subkind.exp == OpK){
                            if(t->child[0]->child[0]->subkind.exp == IdK){
                                currentNode = st.lookup(t->child[0]->child[0]->attr.name);
                            }
                        }

                        t->expType = t->child[0]->expType;
                        break;

                    case CallK:

                        for(int i = 0; i < MAXCHILDREN; i++){
                            semanticAnalysis(t->child[i]);
                        }

                        TreeNode *currentNode = st.lookup(t->attr.name);

                        if(currentNode){
                            if(currentNode->subkind.decl == VarK || currentNode->subkind.decl == ParamK){
                                numErrors++;

                                printf("ERROR(%d): '%s' is a simple variable and cannot be called.\n", currentNode->linenum, currentNode->attr.name);
                            }     
                        }
                        else{
                            numErrors++;

                            printf("ERROR(%d): Symbol '%s' is not declared.\n", t->linenum, t->attr.name);
                        }

                        break;
                }  
        }
    }
}

// moved logic from inside OpK & AssignK
void unaryOps(TreeNode *t, enum subkind){
    switch(subkind){
        case OpK:
            TreeNode *childNode;

            if(t->child[0]){
                childNode = t->child[0];
            }

            switch(t->attr.name){
                case "-":
                    if(childNode->subkind.exp == ConstantK){
                        if(childNode->child[0]){
                            if(childNode->child[0]->subkind.exp != ConstantK){
                                numErrors++;

                                printf("ERROR(%d): Unary '%s' requires an operand of %s but was given %s.\n",
                                            t->linenum, t->attr.name, "int", getExpType(childNode->expType));
                            }
                            if(childNode->expType != Integer){
                                numErrors++;

                                printf("ERROR(%d): Unary '%s' requires an operand of %s but was given %s.\n",
                                            t->linenum, t->attr.name, "int", getExpType(childNode->expType));
                            }
                        }
                    }
                    if(childNode->subkind.exp == IdK){
                        TreeNode *currentChildNode = st.lookup(childNode->attr.name);

                        if(currentChildNode){
                            if(currentChildNode->expType != Integer){
                                numErrors++;

                                printf("ERROR(%d): Unary '%s' requires an operand of %s but was given %s.\n",
                                            t->linenum, t->attr.name, "int", getExpType(childNode->expType));
                            }
                        }
                    }
                    break;

                case "*":
                    break;

                case "?":
                        if(childNode->subkind.exp == IdK){
                            TreeNode *currentChildNode = st.lookup(childNode->attr.name);

                            if(currentChildNode){
                                if(currentChildNode->expType != Integer){
                                    numErrors++;

                                    printf("ERROR(%d): Unary '%s' requires an operand of %s but was given %s.\n",
                                                t->linenum, t->attr.name, "int", getExpType(childNode->expType));
                                    }
                            }
                        }
                        else{
                            if(childNode->expType != Integer){
                                numErrors++;

                                printf("ERROR(%d): Unary '%s' requires an operand of %s but was given %s.\n",
                                            t->linenum, t->attr.name, "int", getExpType(childNode->expType));
                            }
                        }
                    break;

                case "not":
                    if(childNode->child[0]){
                        numErrors++;

                        printf("ERROR(%d): Unary '%s' requires an operand of %s but was given %s.\n",
                                    t->linenum, t->attr.name, "bool", getExpType(childNode->expType));
                    }
                    else{
                        switch(childNode->subkind.exp){

                            case ConstantK:
                                if(childNode->expType != Boolean){
                                    numErrors++;

                                    printf("ERROR(%d): Unary '%s' requires an operand of %s but was given %s.\n",
                                                t->linenum, t->attr.name, "bool", getExpType(childNode->expType));
                                }
                                else if(t->expType != childNode->expType){
                                    numErrors++;

                                    printf("ERROR(%d): Unary '%s' requires an operand of %s but was given %s.\n",
                                                t->linenum, t->attr.name, "bool", getExpType(childNode->expType));
                                }

                            break;

                            case IdK:
                                TreeNode *currentChildNode = st.lookup(childNode->attr.name);

                                if(currentChildNode){
                                    if(currentChildNode->expType != Boolean){
                                        numErrors++;

                                        printf("ERROR(%d): Unary '%s' requires an operand of %s but was given %s.\n",
                                                    t->linenum, t->attr.name, "bool", getExpType(childNode->expType));
                                    }
                                }
                        }
                    }
                    break;

                case "++":
                    break;

                case "--":
                    break;
                
                default:
                    break;
            }
            break;

        case AssignK:
            TreeNode *childNode;

            if(t->child[0]){
                childNode = t->child[0];
            }

            switch(t->attr.name){
                case "-":
                    if(childNode->expType != Integer && childNode->expType != UndefinedType){
                        numErrors++;

                        printf("ERROR(%d): Unary '%s' requires an operand of %s but was given %s.\n",
                                         t->linenum, "chsign", "int", getExpType(childNode->expType));
                    }
                    break;

                case "*":
                    if(!childNode->isArray){
                        unaryOps(t, OpK);
                    }
                    break;

                case "?":
                    if(childNode->expType != Integer && childNode->expType != UndefinedType){
                        numErrors++;

                        printf("ERROR(%d): Unary '%s' requires an operand of %s but was given %s.\n",
                                         t->linenum, t->attr.name, "int", getExpType(childNode->expType));
                    }
                    break;

                case "not":
                    if(childNode->expType != Integer && childNode->expType != UndefinedType){
                        numErrors++;

                        printf("ERROR(%d): Unary '%s' requires an operand of %s but was given %s.\n",
                                         t->linenum, t->attr.name, "bool", getExpType(childNode->expType));
                    }
                    break;

                case "++":
                    if(childNode->expType != Integer && childNode->expType != UndefinedType){
                        numErrors++;

                        printf("ERROR(%d): Unary '%s' requires an operand of %s but was given %s.\n",
                                         t->linenum, t->attr.name, "int", getExpType(childNode->expType));
                    }
                    break;

                case "--":
                    if(childNode->expType != Integer && childNode->expType != UndefinedType){
                        numErrors++;

                        printf("ERROR(%d): Unary '%s' requires an operand of %s but was given %s.\n",
                                         t->linenum, t->attr.name, "int", getExpType(childNode->expType));
                    }
                    break;

                default:
                    break;
            }
            break;
    }
}

void binaryOps(TreeNode *t, enum subkind){

    TreeNode *childLeft;
    TreeNode *childRight;

    if(t->child[0]){
        childLeft = t->child[0];
    }
    if(t->child[1]){
        childRight = t->child[1];
    }

    switch(subtype){
        case OpK:
            // multiple cases without a break use the same code as last case before break
            switch(t->attr.name){
                case "or":
                case "and":
                    if(childLeft->subkind.exp == IdK){
                        if(childLeft->expType != Boolean && childLeft->expType != Void && childLeft->expType != UndefinedType){
                            numErrors++;

                            printf("ERROR(%d): '%s' requires operands of %s but lhs is of %s.\n", t->linenum, t->attr.name, getExpType(childLeft->expType));
                         }
                        if(childRight->expType != Boolean && childRight->expType != Void && childRight->expType != UndefinedType){
                            numErrors++;

                            printf("ERROR(%d): '%s' requires operands of %s but rhs is of %s.\n", t->linenum, t->attr.name, getExpType(childRight->expType));
                        }
                        if(childLeft->isArray || childRight->isArray){
                            numErrors++;

                        printf("ERROR(%d): The operation '%s' does not work with arrays.\n", t->linenum, t->attr.name);
                        }
                    }
                    else if(childLeft->subkind.exp == CallK){
                        if(childLeft->expType != Boolean && childLeft->expType != Void && childLeft->expType != UndefinedType){
                            numErrors++;

                            printf("ERROR(%d): '%s' requires operands of %s but lhs is of %s.\n", t->linenum, t->attr.name, getExpType(childLeft->expType));
                         }
                        if(childRight->expType != Boolean && childRight->expType != Void && childRight->expType != UndefinedType){
                            numErrors++;

                            printf("ERROR(%d): '%s' requires operands of %s but rhs is of %s.\n", t->linenum, t->attr.name, getExpType(childRight->expType));
                        }
                    }
                    
                    break;

                case "<":
                case ">":
                case "=":
                case ">=":
                case "<=":
                    if(childLeft->expType != childRight->expType){
                        if(childLeft->expType != UndefinedType && childRight->expType != UndefinedType){
                            if(childLeft->expType != Void && childRight->expType != Void){
                                numErrors++;

                                printf("ERROR(%d): '%s' requires operands of the same type but lhs is %s and rhs is %s.\n", 
                                            t->linenum, t->attr.name, getExpType(childLeft->expType), getExpType(childRight->expType));
                            }
                        }
                    }

                    if(childLeft->isArray && !childRight->isArray){
                        numErrors++;

                        printf("ERROR(%d): '%s' requires both operands be arrays or not but lhs is %s an array and rhs is %s an array.\n", 
                                            t->linenum, t->attr.name, getExpType(childLeft->expType), getExpType(childRight->expType));
                    }
                    else if(!childLeft->isArray && childRight->isArray){
                        numErrors++;

                        printf("ERROR(%d): '%s' requires both operands be arrays or not but lhs is %s an array and rhs is %s an array.\n", 
                                            t->linenum, t->attr.name, getExpType(childLeft->expType), getExpType(childRight->expType));
                    }
                    break;

                case "+":
                case "-":
                case "*":
                case "/":
                case "%":
                    if(!t->isArray){
                        if(childLeft->expType != Integer && childLeft->expType != Void && childLeft->expType != UndefinedType){
                            numErrors++;

                            printf("ERROR(%d): '%s' requires operands of %s but lhs is of %s.\n", t->linenum, t->attr.name, getExpType(childLeft->expType));
                         }
                        if(childRight->expType != Integer && childRight->expType != Void && childRight->expType != UndefinedType){
                            numErrors++;

                            printf("ERROR(%d): '%s' requires operands of %s but rhs is of %s.\n", t->linenum, t->attr.name, getExpType(childRight->expType));
                        }
                    }

                    if(childLeft->subkind.exp == CallK && childRight->subkind.exp == CallK){
                        if(childLeft != Integer && childLeft != UndefinedType){
                            numErrors++;

                            printf("ERROR(%d): '%s' requires operands of %s but lhs is of %s.\n", t->linenum, t->attr.name, getExpType(childLeft->expType));
                        }
                        if(childRight != Integer && childRight != UndefinedType){
                            numErrors++;

                            printf("ERROR(%d): '%s' requires operands of %s but rhs is of %s.\n", t->linenum, t->attr.name, getExpType(childRight->expType));
                        }
                    }
                    break;

                case "[":
                    if(childLeft->subkind.exp == Idk){
                        TreeNode *temp = st.lookup(childLeft->attr.name);

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

                            printf("ERROR(%d): Array '%s' should be indexed by type int but got %s.\n", t->linenum, childRight->attr.name, getExpType(childRight->expType));
                        }

                        if(childRight->subkind.exp == IdK){
                            if(childRight->isArray){
                                numErrors++;

                                printf("ERROR(%d): Array index is the unindexed array '%s'.\n", t->linenum, childRight->attr.name);
                            }
                        }
                    }
                    break;

                default:
                    break;
            }
            break;

        case AssignK:
            switch(t->attr.name){
                case "+=":
                case "-=":
                case "*=":
                case "/=":
                    if(childLeft->expType != Integer && childLeft->expType != UndefinedType){
                        numErrors++;

                        printf("ERROR(%d): '%s' requires operands of %s but lhs is of %s.\n", t->linenum, t->attr.name, "int", getExpType(childLeft->expType));
                    }
                    if(childRight->expType != Integer && childRight->expType != UndefinedType){
                        numErrors++;

                        printf("ERROR(%d): '%s' requires operands of %s but rhs is of %s.\n", t->linenum, t->attr.name, "int", getExpType(childRight->expType));
                    }
                    break;

                case ":=":
                    switch (t->subkind.decl){
                        case ParamK:
                            if(childLeft->expType != childRight->expType){
                                if(childLeft->expType != UndefinedType && childRight->expType != UndefinedType){
                                    numErrors++;

                                    printf("ERROR(%d): '%s' requires operands of the same type but lhs is %s and rhs is %s.\n", 
                                                t->linenum, t->attr.name, getExpType(childLeft->expType), getExpType(childRight->expType));
                                }
                            }
                            break;

                        case IdK:
                            if(childLeft->subkind.exp != IdK){
                                if(childLeft->expType != childRight->expType){
                                    if(childLeft->expType != UndefinedType && childRight->expType != UndefinedType){
                                        numErrors++;

                                        printf("ERROR(%d): '%s' requires operands of the same type but lhs is %s and rhs is %s.\n", 
                                                t->linenum, t->attr.name, getExpType(childLeft->expType), getExpType(childRight->expType));
                                    }
                                }
                            }
                            if(childLeft->expType != childRight->expType){
                                if(childLeft->expType != UndefinedType && childRight->expType != UndefinedType){
                                    
                                    numErrors++;

                                    printf("ERROR(%d): '%s' requires operands of the same type but lhs is %s and rhs is %s.\n", 
                                                t->linenum, t->attr.name, getExpType(childLeft->expType), getExpType(childRight->expType));
                                }
                            }

                            if(childLeft->isArray && !childRight->isArray){
                                numErrors++;

                                printf("ERROR(%d): '%s' requires both operands be arrays or not but lhs is %s an array and rhs is %s an array.\n", 
                                            t->linenum, t->attr.name, getExpType(childLeft->expType), getExpType(childRight->expType));
                            }
                            else if(!childLeft->isArray && childRight->isArray){
                                numErrors++;

                                printf("ERROR(%d): '%s' requires both operands be arrays or not but lhs is %s an array and rhs is %s an array.\n", 
                                            t->linenum, t->attr.name, getExpType(childLeft->expType), getExpType(childRight->expType));
                        }
                    }
                    break;
            }
            break;
    }
}

char *getExpType(ExpType t){
    switch(t){
        case Void:
            return ("void");
        case Integer:
            return ("int");
        case Boolean:
            return ("bool");
        case Char:
            return ("char");
        case CharInt:
            return ("CharInt");
        case Equal:
            return ("Equal");
        case UndefinedType:
            return ("undefined type");
        default:
            break;
    }
}