// semantics.h

#ifndef SEMANTICS
#define SEMANTICS

#include "scanType.h"
#include "treeNode.h"
#include "symbolTable.h"

void semanticAnalysis(TreeNode *, SymbolTable);
void isUnaryOps(TreeNode *);
void unaryAssign(TreeNode *);
void isBinaryOps(TreeNode *);
void binaryAssign(TreeNode *);
#endif
