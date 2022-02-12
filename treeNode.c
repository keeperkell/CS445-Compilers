// // // // // // // // // // // // // // // // // // // // // // // 
// CS445 - treeNode.c
//
// Keller Lawson
// 
// Last Updated
// Feb 10, 2022  

#include "scanType.h"
#include "treeNode.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// White space count needed
int WS = 0;

// create a new Decl node
TreeNode *newDeclNode(DeclKind kind, TokenData* token){
    TreeNode *t = (TreeNode *) malloc(sizeof(TreeNode));
    int i;
    if( t==NULL){
        printf("Out of memory error at line %d\n", token->linenum);
    }
    else{
        for(i=0; i<MAXCHILDREN; i++){
            t->child[i] = NULL;
        }
        t->sibling = NULL;
        t->nodekind = DeclK;
        t->subkind.decl = kind;
        t->linenum = token->linenum;
        t->expType = Void;
    }

    return t;
}

// create a new Stmt node
TreeNode *newStmtNode(StmtKind kind, TokenData *token){
    TreeNode *t = (TreeNode *) malloc(sizeof(TreeNode));
    int i;
    if( t==NULL){
        printf("Out of memory error at line %d\n", token->linenum);
    }
    else{
        for(i=0; i<MAXCHILDREN; i++){
            t->child[i] = NULL;
        }
        t->sibling = NULL;
        t->nodekind = StmtK;
        t->subkind.stmt = kind;
        t->linenum = token->linenum;
        t->expType = Void;
    }

    return t;
}

// create a new Exp node
TreeNode *newExpNode(ExpKind kind, TokenData *token){
    TreeNode *t = (TreeNode *) malloc(sizeof(TreeNode));
    int i;
    if( t==NULL){
        printf("Out of memory errat at line %d\n", token->linenum);
    }  
    else{
        for(i=0; i<MAXCHILDREN; i++){
            t->child[i] = NULL;
        }
        t->sibling = NULL;
        t->nodekind = ExpK;
        t->subkind.exp = kind;
        t->linenum = token->linenum;
        t->expType = Void;
    }

    return t;
}

// Add sibling
TreeNode *addSibling(TreeNode *t, TreeNode *s){
    if(t == NULL){
        return s;
    }
    if(s == NULL){
        return t;
    }

    if(t != NULL && s!= NULL){
        TreeNode *tmp = (TreeNode *) malloc(sizeof(TreeNode));
        tmp = t;

        while( tmp != NULL && tmp->sibling != NULL){
            tmp = tmp->sibling;
        }

        tmp->sibling = s;
    }

    return t;
}

// Print Tree
void printTree(TreeNode *t, int numSiblings){
    int i;
    int countSibs = numSiblings;

    if(t == NULL){
        printf("empty tree, will not print");
    }

    while(t != NULL){
        switch(t->nodekind){
            case DeclK:
                switch(t->subkind.decl){
                    case VarK:
                        if(t->isArray){
                            printf("Var: %s is array of type %s [line: %d]\n", 
                                t->tokenData->tokeninput, getExpType(t->expType), t->linenum);
                        }
                        else{
                            printf("Var: %s is of type %s [line: %d]\n", 
                                t->attr.name, getExpType(t->expType), t->linenum);
                        }

                        break;

                    case FuncK:
                        printf("Func: %s returns type %s [line: %d]\n", 
                                t->attr.name, getExpType(t->expType), t->linenum);

                        break;

                    case ParamK:
                        if(t->isArray){
                            printf("Var: %s is array of type %s [line: %d]\n", 
                                t->tokenData->tokeninput, getExpType(t->expType), t->linenum);
                        }
                        else{
                            printf("Var: %s is of type %s [line: %d]\n", 
                                t->attr.name, getExpType(t->expType), t->linenum);
                        }

                        break;

                    default:
                }
                break;

            case StmtK:
                switch(t->subkind.stmt){
                    case NullK:
                        printf("NULL [line: %d]\n", t->linenum);
                        break;
                        
                    case IfK:
                        printf("If [line: %d]\n", t->linenum);
                        break;

                    case WhileK:
                        printf("While [line: %d]\n", t->linenum);
                        break;

                    case ForK:
                        printf("For [line: %d]\n", t->linenum);
                        break;

                    case CompoundK:
                        printf("Compound [line: %d]\n", t->linenum);
                        break;

                    case ReturnK:
                        printf("Return [line: %d]\n", t->linenum);
                        break;

                    case BreakK:
                        printf("Break [line: %d]\n", t->linenum);
                        break;

                    case RangeK:
                        printf("Range [line: %d]\n", t->linenum);
                        break;

                    default:
                        break;
                }
                break;

            case ExpK:
                switch(t->subkind.exp){
                    case OpK:
                        if(t->child[1] == NULL && !strcmp(t->attr.name, "-")){
                            printf("Op: chsign [line: %d]\n", t->linenum);
                        }
                        else if(t->child[1] == NULL && !strcmp(t->attr.name, "*")){
                            printf("Op: sizeof [line: %d]\n", t->linenum);
                        }
                        else{
                            printf("Op: %s [line: %d]\n", t->attr.name, t->linenum);
                        }
                        break;
                        
                    case ConstantK:
                        switch (t->expType){
                        case Boolean:
                            printf("Const %s [line %d]", t->attr.name, t->linenum);
                            break;

                        case CharInt:
                            printf("Const is array \"%s\" [line: %d]\n", t->attr.string, t->linenum);
                            break;

                        case Char:
                            printf("Const \'%c\' [line: %d]\n",t->tokenData->cvalue, t->linenum);
                            break;

                        default:
                            break;

                        }
                        break;

                    case IdK:
                        printf("Id: %s [line: %d]\n", t->attr.name, t->linenum);
                        break;

                    case AssignK:
                        printf("Assign: %s [line: %d]\n", t->attr.name, t->linenum);
                        break;

                    case InitK:
                        printf("Init: %s [line: %d]\n", t->attr.name, t->linenum);
                        break;

                    case CallK:
                        printf("Call: %s [line: %d]\n", t->attr.name, t->linenum);
                        break;

                    default:
                        printf("ERROR %i Unknown ExpNode subkind Line: %d\n", CallK, t->linenum);
                        break;
                }
                break;

            default:
                printf("Unknown node type: %d Line: %d\n", t->nodekind, t->linenum);
                break;
        }

        for(i = 0; i < MAXCHILDREN; i++){
            if(t->child[i] != NULL){
                WS++;
                printWhiteSpace(WS);
                printf("Child: %d ", i);
                printTree(t->child[i], 0);
                WS--;
            }
        }

        if(t->sibling != NULL){
            numSiblings++;
            printWhiteSpace(WS);
            printf("Sibling: %d", numSiblings);
        }

        t = t->sibling;
    }
}

// return expType as string
char *getExpType(ExpType t){
    char *exp;

    switch(t){
        case Void:
            exp = strdup("void");
        case Integer:
            exp = strdup("int");
        case Boolean:
            exp = strdup("bool");
        case Char:
            exp = strdup("char");
        case CharInt:
            exp = strdup("CharInt");
        case Equal:
            exp = strdup("Equal");
        case UndefinedType:
            exp = strdup("undefined type");
        default: 
            exp = strdup("exprType not found");
    }

    return exp;
}

// print the . and white space for each indented child
void printWhiteSpace(int WS){
    // write function to print WS
    int i;
    for(i = 0; i < WS; i++){
        printf(".   ");
    }
}

void assignTyping(TreeNode *t, ExpType type){

    TreeNode *tmp = t;
    
    if(t != NULL){
        while(tmp != NULL){
            tmp->expType = type;
            tmp = tmp->sibling;
        }
    }
}