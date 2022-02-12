%{
// // // // // // // // // // // // // // // // // // // // // // // 
// CS445 - parser.y
//
// Keller Lawson
// 
// Last Updated
// Feb 9, 2022     

#include "scanType.h"  // TokenData Type
#include "treeNode.h"  // Tree Struct

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <unistd.h>   

extern int yylex();
extern FILE *yyin;
extern int line;         // ERR line number from the scanner!!
extern int numErrors;    // ERR err count

static TreeNode *AST;

#define YYERROR_VERBOSE
void yyerror(const char *msg)
{
    printf("ERROR(%d): %s\n", line, msg);
    numErrors++;
}


%}

// this is included in the tab.h file
// so scanType.h must be included before the tab.h file!!!!
%union {
    ExpType type;           // For passing types( i.e. pass a type in a decl like in or bool)
    TokenData *tokenData;   // For terminals. Token data comes from yylex() in the $ vars
    TreeNode *tree;         // For nonterminals. Add these nodes as you build the tree. 
}

%token <tokenData> ID BOOLCONST NUMCONST CHARCONST STRINGCONST SYMBOL
%token <tokenData> ASGN ADDASGN SUBASGN MULASGN DIVASGN INC DEC GEQ LEQ NEQ
%token <tokenData> LESSTHAN GREATTHAN LPAREN RPAREN LBRACKET RBRACKET
%token <tokenData> PLUS EQUAL MINUS MULT DIV MOD
%token <tokenData> COLON SEMICOLON QUESTION COMMA
%token <tokenData> INT BOOL CHAR STATIC AND OR NOT IF ELSE THEN FOR
%token <tokenData> BREAK RETURN BEGN END TO DO BY WHILE

%type <tree> declList decl varDecl scopedVarDecl varDeclList
%type <tree> varDeclInit varDeclId typeSpec funDecl params paramList paramTypeList
%type <tree> paramIdList paramId stmt expStmt compoundStmt localDecls stmtList 
%type <tree> selectStmt iterStmt iterRange returnStmt breakStmt exp assignop
%type <tree> simpleExp andExp unaryRelExp relExp relop sumExp sumop mulExp mulop
%type <tree> unaryExp unaryop factor mutable immutable call args argList constant

%type <tree> stmtEnter iterStmtEnter selectStmtEnter stmtEnd
%type <tree> stmtElse iterStmtElse selectStmtElse


%%

program       : declList                                        { AST = $1;}
              ;

declList      : declList decl                                   { $$ = addSibling($1, $2); }
              | decl                                            { $$ = $1; }
              ;

decl          : varDecl                                         { $$ = $1; }
              | funDecl                                         { $$ = $1; }
              ;

varDecl       : typeSpec varDeclList SEMICOLON                  { $$ = $2; assignTyping($$, $1->expType); }
              ;

scopedVarDecl : STATIC typeSpec varDeclList SEMICOLON           { $$ = $3; 
                                                                  $$->isStatic = true; 
                                                                  assignTyping($$, $2->expType); 
                                                                }
              | typeSpec varDeclList SEMICOLON                  { $$ = $2; assignTyping($$, $1->expType); }
              ;

varDeclList   : varDeclList COMMA varDeclInit                   { $$ = addSibling($1, $3); }
              | varDeclInit                                     { $$ = $1; }
              ;

varDeclInit   : varDeclId                                       { $$ = $1; }
              | varDeclId COLON simpleExp                       { $$ = $1; $$->child[0] = $3; }
              ;

varDeclId     : ID                                              { $$ = newDeclNode(VarK, $1); 
                                                                  $$->attr.name = $1->tokeninput;
                                                                }
              | ID LBRACKET NUMCONST RBRACKET                   { $$ = newDeclNode(VarK, $1);       // Ex: ID[NUMCONST]
                                                                  $$->attr.name = $1->tokeninput;
                                                                      //$$->TokenData = $1;
                                                                  $$->isArray = true;
                                                                  $$->expType = UndefinedType;
                                                                }
              ;

typeSpec      : BOOL                                             { $$->expType = Boolean; }
              | CHAR                                             { $$->expType = Char; }
              | INT                                              { $$->expType = Integer; }
              ;

funDecl       : typeSpec ID LPAREN params RPAREN compoundStmt    { $$ = newDeclNode(FuncK, $2);     // Ex: BOOL ID(params) compoundStmt
                                                                   $$->attr.name = $2->tokeninput;
                                                                   $$->child[0] = $4;
                                                                   $$->child[1] = $6;
                                                                   $$->expType = $1->expType;
                                                                      //$$->tokenData = $2;
                                                                 }
              | ID LPAREN params RPAREN compoundStmt             { $$ = newDeclNode(FuncK, $1);     // Ex: BOOL ID(params) compoundStmt
                                                                   $$->attr.name = $1->tokeninput;
                                                                   $$->child[0] = $3;
                                                                   $$->child[1] = $5;
                                                                      //$$->tokenData = $1;
                                                                 }
              ;

params        : paramList                                        { $$ = $1; }
              | %empty                                           { $$ = NULL; }
              ;

paramList     : paramList SEMICOLON paramTypeList                { $$ = addSibling($1, $3); }
              | paramTypeList                                    { $$ = $1; }
              ;

paramTypeList : typeSpec paramIdList                             { $$ = $2; assignTyping($$, $1->expType); }
              ;

paramIdList   : paramIdList COMMA paramId                        { $$ = addSibling($1, $3); }
              | paramId                                          { $$ = $1; }
              ;

paramId       : ID                                               { $$ = newDeclNode(ParamK, $1);
                                                                   $$->attr.name = $1->tokeninput; 
                                                                 }
              | ID LBRACKET RBRACKET                             { $$ = newDeclNode(ParamK, $1);
                                                                   $$->isArray = true;
                                                                   $$->attr.name = $1->tokeninput; 
                                                                 }
              ;

stmt          : stmtEnter                                        { $$ = $1; }           // Fix for dangling else
              | stmtElse                                         { $$ = $1; }
              ;

stmtEnter     : iterStmtEnter                                    { $$ = $1; }
              | selectStmtEnter                                  { $$ = $1; }
              | stmtEnd                                          { $$ = $1; }
              ;

stmtElse      : iterStmtElse                                     { $$ = $1; }
              | selectStmtElse                                   { $$ = $1; }
              ;

expStmt       : LESSTHAN exp GREATTHAN SEMICOLON                 { $$ = $2; }
              | SEMICOLON                                        { $$ = NULL; }
              ;

selectStmtEnter : IF simpleExp THEN stmtEnter                    { $$ = newStmtNode(IfK, $1); 
                                                                   $$->child[0] = $2;
                                                                   $$->child[1] = $4; 
                                                                 }
              | IF simpleExp THEN stmt ELSE stmtEnter          { $$ = newStmtNode(IfK, $1); 
                                                                   $$->child[0] = $2;
                                                                   $$->child[1] = $4;
                                                                   $$->child[2] = $6; 
                                                                 } 
              ;   

iterStmtEnter : WHILE simpleExp DO stmtEnter                     { $$ = newStmtNode(WhileK, $1);
                                                                   $$->child[0] = $2;
                                                                   $$->child[1] = $4;
                                                                 }
              | FOR ID ASGN iterRange DO stmtEnter               { $$ = newStmtNode(ForK, $1);
                                                                   $$->attr.name = $3->tokeninput;
                                                                   $$->child[0] = newDeclNode(VarK, $2);
                                                                   $$->child[0]->expType = Integer;
                                                                   $$->child[1] = $4;
                                                                   $$->child[2] = $6;
                                                                 }
              ;                                                 

selectStmtElse : IF simpleExp THEN stmtElse                      { $$ = newStmtNode(IfK, $1); 
                                                                   $$->child[0] = $2;
                                                                   $$->child[1] = $4; 
                                                                 }
              | IF simpleExp THEN stmt ELSE stmtElse             { $$ = newStmtNode(IfK, $1); 
                                                                   $$->child[0] = $2;
                                                                   $$->child[1] = $4;
                                                                   $$->child[2] = $6; 
                                                                 } 
              ;

iterStmtElse  : WHILE simpleExp DO stmtElse                      { $$ = newStmtNode(WhileK, $1);
                                                                   $$->child[0] = $2;
                                                                   $$->child[1] = $4;
                                                                 }
              | FOR ID ASGN iterRange DO stmtElse                { $$ = newStmtNode(ForK, $1);
                                                                   $$->attr.name = $3->tokeninput;
                                                                   $$->child[0] = newDeclNode(VarK, $2);
                                                                   $$->child[0]->expType = Integer;
                                                                   $$->child[1] = $4;
                                                                   $$->child[2] = $6;
                                                                 }
              ;

stmtEnd       : expStmt                                          { $$ = $1; }
              | compoundStmt                                     { $$ = $1; }
              | returnStmt                                       { $$ = $1; }
              | breakStmt                                        { $$ = $1; }
              ;

compoundStmt  : BEGN localDecls stmtList END                     { $$ = newStmtNode(CompoundK, $1);
                                                                   $$->child[0] = $2;
                                                                   $$->child[1] = $3;
                                                                 }
              ;

localDecls    : localDecls scopedVarDecl                         { $$ = addSibling($1, $2); }
              | %empty                                           { $$ = NULL; }
              ;

stmtList      : stmtList stmt                                    { $$ = addSibling($1, $2); }
              | %empty                                           { $$ = NULL; }
              ;

iterRange     : simpleExp TO simpleExp                           { $$ = newStmtNode(RangeK, $2);
                                                                   $$->child[0] = $1;
                                                                   $$->child[1] = $3;
                                                                 }
              | simpleExp TO simpleExp BY simpleExp              { $$ = newStmtNode(RangeK, $2);
                                                                   $$->child[0] = $1;
                                                                   $$->child[1] = $3;
                                                                   $$->child[2] = $5;
                                                                 }
              ;

returnStmt    : RETURN SEMICOLON                                 { $$ = newStmtNode(ReturnK, $1);
                                                                   $$->attr.name = $1->tokeninput;
                                                                 }
              | RETURN exp SEMICOLON                             { $$ = newStmtNode(ReturnK, $1);
                                                                   $$->child[0] = $2;
                                                                   $$->attr.name = $1->tokeninput;
                                                                   $$->expType = $2->expType;
                                                                 }
              ;

breakStmt     : BREAK SEMICOLON                                  { $$ = newStmtNode(BreakK, $1);
                                                                   $$->attr.name = $1->tokeninput;
                                                                 }
              ;

exp           : mutable assignop exp                             { $$ = $2; 
                                                                   $$->child[0] = $1;
                                                                   $$->child[1] = $3;
                                                                 }
              | mutable INC                                      { $$ = newExpNode(AssignK, $2);
                                                                   $$->child[0] = $1;
                                                                   $$->attr.name = $2->tokeninput;
                                                                   $$->expType = Integer;
                                                                 }
              | mutable DEC                                      { $$ = newExpNode(AssignK, $2);
                                                                   $$->child[0] = $1;
                                                                   $$->attr.name = $2->tokeninput;
                                                                   $$->expType = Integer;
                                                                 }
              | simpleExp                                        { $$ = $1; }
              ;

assignop      : ASGN                                             { $$ = newExpNode(AssignK, $1);
                                                                   $$->attr.name = $1->tokeninput;
                                                                   $$->expType = Integer;
                                                                 }
              | ADDASGN                                          { $$ = newExpNode(AssignK, $1);
                                                                   $$->attr.name = $1->tokeninput;
                                                                   $$->expType = Integer;
                                                                 }
              | SUBASGN                                          { $$ = newExpNode(AssignK, $1);
                                                                   $$->attr.name = $1->tokeninput;
                                                                   $$->expType = Integer;
                                                                 }
              | MULASGN                                          { $$ = newExpNode(AssignK, $1);
                                                                   $$->attr.name = $1->tokeninput;
                                                                   $$->expType = Integer;
                                                                 }
              | DIVASGN                                          { $$ = newExpNode(AssignK, $1);
                                                                   $$->attr.name = $1->tokeninput;
                                                                   $$->expType = Integer;
                                                                 }
              ;

simpleExp     : simpleExp OR andExp                              { $$ = newExpNode(OpK, $2);
                                                                   $$->child[0] = $1;
                                                                   $$->child[1] = $3;
                                                                   $$->attr.name = $2->tokeninput;
                                                                   $$->expType = Boolean;
                                                                 }
              | andExp                                           { $$ = $1; }
              ;

andExp        : andExp AND unaryRelExp                           { $$ = newExpNode(OpK, $2);
                                                                   $$->child[0] = $1;
                                                                   $$->child[1] = $3;
                                                                   $$->attr.name = $2->tokeninput;
                                                                   $$->expType = Boolean;
                                                                 }
              | unaryRelExp                                      { $$ = $1; }
              ;

unaryRelExp   : NOT unaryRelExp                                  { $$ = newExpNode(OpK, $1);
                                                                   $$->child[0] = $2;
                                                                   $$->attr.name = $1->tokeninput;
                                                                   $$->expType = Boolean;
                                                                 }
              | relExp                                           { $$ = $1; }
              ;

relExp        : sumExp relop sumExp                              { $$ = $2; 
                                                                   $$->child[0] = $1;
                                                                   $$->child[1] = $3;
                                                                 }
              | sumExp                                           { $$ = $1; }
              ;

relop         : LESSTHAN                                         { $$ = newExpNode(OpK, $1);
                                                                   $$->attr.name = $1->tokeninput;
                                                                   $$->expType = Boolean;
                                                                 }
              | LEQ                                              { $$ = newExpNode(OpK, $1);
                                                                   $$->attr.name = $1->tokeninput;
                                                                   $$->expType = Boolean;
                                                                 }
              | GREATTHAN                                        { $$ = newExpNode(OpK, $1);
                                                                   $$->attr.name = $1->tokeninput;
                                                                   $$->expType = Boolean;
                                                                 }
              | GEQ                                              { $$ = newExpNode(OpK, $1);
                                                                   $$->attr.name = $1->tokeninput;
                                                                   $$->expType = Boolean;
                                                                 }
              | EQUAL                                            { $$ = newExpNode(OpK, $1);
                                                                   $$->attr.name = $1->tokeninput;
                                                                   $$->expType = Boolean;
                                                                 }
              | NEQ                                              { $$ = newExpNode(OpK, $1);
                                                                   $$->attr.name = $1->tokeninput;
                                                                   $$->expType = Boolean;
                                                                 }
              ;

sumExp        : sumExp sumop mulExp                              { $$ = $2; 
                                                                   $$->child[0] = $1;
                                                                   $$->child[1] = $3;
                                                                 }
              | mulExp                                           { $$ = $1; }
              ;

sumop         : PLUS                                             { $$ = newExpNode(OpK, $1);
                                                                   $$->attr.name = $1->tokeninput;
                                                                   $$->expType = Integer;
                                                                 }
              | MINUS                                            { $$ = newExpNode(OpK, $1);
                                                                   $$->attr.name = $1->tokeninput;
                                                                   $$->expType = Integer;
                                                                 }
              ;

mulExp        : mulExp mulop unaryExp                            { $$ = $2; 
                                                                   $$->child[0] = $1;
                                                                   $$->child[1] = $3;
                                                                 }
              | unaryExp                                         { $$ = $1; }
              ;

mulop         : MULT                                             { $$ = newExpNode(OpK, $1);
                                                                   $$->attr.name = $1->tokeninput;
                                                                   $$->expType = Integer;
                                                                 }
              | DIV                                              { $$ = newExpNode(OpK, $1);
                                                                   $$->attr.name = $1->tokeninput;
                                                                   $$->expType = Integer;
                                                                 }
              | MOD                                              { $$ = newExpNode(OpK, $1);
                                                                   $$->attr.name = $1->tokeninput;
                                                                   $$->expType = Integer;
                                                                 }
              ;

unaryExp      : unaryop unaryExp                                 { $$ = $1; 
                                                                   $$->child[0] = $2;
                                                                 }
              | factor                                           { $$ = $1; }
              ;

unaryop       : MINUS                                            { $$ = newExpNode(OpK, $1);
                                                                   $$->attr.name = $1->tokeninput;
                                                                   $$->expType = Integer;
                                                                 }
              | MULT                                             { $$ = newExpNode(OpK, $1);
                                                                   $$->attr.name = $1->tokeninput;
                                                                   $$->expType = Integer;
                                                                 }
              | QUESTION                                         { $$ = newExpNode(OpK, $1);
                                                                   $$->attr.name = $1->tokeninput;
                                                                   $$->expType = Integer;
                                                                 }
              ;

factor        : mutable                                          { $$ = $1; }
              | immutable                                        { $$ = $1; }
              ;

mutable       : ID                                               { $$ = newDeclNode(VarK, $1);
                                                                   $$->attr.name = $1->tokeninput;    
                                                                 }
              | ID LBRACKET exp RBRACKET                         { $$ = newExpNode(OpK, $2);  
                                                                  $$->child[0] = newExpNode(IdK, $1);
                                                                  $$->child[0]->attr.name = $1->tokeninput;
                                                                  $$->child[0]->isArray = true;
                                                                  $$->child[1] = $3; 
                                                                }
              ;

immutable     : LPAREN exp RPAREN                                { $$ = $2; }
              | call                                             { $$ = $1; }
              | constant                                         { $$ = $1; }
              ;

call          : ID LPAREN args RPAREN                            { $$ = newExpNode(CallK, $1);
                                                                   $$->child[0] = $3;
                                                                   $$->attr.name = $1->tokeninput;
                                                                 }
              ;

args          : argList                                          { $$ = $1; }
              | %empty                                           { $$ = NULL; }
              ;

argList       : argList COMMA exp                                { $$ = addSibling($1, $3); }
              | exp                                              { $$ = $1; }

constant      : NUMCONST                                         { $$ = newExpNode(ConstantK, $1);
                                                                   $$->attr.value = $1->nvalue; 
                                                                   $$->expType = Integer;
                                                                   $$->attr.name = $1->tokeninput;
                                                                 }
              | CHARCONST                                        { $$ = newExpNode(ConstantK, $1);
                                                                   $$->attr.cvalue = $1->cvalue; 
                                                                   $$->expType = Char;
                                                                   $$->attr.name = $1->tokeninput;
                                                                 }
              | STRINGCONST                                      { $$ = newExpNode(ConstantK, $1);
                                                                   $$->attr.string = $1->svalue; 
                                                                   $$->expType = CharInt;
                                                                   $$->attr.name = $1->tokeninput;
                                                                 }
              | BOOLCONST                                        { $$ = newExpNode(ConstantK, $1);
                                                                   $$->attr.value = $1->nvalue; 
                                                                   $$->expType = Boolean;
                                                                   $$->attr.name = $1->tokeninput;
                                                                 }
              ;

%%
extern int yydebug;

int main(int argc, char *argv[])
{
    int option;

    // get CLI option when program is run
    if((option = getopt(argc, argv, "dp")) != -1){

      if ((yyin = fopen(argv[2], "r"))) {
            // file open successful
      }
      else {
            // failed to open file
            printf("ERROR: failed to open \'%s\'\n", argv[2]);
            exit(1);
      }    

      switch(option){
        case 'd':
          yydebug = 1;
          yyparse();
          break;

        case 'p':
          yyparse();
          printTree(AST, 0);
          break;
          
        default:
          break;
      }
    }
    else{
      if ((yyin = fopen(argv[1], "r"))) {
            // file open successful
      }
      else {
            // failed to open file
            printf("ERROR: failed to open \'%s\'\n", argv[1]);
            exit(1);
      }   
      yyparse();
    }

    return 0;
}
