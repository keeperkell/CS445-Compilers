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

void checkAssignOpK(TreeNode *);
void checkOpK(TreeNode *);
void checkIdK(TreeNode *);
char *returnExpType(ExpType);

// check parameters of function call
void checkCallParams(TreeNode *, TreeNode *, TreeNode *, TreeNode *, int);
// check parameters of for 
void checkForKParams(TreeNode *);
// helper function to recursively check ops until no more children exist
void checkRecursiveOps(TreeNode *, TreeNode *);
//debug function to print decl types
char *getDeclType(DeclKind);

#endif
