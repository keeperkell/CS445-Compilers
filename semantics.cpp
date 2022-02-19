// semantics.cpp

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
                            isBinaryOps(t);
                        }
                        else{
                            // long set of checks, should move into function
                            isUnaryOps(t);
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
                            unaryAssigns(t);
                        }
                        else{
                            //if not unary, then binary. long check, should write into function
                            binaryAssigns(t);
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

// function moved from inside OpK
void isUnaryOps(TreeNode *){

}

// function moved from inside AssignK
void unaryAssign(TreeNode *){

}

// function moved from inside OpK
void isBinaryOps(TreeNode *){

}

// function moved from inside AssignK
void binaryAssign(TreeNode *){

}