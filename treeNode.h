// // // // // // // // // // // // // // // // // // // // // // // 
// CS445 - treeNode.h
//
// Keller Lawson
// 
// Last Updated
// Feb 9, 2022  

#ifndef TREENODE_H
#define TREENODE_H

#include "scanType.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAXCHILDREN 3

// Kind of Operators
// these are the token numbers for the operators same as in flex
typedef int OpKind;

// Kind of statments
enum NodeKind {DeclK, StmtK, ExpK};

// Subkinds of Declarations
enum DeclKind {VarK, FuncK, ParamK};

//Subkinds of Statements
enum StmtKind {NullK, IfK, WhileK, ForK, CompoundK, ReturnK, BreakK, RangeK};

//Subkinds of Expressions
enum ExpKind {OpK, ConstantK, IdK, AssignK, InitK, CallK};

// ExpType is used for type checking (void means no type or value, undedfined type means undefined)
enum ExpType {Void, Integer, Boolean, Char, CharInt, Equal, UndefinedType};

//What kind of Scoping is used? (decided during typing)
enum VarKind {None, Local, Global, Parameter, LocalStatic};

typedef struct treeNode{
    // connectivity in the tree
    struct treeNode *child[MAXCHILDREN];        // children of the node
    struct treeNode *sibling;                   //sinblings for the node

    //what kind of node
    int linenum;                                 // linenum relevant to this node
    NodeKind nodekind;                          // type of this node

    union                                       //subtype of type
    {
        DeclKind decl;                          // used when DeclK
        StmtKind stmt;                          // used when StmtK
        ExpKind exp;                            // used when ExpK
    } subkind;

    union                                       // relevant data to type -> attr
    {
        OpKind op;                              // type of token (same as in bison)
        int value;                              // used when an integer constant or boolean
        unsigned char cvalue;                   // used when a character
        char *string;                           // used when a string constant
        char *name;                             // used when IdK
    } attr;
       
    ExpType expType;                            // used when ExpK for type checking
    bool isArray;                               // is this an array
    bool isStatic;                              // is staticly allocated
} TreeNode;

// Functions
TreeNode *newDeclNode(DeclKind kind, TokenData* token);
TreeNode *newStmtNode(DeclKind kind, TokenData* token);
TreeNode *newExpNode(DeclKind kind, TokenData* token); 

TreeNode *addSibling(TreeNode *t, TreeNode *s);

void printTree(TreeNode *, int);

#endif