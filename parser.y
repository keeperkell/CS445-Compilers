%{
// // // // // // // // // // // // // // // // // // // // // // // 
// CS445 - parser.y
//
// Keller Lawson
// 
// Last Updated
// Feb 19, 2022     

#include "scanType.h"     // TokenData Type
#include "treeNode.h"     // Tree Struct
#include "symbolTable.h"  // Symbol Table
#include "semantics.h"    // Semantics  

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <unistd.h>   

extern int yylex();
extern FILE *yyin;
extern int line;         // ERR line number from the scanner!!
extern int numErrors;    // ERR err count
int numWarnings;         // ERR warning count
bool W_TYPING; 

static TreeNode *AST;
extern SymbolTable st;

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
%token <tokenData> BREAK RETURN BEGN FINISH TO DO BY WHILE

%type <tree> declList decl varDecl scopedVarDecl varDeclList
%type <tree> varDeclInit varDeclId funDecl params paramList paramTypeList
%type <tree> paramIdList paramId stmt expStmt compoundStmt localDecls stmtList 
%type <tree> iterRange returnStmt breakStmt exp assignop
%type <tree> simpleExp andExp unaryRelExp relExp relop sumExp sumop mulExp mulop
%type <tree> unaryExp unaryop factor mutable immutable call args argList constant
%type <tree> matched unmatched stmtEnd

%type <type> typeSpec

%%

program       : declList                                        { AST = $1;}
              ;

declList      : declList decl                                   { $$ = addSibling($1, $2); }
              | decl                                            { $$ = $1; }
              ;

decl          : varDecl                                         { $$ = $1; }
              | funDecl                                         { $$ = $1; }
              ;

varDecl       : typeSpec varDeclList SEMICOLON                  { $$ = $2; assignTyping($$, $1); }
              ;

scopedVarDecl : STATIC typeSpec varDeclList SEMICOLON           { $$ = $3; 
                                                                  $$->isStatic = true; 
                                                                  assignTyping($$, $2); 
                                                                }
              | typeSpec varDeclList SEMICOLON                  { $$ = $2; 
                                                                  assignTyping($$, $1);
                                                                 }
              ;

varDeclList   : varDeclList COMMA varDeclInit                   { $$ = addSibling($1, $3); }
              | varDeclInit                                     { $$ = $1; }
              ;

varDeclInit   : varDeclId                                       { $$ = $1; }
              | varDeclId COLON simpleExp                       { $$ = $1; 
                                                                  $1->child[0] = $3; 
                                                                }
              ;

varDeclId     : ID                                              { $$ = newDeclNode(VarK, $1); 
                                                                  $$->attr.name = $1->tokeninput;
                                                                }
              | ID LBRACKET NUMCONST RBRACKET                   { $$ = newDeclNode(VarK, $1);       // Ex: ID[NUMCONST]
                                                                  $$->attr.name = $1->tokeninput;
                                                                  $$->isArray = true;
                                                                  $$->expType = UndefinedType;
                                                                }
              ;

typeSpec      : BOOL                                             { $$ = Boolean; }
              | CHAR                                             { $$ = Char; }
              | INT                                              { $$ = Integer; }
              ;

funDecl       : typeSpec ID LPAREN params RPAREN compoundStmt    { $$ = newDeclNode(FuncK, $2);     // Ex: BOOL ID(params) compoundStmt
                                                                   $$->attr.name = $2->tokeninput;
                                                                   $$->child[0] = $4;
                                                                   $$->child[1] = $6;
                                                                   $$->expType = $1;
                                                                 }
              | ID LPAREN params RPAREN compoundStmt             { $$ = newDeclNode(FuncK, $1);     // Ex: BOOL ID(params) compoundStmt
                                                                   $$->attr.name = $1->tokeninput;
                                                                   $$->child[0] = $3;
                                                                   $$->child[1] = $5;
                                                                 }
              ;

params        : paramList                                        { $$ = $1; }
              | %empty                                           { $$ = NULL; }
              ;

paramList     : paramList SEMICOLON paramTypeList                { $$ = addSibling($1, $3); }
              | paramTypeList                                    { $$ = $1; }
              ;

paramTypeList : typeSpec paramIdList                             { $$ = $2; assignTyping($$, $1); }
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

stmt          : matched                                          { $$ = $1; }           // Fix for dangling else
              | unmatched                                        { $$ = $1; }
              ;

matched       : stmtEnd                                          { $$ = $1; }
              | IF simpleExp THEN matched ELSE matched           { $$ = newStmtNode(IfK, $1); 
                                                                   $$->child[0] = $2;
                                                                   $$->child[1] = $4;
                                                                   $$->child[2] = $6;
                                                                 } 
              | WHILE simpleExp DO matched                       { $$ = newStmtNode(WhileK, $1);
                                                                   $$->child[0] = $2;
                                                                   $$->child[1] = $4;
                                                                   $$->attr.name = $1->tokeninput;
                                                                 }
              | FOR ID ASGN iterRange DO matched                 { $$ = newStmtNode(ForK, $1);
                                                                   $$->child[0] = newDeclNode(VarK, $2);
                                                                   $$->child[0]->expType = Integer;
                                                                   $$->attr.name = $3->tokeninput;
                                                                   $$->child[1] = $4;
                                                                   $$->child[2] = $6;
                                                                   
                                                                 }
              ;

unmatched     : IF simpleExp THEN matched ELSE unmatched         { $$ = newStmtNode(IfK, $1); 
                                                                   $$->child[0] = $2;
                                                                   $$->child[1] = $4;
                                                                   $$->child[2] = $6; 
                                                                 } 
              | WHILE simpleExp DO unmatched                     { $$ = newStmtNode(WhileK, $1);
                                                                   $$->child[0] = $2;
                                                                   $$->child[1] = $4;
                                                                   $$->attr.name = $1->tokeninput;
                                                                 }
              | FOR ID ASGN iterRange DO unmatched               { $$ = newStmtNode(ForK, $1);
                                                                   $$->child[0] = newDeclNode(VarK, $2);
                                                                   $$->child[0]->expType = Integer;
                                                                   $$->attr.name = $3->tokeninput;
                                                                   $$->child[1] = $4;
                                                                   $$->child[2] = $6;
                                                                   
                                                                 }
              | IF simpleExp THEN stmt                           { $$ = newStmtNode(IfK, $1);              
                                                                   $$->child[0] = $2;
                                                                   $$->child[1] = $4; 
                                                                 }
              ;

stmtEnd       : expStmt                                          { $$ = $1; }
              | compoundStmt                                     { $$ = $1; }
              | returnStmt                                       { $$ = $1; }
              | breakStmt                                        { $$ = $1; }
              ;

expStmt       : exp SEMICOLON                                    { $$ = $1; }
              | SEMICOLON                                        { $$ = NULL; }
              ;

compoundStmt  : BEGN localDecls stmtList FINISH                  { $$ = newStmtNode(CompoundK, $1);
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

mutable       : ID                                               { $$ = newExpNode(IdK, $1);
                                                                   $$->attr.name = $1->tokeninput;    
                                                                 }
              | ID LBRACKET exp RBRACKET                         { $$ = newExpNode(OpK, $2);  
                                                                  $$->child[0] = newExpNode(IdK, $1);
                                                                  $$->child[0]->attr.name = $1->tokeninput;
                                                                  $$->child[0]->isArray = true;
                                                                  $$->child[1] = $3; 
                                                                  $$->attr.name = $2->tokeninput;
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
                                                                 }
              | CHARCONST                                        { $$ = newExpNode(ConstantK, $1);
                                                                   $$->attr.cvalue = $1->cvalue; 
                                                                   $$->expType = Char;
                                                                 }
              | STRINGCONST                                      { $$ = newExpNode(ConstantK, $1);
                                                                   $$->attr.string = $1->svalue; 
                                                                   $$->expType = CharInt;
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
    TreeNode *funcMainNode;

    // get CLI option when program is run
    if((option = getopt(argc, argv, "dDhpP")) != -1){

      if ((yyin = fopen(argv[2], "r"))) {
            // file open successful
      }
      else {
            // failed to open file
            numErrors++; 

            printf("ERROR(ARGLIST): source file \"%s\" could not be opened. \n", argv[2]);
            printf("Number of warnings: %d\n", numWarnings);
            printf("Number of errors: %d\n", numErrors);
            exit(1);
      }
      
      if(option == 'd' || option == 'D' | option == 'h'){
        switch(option){
          case 'd':
            yydebug = 1;
            yyparse();
            break;

          case 'D':

            st.debug(1);
            yyparse();
            semanticAnalysis(AST);
            
            break;
            
          case 'h':
            printf("usage: c- [options] [sourcefile]\n");
            printf("options: \n");
            printf("-d          - turn on parser debugging\n");
            printf("-D          - turn on symbol table debugging\n");
            printf("-h          - print this usage message\n");
            printf("-p          - print the abstract syntax tree");
            printf("-P          - print the abstract syntax tree plus type information");     
            break; 
        }
      }
      else{
        // Parse Tree and check for errors
        yyparse();

        if(!numErrors){
          switch(option){
            case 'p':
              W_TYPING = false;
              printTree(AST, W_TYPING, 0);
              break;

            case 'P':
              semanticAnalysis(AST);
              funcMainNode = (TreeNode *)st.lookup("main");
              
              // if main doesnt exist, print error
              if(!funcMainNode){
                numErrors++;
                
                printf("ERROR(LINKER): A function named \'main()\' must be defined\n");
              }

              W_TYPING = true;
              printTree(AST, W_TYPING, 0);
              
              /*
              if(!numErrors){
                W_TYPING = true;
                printTree(AST, W_TYPING, 0);
              }
              */
              
              break;

            default:
              break;
          }
        } 
      }

      // report number of errors and warning
      printf("Number of warnings: %d\n", numWarnings);
      printf("Number of errors: %d\n", numErrors);

    }
    else{
      if ((yyin = fopen(argv[1], "r"))) {
            // file open successful
      }
      else {
            // failed to open file
            numErrors++;
            printf("ERROR(ARGLIST): source file \"%s\" could not be opened\n", argv[1]);
            printf("Number of warnings: %d\n", numWarnings);
            printf("Number of errors: %d\n", numErrors);
            exit(1);
      }   
      yyparse();
    }

    return 0;
}
