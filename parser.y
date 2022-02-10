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

static TreeNode *savedTree;

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
%type <tree> varDeclInit varDeclId typeSpec funDecl parms parmList parmTypeList
%type <tree> parmIdList parmId stmt expStmt compoundStmt localDecls stmtList 
%type <tree> selectStmt iterStmt iterRange returnStmt breakStmt exp assignop
%type <tree> simpleExp andExp unaryRelExp relExp relop sumExp sumop mulExp mulop
%type <tree> unaryExp unaryop factor mutable immutable call args argList constant


%%

program       : declList                                    {savedTree = $1;}
              ;

declList      : declList delc                               {}
              | decl                                        {}
              ;

decl          : varDecl
              | funDecl
              ;

varDecl       : typeSpec varDeclList SEMICOLON
              ;

scopedVarDecl : STATIC typeSpec varDeclList SEMICOLON
              | typeSpec varDeclList SEMICOLON
              ;

varDeclList   : varDeclList COMMA varDecInit
              | varDecInit
              ;

varDeclInit   : varDeclId
              | varDeclId COLON simpleExp
              ;

varDeclId     : ID
              | ID LBRACKET NUMCONST RBRACKET
              ;

typeSpec      : BOOL
              | CHAR
              | INT
              ;

funDecl       : typeSpec ID LPAREN parms RPAREN compoundStmt
              | ID LPAREN parms RPAREN compoundStmt
              ;

parms         : parmList
              | %empty
              ;

parmList      : parmList SEMICOLON parmTypeList
              | parmTypeList
              ;

parmTypeList  : typeSpec parmIdList
              ;

parmIdList    : parmIdList COMMA parmId 
              | parmId
              ;

parmId        : ID 
              | ID LBRACKET RBRACKET
              ;

stmt          : expStmt 
              | compoundStmt 
              | selectStmt 
              | iterStmt 
              | returStmt 
              | breakStmt
              ;

expStmt       : LESSTHAN exp GREATTHAN SEMICOLON
              | ;

compoundStmt  : begin localDecls stmtList end
              ;

localDecls    : localDecls scopedVarDecl
              | %empty
              ;

stmtList      : stmtList stmt
              | %empty
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
              | simpleExp
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
              | %empty
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
