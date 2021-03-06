// // // // // // // // // // // // // // // // // // // // // // // 
// CS445 - treeNode.c
//
// Keller Lawson
// 
// Last Updated
// Feb 13, 2022  

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
            t->sibling = NULL;
            t->nodekind = DeclK;
            t->subkind.decl = kind;
            t->linenum = token->linenum;
            t->expType = Void;
            t->attr.name = strdup(token->tokeninput);
            t->memSize = 1;
            t->memKind = None;
            t->isOffset = false;
            t->codeGenLineNum = 0;
        }
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
            t->sibling = NULL;
            t->nodekind = StmtK;
            t->subkind.stmt = kind;
            t->linenum = token->linenum;
            t->expType = Void;
            t->attr.name = strdup(token->tokeninput);
            t->memSize = 1;
            t->memKind = None;
            t->isOffset = false;
            t->codeGenLineNum = 0;
        }
    }

    return t;
}

// create a new Exp node
TreeNode *newExpNode(ExpKind kind, TokenData *token){
    TreeNode *t = (TreeNode *) malloc(sizeof(TreeNode));
    int i;
    if( t==NULL){
        printf("Out of memory error at line %d\n", token->linenum);
    }  
    else{
        for(i=0; i<MAXCHILDREN; i++){
            t->child[i] = NULL;
            t->sibling = NULL;
            t->nodekind = ExpK;
            t->subkind.exp = kind;
            t->linenum = token->linenum;
            t->expType = Void;
            t->memSize = 1;
            t->memKind = None;
            t->isOffset = false;
            t->codeGenLineNum = 0;
        }
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
void printTree(TreeNode *t, bool typing_option, int numSiblings, bool memTyping){
    int i;
    bool W_TYPING = typing_option;
    int countSibs = 0;

    if(t == NULL){
        printf("empty tree, will not print\n");
    }

    while(t != NULL){
        switch(t->nodekind){
            case DeclK:
                switch(t->subkind.decl){
                    case VarK:
                        if(t->isArray){
                            
                            printf("Var: %s is array of type ",t->attr.name);
                            getExpType(t->expType);
                            if(memTyping){
                                printf(" [mem: %s loc: %d size: %d]", returnMemKind(t->memKind), t->offset, t->memSize);
                            }
                            printf(" [line: %d]\n", t->linenum);
                            
                        }
                        else if(t->isStatic){
                            printf("Var: %s of static type ",t->attr.name);
                            getExpType(t->expType);
                            if(memTyping){
                                printf(" [mem: %s loc: %d size: %d]", returnMemKind(t->memKind), t->offset, t->memSize);
                            }
                            printf(" [line: %d]\n", t->linenum);
                        }
                        else{
                            printf("Var: %s of type ", t->attr.name);
                            getExpType(t->expType);
                            if(memTyping){
                                printf(" [mem: %s loc: %d size: %d]", returnMemKind(t->memKind), t->offset, t->memSize);
                            }
                            printf(" [line: %d]\n", t->linenum);
                        }
                        break;

                    case FuncK:
                        printf("Func: %s returns type ", t->attr.name);
                        getExpType(t->expType);
                        if(memTyping){
                            printf(" [mem: %s loc: %d size: %d]", returnMemKind(t->memKind), t->offset, t->memSize);
                        }
                        printf(" [line: %d]\n", t->linenum);
                        break;

                    case ParamK:
                        if(t->isArray){
                            printf("Parm: %s is array of type ", t->attr.name);
                            getExpType(t->expType);
                            if(memTyping){
                                printf(" [mem: %s loc: %d size: %d]", returnMemKind(t->memKind), t->offset, t->memSize);
                            }
                            printf(" [line: %d]\n", t->linenum);
                        }
                        else{
                            printf("Parm: %s of type ", t->attr.name);
                            getExpType(t->expType);
                            if(memTyping){
                                printf(" [mem: %s loc: %d size: %d]", returnMemKind(t->memKind), t->offset, t->memSize);
                            }
                            printf(" [line: %d]\n", t->linenum);
                        }

                        break;

                    default:
                        break;
                }
                break;

            case StmtK:
                switch(t->subkind.stmt){
                    
                    case NullK:
                        printf("NULL [line: %d]\n", t->linenum);
                        if(memTyping){
                                printf(" [mem: %s loc: %d size: %d]", returnMemKind(t->memKind), t->offset, t->memSize);
                            }
                        break;
                    
                    case IfK:
                        printf("If [line: %d]\n", t->linenum);
                        break;

                    case WhileK:
                        printf("While [line: %d]\n", t->linenum);
                        if(memTyping){
                                printf(" [mem: %s loc: %d size: %d]", returnMemKind(t->memKind), t->offset, t->memSize);
                            }
                        break;

                    case ForK:
                        printf("For ");
                        if(memTyping){
                            printf(" [mem: %s loc: %d size: %d]", returnMemKind(t->memKind), t->offset, t->memSize);
                        }
                        printf(" [line: %d]\n", t->linenum);
                        break;

                    case CompoundK:
                        printf("Compound ");
                        if(memTyping){
                            printf(" [mem: %s loc: %d size: %d]", returnMemKind(t->memKind), t->offset, t->memSize);
                        }
                        printf(" [line: %d]\n", t->linenum);
                        break;

                    case ReturnK:
                        printf("Return [line: %d]\n", t->linenum);
                        
                        break;

                    case BreakK:
                        printf("Break [line: %d]\n", t->linenum);
                        if(memTyping){
                                printf(" [mem: %s loc: %d size: %d]", returnMemKind(t->memKind), t->offset, t->memSize);
                            }
                        break;

                    case RangeK:
                        printf("Range [line: %d]\n", t->linenum);
                        if(memTyping){
                                printf(" [mem: %s loc: %d size: %d]", returnMemKind(t->memKind), t->offset, t->memSize);
                            }
                        break;

                    default:
                        break;
                }
                break;

            case ExpK:
                switch(t->subkind.exp){
                    case OpK:
                        if(t->child[1] == NULL && !strcmp(t->attr.name, "-")){
                            
                            printf("Op: chsign");
                            if(W_TYPING){
                                if(t->expType == UndefinedType){
                                    printf(" of undefined type ");
                                }
                                else{
                                    printf(" of type ");
                                    getExpType(t->expType);
                                }
                            }
                            /*
                            if(memTyping){
                                printf(" [mem: %s loc: %d size: %d]", returnMemKind(t->memKind), t->offset, t->memSize);
                            }
                            */
                            printf(" [line: %d]\n", t->linenum);
                        }
                        else if(t->child[1] == NULL && !strcmp(t->attr.name, "*")){

                            printf("Op: sizeof");
                            if(W_TYPING){
                                if(t->expType == UndefinedType){
                                    printf(" of undefined type ");
                                }
                                else{
                                    printf(" of type ");
                                    getExpType(t->expType);
                                }
                            }
                            /*
                            if(memTyping){
                                printf(" [mem: %s loc: %d size: %d]", returnMemKind(t->memKind), t->offset, t->memSize);
                            }
                            */
                            printf(" [line: %d]\n", t->linenum);
                        }
                        else{
                            printf("Op: %s", t->attr.name);
                            if(W_TYPING){
                                if(t->expType == UndefinedType || t->expType == Void){
                                    printf(" of undefined type ");
                                }
                                else{
                                    printf(" of type ");
                                    getExpType(t->expType);
                                }
                            }
                            /*
                            if(memTyping){
                                printf(" [mem: %s loc: %d size: %d]", returnMemKind(t->memKind), t->offset, t->memSize);
                            }
                            */
                            printf(" [line: %d]\n", t->linenum);
                        }
                        break;
                        
                    case ConstantK:
                        switch (t->expType){
                        case Integer:
                            printf("Const %d", t->attr.value);
                            if(W_TYPING){
                                printf(" of type int");
                            }
                            /*
                            if(memTyping){
                                printf(" [mem: %s loc: %d size: %d]", returnMemKind(t->memKind), t->offset, t->memSize);
                            }
                            */
                            printf(" [line: %d]\n", t->linenum);
                            break;
                        
                        case Boolean:
                            printf("Const %s",t->attr.name);
                            if(W_TYPING){
                                printf(" of type bool");
                            }
                            if(memTyping){
                                printf(" [mem: %s loc: %d size: %d]", returnMemKind(t->memKind), t->offset, t->memSize);
                            }
                            printf(" [line: %d]\n", t->linenum);
                            break;

                        case CharInt:
                            printf("Const %s", t->attr.string);
                            if(W_TYPING){
                                printf(" of array of type char");
                            }
                            if(memTyping){
                                printf(" [mem: %s loc: %d size: %d]", returnMemKind(t->memKind), t->offset, t->memSize);
                            }
                            printf(" [line: %d]\n", t->linenum);
                            break;

                        case Char:
                            if(t->isArray){
                                printf("Const \"%s\"", t->attr.string);
                                if(W_TYPING){
                                    printf(" of array of type char");
                                }
                                if(memTyping){
                                    printf(" [mem: %s loc: %d size: %d]", returnMemKind(t->memKind), t->offset, t->memSize);
                                }
                                printf(" [line: %d]\n", t->linenum);
                            }
                            else{
                                printf("Const \'%c\'",t->attr.cvalue);
                                if(W_TYPING){
                                    printf(" of type char");
                                }
                                if(memTyping){
                                    printf(" [mem: %s loc: %d size: %d]", returnMemKind(t->memKind), t->offset, t->memSize);
                                }
                                printf(" [line: %d]\n", t->linenum);
                            }
                            
                            break;

                        default:
                            break;

                        }
                        break;

                    case IdK:
                        printf("Id: %s", t->attr.name);
                        if(W_TYPING){
                            if(t->expType == Void || t->expType == UndefinedType){
                                printf(" of undefined type ");
                            }
                            else{
                                if(t->isStatic && t->isArray){
                                    printf(" of static array");
                                }

                                printf(" of type ");
                                getExpType(t->expType);
                            }
                        }
                        if(memTyping){
                            printf(" [mem: %s loc: %d size: %d]", returnMemKind(t->memKind), t->offset, t->memSize);
                        }
                        printf(" [line: %d]\n", t->linenum);
                        break;

                    case AssignK:
                        printf("Assign: %s", t->attr.name);
                        if(W_TYPING){
                            printf(" of type ");
                            getExpType(t->expType);
                        }
                        printf(" [line: %d]\n", t->linenum);
                        break;

                    case InitK:
                        //printf("Init: %s [line: %d]\n", t->attr.name, t->linenum);
                        break;

                    case CallK:
                        printf("Call: %s", t->attr.name);
                        if(W_TYPING){
                            printf(" of type ");
                            getExpType(t->expType);
                        }

                        printf(" [line: %d]\n", t->linenum);
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
                printTree(t->child[i], W_TYPING, 0, memTyping);
                
                WS--;
            }
        }

        if(t->sibling != NULL){
            numSiblings++;
            printWhiteSpace(WS);
            printf("Sibling: %d ", numSiblings);
        }

        t = t->sibling;
    }
}

// return expType as string
void getExpType(ExpType t){

    switch(t){
        case Void:
            printf("void");
            break;
        case Integer:
            printf("int");
            break;
        case Boolean:
            printf("bool");
            break;
        case Char:
            printf("char");
            break;
        case CharInt:
            printf("CharInt");
            break;
        case Equal:
            printf("Equal");
            break;
        case UndefinedType:
            printf("undefined type");
            break;
        default: 
            printf("exprType not found");
            break;
    }
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

char *returnMemKind(VarKind kind){
    char *str;

    switch(kind){
        case None:
            str = strdup("None");
            break;
        case Local:
            str = strdup("Local");
            break;
        case Global:
            str = strdup("Global");
            break;
        case Parameter:
            str = strdup("Parameter");
            break;
        case LocalStatic:
            str = strdup("LocalStatic");
            break;
        default:
            break;
    }

    return str;
}