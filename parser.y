%{
// // // // // // // // // // // // // // // // // // // // // // // 
// CS445 - hw1.y
//
// Keller Lawson
// Jan 23, 2022    

#include "scanType.h"  // TokenData Type
#include <stdio.h>

double vars[26];    

extern int yylex();
extern FILE *yyin;
extern int line;         // ERR line number from the scanner!!
extern int numErrors;    // ERR err count

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

%%

program       : declList
              ;

declList      : declList delc
              | decl
              ;

decl          : varDecl
              | funDecl
              ;

varDecl       : typeSpec varDeclList ;
              ;

scopedVarDecl : static typeSpec varDeclList ;
              | typeSpec varDeclList ;
              ;

varDeclList   : varDeclList , varDecInit
              | varDecInit
              ;

varDeclInit   : varDeclId
              | varDeclId : simpleExp
              ;

varDeclId     : ID
              | ID LBRACKET NUMCONST RBRACKET
              ;

typeSpec      : bool
              | char
              | int
              ;

funDecl       : typeSpec ID LPAREN parms RPAREN compoundStmt
              | ID LPAREN parms RPAREN compoundStmt
              ;

parms         : parmList
              | %empty
              ;

parmList      : parmList ; parmTypeList
              | parmTypeList
              ;

parmTypeList  : typeSpec parmIdList
              ;

parmIdList    : parmIdList , parmId 
              | parmId
              ;

parmId        : ID | ID LBRACKET RBRACKET
              ;

stmt          : expStmt 
              | compoundStmt 
              | selectStmt 
              | iterStmt 
              | returStmt 
              | breakStmt
              ;

expStmt       : LESSTHAN exp GREATTHAN ;
              | ;

compoundStmt  : begin localDecls stmtList end
              ;

localDecls    : localDecls scopedVarDecl
              | %empty
              ;

stmtList      : stmtList stmt
              | %empty
              ;

selectStmt    : if simpleExp then stmt
              | if simpleExp then stmt else stmt
              ;

iterStmt      : while simpleExp do stmt
              | for ID ASGN iterRange do stmt
              ;

iterRange     : simpleExp to simpleExp
              | simpleExp to simpleExp by simpleExp
              ;

returnStmt    : return ;
              | return exp;
              ;

breakStmt     : break ; 
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

simpleExp     : simpleExp or andExp
              | andExp
              ;

andExp        : andExp and unaryRelExp
              | unaryRelExp
              ;

unaryRelExp   : not unaryRelExp
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

argList       : argList , exp
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
