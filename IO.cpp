#include "IO.h"
#include "scanType.h"
#include "treeNode.h"
#include "semantics.h"
#include "symbolTable.h"

extern SymbolTable st;

void IOconstructor(){
    TokenData *tmp;
    TokenData *tmpChild;


    // 7 IO nodes
    TreeNode *t[7];

    // children nodes will all be the same
    tmpChild->tokeninput = strdup("*dummy*");
    tmpChild->linenum = -1;   
    
    // void output(int)
    tmp->tokeninput = strdup("output");
    tmp->linenum = -1;
    t[0] = newDeclNode(FuncK, tmp);
    t[0]->child[0] = newDeclNode(ParamK, tmpChild);
    t[0]->child[0]->expType = Integer;
    t[0]->isIO = true;
    st.insert(t[0]->attr.name, t[0]);

    // void outputb(bool)
    tmp->tokeninput = strdup("outputb");
    tmp->linenum = -1;
    t[1] = newDeclNode(FuncK, tmp);
    t[1]->child[0] = newDeclNode(ParamK, tmpChild);
    t[1]->child[0]->expType = Boolean;
    t[1]->isIO = true;
    st.insert(t[1]->attr.name, t[1]);

    // void outpuc(char)
    tmp->tokeninput = strdup("outputc");
    tmp->linenum = -1;
    t[2] = newDeclNode(FuncK, tmp);
    t[2]->child[0] = newDeclNode(ParamK, tmpChild);
    t[2]->child[0]->expType = Char;
    t[2]->isIO = true;
    st.insert(t[2]->attr.name, t[2]);

    // int input()
    tmp->tokeninput = strdup("input");
    tmp->linenum = -1;
    t[3] = newDeclNode(FuncK, tmp);
    t[3]->expType = Integer;
    t[3]->isIO = true;
    st.insert(t[3]->attr.name, t[3]);

    // int inputb()
    tmp->tokeninput = strdup("inputb");
    tmp->linenum = -1;
    t[4] = newDeclNode(FuncK, tmp);
    t[4]->expType = Boolean;
    t[4]->isIO = true;
    st.insert(t[4]->attr.name, t[4]);

    // int inputc()
    tmp->tokeninput = strdup("inputc");
    tmp->linenum = -1;
    t[5] = newDeclNode(FuncK, tmp);
    t[5]->expType = Integer;
    t[5]->isIO = true;
    st.insert(t[5]->attr.name, t[5]);

    // void outnl()
    tmp->tokeninput = strdup("outnl");
    tmp->linenum = -1;
    t[6] = newDeclNode(FuncK, tmp);
    t[6]->child[0] = newDeclNode(ParamK, tmpChild);
    t[6]->child[0]->expType = Void;
    t[6]->isIO = true;
    st.insert(t[6]->attr.name, t[6]);
}