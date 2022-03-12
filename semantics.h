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

void checkAssignK(TreeNode *);
void checkOpK(TreeNode *);
void checkIdK(TreeNode *);
char *returnExpType(ExpType);

// check parameters of function call
void checkCallParams(TreeNode *, TreeNode *, TreeNode *, TreeNode *, int);
// check parameters of for 
void checkForKParams(TreeNode *);

#endif
