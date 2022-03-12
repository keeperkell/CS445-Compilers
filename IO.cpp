#include "IO.h"
#include "scanType.h"
#include "treeNode.h"
#include "semantics.h"
#include "symbolTable.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern SymbolTable st;

void IOconstructor(){
    TreeNode *tmpChild = (TreeNode *) malloc(sizeof(TreeNode));

    // children nodes will all be the same
    tmpChild->attr.name = strdup("*dummy*");
    tmpChild->linenum = -1;   
    
    // void output(int)
    TreeNode *output = (TreeNode *) malloc(sizeof(TreeNode));
    output->attr.name = strdup("output");
    output->linenum = -1;
    output->subkind.decl = FuncK;
    output->expType = Void;
    output->child[0] = tmpChild;
    output->child[0]->expType = Integer;
    output->isIO = true;
    st.insert(output->attr.name, output);

    // void outputb(bool)
    TreeNode *outputb = (TreeNode *) malloc(sizeof(TreeNode));
    outputb->attr.name = strdup("outputb");
    outputb->linenum = -1;
    outputb->subkind.decl = FuncK;
    outputb->expType = Void;
    outputb->child[0] = tmpChild;
    outputb->child[0]->expType = Boolean;
    outputb->isIO = true;
    st.insert(outputb->attr.name, outputb);

    // void outputc(char)
    TreeNode *outputc = (TreeNode *) malloc(sizeof(TreeNode));
    outputc->attr.name = strdup("outputc");
    outputc->linenum = -1;
    outputc->subkind.decl = FuncK;
    outputc->expType = Void;
    outputc->child[0] = tmpChild;
    outputc->child[0]->expType = Char;
    outputc->isIO = true;
    st.insert(outputc->attr.name, outputc);

    // int input()
    TreeNode *input = (TreeNode *) malloc(sizeof(TreeNode));
    input->attr.name = strdup("input");
    input->linenum = -1;
    input->subkind.decl = FuncK;
    input->expType = Integer;
    input->isIO = true;
    st.insert(input->attr.name, input);

    // bool inputb()
    TreeNode *inputb = (TreeNode *) malloc(sizeof(TreeNode));
    inputb->attr.name = strdup("inputb");
    inputb->linenum = -1;
    inputb->subkind.decl = FuncK;
    inputb->expType = Boolean;
    inputb->isIO = true;
    st.insert(inputb->attr.name, inputb);

    // char inputc()
    TreeNode *inputc = (TreeNode *) malloc(sizeof(TreeNode));
    inputc->attr.name = strdup("inputc");
    inputc->linenum = -1;
    inputc->subkind.decl = FuncK;
    inputc->expType = Char;
    inputc->isIO = true;
    st.insert(inputc->attr.name, inputc);
    
    // void outnl()
    TreeNode *outnl = (TreeNode *) malloc(sizeof(TreeNode));
    outnl->attr.name = strdup("outnl");
    outnl->linenum = -1;
    outnl->subkind.decl = ParamK;
    outnl->expType = Void;
    outnl->isIO = true;
    st.insert(outnl->attr.name, outnl);

}