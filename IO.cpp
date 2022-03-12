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
    TreeNode *tmp = (TreeNode *) malloc(sizeof(TreeNode));
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

    /*
    // void outputb(bool)
    t[1]->attr.name = strdup("outputb");
    t[1]->linenum = -1;
    t[1]->subkind.decl = FuncK;
    t[1]->expType = Void;
    t[1]->child[0] = tmpChild;
    t[1]->child[0]->expType = Boolean;
    t[1]->isIO = true;
    st.insert(t[1]->attr.name, t[1]);

    // void outputc(char)
    t[2]->attr.name = strdup("outputc");
    t[2]->linenum = -1;
    t[2]->subkind.decl = FuncK;
    t[2]->expType = Void;
    t[2]->child[0] = tmpChild;
    t[2]->child[0]->expType = Char;
    t[2]->isIO = true;
    st.insert(t[2]->attr.name, t[2]);
    /*

    /*
    // void outputb(bool)
    tmp->attr.name = strdup("outputb");
    tmp->linenum = -1;
    t[1] = newDeclNode(FuncK, tmp);
    t[1]->child[0] = newDeclNode(ParamK, tmpChild);
    t[1]->child[0]->expType = Boolean;
    t[1]->isIO = true;
    st.insert(t[1]->attr.name, t[1]);

    // void outpuc(char)
    tmp->attr.name = strdup("outputc");
    tmp->linenum = -1;
    t[2] = newDeclNode(FuncK, tmp);
    t[2]->child[0] = newDeclNode(ParamK, tmpChild);
    t[2]->child[0]->expType = Char;
    t[2]->isIO = true;
    st.insert(t[2]->attr.name, t[2]);

    // int input()
    tmp->attr.name = strdup("input");
    tmp->linenum = -1;
    t[3] = newDeclNode(FuncK, tmp);
    t[3]->expType = Integer;
    t[3]->isIO = true;
    st.insert(t[3]->attr.name, t[3]);

    // int inputb()
    tmp->attr.name = strdup("inputb");
    tmp->linenum = -1;
    t[4] = newDeclNode(FuncK, tmp);
    t[4]->expType = Boolean;
    t[4]->isIO = true;
    st.insert(t[4]->attr.name, t[4]);

    // int inputc()
    tmp->attr.name = strdup("inputc");
    tmp->linenum = -1;
    t[5] = newDeclNode(FuncK, tmp);
    t[5]->expType = Integer;
    t[5]->isIO = true;
    st.insert(t[5]->attr.name, t[5]);

    // void outnl()
    tmp->attr.name = strdup("outnl");
    tmp->linenum = -1;
    t[6] = newDeclNode(FuncK, tmp);
    t[6]->child[0] = newDeclNode(ParamK, tmpChild);
    t[6]->child[0]->expType = Void;
    t[6]->isIO = true;
    st.insert(t[6]->attr.name, t[6]);
    */
}