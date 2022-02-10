// // // // // // // // // // // // // // // // // // // // // // // 
// CS445 - treeNode.c
//
// Keller Lawson
// 
// Last Updated
// Feb 9, 2022  

#include "scanType.h"
#include "treeNode.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

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

void printTree(TreeNode *t, int numSiblings){

}