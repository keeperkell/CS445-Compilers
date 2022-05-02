#ifndef CODE_GEN_H__
#define CODE_GEN_H__

// generate code file
void codeGen(char *outputFile, TreeNode *t);
// parse codegen
void genParse(TreeNode *t);

void codeGenDecl(TreeNode *t);
void codeGenStmt(TreeNode *t);
void codeGenExp(TreeNode *t);

// create main function
void genMainFunc(TreeNode *t);
// gen global and statics
void genGlobAndStatics(TreeNode *t);

#endif