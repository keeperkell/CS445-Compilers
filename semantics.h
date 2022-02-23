// // // // // // // // // // // // // // // // // // // // // // // 
// CS445 - semantics.h
//
// Keller Lawson
// 
// Last Updated
// Feb 19, 2022   

#ifndef SEMANTICS
#define SEMANTICS

#include "scanType.h"
#include "treeNode.h"
#include "symbolTable.h"

void semanticAnalysis(TreeNode *);
void unaryOps(TreeNode *, ExpKind, SymbolTable);
void binaryOps(TreeNode *, ExpKind, SymbolTable);
char *returnExpType(ExpType);

#endif
