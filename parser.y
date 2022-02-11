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

double vars[26];    

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
    TokenData *tokenData;
}

%token <tokenData> ID BOOLCONST NUMCONST CHARCONST STRINGCONST SYMBOL OTHER
%token <tokenData> ASGN ADDASGN SUBASGN MULASGN DIVASGN INC DEC GEQ LEQ NEQ
%token <tokenData> LESSTHAN GREATTHAN LPAREN RPAREN LBRACKET RBRACKET
%token <tokenData> PLUS EQUAL MINUS MULT DIV MOD
%token <tokenData> COLON SEMICOLON QUESTION COMMA
%token <tokenData> INT BOOL CHAR STATIC AND OR NOT IF ELSE THEN FOR
%token <tokenData> BREAK RETURN BEGIN END TO DO BY

%type <tree> declList decl varDecl scopedVarDecl varDecDecl varDeclList
%type <tree> varDeclInit varDeclId typeSpec funDecl params paramList paramTypeList
%type <tree> paramIdList paramId stmt expStmt compoundStmt localDecls stmtList 
%type <tree> selectStmt iterStmt iterRange returnStmt breakStmt exp assignop
%type <tree> simpleExp andExp unaryRelExp relExp relop sumExp sumop mulExp mulop
%type <tree> unaryExp unaryop factor mutable immutable call args argList constant


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

scopedVarDecl : STATIC typeSpec varDeclList SEMICOLON           { $$ = $3; $$->isStatic = true; assignTyping($$, $2); }
              | typeSpec varDeclList SEMICOLON                  { $$ = $2; assignTyping($$, $1);}
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
                                                                  $$->tokenData = $1;
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
                                                                   $$->tokenData = $2;
                                                                 }
              | ID LPAREN params RPAREN compoundStmt             { $$ = newDeclNode(FuncK, $1);     // Ex: BOOL ID(params) compoundStmt
                                                                   $$->attr.name = $1->tokeninput;
                                                                   $$->child[0] = $3;
                                                                   $$->child[1] = $5;
                                                                   $$->tokenData = $1;
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
                                                                   $$.attr.name = $1->tokeninput; 
                                                                 }
              | ID LBRACKET RBRACKET                             { $$ = newDeclNode(ParamK, $1);
                                                                   $$.isArray = true;
                                                                   $$.attr.name = $1->tokeninput; 
                                                                 }
              ;

stmt          : expStmt                                          { $$ = $1; }
              | compoundStmt                                     { $$ = $1; }
              | selectStmt                                       { $$ = $1; }
              | iterStmt                                         { $$ = $1; }
              | returnStmt                                       { $$ = $1; }
              | breakStmt                                        { $$ = $1; }
              ;

expStmt       : LESSTHAN exp GREATTHAN SEMICOLON                 { $$ = $2; }
              | ;                                                { $$ = NULL; }

compoundStmt  : BEGIN localDecls stmtList END                    { $$ = newStmtNode(CompoundK, $1);
                                                                   $$->child[0] = $2;
                                                                   $$->child[1] = $3;
                                                                 }
              ;

localDecls    : localDecls scopedVarDecl
              | %empty                                           { $$ = NULL; }
              ;

stmtList      : stmtList stmt
              | %empty                                           { $$ = NULL; }
              ;

selectStmt    : IF simpleExp THEN stmt
              | IF simpleExp THEN stmt ELSE stmt
              ;

iterStmt      : WHILE simpleExp DO stmt
              | FOR ID ASGN iterRange DO stmt
              ;

iterRange     : simpleExp TO simpleExp
              | simpleExp TO simpleExp BY simpleExp
              ;

returnStmt    : RETURN SEMICOLON
              | RETURN exp SEMICOLON
              ;

breakStmt     : BREAK SEMICOLON
              ;

exp           : mutable assignop exp 
              | mutable INC
              | mutable DEC
              | simpleExp                                        { $$ = $1; }
              ;

assignop      : ASGN 
              | ADDASGN
              | SUBASGN 
              | MULASGN 
              | DIVASGN
              ;

simpleExp     : simpleExp OR andExp
              | andExp
              ;

andExp        : andExp AND unaryRelExp
              | unaryRelExp
              ;

unaryRelExp   : NOT unaryRelExp
              | relExp
              ;

relExp        : sumExp relop sumExp
              | sumExp
              ;

relop         : LESSTHAN 
              | LEQ 
              | GREATTHAN 
              | GEQ 
              | EQUAL 
              | NEQ
              ;

sumExp        : sumExp sumop mulExp
              | mulExp
              ;

sumop         : PLUS
              | MINUS
              ;

mulExp        : mulExp mulop unaryExp
              | unaryExp
              ;

mulop         : MULT
              | DIV
              | MOD
              ;

unaryExp      : unaryop unaryExp
              | factor
              ;

unaryop       : MINUS
              | MULT
              | QUESTION
              ;

factor        : mutable
              | immutable
              ;

mutable       : ID
              | ID LBRACKET exp RBRACKET
              ;

immutable     : LPAREN exp RPAREN
              | call
              | constant
              ;

call          : ID LPAREN args RPAREN
              ;

args          : argList
              | %empty                              { $$ = NULLl; }
              ;

argList       : argList COMMA exp
              | exp

constant      : NUMCONST
              | CHARCONST
              | STRINGCONST
              | BOOLCONST
              ;

%%
extern int yydebug;

int main(int argc, char *argv[])
{
    if (argc > 1) {
        if ((yyin = fopen(argv[1], "r"))) {
            // file open successful
        }
        else {
            // failed to open file
            printf("ERROR: failed to open \'%s\'\n", argv[1]);
            exit(1);
        }
    }

    // do the parsing
    numErrors = 0;
    yyparse();

    return 0;
}
