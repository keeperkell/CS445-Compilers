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
    double value;
}

%token <tokenData> QUIT NUMBER ID
%type  <value> expression sumexp mulexp unary factor

%%
statementlist : statementlist statement
              | statement
              ;

statement     : '\n'
              | expression '\n'         { printf("THE ANSWER IS %lg\n", $1); }
              | QUIT '\n'               { exit(0); }
              ;

expression    : ID '=' expression   { vars[$1->idIndex] = $3; $$ = $3;}
              | sumexp              { $$ = $1; }

sumexp        : sumexp '+' mulexp     { $$ = $1 + $3; }
              | sumexp '-' mulexp     { $$ = $1 - $3; }
              | mulexp                { $$ = $1; }
              ;

mulexp        : mulexp '*' unary   { $$ = $1 * $3; }
              | mulexp '/' unary   { $$ = $1 / $3; } // no check div zero
              | unary              { $$ = $1; }
              ;

unary         : '-' unary          { $$ = - $2; }
              | factor             { $$ = $1; }

factor        : ID                  { $$ = vars[$1->idIndex]; }
              | '(' expression ')'  { $$ = $2; }
              | NUMBER              { $$ = $1->numValue; }
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

    // init variables a through z
    for (int i=0; i<26; i++) vars[i] = 0.0;

    // do the parsing
    numErrors = 0;
    yyparse();

    printf("Number of errors: %d\n", numErrors);   // ERR

    return 0;
}
